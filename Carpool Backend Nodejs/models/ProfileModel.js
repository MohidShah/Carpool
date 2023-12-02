// models/ProfileModel.js
const mongoose = require('mongoose');

const profileSchema = new mongoose.Schema({
  coverImage: String,
  profileImage: String,
  name: String,
  location: String,
  status:Boolean,
  bio: String,
  friendsList: [String],
  rides: Number,
  pickup: Number,
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
  },
});

module.exports = mongoose.model('Profile', profileSchema);
