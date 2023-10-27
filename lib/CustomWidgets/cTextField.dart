// ignore_for_file: file_names, non_constant_identifier_names

import 'package:carpool/Controller/loginController.dart';
import 'package:carpool/exportlinks.dart';

pTextField(
    {context, PlaceholderText, secureText, makeSecure, controller, passField}) {
  return TextField(
    obscureText: secureText,
    controller: controller,
    decoration: InputDecoration(
        hintText: PlaceholderText,
        suffixIcon: GetBuilder(
            init: LoginController(),
            builder: (controller) {
              return GestureDetector(
                onTap: () {
                  passField == 1
                      ? controller.showHidePass()
                      : controller.showHidePass2();
                },
                child: Icon(
                  secureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              );
            }),
        fillColor: myColors().textfieldFilled,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        )),
  );
}

eTextField({context, PlaceholderText}) {
  return GetBuilder<LoginController>(
    id: const {'email'},
    init: LoginController(),
    initState: (state) => LoginController,
    builder: (controller) => TextField(
      decoration: InputDecoration(
          hintText: PlaceholderText,
          fillColor: myColors().textfieldFilled,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          )),
    ),
  );
}

myField({context, PlaceholderText, fieldType}) {
  return GetBuilder<LoginController>(
    init: LoginController(),
    initState: (state) => LoginController,
    builder: (controller) => TextField(
      controller: controller.fieldTypeController(fieldType),
      keyboardType:
          fieldType == 'Phone' ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
          hintText: PlaceholderText,
          fillColor: myColors().textfieldFilled,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          )),
    ),
  );
}
