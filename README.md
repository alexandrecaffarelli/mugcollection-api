# mugcollection-api

Tool to manage its own mug collection.

Using:

- NodeJs,
- Express,
- PostgreSQL,
- Sqitch

## Getting Started

1. Create your own `.env` and `sqitch.conf`, using `.example` files.

```bash
npm install
sqitch status # To verify that sqitch is connected
sqitch deploy
npm run start
```

To run as "dev mode": `npm run dev`. Please note that [nodemon](https://www.npmjs.com/package/nodemon) needs to be globally installed : `sudo npm install -g nodemon`
