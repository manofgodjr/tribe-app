import 'package:flutter/material.dart';

Widget eventCard({required String title, required String date}) {
  return Card(
    child: ListTile(
      title: Text(title),
      subtitle: Text(date),
      trailing:
          const Icon(Icons.arrow_forward_ios), // Optional arrow for details
    ),
  );
}
