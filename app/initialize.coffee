window.App = require 'app'

require 'models'
require 'controllers'
require 'views'
require 'router'
require 'helpers'

##################################################
## Bookmarklet
##################################################

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

##################################################
## Getting CurrentUser
##################################################

App.CurrentUser = Em.ObjectController.create {}

setCurrentUser = (user) ->
  App.CurrentUser.set('content', user)

# check store
if window.localStore?.currentUser
  user = App.User.create(JSON.parse(window.localStore.currentUser))
  setCurrentUser(user)
else if window.localStore?.user
  user = App.store.find(App.User, window.localStore.user)
  setCurrentUser(user)
else
  window.$.ajax('/current_user')
    .success ({id}) ->
      user = App.store.find(App.User, id)
      setCurrentUser(user)
    .fail ->
