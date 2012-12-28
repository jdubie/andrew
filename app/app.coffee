# Application bootstrapper

App = Em.Application.create()
App.store = DS.Store.create
  revision: 10
  adapter: DS.RESTAdapter.create
    bulkCommit: false
    serializer: DS.JSONSerializer.extend
      primaryKey: (type) -> '_id'

# https://github.com/emberjs/data/issues/504
App.Adapter = DS.FixtureAdapter.extend()
App.store.adapter.serializer.map 'App.Post', link: embedded: 'load'

module.exports = App
