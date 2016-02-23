Template.deletePurchasePage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deletePurchasePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deletePurchasePage.helpers
  customTemplate: -> Customisations.deletePurchase
  textDoc: -> (Purchases.findOne {'id':Session.get('currentID').toString()}).text

Template.deletePurchasePage.events
  'click .deletePurchase .btnDelete': (event) ->
    Meteor.call 'deletePurchase', Session.get('currentID').toString(), (error, result) ->
      if error
        toast 'error', error
      else
        toast 'success', result
        FlowRouter.go history.back()
      return
