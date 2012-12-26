App.LoginView = Em.View.extend
  templateName: require('templates/login')

App.LoginForm = Em.View.extend
  tagName: 'form'
  submit: (e) ->
    e.preventDefault()
    controller = this.get('controller')
    controller.submit()
