const express = require('express');
const mugControllers = require('../controllers/mugControllers');

const router = express.Router();

router.get('/', mugControllers.getAll);
router.get('/:id(\\d+)', mugControllers.getById);
router.post('/', mugControllers.create);
router.put('/use/:id(\\d+)', mugControllers.use);

module.exports = router;