Template.deleteCompanyPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteCompanyPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteCompanyPage.helpers
  customTemplate: -> Customisations.deleteCompany
  textDoc: -> (Items.findOne {'id':Session.get('currentID').toString()}).text

Template.deleteCompanyPage.events
  'click .deleteCompany .btnDelete': (event) ->
    temp = Items.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete an item that has children!'
    else
      Meteor.call 'deleteCompany', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
