// ignore_for_file: file_names

import 'package:carpool/config/Constants.dart';
import 'package:carpool/exportlinks.dart';

class LoginController extends GetxController {
  var secureText = true;
  var secureText2 = true;

  //fields controller
  TextEditingController FirstName = TextEditingController();
  TextEditingController LasttName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Dateofbirth = MaskedTextController(mask: '00/00/0000');
  TextEditingController cnic = MaskedTextController(mask: '00000-0000000-0');

  @override
  void onInit() {
    super.onInit();
    clearLoginFields();
  }

  clearLoginFields() {
    FirstName.clear();
    LasttName.clear();
    Email.clear();
    Password.clear();
    Confirmpassword.clear();
    Phone.clear();
    Dateofbirth.clear();
    cnic.clear();
  }

  fieldTypeController(type) {
    print("enter fieldTypeController $type");
    switch (type) {
      case 'FirstName':
        return FirstName;
      case 'LasttName':
        return LasttName;
      case 'Email':
        return Email;
      case 'Password':
        return Password;
      case 'Confirmpassword':
        return Confirmpassword;
      case 'Phone':
        return Phone;
      case 'Dateofbirth':
        return Dateofbirth;
      case 'Cnic':
        return cnic;
    }
  }

  showHidePass() {
    print("showHidePass in $secureText");

    if (secureText == false) {
      secureText = true;
    } else {
      secureText = false;
    }

    update();
  }

  showHidePass2() {
    print("showHidePass in $secureText2");

    if (secureText2 == false) {
      secureText2 = true;
    } else {
      secureText2 = false;
    }

    update();
  }

  onClicklogin() {
    var userType = "";
    print(loginemail.text);
    print(loginpassword.text);

    // switch (userType) {
    //   case 'Driver':
    //     Get.toNamed('/DriverHome');
    //     break;

    //   case 'passengers':
    //     Get.toNamed('/Home');
    //     break;
    // }
  }
}
