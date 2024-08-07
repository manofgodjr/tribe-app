import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/views/onboarding/onboardingscreen.dart';

import 'constants/theme.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: MythemeData.mylightTheme,
      //darkTheme: MythemeData.mydarkTheme,
      themeMode: ThemeMode.light,
      theme: myTheme,
      home: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          //bottomNavigationBar: const BottomNavBar(),
          body: OnboardingPage(),
        ),
      ),
    );
  }
}
