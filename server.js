const express = require("express")
const app = express()
const dotenv = require("dotenv")
const bodyParser = require("body-parser")
// import routes
const Routes = require("./app/routes")

require("./config/database/mysql")

//dotenv (.env) config
dotenv.config()

//middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }))

// //routes middleware
app.use("/api", Routes)

app.listen(3000, () => {
    console.log("Server is running on example http://localhost:3000");
});
