# Initialize collapse button
Template.layout.onRendered ->
  $(".dropdown-button").dropdown()
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutAssets.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutPM.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutResources.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutWork.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

Template.layoutInventory.onRendered ->
  $('.button-collapse').sideNav { closeOnClick: true }

# Set relevant classification type
Template.layoutAssets.onCreated ->
  Session.set 'currentClass', 'asset-classification'

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

Template.layoutInventory.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'classification'
    self.subscribe 'bins'
    self.subscribe 'items'
    self.subscribe 'equipment'

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
