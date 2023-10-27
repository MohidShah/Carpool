// ignore_for_file: file_names

import 'package:carpool/exportlinks.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    // ignore: avoid_print
    print("SplashBinding");
    Get.lazyPut<splashController>(() => splashController());
    // Get.put<Service>(()=> Api());
  }
}
