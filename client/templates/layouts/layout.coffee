# Initialize collapse button
Template.layout.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutAssets.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutPM.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutResources.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutWork.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

# Subscriptions
Template.layoutPM.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'pm'
    self.subscribe 'assetGroups'
    self.subscribe 'safetyplans'
    self.subscribe 'workplans'

Template.layoutWork.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'my-work', Meteor.userId()
    self.subscribe 'safetyplans'
    self.subscribe 'workplans'

#Helpers
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
