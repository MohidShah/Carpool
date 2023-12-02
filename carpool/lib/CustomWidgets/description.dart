import 'package:carpool/exportlinks.dart';

Widget cDescription({text, context}) {
  return Text(
    text,
    style: MyFontStyle(context).getDescriptionFont(),
  );
}
