const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getMB, addMB, updateMB, deleteMB } = require('../controllers/motherboard.controller');

router.get('/api/motherboard', validateJWT, getMB);
router.post('/api/motherboard/register', validateJWT, addMB);
router.put('/api/motherboard/update', validateJWT, updateMB);
router.delete('/api/motherboard/delete', validateJWT, deleteMB);

module.exports = router;