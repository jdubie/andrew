App.SignupView = Em.View.extend
  templateName: require('templates/signup')

App.SignupUsernameTextField = Em.TextField.extend
  valueBinding: 'App.SignupController.username'

App.SignupPasswordTextField = Em.TextField.extend
  valueBinding: 'App.SignupController.password'

App.SignupForm = Em.View.extend
  tagName: 'form'
  submit: (e) ->
    e.preventDefault()
    controller = this.get('controller')
    controller.submit()
