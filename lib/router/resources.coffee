###************************* Resources routes ***********************************###

resourcesRoutes = FlowRouter.group(
  prefix: '/resources'
  name: 'resources')
resourcesRoutes.route '/', action: ->
  BlazeLayout.render 'layout',
    content: 'resourcesPage'
    header: 'header1'
    footer: 'footer1'

resourcesRoutes.route '/view-people',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'viewPeoplePage'
      header: 'header1'
      footer: 'footer1'

resourcesRoutes.route '/edit-people',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'editPeoplePage'
      header: 'header1'
      footer: 'footer1'

resourcesRoutes.route '/credentials',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layout',
      content: 'credentialsPage'
      header: 'header1'
      footer: 'footer1'
