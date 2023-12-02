// routes/loginRoutes.js
const express = require('express');
const router = express.Router();
const SignupDriverModel = require('../models/SignupDriverModel');
const SignupPassengerModel = require('../models/SignupPassengerModel');
const ProfileModel = require('../models/ProfileModel');
const userModel = require('../models/LoginModel');


// Handle user login
router.post('/login', async (req, res) => {
  const { email, password, role } = req.body;

  try {
    let user;
    let profile;

    if (role === 'driver') {
      user = await SignupDriverModel.findOne({ email });
    } else if (role === 'passenger') {
      user = await SignupPassengerModel.findOne({ email });
    }

    if (!user) {
      return res.status(401).json({ error: 'User not found' });
    }

    // Check if the password is correct (you can use a secure authentication method)
    if (user.password !== password) {
      return res.status(401).json({ error: 'Incorrect password' });
    }
    profile = await ProfileModel.findOne({ user: userModel._id });
    
    res.status(200).json({ message: 'Login successful', user });
  } catch (error) {
    res.status(500).json({ error: 'Login failed' });
  }
});

module.exports = router;
