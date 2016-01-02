if (Meteor.isServer) {
  Meteor.methods({
    setRole: function(userID,role) {
      Roles.setUserRoles(userID, role);
    }
  });
};

Meteor.users.allow({
  insert: function() {return true;},
  update: function() {return true;},
  remove: function() {return true;}
});

Schema.UserProfile = new SimpleSchema({
	firstName: {
		type: String,
		regEx: /^[a-zA-Z-]{2,25}$/,
		optional: true
	},
	lastName: {
		type: String,
		regEx: /^[a-zA-Z]{2,25}$/,
		optional: true
	},
  cpyName: {
		type: String,
    label:"Company",
		optional: true
	},
  cpyDiv: {
		type: String,
    label:"Division",
		optional: true
	},
  phone: {
		type: Number,
    label:"Phone Number",
		optional: true
	},
  mobile: {
		type: Number,
    label:"Mobile Number",
		optional: true
	},
	birthday: {
		type: Date,
		optional: true
	},
	website: {
		type: String,
		regEx: SimpleSchema.RegEx.Url,
		optional: true
	},
	bio: {
		type: String,
		optional: true
	}
});

Schema.users = new SimpleSchema({
  createdAt: {
    type: Date
  },
  profile: {
    type: Schema.UserProfile,
    optional: true
  },
	emails: {
		type: [Object],
		optional: true
	},
	"emails.$.address": {
		type: String,
		regEx: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,15})$/
	},
	"emails.$.verified": {
		type: Boolean
	},
  trades: {
		type: [Object],
    label: "Trade Qualifications",
		optional: true
	},
	"trades.$.trade": {
		type: String,
    autoform: {type: "select",options: function () {
      return Lists.Resources.Trades
    }}
	},
  "trades.$.level": {
		type: String,
    autoform: {type: "select",options: function () {
      return Lists.Resources.TradeLevels
    }}
	},
  "trades.$.expires": {
    type: Date,
		optional: true
  },
  professions: {
		type: [Object],
    label: "Academic",
		optional: true
	},
	"professions.$.profession": {
		type: String,
    autoform: {type: "select",options: function () {
      return Lists.Resources.Professions
    }}
	},
  "professions.$.level": {
		type: String,
    autoform: {type: "select",options: function () {
      return Lists.Resources.ProfessionLevels
    }}
	},
  "professions.$.expires": {
    type: Date,
		optional: true
  },
  certifications: {
		type: [Object],
    label: "Certifications",
		optional: true
	},
	"certifications.$.certification": {
		type: String,
    autoform: {type: "select",options: function () {
      return Lists.Resources.Certifications
    }}
	},
  "certifications.$.expires": {
    type: Date,
		optional: true
  },
  databases: {
		type: [String],
    label: "Database Access",
    autoform: {type: "select-multiple", options: function () {
      var temp1 = Locations.find({type:"database"}, {fields: {
        _id:true,
        text: true,
        id: true
      }}).fetch();
      var temp2 =[];
      if (temp1.length!==0){
        for (var a=0; a<temp1.length; a++){
          temp2[a]={
            label: temp1[a].id + "-" + temp1[a].text,
            value: temp1[a]._id
          }
        }
      }
      return temp2;
    }},
		optional: true
	},
	services: {
		type: Object,
		optional: true,
		blackbox: true
	}
});

Meteor.users.attachSchema(Schema.users);
