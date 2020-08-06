const express = require('express');
const mugControllers = require('../controllers/mugControllers');
const dataControllers = require('../controllers/dataControllers');

const router = express.Router();

router.get('/', mugControllers.getAll);
router.get('/:id(\\d+)', mugControllers.getById);
router.post('/', dataControllers.validateMug, mugControllers.create);
router.put('/use/:id(\\d+)', mugControllers.use);
router.put('/clean/:id(\\d+)', mugControllers.clean);
router.put('/update/:id(\\d+)', dataControllers.validateState, mugControllers.updateState);
router.get('/remove/:id(\\d+)', mugControllers.remove);

router.use((_, response) => {
    response.status(404).json("Sorry can't find that!")
});

module.exports = router;