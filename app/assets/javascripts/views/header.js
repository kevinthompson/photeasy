define([
  'view',
  'eventbus',
  'dusty!templates/header'],

function(BaseView, Bus, template) {
  var Header = BaseView.extend({
    id: 'header',
    tagName: 'header',
    template: template,
    render: function() {
      this.$el.html(template(this));
      return this;
    }
  });

  return Header;
});
