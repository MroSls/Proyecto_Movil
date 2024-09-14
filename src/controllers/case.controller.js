const CaseService = require('../services/case.service');

const getCase = async (req, res) => {
    try {
        const cases = await CaseService.getCase();
        res.json({ cases });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addCase = async (req, res) => {
    try {
        const newCase = await CaseService.addCase(req.body);
        res.status(201).json({ newCase });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateCase = async (req, res) => {
    try {
        const updatedCase = await CaseService.updateCase(req.body);
        if (!updatedCase) {
            return res.status(404).json({ message: 'No se ha encontrado el gabinete' });
        }

        return res.status(200).json({ updatedCase });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deleteCase = async (req, res) => {
    try {
        const deletedCase = await CaseService.deleteCase(req.params.id);
        if (!deletedCase) {
            res.status(404).json({ message: 'No se ha encontrado el gabinete' });
        }

        res.status(200).json({ deleteCase });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getCase, addCase, updateCase, deleteCase };