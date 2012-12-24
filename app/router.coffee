App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'


App.Router.map (match) ->
  match('/').to('home')
  match('/signup').to('signup')
  #match('/:feed_id').to('/feed')
  #match('/:feed_id/:post_id').to('/feed')
  match('/post/:link_id').to('link')

App.LinkRoute = Em.Route.extend
  setupControllers: (controller, post, link) ->
    #controller.set('posts', App.store.findAll(App.Post))
    #controller.set('content', link)
    #controller.set('link', link)
    App.Linkk = 'hey'
  renderTemplates: ->

App.LinkView = Em.View.extend {}
  templateName: require('templates/link')

App.ApplicationView = Em.View.extend
  templateName: require('templates/application')

App.SignupRoute = Em.Route.extend {}
App.ApplicationRoute = Em.Controller.extend
  setupControllers: (controller) ->
    controller.set('posts', App.store.findAll(App.Post))

App.HomeRoute = Em.Route.extend
  setupControllers: (controller) ->
    controller.set('posts', App.store.findAll(App.Post))

App.HomeController = Em.Controller.extend
  posts: null
