const Song = require('../controllers/song.controller')

module.exports = function(app){
    app.get('/api/songs',Song.getAllSongs)
    app.post('/api/songs',Song.createSong)
    app.get('/api/songs/:id',Song.getOne)
    app.put('/api/songs/:id',Song.updateSong)
    app.delete('/api/songs/:id',Song.deleteSong)
}