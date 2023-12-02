// models/rideRequestModel.js
const mongoose = require('mongoose');

const rideRequestSchema = new mongoose.Schema({
  requestId: String,
  polygonCoordinates: [
    {
      latitude: Number,
      longitude: Number,
    },
  ],
  status: String,
  driverId: String,
  passengerId: String,
  startLocation: String,
  endLocation: String,
});

module.exports = mongoose.model('RideRequest', rideRequestSchema);
