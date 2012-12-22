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
    'underscore': {
      deps: ['jst']
    }
  },

  paths: {
    jquery: 'js/lib/jquery-1.8.1.min',
    json: 'js/lib/json2',
    jst: '/jst',
    underscore: 'js/lib/underscore-min',
    backbone: 'js/lib/backbone-min',
    text: 'js/lib/require/text',
  }
});

require([
  'js/views/Dashboard', 'js/routes/Dashboard'
], function(Dashboard, Router){
  var router = new Router;
  if(!window.history.pushState) {
    Backbone.history.start()
  } else {
    Backbone.history.start({pushState: true})
  }
  $(document).on('click', 'a[href]:not([data-bypass])', function(e) {
    var href = {prop: $(this).attr("href"), attr: $(this).attr('href')}
    var root = location.protocol + "//" + location.host + app.root;
    if(href.prop.slice(0, root.length) == root) {
      e.preventDefault();
      Backbone.history.navigate(href.attr, true);
    }
  });
});