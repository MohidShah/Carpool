// ignore_for_file: file_names

import 'dart:convert';
import 'dart:convert';
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

  onClicklogin() {
    var userType = "";
    print(loginemail.text);
    print(loginpassword.text);
    loginUser(loginemail.text, loginpassword.text, "passenger");
  }

  Future<Map<String, dynamic>> loginUser(
      String email, String password, String role) async {
    print("loginuserfun");
    var clientip = "192.168.72.1";
    var myip = "223.123.114.201";
    final String apiUrl = 'http://$myip:3000/api/users/login';

    // Create the payload
    Map<String, dynamic> payload = {
      'email': loginemail.text,
      'password': loginpassword.text,
      'role': role,
    };

    // Encode the payload to JSON
    String payloadJson = jsonEncode(payload);

    try {
      // Make the HTTP POST request
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: payloadJson,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data}");
        loginRes.add(data);
        switch (data['user'].role) {
          case 'Driver':
            Get.toNamed('/DriverHome');
            break;

          case 'passengers':
            Get.toNamed('/Home');
            break;
        }
        return data;
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the HTTP request
      print('Error: $error');
      throw error;
    }
  }
}
