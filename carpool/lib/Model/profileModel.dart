class ProfileModel {
  final String coverImage;
  final String profileImage;
  final String name;
  final String location;
  final String bio;
  final List<String> friendsList;
  final int rides;
  final String pickup;

  ProfileModel({
    required this.coverImage,
    required this.profileImage,
    required this.name,
    required this.location,
    required this.bio,
    required this.friendsList,
    required this.rides,
    required this.pickup,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      coverImage: json['coverImage'],
      profileImage: json['profileImage'],
      name: json['name'],
      location: json['location'],
      bio: json['bio'],
      friendsList: List<String>.from(json['friendsList']),
      rides: json['rides'],
      pickup: json['pickup'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coverImage': coverImage,
      'profileImage': profileImage,
      'name': name,
      'location': location,
      'bio': bio,
      'friendsList': friendsList,
      'rides': rides,
      'pickup': pickup,
    };
  }
}
