const router = require('express').Router();
const { getAssembledPC } = require('../controllers/assembledPC.controller');

router.get('/api/assembledPC', getAssembledPC);

module.exports = router;