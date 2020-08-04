require('dotenv').config();
const express = require('express');
const mugRouter = require('./router/mugRouter');

const app = express();

app.use(express.json());
app.use('/mugs', mugRouter);

const port = process.env.PORT || 3000;

app.listen(port, _ => {
console.log(`Running on: ${port}`)
}); 