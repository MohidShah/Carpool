// ignore_for_file: file_names, camel_case_types

import 'package:carpool/exportlinks.dart';

import '../CustomWidgets/genderbtn.dart';

class rideSignup extends StatelessWidget {
  rideSignup({super.key});
  final RxString selectedGender = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().bgWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/animation/joinus.json'),
            LoginTitle(context: context, text: "Book Ride"),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: myField(
                  context: context,
                  PlaceholderText: "First Name",
                  fieldType: "FirstName"),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: myField(
                  context: context,
                  PlaceholderText: "Last Name",
                  fieldType: "LastName"),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: myField(
                  context: context,
                  PlaceholderText: "Email",
                  fieldType: "Email"),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: GetBuilder(
                  initState: (state) => LoginController(),
                  init: LoginController(),
                  builder: (controller) => pTextField(
                      context: context,
                      controller: controller.Password,
                      PlaceholderText: "Password",
                      passField: 1,
                      secureText: controller.secureText),
                )),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: GetBuilder(
                  initState: (state) => LoginController(),
                  init: LoginController(),
                  builder: (controller) => pTextField(
                      context: context,
                      controller: controller.Confirmpassword,
                      PlaceholderText: "Confirm Password",
                      passField: 2,
                      secureText: controller.secureText2),
                )),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: myField(
                  context: context,
                  PlaceholderText: "Phone No",
                  fieldType: "Phone"),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: myField(
                  context: context,
                  PlaceholderText: "DD/MM/YYYY",
                  fieldType: "Dateofbirth"),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            styledRadioTile('Male', selectedGender, context),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            styledRadioTile('Female', selectedGender, context),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
                width: MySizes(context).screenWidth * 0.4,
                child: Cbutton(
                    // ignore: avoid_print
                    onPressed: () => print("hello world btn"),
                    text: "Sign up",
                    context: context)),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
          ],
        ),
      )),
    );
  }
}
