const router = require('express').Router();
const { getToken } = require('../controllers/auth.controller');

router.get('/api/API-RESTful/auth', getToken);

module.exports = router;