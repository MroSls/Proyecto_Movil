const { Schema, model } = require('mongoose');

const coolerSchema = new Schema({
    name: { type: String, required: true },
    brand: { type: String, required: true },
    type: { type: String, enum: ['Air', 'Liquid'], required: true },
    fan_size_mm: { type: Number, required: true },
    noise_level: { type: Number, required: true },
    compatibility: {
        cpu_socket: { type: String, required: true }, // Compatibilidad con el socket del CPU
        case_clearanse: { type: Boolean, required: true } // Verifica si cabe en el gabinete
    },
    url: { type: String, require: true },
    price: { type: Number, required: true}
});

module.exports = model('cooler', coolerSchema);