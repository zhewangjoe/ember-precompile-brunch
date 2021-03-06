fs = require 'fs'
jsdom = require 'jsdom'

module.exports = class EmberPrecompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'hbs'
  precompile: yes

  setup: (@config) ->
    @window = jsdom.jsdom().defaultView
    @window.eval fs.readFileSync @config.files.templates.paths.jquery, 'utf8'
    @window.eval fs.readFileSync @config.files.templates.paths.handlebars, 'utf8'
    @window.eval fs.readFileSync @config.files.templates.paths.ember, 'utf8'

  constructor: (@config) ->
    if @config.files.templates?.paths?
      @setup(@config)

    null

  compile: (data, path, callback) ->
    if not @window?
      return callback "files.templates.paths must be set in your config", {}

    try
      content = @precompileEmber data.toString()
      result = "Ember.TEMPLATES[module.id] = Ember.Handlebars.template(#{content});\nmodule.exports = module.id;"
    catch e
      error = e
    finally
      callback error, result

  precompileEmber: (data) ->
    return @window.Ember.Handlebars.precompile(data.toString()).toString()

