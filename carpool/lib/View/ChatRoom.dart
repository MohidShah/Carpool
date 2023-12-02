import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../Controller/GroupChatScreenController.dart';
import '../exportlinks.dart';

class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({super.key});
  final controller = Get.put(GroupChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors().bgColor,
        title: const Text('Mohid'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Get.offAndToNamed('/profile')},
        ),
      ),
      body: Chat(
        messages: controller.messages,
        // onAttachmentPressed: controller.handleAttachmentPressed(context),
        onMessageTap: controller.handleMessageTap,
        onPreviewDataFetched: controller.handlePreviewDataFetched,
        onSendPressed: controller.handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: controller.user,
      ),
    );
  }
}
