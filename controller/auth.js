const validation = require("../helpers/validation")
const bcrypt = require('bcryptjs');
const jwt = require("jsonwebtoken");
const model = require("../config/models/index");

let controller = {}

controller.register = async (req, res) => {

    const name = req.body.name
    const email = req.body.email
    const password = req.body.password

    //validation Data Check Before create new user
    const validationError = validation.registerValidation(req.body).error
    if (validationError) return res.status(400).json({ message: validationError.details[0].message })

    const checkEmail = await model.user.findOne({ where: { email: email } });
    if (checkEmail !== null) {
        res.status(400).json({
            message: "Email Already Exist"
        })

    } else {
        //hash password
        const salt = await bcrypt.genSalt(10)
        const hashingPassword = await bcrypt.hash(password, salt)

        const result = await User.create({
            name,
            email,
            password: hashingPassword
        })

        res.json({
            message: "Email Already Exist",
            result
        })
    }

};

controller.login = async (req, res) => {

    const email = req.body.email
    const password = req.body.password

    //validation Data Check
    const validationError = validation.loginValidation(req.body).error
    if (validationError) return res.status(400).json({ message: validationError.details[0].message })

    const result = await model.user.findOne({ where: { email: email } })
    if (result !== null) {
        // //check password
        const validPassword = await bcrypt.compare(password, result.password)
        if (!validPassword) return res.status(400).json({ message: "Email or password wrong!" })

        //create an assign a token
        const token = jwt.sign({ user_id: result.id }, process.env.TOKEN_SECRET)
        res.header("auth-token", token)

        res.json({
            messsage: "logged In",
            token: token,
            name: result.name,  
            email: result.email
        });
    }else{
        res.status(400).json({ message: "Email or password wrong!" })
    }

};

module.exports = controller;