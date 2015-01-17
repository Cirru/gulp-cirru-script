
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
  .pipe script()
  .pipe rename(extname: '.js')
  .pipe sourcemaps.write('./')
  .pipe gulp.dest('build/')
```

### License

MIT
