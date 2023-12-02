// routes/rideRequestRoutes.js
const express = require('express');
const router = express.Router();
const RideRequest = require('../models/rideRequestModel');

// Create a new ride request
router.post('/create', async (req, res) => {
  try {
    const rideRequestData = req.body;
    const rideRequest = new RideRequest(rideRequestData);
    const savedRequest = await rideRequest.save();
    res.status(201).json(savedRequest);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create ride request' });
  }
});

// Retrieve all ride requests
router.get('/all', async (req, res) => {
  try {
    const rideRequests = await RideRequest.find();
    res.status(200).json(rideRequests);
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve ride requests' });
  }
});

module.exports = router;
