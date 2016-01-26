pmRoutes = FlowRouter.group(
  prefix: '/pm'
  name: 'pm')
pmRoutes.route '/', action: ->
  BlazeLayout.render 'layoutPM',
    content: 'pmPage'
    header: 'header1'
    footer: 'footer1'

pmRoutes.route '/view-groups',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'assetGroupsPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/create-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'createAssetGroupPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/view-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'viewAssetGroupPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/edit-group',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'editAssetGroupPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/create-pm',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'createPMPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/view-pms',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'viewPMsPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/view-pm',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'viewPMPage'
      header: 'header1'
      footer: 'footer1'

pmRoutes.route '/edit-pm',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutPM',
      content: 'editPMPage'
      header: 'header1'
      footer: 'footer1'
