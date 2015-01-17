
through = require 'through2'
cirru = require 'cirru-script'
applySourceMap = require 'vinyl-sourcemaps-apply'
path = require 'path'

module.exports = (options) ->
  through.obj (file, encoding, callback) ->
    contents = String file.contents
    options =
      path: file.path
      base: file.base
      relativePath: path.relative file.base, file.path
    res = cirru.compile contents, options
    file.contents = new Buffer res.js
    applySourceMap file, res.mapping

    @push file
    callback()
