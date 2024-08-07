import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/constants/stringconstants.dart';
import 'package:tribe/controlls/controller.dart';
import 'package:tribe/views/screens/dashboardscreen.dart';

import '../../models/onboardingmodel.dart';
import '../../reuseable/onboardingwidget.dart';

// import '../../models/onboardingmodel.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  Controller controll = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}

// to begin create a class onboardingscreen
//extend it to stateful widget to be able to use its properties
//and others
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pagecontroll = PageController();
  bool onLastPage = false; // changing toggling btw a done text and next text
  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          color: Colors.black,
          child: PageView(
            controller: pagecontroll,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              //index of the pages initial = 0
              setState(() {
                onLastPage = (index == 2); // when the
              });
            },
            children: [
              OnboardingScreenWidget(
                model: OnboardingModel(
                    addImage: 'assets/images/heritage2.jpg',
                    addTittle: 'Heritage',
                    addSubtittle: heritageText
                    // addCount: 1,
                    ),
              ),
              OnboardingScreenWidget(
                  model: OnboardingModel(
                      // addCount: 2,
                      addImage: 'assets/images/culture.jpg',
                      addSubtittle: cultureText,
                      addTittle: 'CULTURE')),
              OnboardingScreenWidget(
                  model: OnboardingModel(
                      //addCount: 3,
                      addImage: 'assets/images/tribe.jpg',
                      addTittle: 'Tribes',
                      addSubtittle: tribeText))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: const Alignment(0.10, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (pagecontroll.hasClients) {
                        pagecontroll.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  },
                  child: const Text('Previous'),
                ),
                onLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Get.to(() => const DashBoardScreen());
                        },
                        child: const Text('Done'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (pagecontroll.hasClients) {
                              pagecontroll.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.bounceIn,
                              );
                            }
                          });
                        },
                        child: const Text('Next'),
                      )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
