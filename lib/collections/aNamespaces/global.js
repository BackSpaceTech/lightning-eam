/************************** Global Variables **********************************/
Collections = {};
Collections.Locations = {};
Collections.Locations.Current = {}
Collections.Locations.CurrentID = 0;
Collections.Locations.CurrentMeter = {};

Lists = {};
Lists.Locations = {};

Schema = {};

/************************** Global Functions **********************************/
function isEmpty(value){
  return (value == null || value.length === 0);
}
