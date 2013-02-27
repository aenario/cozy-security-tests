express = require 'express'

app = express()

app.use express.logger 'dev'
app.use (req, res, next) ->
    res.cookie('info', 'cookie-info', { maxAge: 900000, httpOnly: true })
    next()

app.use express.static(__dirname + '/public')
app.use express.bodyParser()

app.options '/api', (req, res) ->
    res.header 'Access-Control-Allow-Origin', '*'
    res.header 'Access-Control-Allow-Headers', 'X-Requested-With'
    res.header 'Access-Control-Allow-Methods', 'GET'
    res.json({"data":"api-data"})

app.get '/api', (req, res) ->
    res.json({"data":"api-data"})

app.listen(8080)
console.log('started')