define([
  'view',
  'eventbus',
  'models/sample',
  'dusty!templates/index'],

function(BaseView, Bus, Model, template, Header) {
  return BaseView.extend({
    el: 'body',
    model: new Model(),
    template: template
  });
});
