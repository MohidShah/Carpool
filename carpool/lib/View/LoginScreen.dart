// ignore_for_file: file_names

import 'package:carpool/exportlinks.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().bgWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MySizes(context).screenHeight * 0.4,
                child: Lottie.asset('assets/animation/joinus.json')),
            LoginTitle(context: context, text: "Welcome Back"),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: eTextField(context: context, PlaceholderText: "Email"),
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
                      PlaceholderText: "Password",
                      passField: 1,
                      secureText: controller.secureText),
                )),
            SizedBox(
              height: MySizes(context).screenHeight * 0.01,
            ),

            SizedBox(
              width: MySizes(context).screenWidth * 0.7,
              child: Align(
                  alignment: Alignment.topRight,
                  child: cTitle(
                      text: "Forget Password", context: context, size: 12.0)),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
                width: MySizes(context).screenWidth * 0.4,
                child: Cbutton(
                    // ignore: avoid_print
                    onPressed: () => controller.onClicklogin("passengers"),
                    text: "LOGIN",
                    context: context)),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
            // smallTitle(context: context, text: "Signup as Driver", type: 'D'),
            SizedBox(
              width: MySizes(context).screenWidth * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallTitle(
                      context: context, text: "Signup as Driver", type: 'D'),
                  smallTitle(
                      context: context, text: "Signup as Ride", type: 'R'),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
