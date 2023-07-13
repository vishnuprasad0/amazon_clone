const express = require('express')
const mongoose = require('mongoose')

const db="mongodb+srv://vishnuprasad:vishnuprasad2002@learnings.vifmieu.mongodb.net/?retryWrites=true&w=majority"
const app = express()
const port = 3000;
const authRouter = require("./routes/auth")

//middleware
app.use(express.json());
app.use(authRouter);

//connect to db
mongoose.connect(db).then(() => console.log("Connected to db")).catch((err) => console.log(err));

app.listen(port,"0.0.0.0"), () => {
     console.log(`Server is running on port' ${port}`) };
