const mongoose = require('mongoose')

const SongSchema = new mongoose.Schema({
    title:{
        type:String,
        require:[true,`Great masterpieces need a name!`]
    },
    tuning:{
        type: String
    },
    song_type:{
        type:String,
    }
},
{timestamps:true}
)

module.exports.Song = mongoose.model('Song',SongSchema)