// groupRoutes.js
const express = require('express');
const router = express.Router();
const Group = require('../models/createGroupModel');

// Create a new group
router.post('/create', async (req, res) => {
  try {
    const group = new Group(req.body);
    const savedGroup = await group.save();
    res.status(201).json(savedGroup);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create group' });
  }
});

// Fetch a group by ID
router.get('/:groupId', async (req, res) => {
  try {
    const groupId = req.params.groupId;
    const group = await Group.findOne({ groupId });
    if (!group) {
      return res.status(404).json({ error: 'Group not found' });
    }
    res.status(200).json(group);
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve group' });
  }
});

// Fetch all groups
router.get('/getall', async (req, res) => {
  try {
    const groups = await Group.find();
    res.status(200).json(groups);
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve groups' });
  }
});

module.exports = router;