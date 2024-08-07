import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final PageController pagecontroll = PageController();
  final Rx<Map<String, dynamic>?> allLgaData = Rx(null);

  void pageControll() {
    if (pagecontroll.hasClients) {
      pagecontroll.animateToPage(1,
          duration: const Duration(milliseconds: 600),
          curve: Curves.bounceInOut);
    }
  }

  Future<Map<String, dynamic>> parseJsonOthers() async {
    // Read the JSON file content (replace with your reading logic)
    final String jsonString = await rootBundle.loadString(
        'jsonfile/ZIPandPOSTALCODE.json'); // Replace with your file path

    // Decode the JSON string
    final dynamic jsonData = jsonDecode(jsonString);

    // Cast the data to the desired type
    return jsonData as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> parseJsonZipCodes() async {
    // Read the JSON file content (replace with your reading logic)
    final String jsonString = await rootBundle.loadString(
        'jsonfile/ZIPandPOSTALCODE.json'); // Replace with your file path

    // Decode the JSON string
    final dynamic jsonData = jsonDecode(jsonString);

    // Cast the data to the desired type
    return jsonData as Map<String, dynamic>;
  }

  // Observable for LGA data

  // Function to parse JSON data (replace with your actual logic)
  Future<Map<String, dynamic>>? parseJsonLGA() async {
    // Read and parse JSON file
    final String jsonString =
        await rootBundle.loadString('jsonfile/naijaLGA.json');
    final dynamic jsonData = jsonDecode(jsonString);
    return allLgaData.value =
        jsonData as Map<String, dynamic>; // Update observable
  }

  Future<Map<String, dynamic>> parseJsonTribes() async {
    // Read the JSON file content (replace with your reading logic)
    final String jsonString = await rootBundle
        .loadString('jsonfile/tribezz.json'); // Replace with your file path

    // Decode the JSON string
    final dynamic jsonData = jsonDecode(jsonString);

    // Cast the data to the desired type
    return jsonData as Map<String, dynamic>;
  }
}
