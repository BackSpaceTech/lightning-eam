Template.afxSmlQuickFieldAdd.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.afxSmlQuickFieldAdd.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.afxArrayAdd.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.afxArrayAdd.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.afxArrayAddCreate.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
Template.afxArrayAddCreate.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
