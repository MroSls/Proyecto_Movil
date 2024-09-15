const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getGPU, addGPU, updateGPU, deleteGPU } = require('../controllers/gpu.controller');

router.get('/api/cpu', validateJWT, getGPU);
router.post('/api/cpu/register', validateJWT, addGPU);
router.put('/api/cpu/update', validateJWT, updateGPU);
router.delete('/api/cpu/delete', validateJWT, deleteGPU);

module.exports = router;