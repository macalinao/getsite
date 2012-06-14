rimraf = require 'rimraf'
getsite = require '../'

describe 'getsite', ->
  afterEach (done) ->
    rimraf './sandbox/', (err) ->
      done()

  it 'should download a site into the given folder', (done) ->
    getsite 'http://expressjs.com/',
      dest: './sandbox/'
    , (err) ->
      console.log JSON.stringify err
      done()
