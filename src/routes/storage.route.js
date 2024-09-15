const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getStorage, addStorage, updateStorage, deleteStorage } = require('../controllers/storage.controller');

router.get('/api/storage', validateJWT, getStorage);
router.post('/api/storage/register', validateJWT, addStorage);
router.put('/api/storage/update', validateJWT, updateStorage);
router.delete('/api/storage/delete', validateJWT, deleteStorage);

module.exports = router;