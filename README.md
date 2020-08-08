# mugcollection-api:coffee:

Tool to manage your own mug collection.

Using:

- [Node.js](https://nodejs.org/),
- [Express](https://expressjs.com/),
- [PostgreSQL](https://www.postgresql.org/),
- [Sqitch](https://sqitch.org/),
- [Joi](https://hapi.dev/module/joi/)

## Contents

- [mugcollection-api:coffee:](#mugcollection-apicoffee)
  - [Contents](#contents)
  - [Getting Started](#getting-started)
  - [Routes](#routes)
    - [Get details about all your mugs](#get-details-about-all-your-mugs)
    - [Get details about all your ready-to-use mugs (cleaned)](#get-details-about-all-your-ready-to-use-mugs-cleaned)
    - [Get details about a mug](#get-details-about-a-mug)
    - [Add a new mug to your collection](#add-a-new-mug-to-your-collection)
    - [Use a mug from your collection](#use-a-mug-from-your-collection)
    - [Clean a mug from your collection](#clean-a-mug-from-your-collection)
    - [Update state of a mug from your collection](#update-state-of-a-mug-from-your-collection)
    - [Remove a mug from your collection](#remove-a-mug-from-your-collection)

## Getting Started

1. Clone the repo using `git clone`.
2. Create your own `.env` and `sqitch.conf`, using `.example` files.
3. Launch:

```bash
npm install
sqitch status # To verify that sqitch is connected
sqitch deploy
npm run start
```

4. Enjoy! :rocket:

To run as "dev mode": `npm run dev`. <br/>
Please note that [nodemon](https://www.npmjs.com/package/nodemon) needs to be globally installed : `sudo npm install -g nodemon`

## Routes

### Get details about all your mugs

- Route:
  
```bash
GET /mugs
```

- Response *(JSON Object)*:

``` JS
{
  "data": [
    {
      "id": integer,
      "label": string,
      "capacity": integer,
      "last_used": timestampz,
      "is_clean": boolean,
      "description": string,
      "state": string
    },
    ...
  ]
}
```

### Get details about all your ready-to-use mugs (cleaned)

- Route:
  
```bash
GET /mugs/cleaned
```

- Response *(JSON Object)*:

``` JS
{
  "data": [
    {
      "id": integer,
      "label": string,
      "capacity": integer,
      "last_used": timestampz,
      "is_clean": boolean, //true
      "description": string,
      "state": string
    },
    ...
  ]
}
```

### Get details about a mug

- Route:
  
```bash
GET /mugs/{mug_id}
```

- Path parameter:
  
```bash
mug_id: integer
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "id": integer,
    "label": string,
    "capacity": integer,
    "last_used": timestampz,
    "is_clean": boolean,
    "description": string,
    "state": string
  }
}
```

### Add a new mug to your collection

- Route:
  
```bash
POST /mugs
```

- Request *(JSON Object)*:
  
```JS
{
  "label": string, //required (unique)
  "capacity": integer, //required (in ml) - default: 250
  "description": string, //optional
  "state": string //required - default: 'Nothing to report'
}
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "label": string,
    "capacity": integer,
    "description": string,
    "state": string,
    "id": integer
  }
}
```

### Use a mug from your collection

- Route:
  
```bash
PUT /mugs/use/{mug_id}
```

- Path parameter:
  
```bash
mug_id: integer
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "id": integer,
    "label": string,
    "capacity": integer,
    "last_used": timestampz, //now()
    "is_clean": boolean, //false
    "description": string,
    "state": string
  }
}
```

### Clean a mug from your collection

- Route:
  
```bash
PUT /mugs/clean/{mug_id}
```

- Path parameter:
  
```bash
mug_id: integer
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "id": integer,
    "label": string,
    "capacity": integer,
    "last_used": timestampz,
    "is_clean": boolean, //true
    "description": string,
    "state": string
  }
}
```

### Update state of a mug from your collection

- Route:
  
```bash
PUT /mugs/update/{mug_id}
```

- Path parameter:
  
```bash
mug_id: integer
```

- Request *(JSON Object)*:
  
```JS
{
  "state": string //required
}
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "id": integer,
    "label": string,
    "capacity": integer,
    "last_used": timestampz,
    "is_clean": boolean,
    "description": string,
    "state": string //updated
  }
}
```

### Remove a mug from your collection

- Route:
  
```bash
GET /mugs/remove/{mug_id}
```

- Path parameter:
  
```bash
mug_id: integer
```

- Response *(JSON Object)*:

``` JS
{
  "data": {
    "The mug has been removed from your collection!"
  }
}
```
