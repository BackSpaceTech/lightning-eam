Template.deleteEquipmentPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteEquipmentPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteEquipmentPage.helpers
  customTemplate: -> Customisations.deleteEquipment
  textDoc: -> Session.get('currentDoc').text

Template.deleteEquipmentPage.events
  'click .deleteEquipment .btnDelete': (event) ->
    temp = Equipment.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete equipment that has children!'
    else
      Meteor.call 'deleteEquipment', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
