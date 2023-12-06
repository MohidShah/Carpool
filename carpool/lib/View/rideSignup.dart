// ignore_for_file: file_names, camel_case_types

import 'package:carpool/Controller/passengercontroller.dart';
import 'package:carpool/exportlinks.dart';

import '../CustomWidgets/genderbtn.dart';

class rideSignup extends StatefulWidget {
  rideSignup({super.key});

  @override
  State<rideSignup> createState() => _rideSignupState();
}

class _rideSignupState extends State<rideSignup> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/animation/joinus.json'),
              LoginTitle(context: context, text: "Book Ride"),
              SizedBox(
                height: MySizes(context).screenHeight * 0.05,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "First Name",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone No",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySizes(context).screenHeight * 0.03,
              ),
              SizedBox(
                width: MySizes(context).screenWidth * 0.8,
                height: MySizes(context).screenHeight * 0.05,
                child: TextField(
                  controller: dobController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    fillColor: myColors().textfieldFilled,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MySizes(context).screenHeight * 0.03),
              StyledRadioTile(
                gender: 'Male',
                selectedGender: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              SizedBox(height: MySizes(context).screenHeight * 0.03),
              StyledRadioTile(
                gender: 'Female',
                selectedGender: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              SizedBox(height: MySizes(context).screenHeight * 0.03),
              SizedBox(
                width: MySizes(context).screenWidth * 0.4,
                child: Cbutton(
                  onPressed: () {
                    setState(() {
                      Map<String, dynamic> payload = {
                        "firstName": firstNameController.text,
                        "lastName": lastNameController.text,
                        "email": emailController.text,
                        "password": passwordController.text,
                        "confirmPassword": confirmPasswordController.text,
                        "phoneNumber": phoneController.text,
                        "dateOfBirth": dobController.text,
                        "gender": selectedGender,
                        "role": "passenger",
                        "status": true,
                      };
                      PassengerController()
                          .Signup(context, selectedGender, payload);
                    });
                  },
                  text: "Sign up",
                  context: context,
                ),
              ),
              SizedBox(height: MySizes(context).screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
    bool isPassword = false,
  }) {
    return SizedBox(
      width: MySizes(context).screenWidth * 0.8,
      height: MySizes(context).screenHeight * 0.05,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: myColors().textfieldFilled,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}

class StyledRadioTile extends StatefulWidget {
  final String gender;
  final String selectedGender;
  final ValueChanged<String> onChanged;

  StyledRadioTile({
    required this.gender,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  _StyledRadioTileState createState() => _StyledRadioTileState();
}

class _StyledRadioTileState extends State<StyledRadioTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color:
            widget.selectedGender == widget.gender ? Colors.blue : Colors.white,
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Center(
        child: RadioListTile<String>(
          title: Text(
            widget.gender,
            style: TextStyle(
              color: widget.selectedGender == widget.gender
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          activeColor: Colors.transparent,
          value: widget.gender,
          groupValue: widget.selectedGender,
          onChanged: (value) => widget.onChanged(value!),
        ),
      ),
    );
  }
}
