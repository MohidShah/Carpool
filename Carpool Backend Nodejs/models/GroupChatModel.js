const mongoose = require('mongoose');

const groupMemberSchema = new mongoose.Schema({
  memberId: String,
  memberName: String,
});

const groupChatSchema = new mongoose.Schema({
  chatId: String,
  groupName: String,
  groupIcon: String,
  messages: [
    {
      messageId: String,
      senderId: String,
      content: String,
      timestamp: Date,
    },
  ],
  lastMessageTime: Date,
  members: [groupMemberSchema],
});

const GroupChat = mongoose.model('GroupChat', groupChatSchema);
