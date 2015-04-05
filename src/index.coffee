
through = require 'through2'
script = require 'cirru-script'
gutil = require 'gulp-util'

{replaceExtension} = require 'gulp-util'

module.exports = (opts) ->
  through.obj (file, encoding, callback) ->
    contents = String file.contents
    js = script.compile contents
    file.contents = new Buffer js

    file.path = replaceExtension file.path, '.js'

    callback null, file
