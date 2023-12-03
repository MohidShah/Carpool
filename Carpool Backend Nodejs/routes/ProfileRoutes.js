// routes/profileRoutes.js
const express = require('express');
const router = express.Router();
const ProfileModel = require('../models/ProfileModel');

// GET profile by user ID
router.get('/:userId', async (req, res) => {
  try {
    const userId = req.params.userId; // Get the user ID from the URL

    // Find the user's profile by user ID
    const profile = await ProfileModel.findOne({ user: userId });

    if (!profile) {
      return res.status(404).json({ error: 'Profile not found' });
    }

    res.status(200).json({ profile });
  } catch (error) {
    res.status(500).json({ error: 'Profile retrieval failed' });
  }
});
router.post('/change-status', async (req, res) => {
  try {
    const profileId = req.body.profileId;
    const newStatus = req.body.status;

    // Validate the new status value
    if (typeof newStatus !== 'boolean') {
      return res.status(400).json({ error: 'Invalid status value' });
    }

    // Find the profile by ID
    const profile = await ProfileModel.findById(profileId);

    if (!profile) {
      return res.status(404).json({ error: 'Profile not found' });
    }

    // Update the status
    profile.status = newStatus;
    await profile.save();

    res.json({ message: 'Status updated successfully', profile });
  } catch (error) {
    console.error('Error changing status:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Route to get all user profiles
// Assuming ProfileModel has the structure similar to mongoose Model

module.exports = router;