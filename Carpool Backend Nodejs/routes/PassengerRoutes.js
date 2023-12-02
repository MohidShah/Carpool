// routes/passengerRoutes.js
const express = require('express');
const router = express.Router();
const PassengerModel = require('../models/SignupPassengerModel');
const ProfileModel = require('../models/ProfileModel');


// Handle passenger registration
router.post('/register', async (req, res) => {
  try {
 
    const passenger = new PassengerModel(req.body);
    await passenger.save();
    const profileData = {
      coverImage: "",
      profileImage: "",
      name: req.body.firstName+" "+req.body.lastName,
      location: "",
      bio: "",
      friendsList: [], // Assuming it's an array
      rides: 0, // Initialize to 0 or another default value
      pickup: 0,
      status:req.body.status,
      user: passenger._id, // Associate the profile with the driver
    };
    const profile = new ProfileModel(profileData);
    await profile.save();

    res.status(201).json(passenger);
  } catch (error) {
    res.status(500).json({ error: 'Could not create a passenger account' });
  }
});

router.get('/total', async (req, res) => {
  try {
      const totalpassenger = await PassengerModel.countDocuments();
      res.status(200).json({ totalpassenger });
  } catch (error) {
      res.status(500).json({ error: 'Could not retrieve total passenger count' });
  }
});
module.exports = router;
