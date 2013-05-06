define([
  'views/parent',
  'views/layout/header',
  'views/layout/main'],

function(ParentView, HeaderView, MainView, template) {
  return ParentView.extend({
    el: 'body',

    initialize: function() {
      this.appendChild(HeaderView);
      this.appendChild(MainView);
    }
  });
});
