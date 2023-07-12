const express = require('express')
const Tweet = require('./models/tweet')
const mongoose=require('./db/mongoose')
const app = express()
const userRouter = require('./routers/user')
const tweetRouter = require('./routers/tweet')
const notificationRouter = require('./routers/notification')
const port = process.env.PORT || 3105
app.use(express.json())
app.use(userRouter)
app.use(tweetRouter)
app.use(notificationRouter)
app.listen(port,()=>{
    console.log("Server run on the port:",port)
})