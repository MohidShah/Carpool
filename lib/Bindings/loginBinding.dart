// ignore_for_file: file_names

import 'package:carpool/Controller/loginController.dart';
import 'package:carpool/exportlinks.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(() => LoginController());
    // Get.put<Service>(()=> Api());
  }
}
