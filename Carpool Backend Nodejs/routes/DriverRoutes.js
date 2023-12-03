// routes/driverRoutes.js
const express = require('express');
const router = express.Router();
const SignupDriverModel = require('../models/SignupDriverModel');
const ProfileModel = require('../models/ProfileModel');
// Handle driver registration
router.post('/register', async (req, res) => {
    try {
       
        const driver = new SignupDriverModel(req.body);
        await driver.save();
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
            user: driver._id, // Associate the profile with the driver
          };
        const profile = new ProfileModel(profileData);
        await profile.save();
        res.status(201).json(driver);
    } catch (error) {
        res.status(500).json({ error: 'Could not create a driver account' });
    }
});


router.get('/total', async (req, res) => {
    try {
        const totalDrivers = await SignupDriverModel.countDocuments();
        res.status(200).json({ totalDrivers });
    } catch (error) {
        res.status(500).json({ error: 'Could not retrieve total driver count' });
    }
});

router.get('/driverprofiles', async (req, res) => {
    try {
      // Fetch driver profiles from the database
      const driverProfiles = await SignupDriverModel.find({ role: 'driver' });
  
      // Respond with the driver profiles
      res.status(200).json({ driverProfiles });
    } catch (error) {
      console.error('Error fetching driver profiles:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
module.exports = router;
