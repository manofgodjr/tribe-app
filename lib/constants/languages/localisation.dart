import 'package:get/get.dart';

import '../stringconstants.dart';
import 'edo.dart';
import 'english.dart';
import 'french.dart';
import 'hausa.dart';
import 'igbo.dart';
import 'yoruba.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: eng,
        yrb: yb,
        haus: hau,
        fre: fr,
        bini: edos,
        igbo: igbos,
      };
}
