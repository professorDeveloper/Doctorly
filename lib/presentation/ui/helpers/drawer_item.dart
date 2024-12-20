import 'package:flutter/material.dart';

  Widget buildMenuItem(IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: trailing,
      onTap: () {
        // Add menu item functionality here
      },
    );
  }
