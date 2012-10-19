requirejs.config({
  shim: {
    'underscore': {
      exports: '_'
    },
    'backbone': {
      deps: [
        'underscore',
        'jquery',
        'json'
      ],
      exports: 'Backbone'
    },
    'handlebars': {
      exports: 'Handlebars'
    }
  },

  paths: {
    jquery: 'js/lib/jquery-1.8.1.min',
    json: 'js/lib/json2',
    underscore: 'js/lib/underscore-min',
    backbone: 'js/lib/backbone-min',
    text: 'js/lib/require/text',
  }
});

require([
  'js/views/app'
], function(AppView){
  var app = new AppView;
});