App.User = DS.Model.extend
  _id         : DS.attr 'string'
  username    : DS.attr 'string'

  error: (() ->
    @get('errors')?[0]
  ).property('errors')

  valueObserver: (() ->
    @set('errors', [])
    App.store.commit()
  ).observes('username')

  usernameClass : (() ->
    res = 'control-group'
    res += ' error' unless (@get('validUsername') and not @get('error'))
    res
  ).property('validUsername', 'error')

  validUsername : (() ->
    /^[a-z0-9_-]{3,25}$/.test(@get('username'))
  ).property('username', 'error')

  loggedIn    : (() ->
    @get('_id')? and @get('username')?
  ).property('_id', 'username')
