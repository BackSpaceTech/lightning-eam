Template.createLocationPage.helpers
  customTemplate: -> Customisations.createLocation
  parentID: -> Session.get('currentID').toString()
  children: -> []
  locationFormSchema: -> Schema.locations
  locationType: ->
    if (Session.get 'currentID') == '#'
      type = 'database'
    else
      type = 'location'
    return type

Template.createLocationPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.createLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
