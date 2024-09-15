const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getAssembledPC, addAssembledPC, updateAssembledPC, deletedAssembledPC } = require('../controllers/assembledPC.controller');

router.get('/api/assembledPC', validateJWT, getAssembledPC);
router.post('/api/assembledPC/register', validateJWT, addAssembledPC);
router.put('/api/assembledPC/update', validateJWT, updateAssembledPC);
router.delete('/api/assembledPC/delete/:id', validateJWT, deletedAssembledPC);

module.exports = router;