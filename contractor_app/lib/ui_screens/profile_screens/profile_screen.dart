// import 'package:contractor_app/ui_screens/home/nav_bar.dart/navbar.dart';
// import 'package:contractor_app/ui_screens/profile_screens/edit_profile.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     TextStyle labelStyle = const TextStyle(fontFamily: 'Roboto', fontSize: 20);

//     TextStyle valueStyle = const TextStyle(
//       fontFamily: 'Roboto',
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(fontFamily: 'Roboto')),
//         centerTitle: true,
//       ),
//      // bottomNavigationBar: Navbar(),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // SizedBox(height: height * 0.02),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(width * 0.02),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => EditProfile(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           "Edit Profile",
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       width: width * 0.35,
//                       height: width * 0.35,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.yellow.shade200,
//                           width: 6,
//                         ),
//                         image: const DecorationImage(
//                           image: AssetImage(
//                             'assets/images/person_img.png',
//                           ), // Correct image path (without leading slash)
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.05),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: width * 0.025),
//                       child: Text(
//                         "Personal Details",
//                         style: const TextStyle(
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.01),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.025),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Name :", style: labelStyle),
//                               Text("Pritesh Pawar", style: valueStyle),
//                             ],
//                           ),
//                           SizedBox(height: height * 0.005),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Worker ID :", style: labelStyle),
//                               Text("LBR102", style: valueStyle),
//                             ],
//                           ),
//                           SizedBox(height: height * 0.005),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Contact :", style: labelStyle),
//                               Text("+91 8552011102", style: valueStyle),
//                             ],
//                           ),
//                           SizedBox(height: height * 0.005),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Address :", style: labelStyle),
//                               Text("Nashik, Maharashtra", style: valueStyle),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.04),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: width * 0.025),
//                       child: Text(
//                         "Work Details",
//                         style: const TextStyle(
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.01),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.025),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Site :", style: labelStyle),
//                               Text("Construction Site-A", style: labelStyle),
//                             ],
//                           ),
//                           SizedBox(height: height * 0.005),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Joining Date :", style: labelStyle),
//                               Text("05-Aug-2025", style: labelStyle),
//                             ],
//                           ),
//                           SizedBox(height: height * 0.005),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Supervisor :", style: labelStyle),
//                               Text("Arjun Deshmukh", style: labelStyle),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: height * 0.04),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:contractor_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// PROFILE SCREEN
class ProfileScreen extends StatelessWidget {
  final Labour labour;

  const ProfileScreen({super.key, required this.labour});

  Widget infoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? "")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (labour.imageUrl != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(labour.imageUrl!),
              ),
            const SizedBox(height: 16),
            Text(
              "${labour.firstName ?? ''} ${labour.lastName ?? ''}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            infoRow("UID", labour.labourId),
            infoRow("Email", labour.email),
            infoRow("Phone", labour.phoneNumber),
            infoRow("Age", labour.age?.toString()),
            infoRow("Gender", labour.gender),
            infoRow("DOB", labour.dateOfBirth),
            infoRow("Address", labour.address),
            infoRow("City", labour.city),
            infoRow("State", labour.state),
            infoRow("Pincode", labour.pincode),
            infoRow("Aadhar", labour.aadharNumber),
            infoRow("PAN", labour.panCardNumber),
            infoRow("Govt Reg. No", labour.governmentRegistrationNumber),
            infoRow("Skill Level", labour.skillLevel),
            infoRow("Specialization", labour.specialization),
            infoRow("Daily Wage", labour.dailyWage),
            infoRow("Status", labour.status),
            infoRow("Created At", labour.createdAt),
            infoRow("Updated At", labour.updatedAt),
          ],
        ),
      ),
    );
  }
}
