import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/stringconstants.dart';
import '../../controlls/settingscontroll.dart';
import '../textutilities.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});

  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: "Language".tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  value: ene,
                  child: Text(
                    english,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: fre,
                  child: Text(
                    french,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: yrb,
                  child: Text(
                    yoruba,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: haus,
                  child: Text(
                    hausa,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: igb,
                  child: Text(
                    igbo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: edo,
                  child: Text(
                    edo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
              value: controller.langLocal,
              onChanged: (value) {
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
            ),
          ),
        ),
      ],
    );
  }
}
