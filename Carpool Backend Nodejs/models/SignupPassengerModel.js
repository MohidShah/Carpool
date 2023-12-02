// models/SignupPassengerModel.js
const mongoose = require('mongoose');

const passengerSchema = new mongoose.Schema({
  firstName: String,
  lastName: String,
  email: String,
  password: String,
  confirmPassword: String,
  phoneNumber: String,
  cnic: String,
  dateOfBirth: String,
  role: String,
  gender: String,
  status: Boolean
});

module.exports = mongoose.model('Passenger', passengerSchema);
