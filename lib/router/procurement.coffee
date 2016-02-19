###************************* Procurement routes ***********************************###

procurementRoutes = FlowRouter.group(
  prefix: '/procurement'
  name: 'procurement')

procurementRoutes.route '/', action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'procurementPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/view-classifications',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'viewCompanyClassificationsPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/view-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'viewCompanyClassificationPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/create-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'createCompanyClassificationPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/edit-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'editCompanyClassificationPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/duplicate-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'duplicateCompanyClassificationPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/delete-classification',
  triggersEnter: [ AccountsTemplates.ensureSignedIn ]
  action: ->
    BlazeLayout.render 'layoutProcurement',
      content: 'deleteCompanyClassificationPage'
      header: 'header1'
      footer: 'footer1'

procurementRoutes.route '/company/view-companies',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'viewCompaniesPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/view-company',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'viewCompanyPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/create-company',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'createCompanyPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/edit-company',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'editCompanyPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/duplicate-company',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'duplicateCompanyPage'
    header: 'header1'
    footer: 'footer1'

procurementRoutes.route '/company/delete-company',
triggersEnter: [ AccountsTemplates.ensureSignedIn ]
action: ->
  BlazeLayout.render 'layoutProcurement',
    content: 'deleteCompanyPage'
    header: 'header1'
    footer: 'footer1'
