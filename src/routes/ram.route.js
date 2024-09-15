const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getRAM, addRAM, updateRAM, deleteRAM } = require('../controllers/ram.controller');

router.get('/api/ram', validateJWT, getRAM);
router.get('/api/ram/register', validateJWT, addRAM);
router.get('/api/ram/update', validateJWT, updateRAM);
router.get('/api/ram/delete', validateJWT, deleteRAM);

module.exports = router;