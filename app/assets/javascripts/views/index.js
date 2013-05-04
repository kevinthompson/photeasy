define(['backbone', 'speck!templates/index'], function(Backbone, template) {
  return Backbone.View.extend({
    initialize: function() {
      this.$el = $('#main');
      this.render();
      return this;
    },
    render: function() {
      template.view(this);
      return this;
    }
  });
});
