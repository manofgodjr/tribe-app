import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controlls/bottom_nav_bar_controller.dart';

class CustomBottomNavigationBar extends GetView<BottomNavBarController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavBarController>(
      init: BottomNavBarController(),
      builder: (controller) => Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onTabSelected,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[700], // Shade of green
          unselectedItemColor: Colors.grey[400],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Tribes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin),
              label: "LGA",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Postal Codes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "Utilities",
            ),
          ],
        ),
      ),
    );
  }
}
