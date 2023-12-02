// groupModel.js
const mongoose = require('mongoose');

const groupSchema = new mongoose.Schema({
  groupId: String,
  groupName: String,
  members: [String],
  groupImage: String,
});

const Group = mongoose.model('Group', groupSchema);

module.exports = Group;
