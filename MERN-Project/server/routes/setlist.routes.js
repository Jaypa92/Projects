const SetList = require('../controllers/setlist.controller')

module.exports = function(app){
    app.post('/api/setlists',SetList.createSetList)
    app.get('/api/setlists',SetList.getAllSets)
    app.get('/api/setlists/:id',SetList.getOne)
    app.put('/api/setlists/:id',SetList.updateSet)
    app.delete('/api/setlists/:id',SetList.deleteSet)
}