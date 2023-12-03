const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();

// Use Express built-in JSON middleware for parsing JSON requests
app.use(express.json()); 

// Enable CORS for all routes
app.use(cors());

// Connect to MongoDB
mongoose.connect('mongodb+srv://iammohidshah:ATrFz29PKHxAmDjj@cluster0.9o7jx9f.mongodb.net/Carpooldb?retryWrites=true&w=majority', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  // connectTimeoutMS: 10000, // 10 seconds
  // socketTimeoutpMS: 45000,  // 45 seconds
});

const db = mongoose.connection;

// Handle MongoDB connection events
db.on('error', (err) => {
  console.error('MongoDB connection error:', err);
});

db.once('open', () => {
  console.log('MongoDB connected');
});

// Import your models and routes
const SignupDriverModel = require('./models/SignupDriverModel');
const SignupPassengerModel = require('./models/SignupPassengerModel');
const ProfileModel = require('./models/ProfileModel');
const UserModel = require('./models/LoginModel');
const GroupModel = require('./models/GroupChatModel');

const driverRoutes = require('./routes/DriverRoutes');
const passengerRoutes = require('./routes/PassengerRoutes');
const loginRoutes = require('./routes/LoginRoutes');
const profileRoutes = require('./routes/ProfileRoutes');
const chatRoutes = require('./routes/chatRoutes');
const GroupchatRoutes = require('./routes/GroupChatRoutes');
const requesrrideRoutes = require('./routes/rideRequestRoutes');
const promotionRoutes = require('./routes/PromotionRoutes');
const groupRoutes = require('./routes/createGroupRoutes');

// Define API routes
app.use('/api/driver', driverRoutes);
app.use('/api/passenger', passengerRoutes);
app.use('/api/users', loginRoutes);
// Use the profile route
app.use('/api/profiles', profileRoutes);
app.use('/api/chat', chatRoutes);
app.use('/api/groupchat', GroupchatRoutes); 
// Use the ridebook routes
app.use('/api/ride',requesrrideRoutes);
app.use('/api/offer',promotionRoutes);
app.use('/api/creategroup', groupRoutes); 

const PORT = process.env.PORT || 3000;
app.listen(PORT,'0.0.0.0', () => {
  console.log(`Server is running on port ${PORT}`);
});
