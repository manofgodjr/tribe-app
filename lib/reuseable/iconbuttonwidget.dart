// Reusable custom icon button
import 'package:flutter/material.dart';

Widget customIconButton(
    {required IconData icon,
    required String label,
    required VoidCallback onPressed}) {
  return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20.0),
      label: Text(label),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(1)));
}
