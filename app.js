require('dotenv').config();
const express = require('express');
const mugRouter = require('./router/mugRouter');

const app = express();

app.use(express.json());

app.use('/mugs', mugRouter);

app.use((_, response) => {
    response.status(404).json({
        data: "Sorry can't find that!"
    });
});

const port = process.env.PORT || 3000;

app.listen(port, _ => {
console.log(`Running on: ${port}`)
}); 