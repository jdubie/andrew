App = require 'app'

App.OneLinkView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')
  templateName: require 'templates/oneLink'
