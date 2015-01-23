
Gulp CirruScript
----

### Usage

Gulp plugin for compiling CirruScript.

```
npm i --save-dev gulp-cirru-script
```

```coffee
gulp.task 'script', ->
  rename      = require 'gulp-rename'
  script      = require 'gulp-cirru-script'
  sourcemaps  = require 'gulp-sourcemaps'

  gulp
  .src 'source/**/*.cirru', base: 'source/'
  .pipe sourcemaps.init(debug: yes)
  .pipe script(dest: '../build/')
  .pipe rename(extname: '.js')
  .pipe sourcemaps.write('./')
  .pipe gulp.dest('build/')
```

### Options

* `dest`(required)

Destination folder for Compiled JavaScript code,
which is relative to `base` in `gulp.src`.

### License

MIT
