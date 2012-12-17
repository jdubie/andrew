App = require 'app'
debug = require('debug') 'DEBUG router'

connectOutlets = (router, context = {}) ->
  #console.log context
  #globalLinks = App.store.findAll(App.LinkModel)
  #previewLink = App.store.find(App.LinkModel, context.preview)
  #router.get('applicationController')
  #  .connectOutlet 'global', 'allLinks', globalLinks
  router.get('applicationController')
    .connectOutlet 'global', 'allLinks', [{url: 'wefw', _id: 'wefwww'}]
  #router.get('applicationController')
  #  .connectOutlet 'profile', 'allLinks', globalLinks
  #router.get('applicationController')
  #  .connectOutlet 'preview', 'oneLink', previewLink

App.Router = Em.Router.extend
  enableLogging: true
  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'home'
    home: Em.Route.extend
      route: '/home'
      index: Em.Route.extend
        route: '/'
        previewLink: Ember.Route.transitionTo 'home.preview'
        connectOutlets: (router, context) ->
          App.CurrentVideo = App.store.createRecord(App.LinkModel, {domain_id: null})
          globalLinks = App.store.findAll(App.LinkModel)
          router.get('applicationController')
            .connectOutlet 'global', 'allLinks', globalLinks
          router.get('applicationController')
            .connectOutlet('preview', 'oneLink', App.CurrentVideo)
      preview: Em.Route.extend
        route: '/:id'
        previewLink: Ember.Route.transitionTo 'home.preview'
        connectOutlets: (router, event) ->
          id = event.id
          link = App.store.find(App.LinkModel, id)
          App.CurrentVideo.set('domain_id', link.get('domain_id'))

            #index: Ember.Route.extend
            #  route: '/'

            # showEmail: Ember.Route.transitionTo 'emails.email'

            #        connectOutlets: (router, context) ->
            #          router.get('applicationController')
            #            .connectOutlet 'main', 'emails', emails: App.EmailModel.find()
            #
            #      email: Em.Route.extend
            #        route: '/:id'
            #
            #        destroyItem: (router, event) ->
            #          email = event.context
            #          debug 'deleting email', email
            #          email.deleteRecord()
            #          App.store.commit()
            #          router.transitionTo 'emails.index'
            #
            #        connectOutlets: (router, context) ->
            #
            #    preview: Em.Route.extend
            #      route: '/home/hey'
            #      connectOutlets: connectOutlets
            #
            #    profile: Em.Route.extend
            #      route: '/:profile'
            #      connectOutlets: connectOutlets
            #
            #    both: Em.Route.extend
            #      route: '/:profile/:preview'
            #      connectOutlets: connectOutlets
            #


          #.connectOutlet 'allLinks', App.LinkModel.find()
        # .connectOutlet 'allLinks', App.store.findAll(App.Link)
        #.connectOutlet 'allLinks', App.EmailModel.find()
        #  .connectOutlet 'allLinks', [{url: 'hey'}, {url:'wefwe'}]
