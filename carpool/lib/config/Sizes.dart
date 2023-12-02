// Access the screen dimensions using MediaQuery
// ignore_for_file: file_names

import 'package:carpool/exportlinks.dart';

class MySizes {
  final BuildContext context;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double appBarHeight = 0.0;
  double buttonWidth = 0.0;
  double cardHeight = 0.0;

  MySizes(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    appBarHeight = screenHeight * 0.1; // 10% of screen height
    buttonWidth = screenWidth * 0.3; // 30% of screen width
    cardHeight = screenHeight * 0.25; // 25% of screen height
  }
}
