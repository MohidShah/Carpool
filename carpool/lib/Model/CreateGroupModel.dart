class Group {
  final String groupId;
  final String groupName;
  final List<String> members; // List of member IDs
  final String groupImage; // URL or path to the group image

  Group({
    required this.groupId,
    required this.groupName,
    required this.members,
    required this.groupImage,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupId: json['groupId'],
      groupName: json['groupName'],
      members: List<String>.from(json['members']),
      groupImage: json['groupImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'members': members,
      'groupImage': groupImage,
    };
  }
}
