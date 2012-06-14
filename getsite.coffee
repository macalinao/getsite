exec = require('child_process').exec
url = require 'url'

module.exports = (page, opts = {}, cb) ->
  ###
  getsite

  Gets the given website recursively.

  @param page The page to download.
  @param opts The options. Read the docs!
  @param cb The callback(err, stdout, stderr).
  ###
  parse = url.parse page

  unless opts.dest?
    opts.dest = './'

  exec "wget --recursive --no-clobber 
    --page-requisites --html-extension 
    --convert-links --restrict-file-names=windows 
    --domains #{parse.host} --no-parent 
    #{parse.host + parse.pathname} -P #{opts.dest}", 
  (err, stdout, stderr) ->
    cb err, stdout, stderr
