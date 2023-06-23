const express = require('express');
const {newUser} = require("../controllers/user");
const router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Juego de bingo EL Gran Buda' });
});

module.exports = router;
