exec = require('child_process').exec
url = require 'url'

module.exports = (page, opts = {}, cb) ->
  ###
  getsite

  Gets the given website recursively.
  ###
  parse = url.parse page

  unless opts.dest?
    opts.dest = parse.hostname

  exec "wget --recursive --no-clobber 
    --page-requisites --html-extension 
    --convert-links --restrict-file-names=windows 
    --domains #{parse.host} --no-parent 
    #{parse.host + parse.pathname} -P #{opts.dest}", 
  (err, stdout, stderr) ->
    
    console.log 'Hello'
    cb err
