const {Schema, model} = require('mongoose');

const gpuSchema = new Schema ({
    name: { type: String, required: true},
    brand: { type: String, required: true},
    chipset: { type: String, enum: ['NVIDIA', 'AMD'], required: true},
    memory: { type: String, required: true}, // Ej: 8GB GDDR6
    pci_version: { type: String, enum: ['PCIe 3.0', 'PCIe 4.0'], required: true },
    power_consumption: { type: Number, required: true }, // Consumo en watts
    length_mm: { type: Number, required: true}, // Longitud en mm para compatibilidad con el gabinete
    compatibility: {
        cpu_compatibility: { type: String, enum: ['Intel', 'AMD'], required: true }, // Compatibilidad para evitar cuello de botella con el procesador
        cpu_performance_thresold: { type: String, required: true } // Nivel mínimo de rendimiento del CPU para evitar cuello de botella
    }
});

module.exports = model('gpu', gpuSchema);