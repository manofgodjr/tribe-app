import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controlls/controller.dart';
import '../textutilities.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});

  final controll = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Colors.white,
            textConfirm: " YES ",
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {},
            buttonColor: Colors.green,
          );
        },
        splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: "Logout".tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ),
    );
  }
}
