const express = require('express');
const router = express.Router();
const controller = require('../controllers/movies');
const { isLogin, notLogin } = require('../middlewares/isLoging');
const movieValidator = require('../validations/movie');

router.get('/', isLogin, controller.list);
router.get('/detail/:id', isLogin, controller.detail);
router.post('/create', isLogin, movieValidator, controller.create);
router.put('/edit/:id', isLogin, movieValidator, controller.edit);
router.delete('/delete/:id', isLogin, controller.delete);
router.get('/search', isLogin, controller.search);

module.exports = router;