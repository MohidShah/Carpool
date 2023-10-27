// ignore_for_file: file_names

import 'package:carpool/exportlinks.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  final controller = Get.put(splashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().bgWhite,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset('assets/animation/splashanimation.json'),
          Wrap(
            direction: Axis.vertical,
            children: [
              cTitle(text: "CarPool", context: context),
              cDescription(
                  text: "Book your Ride within a minutes", context: context)
            ],
          )
        ],
      )),
    );
  }
}
