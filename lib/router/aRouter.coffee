FlowRouter.notFound = action: ->
  BlazeLayout.render 'layout',
    content: 'notFound'
    header: 'header1'
    footer: 'footer1'

FlowRouter.route '/signin', action: ->
  BlazeLayout.render 'layoutSignIn',
    content: 'signInPage'
    header: 'header1'
    footer: 'footer1'

FlowRouter.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'welcomePage'
    header: 'header1'
    footer: 'footer1'


###************************* Other routes ***********************************###

FlowRouter.route '/about', action: ->
  BlazeLayout.render 'layout',
    content: 'aboutPage'
    header: 'header1'
    footer: 'footer1'

FlowRouter.route '/procurement', action: ->
  BlazeLayout.render 'layout',
    content: 'procurementPage'
    header: 'header1'
    footer: 'footer1'

FlowRouter.route '/reports', action: ->
  BlazeLayout.render 'layout',
    content: 'reportsPage'
    header: 'header1'
    footer: 'footer1'

FlowRouter.route '/help', action: ->
  BlazeLayout.render 'layout',
    content: 'helpPage'
    header: 'header1'
    footer: 'footer1'
