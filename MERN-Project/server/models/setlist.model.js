const mongoose = require('mongoose');

const SetListSchema = new mongoose.Schema({
    Name:{
        type:String,
        required:[true, `{PATH} is required!`],
        minLength:[1,`{PATH} must be at least {MINLENGTH} characters long`]
    },
    songs:[
        {
            title:{
                type:String,
            },
            tuning:{
                type:String,
            },
            song_type:{
                type:String,
            }
        }
    ]
},
{timestamps:true}
)

module.exports.SetList = mongoose.model('SetList',SetListSchema)