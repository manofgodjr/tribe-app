import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribe/constants/stringconstants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String tribes = Get.arguments ?? "error in getting list";

    return Scaffold(
        appBar: AppBar(),
        body: Wrap(
          alignment: WrapAlignment.end,
          spacing: 6.0,
          children: [const Text(tribeText), Text(tribes)],
        ));
  }
}
