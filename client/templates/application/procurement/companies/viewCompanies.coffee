Template.viewCompaniesPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewCompaniesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewCompaniesPage.helpers
  customTemplate: -> Customisations.viewCompanies
  rtCollection: -> Companies
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'company_id', label: ' Company ID' }
      { key: 'type', label: ' Type' }
      { key: 'referenceID', label: ' Reference ID' }
      { key: 'status', label: ' Status' }
      { key: 'name', label: ' Company Name' }
      { key: 'tradingName', label: ' Trading Name' }
      { key: 'companyNumber', label: ' Reg Number' }
      { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
    ]
  }

Template.viewCompaniesPage.events
  'click .viewCompanies .btnView': (event) ->
    Session.set 'currentDoc', Companies.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/procurement/companies/view-company'

  'click .viewCompanies .btnEdit': (event) ->
    Session.set 'currentDoc', Companies.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/procurement/companies/edit-company'

  'click .viewCompanies .btnDelete': (event) ->
    Collections.Companies.CurrentID = this._id
    MaterializeModal.display
      bodyTemplate: 'viewCompaniesDelete'
      title: 'Delete Company!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteCompany',  Collections.Companies.CurrentID, (error, result) ->
              if error
                toast 'error', error
              else
                toast 'success', result
              return
        return
