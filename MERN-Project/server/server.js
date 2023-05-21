require('dotenv').config();
require('./config/mongoose.config');
const express = require('express');
const port = process.env.API_PORT;
const app = express();
const cors = require('cors')
app.use(express.json());

app.use(cors())
require('./routes/setlist.routes')(app)
require('./routes/song.routes')(app)

app.listen(port,() => console.log(`nodListening on port ${port} for REQuests to RESpond to`))