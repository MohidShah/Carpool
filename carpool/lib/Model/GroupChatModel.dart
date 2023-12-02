import 'privateChatModel.dart';

class GroupChat {
  final String chatId;
  final String groupName;
  final String groupIcon;
  final List<ChatMessage> messages;
  final DateTime lastMessageTime;
  final List<GroupMember> members; // List of group members

  GroupChat({
    required this.chatId,
    required this.groupName,
    required this.groupIcon,
    required this.messages,
    required this.lastMessageTime,
    required this.members, // Include members
  });

  // ... Rest of the class remains the same ...

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'groupName': groupName,
      'groupIcon': groupIcon,
      'messages': messages.map((message) => message.toJson()).toList(),
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'members': members.map((member) => member.toJson()).toList(),
    };
  }
}

class GroupMember {
  final String memberId;
  final String memberName;

  GroupMember({
    required this.memberId,
    required this.memberName,
  });

  Map<String, dynamic> toJson() {
    return {
      'memberId': memberId,
      'memberName': memberName,
    };
  }
}
