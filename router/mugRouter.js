const express = require('express');
const { todo } = require('../controllers/mugControllers');

const router = express.Router();

router.get('/', todo);
router.post('/', todo);
router.put('/:id(\\d+)', todo);

module.exports = router;