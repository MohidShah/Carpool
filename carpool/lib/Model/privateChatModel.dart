class ChatMessage {
  final String messageId;
  final String senderId;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.messageId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      messageId: json['messageId'],
      senderId: json['senderId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class PrivateChatRoomModel {
  final String roomId; // Unique identifier for the chat room
  final String user1Id; // User ID of the first participant
  final String user2Id; // User ID of the second participant
  final List<ChatMessage> messages; // List of messages in the chat room
  final DateTime lastMessageTime; // Timestamp of the last message

  PrivateChatRoomModel({
    required this.roomId,
    required this.user1Id,
    required this.user2Id,
    required this.messages,
    required this.lastMessageTime,
  });

  factory PrivateChatRoomModel.fromJson(Map<String, dynamic> json) {
    return PrivateChatRoomModel(
      roomId: json['roomId'],
      user1Id: json['user1Id'],
      user2Id: json['user2Id'],
      messages: (json['messages'] as List)
          .map((message) => ChatMessage.fromJson(message))
          .toList(),
      lastMessageTime: DateTime.parse(json['lastMessageTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'user1Id': user1Id,
      'user2Id': user2Id,
      'messages': messages.map((message) => message!.toJson()).toList(),
      'lastMessageTime': lastMessageTime.toIso8601String(),
    };
  }
}
