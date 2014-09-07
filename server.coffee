#require("yw-log")("express")
config = require "./config"
bodyParser = require "body-parser"

process.on 'uncaughtException', (err) ->
  console.log(err)
  throw err


helmet = require "helmet"

module.exports = (express, server) ->




  # We trust NGINX...
  server.enable('trust proxy')

  # Various best practice security settings
  server.use(helmet.xframe())
  server.use(helmet.xssFilter())
  server.use(helmet.nosniff())
  server.use(helmet.nocache())

  # Parse JSON requests
  server.use(bodyParser.json())

  # Now lets set up all the actual routes
  require("./routes/test")(server)

  server.listen config.port
  console.log "APP Server listening on port #{config.port}, url: #{config.url}"