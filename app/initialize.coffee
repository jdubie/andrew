window.App = require 'app'

#require 'templates'
require 'models'
require 'controllers'
require 'views'
require 'router'
#require 'helpers'


#App.initialize()

# init global list
#globalLinks = App.store.findAll(App.LinkModel)
#App.router.get('applicationController')
#  .connectOutlet 'global', 'allLinks', globalLinks

#App.CurrentVideoController = Em.ObjectController.extend
#  content: null

# init current video
#App.CurrentVideo = App.store.createRecord(App.LinkModel, {})
#App.router.get('applicationController')
#  .connectOutlet('preview', 'oneLink', App.CurrentVideo)
