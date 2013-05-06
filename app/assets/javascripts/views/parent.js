define([
  'view'],
function(BaseView) {
  return BaseView.extend({
    renderChild: function(child) {
      return (new child()).render().$el;
    },
    appendChild: function(child, $el) {
      this.renderChild(child).appendTo($el || this.$el);
      return this;
    },
    prependChild: function(child, $el) {
      this.renderChild(child).prependTo($el || this.$el);
      return this;
    }
  });
});
