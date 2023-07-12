const express = require('express')
const app = express()
const port = 3000;
const authRouter = require("./routes/auth")

//middleware
app.use(authRouter);

app.listen(port,"0.0.0.0"), () => {
     console.log(`Server is running on port' ${port}`) };
