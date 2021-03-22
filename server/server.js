'use strict';

const express = require('express');
const os = require("os");
const hostname = os.hostname();

// Constants
const PORT = process.env.PORT || 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send(hostname + "\n");
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
