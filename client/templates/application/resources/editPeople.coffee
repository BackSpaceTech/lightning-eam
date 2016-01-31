Template.editPeoplePage.onCreated ->
  self = this
  self.autorun -> self.subscribe 'singleUser',Collections.Users.Current._id

Template.editPeoplePage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.editPeoplePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editPeoplePage.helpers
  currentUser: -> Collections.Users.Current
  professionsValue: -> Collections.Users.Current.professions
  tradesValue: -> Collections.Users.Current.trades
  customTemplate: -> Customisations.editPeople

Template.editPeoplePage.events
  'click .editPeople .btnSubmit': (event) ->
    FlowRouter.go '/resources/view-people'
