import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  // ... other theme properties

  expansionTileTheme: const ExpansionTileThemeData(
    // Set border properties to remove borders
    backgroundColor: Colors.transparent,
    collapsedBackgroundColor: Colors.transparent, // Transparent background
    collapsedTextColor: Colors.black, // Adjust text color
    tilePadding: EdgeInsets.zero, // Remove padding if needed
  ),
);
