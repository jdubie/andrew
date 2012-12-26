App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'

App.Router.map (match) ->
  match('/').to('home')
  match('/signup').to('signup')
  match('/login').to('login')
  #match('/:feed_id').to('/feed')
  #match('/:feed_id/:post_id').to('/feed')

App.ApplicationView = Em.View.extend
  templateName: require('templates/application')

App.CurrentUser = Em.Object.create
  username: null

App.BookmarkletObject = Em.Object.extend
  token: null
  user: null
  href: (() ->
    url = "(function(){var script=document.createElement('script');script.src='http://m.com:3005/bookmarklet/app.js?x='+Math.random();document.head.appendChild(script);window._ventuse={};window._ventuse.token='#{@get('token')}';window._ventuse.user='#{@get('user')}';})();"
    "javascript:#{encodeURI(url)}"
  ).property('user', 'token')

App.Bookmarklet = App.BookmarkletObject.create
  # TODO get better randomness
  token: (10e16*Math.random()).toString() + (10e16*Math.random()).toString()
  user: (new window.ObjectId).toString()

App.HomeRoute = Em.Route.extend
  route: '/'
  setupControllers: (controller) ->
    controller.set('posts', App.store.findAll(App.Post))

    # check if logged in
    $.getJSON('/session').statusCode
      200: (user) ->
        App.CurrentUser.set 'username', user.username
      403: -> console.log '403'

App.SignupRoute = Em.Route.extend {}
App.LoginRoute = Em.Route.extend {}
