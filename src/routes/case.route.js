const router = require('express').Router();
const { validateJWT } = require('../middleware/auth');
const { getCase, addCase, updateCase, deleteCase } = require('../controllers/case.controller');

router.get('/api/case', validateJWT, getCase);
router.post('/api/case/register', validateJWT, addCase);
router.put('/api/case/update', validateJWT, updateCase);
router.delete('/api/case/delete/:id', validateJWT, deleteCase);

module.exports = router;