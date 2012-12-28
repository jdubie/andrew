App = require 'app'
debug = require('debug') 'DEBUG router'

#App.Route = Em.Router.extend
#  rootUrl: '/'
#  enableLogging: true
#  location: 'history'

App.Router.map (match) ->
  match('/').to('home')
  match('/profile').to('profile')

App.CurrentUser = Em.ObjectController.create {}

window.$.ajax('/current_user')
  .success ({id}) ->
    App.current_user_id = id
    App.CurrentUser.set 'content', App.store.find(App.User, id)
  .fail ->
    App.CurrentUser.set 'isLoad', true

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
  setupControllers: (controller) ->
    controller.set('posts', App.store.findAll(App.Post))

App.ProfileRoute = Em.Route.extend
  setupControllers: (controller) ->
    controller.set('content', App.store.find(App.User, App.current_user_id))
