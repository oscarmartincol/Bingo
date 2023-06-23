const express = require('express');
const { User} = require("../models/user");
const bcrypt = require('bcrypt');
const router = express.Router();

/**
 * Ruta para crear un nuevo usuario
 * @author Oscar David Martinez Benavides
 */
router.post('/', async function (req, res, next) {

    const {name, lastname, username, password} = req.body;

    //Verificar si el usuario existe
    const existingUser = await User.findOne({username});

    //Si el usuario existe se envia el código de estado http 409 que significa que hay conflicto con el estado actual del servidor.
    if (existingUser) {
        console.log(username);
        return res.status(409).json({ message: 'El usuario ya existe' });
    }
    const hashedPassword = await bcrypt.hash(password, 10);

    const user = new User({
        name: name,
        lastname: lastname,
        username: username,
        password: hashedPassword
    });

    await user.save()
        .then(result => {
            res.status(201).json({message: 'Usuario registrado exitosamente'});
        })
        .catch((err) => {
            res.status(500).json({message: 'Error interno del servidor'});
            console.log(err);
        });
});


module.exports = router;