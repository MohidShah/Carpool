const express = require('express');
const router = express.Router();
const PromotionOffer = require('../models/PromotionOffer');

// Create a new promotion offer
router.post('/createoffer', async (req, res) => {
  try {
    const offer = new PromotionOffer(req.body);
    const savedOffer = await offer.save();
    res.status(201).json(savedOffer);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create promotion offer' });
  }
});

// Get all promotion offers
router.get('/getoffer', async (req, res) => {
  try {
    const offers = await PromotionOffer.find();
    res.status(200).json(offers);
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve promotion offers' });
  }
});

module.exports = router;
