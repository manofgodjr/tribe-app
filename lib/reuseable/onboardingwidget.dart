import 'package:flutter/material.dart';

import '../models/onboardingmodel.dart';

class OnboardingScreenWidget extends StatefulWidget {
  const OnboardingScreenWidget({super.key, required this.model});

  final OnboardingModel model;

  @override
  State<OnboardingScreenWidget> createState() => _OnboardingScreenWidgetState();
}

class _OnboardingScreenWidgetState extends State<OnboardingScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage(widget.model.addImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 100,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.model.addTittle,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white54,
                  fontSize: 36,
                ),
                textAlign: TextAlign.center),
            Text(
              widget.model.addSubtittle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
