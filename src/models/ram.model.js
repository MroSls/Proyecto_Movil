const { Schema, model } = require('mongoose');

const ramSchema = new Schema({
    name: { type: String, required: true },
    brand: { type: String, required: true },
    type: { type: String, enum: ['DDR4', 'DDR5'], required: true },
    capacity: { type: Number, required: true },
    speed: { type: Number, required: true },
    compatibility: {
        motherboard_ram_type: { type: String, enum: ['DDR4', 'DDR5'], required: true }
    }
});

module.exports = model('ram', ramSchema);