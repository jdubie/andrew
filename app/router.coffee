App = require 'app'
debug = require('debug') 'DEBUG router'

App.Router = Em.Router.extend
  enableLogging: true
  root: Em.Route.extend
    allLinks: Em.Route.extend
      route: '/'
      connectOutlets: (router, context) ->
        router.get('applicationController')
        #.connectOutlet 'allLinks', App.Link.findAll()
          .connectOutlet 'allLinks', App.store.findAll(App.LinkModel)
          #.connectOutlet 'allLinks', App.LinkModel.find()
        # .connectOutlet 'allLinks', App.store.findAll(App.Link)
        #.connectOutlet 'allLinks', App.EmailModel.find()
        #  .connectOutlet 'allLinks', [{url: 'hey'}, {url:'wefwe'}]
