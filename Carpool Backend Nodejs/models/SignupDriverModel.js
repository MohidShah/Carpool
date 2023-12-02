// models/SignupDriverModel.js
const mongoose = require('mongoose');

const signupDriverSchema = new mongoose.Schema({
  firstName: String,
  lastName: String,
  email: String,
  password: String,
  confirmPassword: String,
  phoneNumber: String,
  cnic: String,
  dateOfBirth: String,
  gender: String,
  role: String,
  status: Boolean,
  drivingLicenseImage: String,
});

module.exports = mongoose.model('Driver', signupDriverSchema);
