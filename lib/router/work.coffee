###************************* Work routes ***********************************###

workRoutes = FlowRouter.group(
  prefix: '/work'
  name: 'work')
workRoutes.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'workPage'
    header: 'header1'
    footer: 'footer1'
  return
workRoutes.route '/create',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'createWorkPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/view',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewWorkPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/query',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'workQueryPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/view-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewWorkorderPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/edit-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editWorkorderPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/copy-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'copyWorkorderPage'
      header: 'header1'
      footer: 'footer1'
    return
