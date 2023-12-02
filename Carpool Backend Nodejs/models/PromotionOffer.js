const mongoose = require('mongoose');

const promotionOfferSchema = new mongoose.Schema({
  title: String,
  description: String,
  startDate: Date,
  endDate: Date,
  discount: Number,
  imageUrl: String,
});

const PromotionOffer = mongoose.model('PromotionOffer', promotionOfferSchema);

module.exports = PromotionOffer;
