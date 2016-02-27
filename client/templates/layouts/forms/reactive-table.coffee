Template.rtViewEditDelete.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtViewEditDelete.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtEditDelete.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtEditDelete.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtDelete.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtDelete.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtAdd.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtAdd.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtEdit.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtEdit.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.rtBoolean.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.rtBoolean.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
