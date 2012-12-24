App.HomeView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')
  templateName: require 'templates/home'
  testFoo: (a,b) ->
    this.get('controller').set('link', a.context)
    #console.log 'clickkk', a.context.get('title')
