import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String location = 'Unknown';
  String time = 'Unknown';
  bool isLoading = false;

  Future<bool> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      var result = await Permission.location.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }

  Future<bool> _checkAndRequestGPS() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show dialog to enable GPS
      if (!mounted) return false;

      final bool? result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Location Services Disabled'),
            content: const Text(
                'Please enable location services to mark attendance. Would you like to enable it now?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () async {
                  Navigator.pop(context, true);
                  await Geolocator.openLocationSettings();
                },
              ),
            ],
          );
        },
      );
      return result ?? false;
    }
    return true;
  }

  Future<Position> getCurrentLocation() async {
    bool gpsEnabled = await _checkAndRequestGPS();
    if (!gpsEnabled) {
      throw Exception('Please enable location services to continue.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 5),
    );
  }

  Future<String> getPlaceName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      List<String?> parts = [
        place.subThoroughfare, // House number like "12"
        place.thoroughfare, // Street name like "Asha building"
        place.subLocality, // Local area like "Tidake colony"
        place.locality, // City like "Nashik"
        place.administrativeArea, // State like "Maharashtra"
        place.postalCode // PIN code like "422009"
      ].where((part) => part != null && part.isNotEmpty).toList();
      return parts.join(', ');
    }
    return 'Unknown location';
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return now.toLocal().toString();
  }

  Future<void> markAttendance() async {
    setState(() {
      isLoading = true;
    });

    try {
      bool permissionGranted = await requestLocationPermission();
      if (!permissionGranted) {
        throw Exception('Location permission denied.');
      }

      Position position = await getCurrentLocation();
      String place = await getPlaceName(position.latitude, position.longitude);
      String currentTime = getCurrentTime();

      setState(() {
        location = place;
        time = currentTime;
      });
    } catch (e) {
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Attendance'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: isLoading ? null : markAttendance,
              child: const Text('Mark Attendance'),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const CircularProgressIndicator()
            else ...[
              const Text('Location:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(location, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Time:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(time, style: const TextStyle(fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }
}
