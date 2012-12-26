App.LoginController = Em.Controller.extend
  username: null
  password: null
  submit: ->
    # TODO would like to do with this.get('username')
    controller = App.LoginController
    opts =
      url: '/users'
      type: 'post'
      dataType: 'json'
      data: { username: controller.username, password: controller.password }
      statusCode:
        403: ->
        200: ->
          # HACK use router
          window.location.href = '/'
    $.ajax(opts)
