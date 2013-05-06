define([
  'view',
  'models/user',
  'dusty!templates/users'],

function(BaseView, UserModel, template) {
  return BaseView.extend({
    el: '#main',
    template: template,

    intitialize: function(id) {
      this.model = new UserModel(id);
    }
  });
});

