import 'package:carpool/CustomWidgets/mapwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:carpool/exportlinks.dart';

class CreateRide extends StatefulWidget {
  const CreateRide({Key? key}) : super(key: key);

  @override
  State<CreateRide> createState() => _CreateRideState();
}

class _CreateRideState extends State<CreateRide> {
  GooglePlaceAutoCompleteTextField? textField;
  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textField = GooglePlaceAutoCompleteTextField(
      googleAPIKey: "YOUR_GOOGLE_MAPS_API_KEY",
      textEditingController: destinationController,
      inputDecoration: InputDecoration(
        hintText: "Search your Destination",
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      debounceTime: 800,
      itemClick: (prediction) {
        setState(() {
          // Update the destination text when a place is picked
          destinationController.text = prediction.description!;
        });
      },
    );
  }

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
                    child: textField,
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
                              text: destinationController.text,
                              context: context,
                              size: 20.0), // Display selected destination
                          Cbutton(
                              text: "Create Ride",
                              context: context,
                              onPressed: () => showAlertDialog(context)),
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
                    height: MySizes(context).screenHeight * 0.4,
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

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Pick Ride"),
        content: Text("your Ride Is Created"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
