const { Schema, model } = require('mongoose');

const psuSchema = new Schema({
    name: { type: String, required: true },
    brand: { type: String, required: true },
    wattage: { type: Number, required: true },
    efficiency_rating: { type: String, enum: ['80+ Bronze', '80+ Silver', '80+ Gold', '80+ Platinum'], required: true },
    modular: { type: Boolean, required: true },
    compatibility: {
        required_power: { type: Number, required: true } // Potencia requerida por la motherboard
    }
});

module.exports = model('psu', psuSchema);