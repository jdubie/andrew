App.SignupController = Em.Controller.extend
  username: null
  password: null
  submit: ->
    # TODO would like to do with this.get('username')
    controller = App.SignupController
    #console.log 'submit in controller', controller.username, controller.password
    opts =
      url: '/users'
      type: 'post'
      dataType: 'json'
      data: { username: controller.username, password: controller.password }
      statusCode:
        403: ->
        200: ->
          console.log 'wefwef'#, this.get('controller')
          window.location.hash = '/'
    $.ajax(opts)
