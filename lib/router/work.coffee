###************************* Work routes ***********************************###

workRoutes = FlowRouter.group(
  prefix: '/work'
  name: 'work')
workRoutes.route '/', action: ->
  BlazeLayout.render 'layoutWork',
    content: 'workPage'
    header: 'header1'
    footer: 'footer1'

workRoutes.route '/create',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'createWorkPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/view',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'viewWorkPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/query',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'workQueryPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/view-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'viewWorkorderPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/edit-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'editWorkorderPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/copy-workorder',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'copyWorkorderPage'
      header: 'header1'
      footer: 'footer1'

  # My workorders available offline through GroundDB
workRoutes.route '/my-workorder',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'myWorkorderPage'
      header: 'header1'
      footer: 'footer1'

workRoutes.route '/my-workorders',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'myWorkordersPage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/create-safety',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'createSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/safety-template',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'safetyTemplatesPage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/view-safety',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'viewSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/edit-safety',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'editSafetyTemplatePage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/work-template',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'workTemplatesPage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/create-work',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'createWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/view-work',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'viewWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'


workRoutes.route '/edit-work',
  action: ->
    BlazeLayout.render 'layoutWork',
      content: 'editWorkTemplatePage'
      header: 'header1'
      footer: 'footer1'
