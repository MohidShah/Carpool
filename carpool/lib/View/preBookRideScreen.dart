// ignore_for_file: file_names, camel_case_types

import 'package:carpool/Controller/preBookRideScreenController.dart';
import 'package:carpool/exportlinks.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/mapwidget.dart';

class preBookRideScreen extends StatelessWidget {
  preBookRideScreen({super.key});
  final controller = Get.put(PreBookRideController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: controller.textField,
                  ),
                  SizedBox(
                    height: MySizes(context).screenHeight * 0.8,
                    width: MySizes(context).screenWidth,
                    child: Expanded(
                      child: MapWidget(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 450),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 50,
                          ),
                          cTitle(
                              text: "Driver Name",
                              context: context,
                              size: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: myColors().redTitle,
                              ),
                              cTitle(
                                  text: "myLocation",
                                  context: context,
                                  size: 20.0),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: myColors().bgGreen,
                              ),
                              cTitle(
                                  text: "driverLocation",
                                  context: context,
                                  size: 20.0),
                            ],
                          ),
                          cTitle(
                              text: "Charges: 300PKR",
                              context: context,
                              size: 20.0),
                          Cbutton(text: "Book Now", context: context),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // Change to your desired background color
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset to bottom
                        ),
                      ],
                    ),
                    height: MySizes(context).screenHeight * 0.5,
                    width: MySizes(context).screenWidth * 0.9,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
