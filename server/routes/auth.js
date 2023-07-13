const express=require('express');
const User = require("../models/user")
const bcryptjs = require('bcryptjs');
const { default: mongoose } = require('mongoose');
const jwt=require('jsonwebtoken');

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

 //sign in route
 authRouter.post("/api/signin", async (req, res) => {
    try {
      const { email, password } = req.body;
  
      const user = await User.findOne({ email });
      if (!user) {
        return res
          .status(400)
          .json({ msg: "User with this email does not exist!" });
      }
  
      const isMatch = await bcryptjs.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect password." });
      }
  
      const token = jwt.sign({ id: user._id }, "passwordKey");
      res.json({ token, ...user._doc });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
module.exports=authRouter;     