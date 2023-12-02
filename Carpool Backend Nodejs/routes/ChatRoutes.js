// routes/chatRoutes.js
const express = require('express');
const router = express.Router();
const PrivateChatRoomModel = require('../models/PrivateChatModel');

// Create or update a private chat room
router.post('/create', async (req, res) => {
  try {
    const { roomId, user1Id, user2Id, messages } = req.body;

    // Check if a chat room with the given roomId exists
    const existingChatRoom = await PrivateChatRoomModel.findOne({ roomId });

    if (existingChatRoom) {
      // If the chat room exists, update messages and lastMessageTime
      existingChatRoom.messages= existingChatRoom.messages.concat(messages);
      existingChatRoom.lastMessageTime = new Date();
      const updatedChatRoom = await existingChatRoom.save();
      return res.status(200).json(updatedChatRoom);
    } else {
      // If the chat room doesn't exist, create a new one
      const chatRoom = new PrivateChatRoomModel({
        roomId,
        user1Id,
        user2Id,
        messages,
        lastMessageTime: new Date(),
      });
      const savedChatRoom = await chatRoom.save();
      return res.status(201).json(savedChatRoom);
    }
  } catch (error) {
    return res.status(500).json({ error: 'Failed to create or update chat room' });
  }
});


// get messages 

router.get('/messages/:roomId', async (req, res) => {
  try {
    const roomId = req.params.roomId;

    // Find the chat room by roomId
    const chatRoom = await PrivateChatRoomModel.findOne({ roomId });

    if (!chatRoom) {
      return res.status(404).json({ error: 'Chat room not found' });
    }

    // Extract messages from the chat room
    const messages = chatRoom.messages;

    res.status(200).json(messages);
  } catch (error) {
    return res.status(500).json({ error: 'Failed to retrieve messages' });
  }
});

module.exports = router;
