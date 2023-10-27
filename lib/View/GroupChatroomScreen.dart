import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../Controller/GroupChatScreenController.dart';
import '../exportlinks.dart';

class GroupChatScreen extends StatelessWidget {
  GroupChatScreen({super.key});
  final controller = Get.put(GroupChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors().bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Communities'),
            GestureDetector(
                onTap: () => Get.offAndToNamed('/GroupMembersList'),
                child: Icon(Icons.group))
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Get.offAndToNamed('/CommunityScreen')},
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
