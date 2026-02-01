const express = require('express');
const app = express();

// Basic endpoint returning a JSON message
app.get('/', (req, res) => {
  res.json({ message: 'Hello from the EKS Node.js app!' });
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});