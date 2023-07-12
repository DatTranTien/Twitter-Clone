const mongoose = require('mongoose')
const bcrypt = require('bcrypt');
const validator = require('validator')
const jwt = require('jsonwebtoken')
const userSchema = new mongoose.Schema({
    userId:{
        type:mongoose.Schema.Types.ObjectId,
        // required: true,
        ref:'User'
    },
    name:{
        type:String,
        required: true,
        trim: true
    },
    username:{
        type:String,
        required: true,
        trim: true
    },
    email:{
        type:String,
        unique:true,
        required: true,
        trim: true,
        lowercase: true,
        validator(value){
            if (!validator.isEmail(value)) {
            throw  new Error('Invalid email')  
            }
            // validator.isEmail(value)
        }
    },
    password:{
        type:String,
        required: true,
        trim: true,
        minLength:6,
        lowercase: true,
        validator(value){
            if (!validator.isEmail(value)) {
            throw  new Error('Password cannot contain password')  
            }
        }
    },
    token:[{
        token:{
            type:String,
            required: true
        }
    }],
    avatar:{
        type:Buffer,
    },
    avatarExists:{
        type:Boolean,
    },
    bio:{
        type: String
    },
    website:{
        type: String
    },
    location:{
        type: String
    },
    followers:{
        type: Array,
        default: []
    },
    followings:{
        type: Array,
        default: []
    }
})
// The relationship between the tweets and users
userSchema.virtual('tweets',{
    ref:"Tweet",
    localField: '_id',
    foreignField:'user'
})
userSchema.virtual('notificationSent',{
    ref:"Notification",
    localField: '_id',
    foreignField:'notSenderId'
})
userSchema.virtual('notificationReceived',{
    ref:"Notification",
    localField: '_id',
    foreignField:'notReceivedId'
})
// to delete password prior to GET
userSchema.methods.toJSON = function () {
    const user = this
    const userObject = user.toObject()
    return userObject
}

//to hash password
userSchema.pre('save',async function(next){
    const user = this
    if (user.isModified('password')) {
        user.password = await bcrypt.hash(user.password,10)
    }
    next()
})


// Authentication Check
userSchema.statics.findByCredentials = async (email,password)=>{
    const user = await User.findOne({email})
    if (!user) {
        throw new Error('Unable to login')
    }
    const isMatch = await bcrypt.compare(password, user.password).then(function(result) {
        // result == true
        console.log("result--->",result)
    });
    console.log(password,user.password)
    if (!isMatch) {
        throw new Error('Unable to login')
    }
    return user
}



//Create tokens
userSchema.methods.generateAuthToken=async function () {
    const user = this
    const token = jwt.sign({_id: user._id.toString()},'twitter')

    user.tokens = user.tokens.concat({token})
    await user.save()

    return token
    
}



const User = mongoose.model("User", userSchema)

module.exports = User