App.LinkModel = DS.Model.extend
  _id         : DS.attr 'string'
  title       : DS.attr 'string'
  date        : DS.attr 'date'
  description : DS.attr 'string'
  url         : DS.attr 'string'
  domain_id   : DS.attr 'string'
  type        : DS.attr 'string'
                
  #didLoad  : -> console.log "didLoad email:"  , @get('url')
  #didUpdate: -> console.log "didUpdate email:", @get('title')
  #didCreate: -> console.log "didCreate email:", @get('title')

.reopenClass
  url: 'link'
