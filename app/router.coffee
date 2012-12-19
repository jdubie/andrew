App = require 'app'
debug = require('debug') 'DEBUG router'

App.Router = Em.Router.extend
  rootUrl: '/'
  enableLogging: true
  location: 'history'

  root: Em.Route.extend
    home: Em.Route.extend
      route: '/'
      index: Em.Route.extend
        route: '/'
        previewLink: Ember.Route.transitionTo 'home.preview'
      preview: Em.Route.extend
        route: '/:id'
        previewLink: Ember.Route.transitionTo 'home.preview'
        connectOutlets: (router, context) ->
          link = App.store.find(App.LinkModel, context.id)
          #App.CurrentVideo.set('domain_id', link.get('domain_id'))
          App.CurrentVideo.set('content', link)
        deserialize: (router, context) ->
          App.store.find(App.LinkModel, context.id)
        serialize:  (router, context) ->
          id: context.id
