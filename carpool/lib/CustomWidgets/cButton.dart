import 'package:carpool/exportlinks.dart';
import 'package:flutter/material.dart';

import '../config/fontfamily.dart';

Widget Cbutton({onPressed, text, context}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(myColors().bgColor)),
    onPressed: onPressed,
    child: Text(text, style: MyFontStyle(context).getLoginbtnTitleFont()),
  );
}
