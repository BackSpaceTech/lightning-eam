
FlowRouter.notFound = {
    action: function() {BlazeLayout.render("layout", {content: "notFound", header: "header1", footer: "footer1"})}
};

FlowRouter.route('/signin', {
  action: function() {BlazeLayout.render("layout2", {content: "signInPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/', {
  action: function() {BlazeLayout.render("layout", {content: "welcomePage", header: "header1", footer: "footer1"})}
});





/************************** Other routes ************************************/

FlowRouter.route('/about', {
  action: function() {BlazeLayout.render("layout", {content: "aboutPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/inventory', {
  action: function() {BlazeLayout.render("layout", {content: "inventoryPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/pm', {
  action: function() {BlazeLayout.render("layout", {content: "pmPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/procurement', {
  action: function() {BlazeLayout.render("layout", {content: "procurementPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/reports', {
  action: function() {BlazeLayout.render("layout", {content: "reportsPage", header: "header1", footer: "footer1"})}
});

FlowRouter.route('/help', {
  action: function() {BlazeLayout.render("layout", {content: "helpPage", header: "header1", footer: "footer1"})}
});
