const router = require('express').Router();
const { getCase, addCase, updateCase, deleteCase } = require('../controllers/case.controller');

router.get('/api/case', getCase);
router.post('/api/case/register', addCase);
router.put('/api/case/update', updateCase);
router.delete('/api/case/delete/:id', deleteCase);

module.exports = router;