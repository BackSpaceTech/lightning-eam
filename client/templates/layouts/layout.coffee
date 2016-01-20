# Initialize collapse button
Template.layout.onRendered ->
  $('.button-collapse').sideNav {
      #edge: 'left', # Choose the horizontal origin
      closeOnClick: true # Closes side-nav on <a> clicks
    }

Template.header1.helpers
  serverConnected: -> (Meteor.status().status == "connected")
  userSignedIn: ->
    if (Meteor.userId())
      return true
    else
      return false
  currentUser: -> Meteor.userId()    

Template.header1.events
  'click #btnheader1Logout': -> AccountsTemplates.logout()
