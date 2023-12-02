class LoginModel {
  final String email;
  final String password;
  final String role; // "driver" or "passenger"

  LoginModel({
    required this.email,
    required this.password,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
      role: json[
          'role'], // You should set this to "driver" or "passenger" during login
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role, // Include the user's role
    };
  }
}
