class SignupPassengerModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String cnic;
  final String dateOfBirth;
  final String gender;

  SignupPassengerModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.cnic,
    required this.dateOfBirth,
    required this.gender,
  });

  factory SignupPassengerModel.fromJson(Map<String, dynamic> json) {
    return SignupPassengerModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      phoneNumber: json['phoneNumber'],
      cnic: json['cnic'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
      'cnic': cnic,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}
