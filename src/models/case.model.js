const { Schema, model } = require('mongoose');

const caseSchema = new Schema({
    name: { type: String, required: true },
    brand: { type: String, required: true },
    form_factor: { type: String, enum: ['ATX', 'Micro-ATX', 'Mini-ITX'], required: true },
    max_gpu_length_mm: { type: Number, required: true },
    max_cooler_height_mm: { type: Number, required: true },
    url: { type: String, require: true },
    price: { type: Number, required: true}
});

module.exports = model('case', caseSchema);