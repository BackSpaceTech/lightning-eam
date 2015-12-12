// Initialize collapse button
Template.layout.onRendered(function () {
  $('.button-collapse').sideNav({
      //edge: 'left', // Choose the horizontal origin
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
});
