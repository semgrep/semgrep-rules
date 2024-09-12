const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jwt-simple');
const mongoose = require('mongoose');
const mongoSanitize = require('express-mongo-sanitize');

const app = express();
app.use(express.json());
app.use(mongoSanitize());
const secretKey = process.env.JWT_SECRET;

// Sample MongoDB connection URI
const mongoURI = 'mongodb://localhost:27017/test';

// Connect to MongoDB using Mongoose
mongoose.connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true });
const db = mongoose.connection;

// Create a user schema
const userSchema = new mongoose.Schema({
  username: String,
  password: String
});

// Create a user model
const User = mongoose.model('User', userSchema);

// Route for user login
app.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    // Find user by username
    const user = await User.findOne({ username });

    if (!user) {
      return res.status(401).json({ error: 'Authentication failed. User not found.' });
    }

    // Compare password with hashed password
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Authentication failed. Invalid password.' });
    }

    // Issue JWT token
    const token = jwt.encode({ username }, secretKey,'HS256');
    res.json({ token });
  } catch (error) {
    console.error('Error occurred during login:', error);
    res.status(500).json({ error: 'Internal server error.' });
  }
});

// Route that requires authentication
app.get('/protectedRoute1', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized. Token missing.' });
  }

  try {
    // ruleid: jwt-simple-noverify  
    const decoded = jwt.decode(token, secretKey, 'HS256');
    res.json({ message: `Hello ${decoded.username}` });
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized. Invalid token.' });
  }
});

// Route that requires authentication
app.get('/protectedRoute2', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized. Token missing.' });
  }

  try {
    // ruleid: jwt-simple-noverify   
    const decoded = jwt.decode(token, secretKey, true);
    res.json({ message: `Hello ${decoded.username}` });
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized. Invalid token.' });
  }
});

// Route that requires authentication
app.get('/protectedRoute3', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized. Token missing.' });
  }

  try {
    // ruleid: jwt-simple-noverify    
    const decoded = jwt.decode(token, secretKey, 'false');
    res.json({ message: `Hello ${decoded.username}` });
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized. Invalid token.' });
  }
});

// Route that requires authentication
app.get('/protectedRoute4', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized. Token missing.' });
  }

  try {
    // ok: jwt-simple-noverify   
    const decoded = jwt.decode(token, secretKey);
    res.json({ message: `Hello ${decoded.username}` });
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized. Invalid token.' });
  }
});

// Route that requires authentication
app.get('/protectedRoute5', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Unauthorized. Token missing.' });
  }

  try {
    // ok: jwt-simple-noverify    
    const decoded = jwt.decode(token, secretKey, false);
    res.json({ message: `Hello ${decoded.username}` });
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized. Invalid token.' });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));