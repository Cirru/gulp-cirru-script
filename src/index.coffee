
through = require 'through2'
cirru = require 'cirru-script'
applySourceMap = require 'vinyl-sourcemaps-apply'
path = require 'path'
gutil = require 'gulp-util'

{PluginError} = gutil

module.exports = (opts) ->
  through.obj (file, encoding, callback) ->
    unless opts?.dest?
      error = new PluginError 'gulp-cirru-script',
        'dest is required for compiing CirruScript'
      return callback error
    contents = String file.contents
    fileRelative = path.relative file.base, file.path
    destRoot = path.join file.base, opts.dest
    destPath = path.join destRoot, fileRelative
    destDir = path.dirname destPath
    options =
      path: file.path
      base: file.base
      relativePath: path.relative destDir, file.path
    res = cirru.compile contents, options
    file.contents = new Buffer res.js
    applySourceMap file, res.mapping

    @push file
    callback()
