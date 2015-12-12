/*Router.configure({
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',
  progressSpinner : false,
  waitOn: function() { return [
    //Meteor.subscribe('posts')
  ];}
});
*/

FlowRouter.notFound = {
    // Subscriptions registered here don't have Fast Render support.
    subscriptions: function() {

    },
    action: function() {BlazeLayout.render("layout", {content: "notFound", header: "header1", footer: "footer1"})}
};

FlowRouter.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "welcomePage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/help', {
  action: function() {BlazeLayout.render("layout", {content: "helpPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/assets', {
  action: function() {BlazeLayout.render("layout", {content: "assetsPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/contracts', {
  action: function() {BlazeLayout.render("layout", {content: "contractsPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/inventory', {
  action: function() {BlazeLayout.render("layout", {content: "inventoryPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/pm', {
  action: function() {BlazeLayout.render("layout", {content: "pmPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/purchasing', {
  action: function() {BlazeLayout.render("layout", {content: "purchasingPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/reports', {
  action: function() {BlazeLayout.render("layout", {content: "reportsPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/resources', {
  action: function() {BlazeLayout.render("layout", {content: "resourcesPage", header: "header1", footer: "footer1"})}
});
FlowRouter.route('/work', {
  action: function() {BlazeLayout.render("layout", {content: "workPage", header: "header1", footer: "footer1"})}
});

// Restricted routes
var requireLogin = function() {
  if (! Meteor.user()) {
    if (Meteor.loggingIn()) {
      this.render(this.loadingTemplate);
    } else {
      this.render('signInPage');
    }
  } else {
    this.next();
  }
}

/*Router.onBeforeAction(requireLogin, {only:[

  ]});
*/
