/************************** Global Variables **********************************/
Collections = {};
Collections.Locations = {};
Collections.Locations.Current = {
  id: 0,
  meter: {}
}


/************************** Global Functions **********************************/
function isEmpty(value){
  return (value == null || value.length === 0);
}
