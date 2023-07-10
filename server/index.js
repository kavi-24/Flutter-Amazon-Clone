const express = require('express');
const mongoose = require('mongoose');
const app = express();
const PORT = 3000;

const authRouter = require("./routes/auth");

app.use(express.json());
app.use(authRouter);

mongoose.connect("mongodb://localhost:27017").then(() => {
    console.log('conn success');
}).catch((e) => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port: ${PORT}`);
});