const express = require('express');
const characters = require('../controllers/characters');
const router = express.Router();
const controller = require('../controllers/characters');
const { isLogin, notLogin } = require('../middlewares/isLoging');
const characterValidator = require('../validations/character');

router.get('/', isLogin, controller.list);
router.get('/detail/:id', isLogin, controller.detail);
router.get('/search', isLogin, controller.search);
router.post('/create', isLogin, characterValidator, controller.create);
router.put('/edit/:id', isLogin, characterValidator, controller.edit);
router.delete('/delete/:id', isLogin, controller.delete);


module.exports = router;