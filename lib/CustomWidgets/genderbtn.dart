import 'package:carpool/exportlinks.dart';

Widget styledRadioTile(String gender, selectedGender, BuildContext context) {
  return Obx(() => Container(
        width: MySizes(context).screenWidth * 0.8,
        height: MySizes(context).screenHeight * 0.07,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: selectedGender.value == gender ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Center(
          child: RadioListTile<String>(
            title: Text(
              gender,
              style: TextStyle(
                color: selectedGender.value == gender
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            activeColor: Colors.transparent,
            value: gender,
            groupValue: selectedGender.value,
            onChanged: (value) => selectedGender.value = value!,
          ),
        ),
      ));
}
