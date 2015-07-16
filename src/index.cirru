
var
  through $ require :through2
  script $ require :cirru-script
  gutil $ require :gulp-util
  parser $ require :cirru-parser
  escodegen $ require :escodegen
  scirpus $ require :scirpus

var
  ({}~ replaceExtension) gutil

= module.exports $ \ (opts)
  return $ through.obj $ \ (file encoding callback)
    var contents $ String file.contents

    if (and opts opts.es6)
      do
        var syntaxTree $ parser.pare contents
        var ast $ scirpus.transform syntaxTree
        var js $ escodegen.generate ast
      do
        var js $ script.compile contents

    = file.contents $ new Buffer js
    = file.path $ replaceExtension file.path :.js

    callback null file
