const express = require('express');
const mugControllers = require('../controllers/mugControllers');

const router = express.Router();

router.get('/', mugControllers.getAll);
router.post('/', mugControllers.create);
router.put('/use/:id(\\d+)', mugControllers.use);

module.exports = router;