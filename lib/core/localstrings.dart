import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class locales extends GetxController{

  Locale intillang= sharepref!.getString('lang')=="ar"?const Locale("ar"):const Locale("en");
  void chanlang (String codelang)
  {
   Locale loc =Locale(codelang);
   sharepref!.setString("lang",codelang);
   Get.updateLocale(loc);
  }
}
