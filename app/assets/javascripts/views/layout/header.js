define([
  'view',
  'eventbus',
  'utils/urls',
  'dusty!templates/layout/header'],

function(BaseView, Bus, Url, template) {
  return BaseView.extend({
    id: 'header',
    tagName: 'header',
    template: template,

    initialize: function() {
      Bus.on('page:change', this.updateCurrent);
    },

    updateCurrent: function(page) {},

    helpers: {
      photosLink: function() {
        return Url.linkTo('photos', 'Photos')[0];
      }
    }
  });
});
