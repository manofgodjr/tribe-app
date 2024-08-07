import 'package:get/get.dart';

import '../views/screens/botttomNavBar/navBarScreens/lga.dart';
import '../views/screens/botttomNavBar/navBarScreens/others.dart';
import '../views/screens/botttomNavBar/navBarScreens/postal_zip_code.dart';
import '../views/screens/botttomNavBar/navBarScreens/tribes.dart';

class BottomNavBarController extends GetxController {
  final selectedIndex = 0.obs; // Observable for selected index

  void onTabSelected(int index) {
    selectedIndex.value = index;
    // Handle navigation based on selected index (replace with your logic)
    Get.to(pages[index]); // Replace YourScreen with your actual screen
  }
}

final pages = [
  GetPage(name: '/', page: () => const TribesPage()),
  GetPage(name: '/second', page: () => const LgaPages()),
  GetPage(name: '/third', page: () => const PostalZipCodePage()),
  GetPage(name: '/fourth', page: () => const OthersUtilitiesPage()),
];
