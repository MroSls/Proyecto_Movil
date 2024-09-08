const router = require('express').Router();
const { getAssembledPC, addAssembledPC, updateAssembledPC } = require('../controllers/assembledPC.controller');

router.get('/api/assembledPC', getAssembledPC);
router.post('/api/assembledPC/register', addAssembledPC);
router.put('/api/assembledPC/update', updateAssembledPC);

module.exports = router;