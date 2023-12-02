// ignore_for_file: non_constant_identifier_names

import 'package:carpool/exportlinks.dart';

Widget cTitle({text, context, size, color}) {
  return Text(
    text,
    style: MyFontStyle(context).getCustomTitleFont(size, color),
  );
}

Widget cWhiteTitle({text, context}) {
  return Text(
    text,
    style: MyFontStyle(context).getWhiteTitleFont(),
  );
}

Widget cbgColorTitle({text, context}) {
  return Text(
    text,
    style: MyFontStyle(context).getGreenTitleFont(),
  );
}

Widget LoginTitle({text, context}) {
  return Center(
    child: Text(
      text,
      style: MyFontStyle(context).getLoginTitleFont(),
      textAlign: TextAlign.center,
    ),
  );
}

Widget smallTitle({text, context, type}) {
  return GestureDetector(
    onTap: () => type == 'D'
        ? Get.toNamed('/driverSignup')
        : type != null
            ? Get.toNamed('/rideSignup')
            : null,
    child: Container(
      width: MySizes(context).screenWidth * 0.4,
      height: MySizes(context).screenHeight * 0.05,
      decoration: BoxDecoration(
          color: myColors().bgBlue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: MyFontStyle(context).smallTitleFont(),
        ),
      ),
    ),
  );
}
