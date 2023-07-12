const mongoose = require('mongoose')

// mongoose.connect('mongodb://127.0.0.1:27017/twitter-api',{
//     userNewUrlParser:true,
//     useCreateindex:true,
//     useFindAndModify:false,
//     useUnifiedTopology: true
// })
mongoose.connect('mongodb+srv://trantiendatbk:trantiendatbk@cluster0.d2xmnbf.mongodb.net/?retryWrites=true&w=majority',
);
const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error: "));
db.once("open", function () {
  console.log("Connected successfully");
});