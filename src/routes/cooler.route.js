const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getCooler, addCooler, updateCooler, deleteCooler } = require('../controllers/cooler.controller');

router.get('/api/cooler', validateJWT, getCooler);
router.post('/api/cooler/register', validateJWT, addCooler);
router.put('/api/cooler/update', validateJWT, updateCooler);
router.delete('/api/cooler/delete', validateJWT, deleteCooler);

module.exports = router;