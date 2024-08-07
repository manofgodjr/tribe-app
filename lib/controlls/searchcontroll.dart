// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'controller.dart';

// import '../models/lga_model.dart';
class SearchControll extends GetxController {
  Controller controll = Get.put(Controller());

  // Function to search LGAs (modify as needed)
  List<dynamic> searchLGA(String searchTerm) {
    if (controll.allLgaData.value == null) {
      return [];
    }

    final List<dynamic> filteredData = [];
    controll.allLgaData.value!.forEach((key, value) {
      if (value.toLowerCase().contains(searchTerm.toLowerCase()) ||
          value.toLowerCase().contains(searchTerm.toLowerCase())) {
        filteredData.add(value);
      }
    });
    return filteredData;
  }
}
