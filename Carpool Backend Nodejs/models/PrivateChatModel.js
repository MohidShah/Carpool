// models/PrivateChatRoomModel.js
const mongoose = require('mongoose');

const chatMessageSchema = new mongoose.Schema({
  senderId: String,
  content: String,
  timestamp: Date,
});

const privateChatRoomSchema = new mongoose.Schema({
  roomId: String,
  user1Id: String,
  user2Id: String,
  messages: [chatMessageSchema],
  lastMessageTime: Date,
});

const PrivateChatRoomModel = mongoose.model('PrivateChatRoom', privateChatRoomSchema);

module.exports = PrivateChatRoomModel;
