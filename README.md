# mugcollection-api :coffee:

Tool to manage its own mug collection.

Using:

- [Node.js](https://nodejs.org/),
- [Express](https://expressjs.com/),
- [PostgreSQL](https://www.postgresql.org/),
- [Sqitch](https://sqitch.org/),
- [Joi](https://hapi.dev/module/joi/)

## Getting Started

1. Create your own `.env` and `sqitch.conf`, using `.example` files.
2. Launch:

```bash
npm install
sqitch status # To verify that sqitch is connected
sqitch deploy
npm run start
```

3. Enjoy! :rocket:

To run as "dev mode": `npm run dev`. <br/>
Please note that [nodemon](https://www.npmjs.com/package/nodemon) needs to be globally installed : `sudo npm install -g nodemon`
