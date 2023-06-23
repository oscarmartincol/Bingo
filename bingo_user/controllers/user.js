
const { response } = require('express');
const { User } = require('../models/user');

const newUser = (req, res = response) => {

    const red = req.body.name;
    console.log('registro de usuario');
    console.log(red);

    res.json(req.body);
}

module.exports = { newUser };