if Meteor.isClient
  @toast = (type, msg) ->
    time = 3000
    if type=='success'
      Materialize.toast(msg, time, 'green')
      console.log 'Success: '+msg
    else if type=='error'
      Materialize.toast(msg, time, 'red')
      console.log 'Error: '+msg
    else if type=='warning'
      Materialize.toast(msg, time, 'orange')
      console.log 'Warning: '+msg
    else if type=='info'
      Materialize.toast(msg, time, 'teal')
      console.log 'Info: '+msg
