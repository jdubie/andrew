App.Post = DS.Model.extend
  _id   : DS.attr 'string'
  ctime : DS.attr 'date'
  link  : DS.belongsTo('App.Link')#, embedded : true)

  didLoad  : -> console.log "didLoad post:"  , @get('_id')
  didUpdate: -> console.log "didUpdate post:", @get('_id')
  didCreate: -> console.log "didCreate post:", @get('_id')

#App.PostModel.reopenClass url: 'post'
