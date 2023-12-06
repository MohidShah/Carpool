// ignore_for_file: file_names, camel_case_types

import 'package:carpool/Controller/drivercontroller.dart';
import 'package:carpool/exportlinks.dart';

class driverSignup extends StatefulWidget {
  driverSignup({super.key});

  @override
  State<driverSignup> createState() => _driverSignupState();
}

class _driverSignupState extends State<driverSignup> {
  String selectedGender = 'Male';
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Dateofbirth = MaskedTextController(mask: '00/00/0000');
  TextEditingController cnic = MaskedTextController(mask: '00000-0000000-0');

  late PickedFile? _pickedFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedFile = pickedFile as PickedFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().bgWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/animation/joinus.json'),
            LoginTitle(context: context, text: "Pick Ride"),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
            SizedBox(
              width: MySizes(context).screenWidth * 0.8,
              height: MySizes(context).screenHeight * 0.05,
              child: TextField(
                controller: FirstName,
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
                controller: LastName,
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
                controller: Email,
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
                controller: Password,
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
                controller: Confirmpassword,
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
                controller: Phone,
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
                controller: cnic,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Cnic",
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
                controller: Dateofbirth,
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
            Container(
              width: MySizes(context).screenWidth * 0.7,
              height: MySizes(context).screenHeight * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cTitle(
                      text: "Upload Driving License",
                      context: context,
                      size: 20.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: myColors().bgGreen,
                      child: Icon(
                        Icons.upload_file,
                        color: myColors().whiteTitle,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MySizes(context).screenHeight * 0.03,
            ),
            SizedBox(
                width: MySizes(context).screenWidth * 0.4,
                child: Cbutton(
                    // ignore: avoid_print
                    onPressed: () {
                      setState(() {
                        Map<String, dynamic> payload = {
                          "firstName": FirstName.text,
                          "lastName": LastName.text,
                          "email": Email.text,
                          "password": Password.text,
                          "confirmPassword": Confirmpassword.text,
                          "phoneNumber": Phone.text,
                          "cnic": cnic.text,
                          "dateOfBirth": Dateofbirth.text,
                          "gender": "male",
                          "role": "driver",
                          "status": true
                        };
                        DriverController()
                            .Signup(context, selectedGender, payload);
                      });
                    },
                    text: "Sign up",
                    context: context)),
            SizedBox(
              height: MySizes(context).screenHeight * 0.05,
            ),
          ],
        ),
      )),
    );
  }
}
