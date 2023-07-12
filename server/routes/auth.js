const express=require('express');
const authRouter=express.Router();
authRouter.get('/login',(req,res)=>
{res.json({message:'login'})})
module.exports=authRouter;     