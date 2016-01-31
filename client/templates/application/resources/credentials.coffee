Template.credentialsPage.onCreated ->
  self = this
  self.autorun -> self.subscribe 'singleUser',Collections.Users.Current._id
  Session.set 'currentDoc', Collections.Users.Current

Template.credentialsPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.credentialsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.credentialsPage.helpers
  currentUser: -> Session.get 'currentDoc'
  professionsValue: -> Collections.Users.Current.professions
  tradesValue: -> Collections.Users.Current.trades
  customTemplate: -> Customisations.credentials

Template.credentialsPage.events
  'click .credentials .btnSubmit': (event) ->
    FlowRouter.go '/resources/view-people'
