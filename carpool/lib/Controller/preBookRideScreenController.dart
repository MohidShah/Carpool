import 'package:carpool/exportlinks.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

class PreBookRideController extends GetxController {
  GooglePlaceAutoCompleteTextField? textField;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textField = GooglePlaceAutoCompleteTextField(
        googleAPIKey:
            "AIzaSyAqXM_XIUKgYMHTWcggt1hhow0igu9R2CI", // Replace with your API key
        textEditingController: TextEditingController(),
        inputDecoration: InputDecoration(
          hintText: "Search your Destination",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 800);
  }
}
