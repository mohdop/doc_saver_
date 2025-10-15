import 'package:flutter/material.dart';

 // Build settings page
  Widget _buildSettingsPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text('Settings Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }