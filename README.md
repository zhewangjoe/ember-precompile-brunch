# ember-precompile-brunch
Yet another Ember template precompiling plugin for [brunch](http://brunch.io).

This plug is forked from [ember-precompiler-brunch](https://www.npmjs.com/package/ember-precompiler-brunch), which is not available on Github any more.
The improvement is that I updated the code and the dependency so that it can work under Node.js v4.

Your application's jQuery, Handlebars and Ember files are used when compiling 
templates so there are never any version discrepancies.

## Usage
Add `"ember-precompile-brunch": "x.y.z"` to `package.json` of your brunch app.

Add `precompile: true` and `paths` to the `files.templates` object of your app's `config.coffee`

```
files:
  templates:
    precompile: true
    defaultExtension: 'hbs'
    joinTo: 'js/templates.js' : /^app/
    paths:
      jquery: 'vendor/scripts/jquery.js'
      handlebars: 'vendor/scripts/handlebars.js'
      ember: 'vendor/scripts/ember.js'
```


yep.

