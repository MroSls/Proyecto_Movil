const StorageService = require('../services/storage.service');

const getStorage = async (req, res) => {
    try {
        const storages = await StorageService.getStorage();
        res.json({ storages });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const addStorage = async (req, res) => {
    try {
        const newStorage = await StorageService.addStorage(req.body);
        res.status(201).json({ newStorage });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const updateStorage = async (req, res) => {
    try {
        const updatedStorage = await StorageService.updateStorage(req.body);
        if (!updatedStorage) {
            res.status(404).json({ message: 'No se ha encontrado la memoria de almacenamiento' });
        }

        res.status(200).json({ updateStorage });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

const deleteStorage = async (req, res) => {
    try {
        const deletedStorage = await StorageService.deleteStorage(req.params.id);
        if (!deletedStorage) {
            res.status(404).json({ message: 'No se ha encontrado la memoria de almacenamiento' });
        }

        res.status(200).json({ deletedStorage });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = { getStorage, addStorage, updateStorage, deleteStorage };