Template.smlDateField.helpers
  dateItem: ->
    if this.item
      dateToText(this.item)

Template.fabBackResetSubmit.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()

Template.fabBack.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()

Template.fabBackSubmit.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()

Template.fabBackCopyEdit.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()

Template.fabBackEdit.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()

Template.fabBackSearch.events
  'click .btnBack': (event) ->
    $('.tooltipped').tooltip 'remove'
    FlowRouter.go history.back()
