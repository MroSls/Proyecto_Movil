const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getGPU, addGPU, updateGPU, deleteGPU } = require('../controllers/gpu.controller');

router.get('/api/gpu', validateJWT, getGPU);
router.post('/api/gpu/register', validateJWT, addGPU);
router.put('/api/gpu/update', validateJWT, updateGPU);
router.delete('/api/gpu/delete', validateJWT, deleteGPU);

module.exports = router;