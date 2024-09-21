const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getRAM, addRAM, updateRAM, deleteRAM } = require('../controllers/ram.controller');

router.get('/api/ram', validateJWT, getRAM);
router.post('/api/ram/register', validateJWT, addRAM);
router.put('/api/ram/update', validateJWT, updateRAM);
router.delete('/api/ram/delete', validateJWT, deleteRAM);

module.exports = router;