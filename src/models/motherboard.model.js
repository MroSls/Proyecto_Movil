const { Schema, model } = require('mongoose');

const motherboardSchema = new Schema({
    url_image: { type: String, required: true },
    name: { type: String, required: true },
    brand: { type: String, required: true },
    socket: { type: String, required: true },
    compatibility: {
        ram_type: { type: String, enum: ['DDR4', 'DDR5'], required: true },
        pci_version: { type: String, enum: ['PCIe 3.0', 'PCIe 4.0'], required: true },
        cpu_compatibility: { type: String, enum: ['Intel', 'AMD'], required: true },
        gpu_compatibility: { type: String, enum: ['NVIDIA', 'AMD'], required: true },
        storage_compatibility: {
            sata: { type: Boolean, required: true },
            nvme: { type: Boolean, required: true }
        },
        url: { type: String, require: true },
        psu_power: { type: Number, required: true }
    },
    price: { type: Number, required: true}
});

module.exports = model('motherboard', motherboardSchema);