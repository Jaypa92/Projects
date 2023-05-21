const {request,response} = require('express')
const {SetList} = require('../models/setlist.model')

module.exports.createSetList = (req,res)=>{
    SetList.create(req.body)
    .then(response=>res.json(response))
    .catch(err=>res.status(400).json)
}

module.exports.getAllSets = (request,response)=>{
    SetList.find()
    .then(set=>response.json(set))
    .catch(err=>response.status(400).json(err))
}

module.exports.getOne = (req,res)=>{
    SetList.findById(req.params.id)
    .then(set=>{
        return res.json(set)
    })
    .catch(err=>res.status(400).json(err))
}

module.exports.updateSet = (req,res)=>{
    SetList.findOneAndUpdate({_id:req.params.id},req.body,{new:true,runValidators:true})
    .then(updatedSet=>res.json(updatedSet))
    .catch(err=>res.status(400).json(err))
}

module.exports.deleteSet = (req,res)=>{
    SetList.deleteOne({_id:req.params.id})
    .then(del=>res.json(del))
    .catch(err=>res.status(400).json(err))
}

