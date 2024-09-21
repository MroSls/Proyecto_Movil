const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getCPU, addCPU, updateCPU, deleteCPU } = require('../controllers/cpu.controller');

router.get('/api/cpu', validateJWT, getCPU);
router.post('/api/cpu/register', validateJWT, addCPU);
router.put('/api/cpu/update', validateJWT, updateCPU);
router.delete('/api/cpu/delete', validateJWT, deleteCPU);

module.exports = router;