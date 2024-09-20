const { Schema, model } = require('mongoose');

const storageSchema = new Schema({
    url_image: { type: String, required: true },
    name: { type: String, required: true },
    brand: { type: String, required: true },
    type: { type: String,  enum: ['SATA', 'NVMe'], required: true },
    capacity: { type: Number, required: true },
    speed: { type: Number, required: true },
    compatibility: {
        motherboard_storage_type: { type: String, enum: ['SATA', 'NVMe'], required: true }
    },
    url: { type: String, require: true },
    price: { type: Number, required: true}
});

module.exports = model('storage', storageSchema);