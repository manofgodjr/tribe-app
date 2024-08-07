import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controlls/settingscontroll.dart';
import '../textutilities.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: '',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: '',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
