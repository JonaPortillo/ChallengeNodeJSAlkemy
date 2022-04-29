const express = require('express');
const router = express.Router();
const controller = require('../controllers/auth');
const registerValidator = require('../validations/register');
const loginValidator = require('../validations/login');
const { isLogin, notLogin } = require('../middlewares/isLoging');
const validateToken = require('../middlewares/validationToken');

router.post('/login', loginValidator, controller.login);
router.post('/register', registerValidator, controller.register)
router.get('/token', validateToken, controller.token)

module.exports = router;