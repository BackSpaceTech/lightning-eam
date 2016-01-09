FlowRouter.notFound = action: ->
  BlazeLayout.render 'layout',
    content: 'notFound'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/signin', action: ->
  BlazeLayout.render 'layout2',
    content: 'signInPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'welcomePage'
    header: 'header1'
    footer: 'footer1'
  return

###************************* Other routes ***********************************###

FlowRouter.route '/about', action: ->
  BlazeLayout.render 'layout',
    content: 'aboutPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/inventory', action: ->
  BlazeLayout.render 'layout',
    content: 'inventoryPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/pm', action: ->
  BlazeLayout.render 'layout',
    content: 'pmPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/procurement', action: ->
  BlazeLayout.render 'layout',
    content: 'procurementPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/reports', action: ->
  BlazeLayout.render 'layout',
    content: 'reportsPage'
    header: 'header1'
    footer: 'footer1'
  return
FlowRouter.route '/help', action: ->
  BlazeLayout.render 'layout',
    content: 'helpPage'
    header: 'header1'
    footer: 'footer1'
  return
