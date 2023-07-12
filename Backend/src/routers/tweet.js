const express = require('express')
const sharp=require('sharp')
const multer=require('multer')
const Tweet = require('../models/tweet')

//New Router
const router = new express.Router()

const auth = require('../middleware/auth')

//helper function
const upload=multer({
    limits:{
        fileSize: 100000000
    }
})

// post tweet router

router.post('/tweets',auth , async(req,res)=>{
    const tweet = new Tweet({
        ...req.body,
        user: req.user._id
    })
    try {
        await tweet.save()
        res.status(201).send(tweet)
    } catch (e) {
        res.status(400).send(e)
    }
} )

//fetch tweets
router.get('/tweets',async (req,res)=>{
    try {
        const tweets=await Tweet.find({})
        res.send(tweets)
    } catch (e) {
        res.status(500).send(e)
    }
})


//fetch specific user tweet
router.get('/tweets/:id',async (req,res)=>{
    const _id=req.params.id
    try {
        const tweets=await Tweet.find({user:_id})
        if (!tweets) {
            return res.status(404).send()
        }
        res.send(tweets)
    } catch (e) {
        res.status(500).send(e)
    }
})

//Add image  to tweet route

router.post('/uploadTweetImage/:id',auth, upload.single('upload'),async (req,res)=>{
    const tweet = await Tweet.findOne({_id: req.params.id})
    if (!tweet) {
        throw new Error('Cannot find the tweet')
    }
    const buffer = await sharp(req.file.buffer).resize({width:350, height:350}).png().toBuffer()
    tweet.image = buffer
    await tweet.save()
    res.send() 
},(e,req,res,next)=>{
    res.status(400).send({error:e.message})
})

//fetch tweet image 
router.get('/tweets/:id/image',async(req,res)=>{
    try {
        const tweet = await Tweet.findById(req.params.id)
        if (!tweet && !tweet.image) {
            throw new Error('Tweet image doesnt exist')
        }
        res.set('Content-Type','image/jpg')
        res.send(tweet.image)
    } catch (e) {
        res.status(404).send(e)
    }
})


// Like tweets function
router.put('/tweets/:id/like',auth, async(req,res)=>{
    try {
        const tweet = await Tweet.findById(req.params.id)
        if (!tweet.likes.includes(req.user.id)) {
            await tweet.updateOne({$push: {likes: req.user.id}})
            res.status(200).json('post has been liked')
        }else{
            res.status(403).json('you have already liked')
        }
    } catch (e) {
        res.status(500).json(e)
    }
})

// Unlike tweet route
router.put('/tweets/:id/unlike',auth, async(req,res)=>{
    try {
        const tweet = await Tweet.findById(req.params.id)
        if (tweet.likes.includes(req.user.id)) {
            await tweet.updateOne({$pull: {likes: req.user.id}})
            res.status(200).json('post has been unliked')
        }else{
            res.status(403).json('you have already unliked')
        }
    } catch (e) {
        res.status(500).json(e)
    }
})
module.exports=router