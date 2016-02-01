if Meteor.isClient
  @toast = (type, msg) ->
    time = 3000
    if type=='success'
      Materialize.toast(msg, time, 'teal')
      console.log 'Success: '+msg
    else if type=='error'
      Materialize.toast(msg, time, 'red')
      console.log 'Error: '+msg
