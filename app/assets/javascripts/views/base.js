define([
  'backbone'],

function(Backbone) {
  return Backbone.View.extend({
    render: function() {
      if (this.template) {
        this.$el.html(this.template.render(this));
      }
      return this;
    }
  });
});
