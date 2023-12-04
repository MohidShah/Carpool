// ignore_for_file: file_names

import 'dart:convert';
import 'dart:convert';
import 'package:carpool/Controller/drivercontroller.dart';
import 'package:http/http.dart' as http;
import 'package:carpool/config/Constants.dart';
import 'package:carpool/exportlinks.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LoginController extends GetxController {
  var secureText = true;
  var secureText2 = true;
  var loginRes = [];

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

  onClicklogin(BuildContext context) {
    var userType = "";
    print(loginemail.text);
    print(loginpassword.text);
    loginUser(loginemail.text, loginpassword.text, "passenger", context);
  }

  Future<Map<String, dynamic>> loginUser(
      String email, String password, String role, BuildContext context) async {
    // Display loading indicator
    showLoader(context);

    var clientip = "192.168.72.1";

    final String apiUrl = 'http://$myip:3000/api/users/login';

    Map<String, dynamic> payload = {
      'email': loginemail.text,
      'password': loginpassword.text,
      'role': role,
    };

    String payloadJson = jsonEncode(payload);

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: payloadJson,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['user']['role']}");
        print("data ${data}");

        loginRes.add(data);
        hideLoader(context);

        switch (data['user']['role']) {
          case 'Driver':
            Get.toNamed('/DriverHome', arguments: [data]);
            break;

          case 'passenger':
            Get.toNamed('/Home', arguments: [data]);
            break;
        }

        // Close loading indicator

        return data;
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the HTTP request
      print('Error: $error');

      // Close loading indicator
      hideLoader(context);

      // Show error popup
      showErrorPopup();

      throw error;
    }
  }

  void showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SpinKitCircle(
            color: Colors.blue, // Customize the color
            size: 50.0, // Customize the size
          ),
        );
      },
    );
  }

  void hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showErrorPopup() {
    Fluttertoast.showToast(
      msg: "Failed to login. Please try again.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
