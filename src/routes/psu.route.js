const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getPSU, addPSU, updatePSU, deletePSU } = require('../controllers/psu.controller');

router.get('/api/psu', validateJWT, getPSU);
router.post('/api/psu/register', validateJWT, addPSU);
router.put('/api/psu/update', validateJWT, updatePSU);
router.delete('/api/psu/delete', validateJWT, deletePSU);

module.exports = router;