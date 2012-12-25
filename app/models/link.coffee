App.Link = DS.Model.extend
  _id         : DS.attr 'string'

  date        : DS.attr 'date'
  url         : DS.attr 'string'
  domain_id   : DS.attr 'string'
  type        : DS.attr 'string'

  # youtube
  title             : DS.attr 'string'
  description       : DS.attr 'string'
  image_small       : DS.attr 'string'  #  90 x 120
  image_medium      : DS.attr 'string'  # 180 x 320
  image_large       : DS.attr 'string'  # 360 x 480
  domain_dislikes   : DS.attr 'number'
  domain_likes      : DS.attr 'number'
  domain_view_count : DS.attr 'number'
                
  didLoad  : -> console.log "didLoad link:"  , @get('url')
  didUpdate: -> console.log "didUpdate link:", @get('title')
  didCreate: -> console.log "didCreate link:", @get('title')

  videoUrl: (() ->
    # TODO switch on type
    "http://www.youtube.com/embed/#{@get('domain_id')}?autoplay=1&origin=http://m.com:3005/"
  ).property('domain_id', 'type')

  brief: (() ->
    truncate = (str, n) -> str.substring(0, n) + '...'
    truncate(@get('description'), 150)
  ).property('description')

  #App.LinkModel.reopenClass url: 'link'
