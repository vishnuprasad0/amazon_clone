const mongoose=require('mongoose');
const userSchema=mongoose.Schema({
    name:{
        type:String,required:true,trim:true},

    email:{type:String,required:true,trim:true,
        vadidate:{validator:(value)=>{
            const emailRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
            return value.match(emailRegex);},
            message:()=>`enter atleast a number  and a special character  `},
    },
    password:{type:String,required:true,
        vadidate:{validator:(value)=>{
            const passwordRegex=/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            return value.match(passwordRegex);},
            message:props=>`${props.value} is not a valid email`},
},
    address:{type:String,
        default:"",
            },
    type: { type:String, default:"user",
},


        
    //cart to be done    

    },);


    const User=mongoose.model('User',userSchema);
    module.exports=User;