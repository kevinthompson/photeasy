define([
  'view',
  'models/photo'],

function(BaseView, PhotoModel) {
  return BaseView.extend({
    tagName: 'img',
    model: new PhotoModel(),
    initialize: function() {
      this.$el.hide();
      this.$el.one('load', function(){
        $(this).fadeIn(500);
      });
    },
    render: function() {
      this.$el.attr('src', this.model.get('url'));
      return this;
    }
  });
});
