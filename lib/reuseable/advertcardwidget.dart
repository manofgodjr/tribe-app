import 'package:flutter/material.dart';

ListTile advertCardWidget({required String title, required String subtitle}) {
  return ListTile(
    leading: const Icon(Icons.announcement),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(subtitle),
  );
}
