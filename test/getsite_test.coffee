rimraf = require 'rimraf'
getsite = require '../'
fs = require 'fs'

describe 'getsite', ->
  afterEach (done) ->
    rimraf './sandbox/', (err) ->
      done()

  it 'should download a site into the given folder', (done) ->
    getsite 'http://expressjs.com/',
      dest: './sandbox/'
    , (err) ->
      fs.readdir './sandbox/', (err, files) ->
        files.should.include 'expressjs.com'
        done()
