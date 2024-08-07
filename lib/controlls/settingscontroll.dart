import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/stringconstants.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language

  @override
  void onInit() async {
    super.onInit();

    // langLocal = await getLanguage!;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  // Future<String>? get getLanguage async {
  //   return await storage.read("lang");
  // }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == yrb) {
      langLocal = yrb;
      saveLanguage(yrb);
    } else if (typeLang == igb) {
      langLocal = igb;
      saveLanguage(igb);
    } else if (typeLang == ene) {
      langLocal = ene;
      saveLanguage(ene);
    } else if (typeLang == fre) {
      langLocal = fre;
      saveLanguage(fre);
    } else if (typeLang == haus) {
      langLocal = haus;
      saveLanguage(haus);
    } else if (typeLang == edo) {
      langLocal = edo;
      saveLanguage(edo);
    }
    update();
  }
}
