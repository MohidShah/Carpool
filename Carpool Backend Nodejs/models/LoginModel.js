// models/UserModel.js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  email: String,
  password: String,
  role: String,
  // You can add more fields as needed
});

module.exports = mongoose.model('User', userSchema);
