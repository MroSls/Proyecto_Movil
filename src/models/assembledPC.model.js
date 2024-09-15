const { Schema, model } = require('mongoose');

const assembledPC = new Schema({
    url_image: [{ type: String, required: true }],
    name_pc: { type: String, required: true },
    wifi: { type: Boolean, required: true },
    color: { type: String, required: true },
    storage_media: {
        storage_units_installed: { type: String, required: true },
        storage_unit: { type: String, required: true },
        total_storage_capacity: { type: String, required: true }
    },
    memory: {
        memory_ram: { type: String, required: true },
        memory_velocity: { type: String, required: true }
    },
    power_supply: { type: String, required: true },
    software: { type: String, required: true },
    cpu: {
        cpu: { type: String, required: true },
        cpu_cache: { type: String, required: true },
        cpu_cores: { type: String, required: true },
        cpu_family: { type: String, required: true },
        cpu_generation: { type: String, required: true },
        cpu_memory_supported: { type: String, required: true },
        cpu_model: { type: String, required: true },
        cpu_socket: { type: String, required: true },
        cpu_turbo_frecuency: { type: String, required: true }
    },
    gpu: {
        gpu_line: { type: String, required: true },
        gpu_name: { type: String, required: true },
        gpu_discrete_model: { type: String, required: true }
    },
    url: { type: String, require: true },
    category: { type: String, enum: ['Gamer', 'Office', 'School'], required: true }
});

module.exports = model('assembled_pcs', assembledPC);