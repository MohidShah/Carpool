// routes/groupChatRoutes.js
const express = require('express');
const router = express.Router();
const GroupChatModel = require('../models/GroupChatModel');

// Create or update a group chat
router.post('/create', async (req, res) => {
  try {
    const { chatId, groupName, groupIcon, messages, members } = req.body;

    // Check if a group chat with the given chatId exists
    const existingGroupChat = await GroupChatModel.findOne({ chatId });

    if (existingGroupChat) {
      // If the group chat exists, update messages and lastMessageTime
      existingGroupChat.messages = existingGroupChat.messages.concat(messages);
      existingGroupChat.lastMessageTime = new Date();
      const updatedGroupChat = await existingGroupChat.save();
      return res.status(200).json(updatedGroupChat);
    } else {
      // If the group chat doesn't exist, create a new one
      const chat = new GroupChatModel({
        chatId,
        groupName,
        groupIcon,
        messages,
        lastMessageTime: new Date(),
        members,
      });
      const savedGroupChat = await chat.save();
      return res.status(201).json(savedGroupChat);
    }
  } catch (error) {
    return res.status(500).json({ error: 'Failed to create or update group chat' });
  }
});

// Get messages
router.get('/messages/:chatId', async (req, res) => {
  try {
    const chatId = req.params.chatId;

    // Find the group chat by chatId
    const groupChat = await GroupChatModel.findOne({ chatId });

    if (!groupChat) {
      return res.status(404).json({ error: 'Group chat not found' });
    }

    // Extract messages from the group chat
    const messages = groupChat.messages;

    res.status(200).json(messages);
  } catch (error) {
    return res.status(500).json({ error: 'Failed to retrieve messages' });
  }
});

module.exports = router;
