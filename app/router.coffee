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

App.ApplicationView = Em.View.extend
  templateName: require('templates/application')

App.SignupRoute = Em.Route.extend
  route: '/signup'

App.HomeRoute = Em.Route.extend
  route: '/'
  setupControllers: (controller) ->
    controller.set('posts', App.store.findAll(App.Post))

App.HomeController = Em.Controller.extend
  #posts: [{link: 'hye'},{link: 'wef'}]
  posts: null
