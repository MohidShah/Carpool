import 'dart:convert';
import 'package:carpool/Controller/drivercontroller.dart';
import 'package:http/http.dart' as http;

import '../Model/privateChatModel.dart';

class ChatApiService {
  final String baseUrl;

  ChatApiService({required this.baseUrl});

  Future<void> createPrivateChatRoom(Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/chat/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      // Room created successfully
    } else {
      // Handle errors
      print('Failed to create chat room. Status code: ${response.statusCode}');
    }
  }

  final chatApiService = ChatApiService(baseUrl: 'http://$myip:3000');
  final payload = {
    "roomId": "3",
    "user1Id": "6532f2832d8e3041cf416882",
    "user2Id": "6532f2ab8a7de74b64aea30d",
    "messages": [
      {
        "messageId": "1",
        "senderId": "6532f2832d8e3041cf416882",
        "content": "iam goo3",
        "timestamp": "2023-10-25T14:30:00Z"
      }
    ]
  };
  Future<List<ChatMessage>> getChatMessages(String roomId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/chat/$roomId/messages'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonMessages = jsonDecode(response.body);
      return jsonMessages.map((json) => ChatMessage.fromJson(json)).toList();
    } else {
      // Handle errors
      print(
          'Failed to fetch chat messages. Status code: ${response.statusCode}');
      return [];
    }
  }

  void loadChatMessages() async {
    final roomId = '3'; // Replace with your actual room ID
    final messages = await chatApiService.getChatMessages(roomId);
    // Update the messages list in your controller
    // controller.messages = messages;
  }
}
