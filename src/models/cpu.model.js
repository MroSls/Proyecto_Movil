const { Schema, model } = require('mongoose');
const motherboardModel = require('./motherboard.model');

const cpuSchema = new Schema({
    name: { type: String, required: true },
    brand: { type: String, required: true },
    socket: { type: String, required: true },
    cores: { type: Number, required: true },
    threads: { type: Number, required: true },
    clock_speed: { type: Number, required: true },
    compatibility: {
        motherboard_socket: { type: String, required: true }, // Compatibilidad con el socket de la motherboard
        gpu_performance_threshold: { type: Number, required: true } // Umbral mínimo de rendimiento de la GPU para evitar cuello de botella
    }
});

module.exports = model('cpu', cpuSchema);