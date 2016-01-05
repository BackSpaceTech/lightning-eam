Template.editPeoplePage.onCreated ->
  self = this
  self.autorun -> self.subscribe 'singleUser',Collections.Users.Current._id

<<<<<<< HEAD
Template.editPeoplePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editPeoplePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.editPeoplePage.helpers
  currentUser: -> Collections.Users.Current
  professionsValue: -> Collections.Users.Current.professions
  tradesValue: -> Collections.Users.Current.trades
  customTemplate: -> Customisations.editPeople
