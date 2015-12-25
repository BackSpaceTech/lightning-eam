Meteor.startup(function () {
  smtp = {
    username: 'AKIAIK3NRQDNJUZ2HXPQ',   // eg: server@gentlenode.com
    password: 'Aq52ntucc3v1b0oqUs82jl5/R7iUjAVrlNknEQ+CbhUy',   // eg: 3eeP1gtizk5eziohfervU
    server:   'email-smtp.us-east-1.amazonaws.com',  // eg: mail.gandi.net
    port: 465
  }

  process.env.MAIL_URL = 'smtp://' + encodeURIComponent(smtp.username) + ':' + encodeURIComponent(smtp.password) + '@' + encodeURIComponent(smtp.server) + ':' + smtp.port;

  Meteor.absoluteUrl.defaultOptions.rootUrl = "http://localhost:3000"

  Accounts.emailTemplates.siteName = "MySite";
  Accounts.emailTemplates.from = "Lightning EAM <classroom@backspace.academy>";

  Accounts.emailTemplates.resetPassword.subject = function (user) {
      return "How to verify your email address on BackSpace Academy.";
  };

  Accounts.emailTemplates.resetPassword.text = function (user, url) {
      var signature = "Lightning EAM";
      var tempURL = url.slice(url.indexOf("reset"));
      tempURL = "http://localhost:3000/" + tempURL;
      //var president = President.findOne();
      //if (president)
      //    president = Meteor.users.findOne(president.presidentId);
      //    signature = president.profile.displayName + ", the MySite President.";

      return "Dear " + user.profile.firstName + ",\n\n" +
          "Click the following link to set your new password:\n" +
          tempURL + "\n\n" +
          "All the best,\n\n\n" +
          "from,\n signature";
  };

});
