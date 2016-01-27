Template.rtViewEditDelete.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtViewEditDelete.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtDelete.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtDelete.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
