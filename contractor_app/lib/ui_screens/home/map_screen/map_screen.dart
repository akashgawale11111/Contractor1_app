import 'package:contractor_app/theme/app_drawer.dart';
import 'package:contractor_app/theme/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(attendanceProvider);
    final attendanceNotifier = ref.read(attendanceProvider.notifier);

    // Listen for errors and show a SnackBar
    ref.listen<AttendanceState>(attendanceProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Attendance'),
      ),
      drawer: const AppDrawer(), // Add the drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            if (attendanceState.isLoading)
              const CircularProgressIndicator()
            else ...[
              const Text('Location:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(attendanceState.location, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Time:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(attendanceState.time, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: attendanceState.isLoading ? null : attendanceNotifier.markAttendance,
                  child: const Text('Mark Attendance'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
