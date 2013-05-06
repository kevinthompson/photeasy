define([
  'view',
  'dusty!templates/layout/header'],

function(BaseView, template) {
  return BaseView.extend({
    id: 'main',
    tagName: 'section'
  });
});

