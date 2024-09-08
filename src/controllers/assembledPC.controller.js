const assembledPCService = require('../services/assembledPC.service');

const getAssembledPC = async (req, res) => {
    res.json({
        assembledPC: await assembledPCService.getAssembledPC()
    });
}

module.exports = { getAssembledPC };