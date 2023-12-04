import 'package:carpool/exportlinks.dart';

import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carpool/config/Constants.dart';
import 'package:carpool/exportlinks.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'drivercontroller.dart';

class PassengerController extends GetxController {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LasttName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Dateofbirth = MaskedTextController(mask: '00/00/0000');
  TextEditingController cnic = MaskedTextController(mask: '00000-0000000-0');
  Future<Map<String, dynamic>> Signup(
      BuildContext context, selectedGender) async {
    print(selectedGender + "selectedGender");
    showLoader(context); // Display loading indicator

    var clientip = "192.168.72.1";
    final String apiUrl = 'http://$myip:3000/api/passenger/register';

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
      "gender": selectedGender,
      "role": "passenger",
      "status": true,
    };
    print("payload: $payload");
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
      if (response.statusCode <= 202) {
        // Parse the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data}");
        hideLoader(context); // Close loading indicator

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
        showErrorPopup('Failed to signup. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to signup. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the HTTP request
      print('Error: $error');
      hideLoader(context); // Close loading indicator

      showErrorPopup('Failed to signup. Please try again.');
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

  void showErrorPopup(String errorMessage) {
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
