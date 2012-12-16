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

  videoUrl: (() ->
      # TODO switch on type
      "http://www.youtube.com/embed/#{@get('domain_id')}?autoplay=1&origin=http://m.com:3005/"
  ).property('domain_id', 'type')

.reopenClass
  url: 'link'
