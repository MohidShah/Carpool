// ignore_for_file: file_names, camel_case_types

import 'dart:async';

import 'package:carpool/exportlinks.dart';

class splashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    afterSplash();
  }

  afterSplash() {
    Timer(const Duration(seconds: 12), () {
      Get.offAllNamed('/Login');
    });
  }
}
