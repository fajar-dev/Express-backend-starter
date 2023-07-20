const model = require("../config/models/index")


let controller = {}


controller.index = async function (req, res) {

    let result = await model.user.findByPk(req.user.user_id);
    delete result.password;
    res.json({
        messsage: "success",
        result
    })

};

controller.update =  async (req, res) => {

    let user = await model.user.findByPk(req.user.user_id);
    req.body.name !== undefined ? user.name = req.body.name : ''
    req.body.email !== undefined ? user.email = req.body.email : ''
    req.body.phone !== undefined ? user.phone = req.body.phone : ''
    req.file !== undefined ? user.picture = req.file.originalname : ''

    user.save()

    console.log(req.file);

    res.json({
        messsage: "success",
        result: user
    })

};

module.exports = controller;