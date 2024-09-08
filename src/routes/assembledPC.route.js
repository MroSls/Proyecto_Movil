const router = require('express').Router();
const { getAssembledPC, addAssembledPC } = require('../controllers/assembledPC.controller');

router.get('/api/assembledPC', getAssembledPC);
router.post('/api/assembledPC/register', addAssembledPC);

module.exports = router;