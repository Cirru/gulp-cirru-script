
Gulp CirruScript
----

Gulp plugin for compiling CirruScript.

### Usage

```text
npm i --save-dev gulp-cirru-script
```

```coffee
gulp.task 'script', ->
  script = require 'gulp-cirru-script'

  gulp
  .src 'source/**/*.cirru'
  .pipe script()
  .pipe gulp.dest('build/')
```

### License

MIT
