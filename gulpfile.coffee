
gulp = require 'gulp'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
coffee = require 'gulp-coffee'

gulp.task 'watch', ->

  gulp
  .src('src/*.coffee', base: 'src/')
  .pipe watch('src/*.coffee')
  .pipe coffee(bare: yes)
  .pipe gulp.dest('./lib/')

gulp.task 'coffee', ->
  gulp
  .src('src/*.coffee', base: 'src/')
  .pipe coffee(bare: yes)
  .pipe gulp.dest('./lib/')
