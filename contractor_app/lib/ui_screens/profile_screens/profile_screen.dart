import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/emp.png'), // Replace with NetworkImage if needed
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 24),

            // Personal Details
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Personal Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow("Name:", "Ramesh Kumar"),
            _buildDetailRow("Worker ID:", "LBR102"),
            _buildDetailRow("Contact:", "+91 9876543210"),
            _buildDetailRow("Address:", "Nashik, Maharashtra"),
            const SizedBox(height: 24),

            // Work Details
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Work Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow("Site", "Construction Site-A"),
            _buildDetailRow("Joining Date", "05 Aug 2025"),
            _buildDetailRow("Supervisor", "Arjun Mehta"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 100, child: Text(title, style: const TextStyle(fontSize: 14))),
          const Text(":", style: TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
