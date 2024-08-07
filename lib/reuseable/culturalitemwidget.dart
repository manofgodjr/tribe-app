import 'package:flutter/material.dart';

Widget culturalHighlightItem(
    {required String image,
    required String title,
    String description = '',
    required VoidCallback ontap}) {
  return Card(
    child: InkWell(
      // Make the card tappable
      onTap:
          // Handle tap event (e.g., navigate to a details screen)
          ontap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              height: 100.0,
              width: double.infinity, // Fill container width
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (description.isNotEmpty) const SizedBox(height: 5.0),
          if (description.isNotEmpty) Text(description),
        ],
      ),
    ),
  );
}
