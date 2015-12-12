WorkOrders = new Mongo.Collection('workOrders');


Meteor.methods({

});

WorkOrders.deny({
  insert: function() {
    return true;
  },
  remove: function() {
    return true;
  }
});

WorkOrders.allow({
  update: function() {
    return true;
  }
});
