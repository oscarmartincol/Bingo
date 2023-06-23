
const mongoose = require('mongoose');

const { Schema } = mongoose;

const userSchema = new Schema({
    name: {
        type: String,
        trim: true,
        required: [true, 'El nombre es requerido']
    },
    lastname: {
        type: String,
        trim: true,
        required: [true, 'El apellido es requerido']
    },
    username: {
        type: String,
        required: true,
        trim: true,
        unique: [true, 'El nombre de usuario es requerido']
    },
    password: {
        type: String,
        required: true
    },
    createAt: {
       type: Date,
       default: Date.now()
    }
})

const User = mongoose.model('User', userSchema);
module.exports = { User };