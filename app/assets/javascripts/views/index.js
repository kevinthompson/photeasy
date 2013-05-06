define([
  'view',
  'dusty!templates/index'],

function(BaseView, template) {
  return BaseView.extend({
    el: '#main',
    template: template
  });
});