const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const { User} = require("../models/user");

router.post('/', async (req, res) => {
    const { username, password } = req.body;

    const user = await User.findOne({ username });
    if(!user) {
        return res.status(401).json({ message: 'Credenciales invalidas'});
    }

    const passwordMatch = await bcrypt.compare(password, user.password);

    if(!passwordMatch) {
        return res.status(401).json({ message: 'Credenciales invalidas'});
    }

    res.status(200).json({ message: 'Inicio de sesión exitoso' });
})

module.exports = router;
