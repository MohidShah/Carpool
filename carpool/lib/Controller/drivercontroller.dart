import 'package:carpool/exportlinks.dart';

import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carpool/config/Constants.dart';
import 'package:carpool/exportlinks.dart';
import 'package:get/get_connect/http/src/response/response.dart';

var clientip = "192.168.72.1";
var myip = "223.123.114.201";

class DriverController extends GetxController {
  Future<Map<String, dynamic>> Signup(
      String email, String password, String role) async {
    print("loginuserfun");

    final String apiUrl = 'http://$myip:3000/api/driver/register';

    // Create the payload
    Map<String, dynamic> payload = {
      "firstName": LoginController().FirstName.text,
      "lastName": LoginController().LasttName.text,
      "email": LoginController().Email.text,
      "password": LoginController().Password.text,
      "confirmPassword": LoginController().Confirmpassword.text,
      "phoneNumber": LoginController().Phone.text,
      "cnic": LoginController().cnic.text,
      "dateOfBirth": LoginController().Dateofbirth.text,
      "gender": "male",
      "role": "driver",
      "drivingLicenseImage": "",
      "status": true,
      "profile": "" // Replace with the actual profile ID
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
        throw Exception(
            'Failed to Signup. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the HTTP request
      print('Error: $error');
      throw error;
    }
  }
}
