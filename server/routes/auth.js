const express=require('express');
const User = require("../models/user")
const bcryptjs = require('bcryptjs')

//sign up route
const authRouter=express.Router()
authRouter.post('/api/signup'   ,async (req,res)=>{

     try {
        const {name,email,password}=req.body;
    //finding if user already exists with same email 
        const existinguser=await User.findOne({email})
   if(existinguser){
       return res.status(400).json({message:"user with same mail id already exists"})
   }

   //hashing password
  const hashpassword=await bcryptjs.hash(password,10,);

   let user=new User({
       name,
       email,
       password:hashpassword
   })

   user=await user.save()
   res.json(user)
     } catch (error) {
        res.status(500).json({error:error.message})
     }
    })

module.exports=authRouter;     