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
  # My workorders available offline through GroundDB
workRoutes.route '/my-workorder',
  action: ->
    BlazeLayout.render 'layout',
      content: 'myWorkorderPage'
      header: 'header1'
      footer: 'footer1'
    return
workRoutes.route '/my-workorders',
  action: ->
    BlazeLayout.render 'layout',
      content: 'myWorkordersPage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/create-safety',
  action: ->
    BlazeLayout.render 'layout',
      content: 'createSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/safety-template',
  action: ->
    BlazeLayout.render 'layout',
      content: 'safetyTemplatesPage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/view-safety',
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/edit-safety',
  action: ->
    BlazeLayout.render 'layout',
      content: 'editSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/work-template',
  action: ->
    BlazeLayout.render 'layout',
      content: 'workTemplatesPage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/create-work',
  action: ->
    BlazeLayout.render 'layout',
      content: 'createWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/view-work',
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return

workRoutes.route '/edit-work',
  action: ->
    BlazeLayout.render 'layout',
      content: 'editWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'
    return
