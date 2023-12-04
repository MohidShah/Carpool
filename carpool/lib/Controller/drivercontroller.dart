import 'package:carpool/exportlinks.dart';

import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carpool/config/Constants.dart';
import 'package:carpool/exportlinks.dart';
import 'package:get/get_connect/http/src/response/response.dart';

var clientip = "192.168.72.1";
var myip = "192.168.71.96";

class DriverController extends GetxController {
  Future<Map<String, dynamic>> Signup(BuildContext context) async {
    TextEditingController FirstName = TextEditingController();
    TextEditingController LasttName = TextEditingController();
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    TextEditingController Confirmpassword = TextEditingController();
    TextEditingController Phone = TextEditingController();
    TextEditingController Dateofbirth =
        MaskedTextController(mask: '00/00/0000');
    TextEditingController cnic = MaskedTextController(mask: '00000-0000000-0');
    showLoader(context); // Display loading indicator

    final String apiUrl = 'http://$myip:3000/api/driver/register';

    Map<String, dynamic> payload = {
      "firstName": FirstName.text,
      "lastName": LasttName.text,
      "email": Email.text,
      "password": Password.text,
      "confirmPassword": Confirmpassword.text,
      "phoneNumber": Phone.text,
      "cnic": cnic.text,
      "dateOfBirth": Dateofbirth.text,
      "gender": "male",
      "role": "driver",
      "status": true,
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
        showErrorPopup('Failed to Signup. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to Signup. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the HTTP request
      print('Error: $error');
      hideLoader(context); // Close loading indicator
      showErrorPopup('Failed to Signup. Please try again.');
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
