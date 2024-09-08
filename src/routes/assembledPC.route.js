const router = require('express').Router();
const { getAssembledPC, addAssembledPC, updateAssembledPC, deletedAssembledPC } = require('../controllers/assembledPC.controller');

router.get('/api/assembledPC', getAssembledPC);
router.post('/api/assembledPC/register', addAssembledPC);
router.put('/api/assembledPC/update', updateAssembledPC);
router.delete('/api/assembledPC/delete/:id', deletedAssembledPC);

module.exports = router;