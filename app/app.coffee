# Application bootstrapper

App = Em.Application.create()
App.store = DS.Store.create
  revision: 10
  adapter: DS.RESTAdapter.create
    bulkCommit: false
    mappings:
      emails: 'App.LinkModel'
    serializer: DS.JSONSerializer.extend
      primaryKey: (type) ->
        switch type
          when App.LinkModel is '_id'
        
module.exports = App
