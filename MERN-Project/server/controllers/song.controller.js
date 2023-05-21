const {request,response} = require('express')
const {Song} = require('../models/song.model')

module.exports.createSong = (req,res)=>{
    Song.create(req.body)
    .then(song=>res.json(song))
    .catch(err=>res.status(400).json(err))
}

module.exports.getAllSongs = (request,response)=>{
    Song.find()
    .then(song=>response.json(song))
    .catch(err=>response.status(400).json(err))
}

module.exports.getOne = (req,res)=>{
    Song.findById({_id:req.params.id})
    .then(song=>{
        return res.json(song)
    })
    .catch(err=>res.status(400).json(err))
}

module.exports.updateSong = (req,res)=>{
    Song.findOneAndUpdate({_id:req.params.id},req.body,{new:true,runValidators:true})
    .then(updated=>res.json(updated))
    .catch(err=>res.status(400).json(err))
}

module.exports.deleteSong = (req,res)=>{
    Song.deleteOne({_id:req.params.id})
    .then(deleted=>res.json(deleted))
    .catch(err=>res.status(400).json(err))
}