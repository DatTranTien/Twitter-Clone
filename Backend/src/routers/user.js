const express = require('express')
const User = require('../models/user')
const { auth } = require('../middleware/auth')
const sharp=require('sharp')
const multer=require('multer')
const router = new express.Router()

const upload=multer({
    limits:{
        fileSize: 100000000
    }
})

//create user
router.post('/users', async (req,res)=>{
    const user = new User(req.body)
    try {
        await user.save()
        res.status(201).send(user)
    } catch (e) {
        res.status(400).send(e)
    }
})


//fetch users
router.get('/users',async(req,res)=>{
    try {
        const users = await User.find({})
        res.send(users)
    } catch (e) {
        res.status(500).send(e)
    }
})


//login user routers
router.post('/users/login',async(req,res)=>{
    try {
        console.log("123")
        const user = await User.findByCredentials(req.body.email,req.body.password)
        const token = await user.generateAuthToken()
        res.send({user,token})
    } catch (e) {
        res.status(500).send(e)
    }
})


//delete by id
router.delete('/users/:id',async(req,res)=>{
    try {
        console.log("1211")
        const user = await User.findByIdAndDelete(req.params.id)
        console.log("user",user)
        if (!user) {
            return res.status(400).send()
        }
        console.log("cuoi")
        res.send()
    } catch (e) {
        res.status(500).send(e)
    }
})


// fetch single user

router.get('/users/:id',async(req,res)=>{
    try {
        const _id = req.params.id
        console.log("_id",_id)
        const user = await User.findById(_id)
        if (!user) {
            return res.status(404).send()
        }
        res.send(user)
    } catch (e) {
        res.status(500).send(e)
    }
})


// Post User Profile Image
router.post('/users/me/avatar', auth,upload.single('avatar'),async (req,res)=>{
    const buffer = await sharp(req.file.buffer).resize({width:250,height:250}).png().toBuffer()
   
   if (req.user.avatar != null) {
    req.user.avatar = null
    req.user.avatarExists = false
   }

   req.user.avatar = buffer
   req.user.avatarExists = true
   await req.user.save()
    res.send(buffer)
},(error,req,res,next)=>{
    res.status(400).send({error: error.message})
})
router.get('/users/:id/avatar', auth,async (req,res)=>{   
try {
    const user = await User.findById(req.params.id)

    if (!user || !user.avatar) {
        throw new Error('The user doesnt exist!')
    }
    res.set('Content-Type','image/jpg')
    res.send(user.avatar)
} catch (e) {
    res.status(404).send(e)
}
})


// Route for Following
router.put('/users/:id/follow',auth, async (req,res)=>{
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id)
            if (!user.followers.includes(req.user.id)) {
                await user.updateOne({$push:{followers: req.user.id}})
                await req.user.updateOne({$push:{followings: req.params.id}})
                res.status(200).json('user has been followed')
            }else{
                res.status(403).json('you already follow this user')
            }
        } catch (e) {
            res.status(500).json(e)
        }
    }else{
        res.status(403).json('you cannot follow yourself!')
    }
})


// unfollowing
router.put('/users/:id/unfollow', auth, async (req,res)=>{
    if (req.user.id != req.params.id) {
        try {
            const user = await User.findById(req.params.id)

            if (user.followers.includes(req.user.id)) {
                await user.updateOne({$pull: {followers: req.user.id}})
                req.user.updateOne({$pull : {followings: req.params.id}})
                res.status(200).json('user has been unfollowed')
            }else{
                res.status(403).json('you dont follow this user')
            }
        } catch (e) {
            res.status(500).json(e)
        }
    }else{
        res.status(403).json('you cannot unfollow youtself')
    }
})


router.path('/users/me',auth, async(req,res)=>{
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name','email','password','website','bio','location']

    const isValidOperation = updates.every((update)=>allowedUpdates.includes(update))
    if (!isValidOperation) {
        return res.status(400).send({
            error:'Invalid request!'
        })
    }
    try {
        const user = req.user
        updates.forEach((updates)=>{user[updates]=req.body[updates]})
        await user.save()
        res.send(user)
    } catch (e) {
        res.status(400).send(e)
    }
})



module.exports = router