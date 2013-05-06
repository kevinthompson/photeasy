define([
  'module', 
  'text', 
  'dust'],

function(module, text, dust) {
  var FOLDER = 'templates/';

  module.config();

  /**
   * Turns a model's attributes into json
   * @name jsonify
   * @function
   * @private
   * @param obj {Object} object to be turned to json
   */
  function jsonify(obj) {
    if (!obj || !(obj instanceof Object)) return;
    return JSON.parse(JSON.stringify(obj));
  }

  return {
    load: function(name, req, load, config) {
      text.get(req.toUrl(name), function(template) {
        var key = name.replace(FOLDER, '');
        dust.loadSource(template);

        load({
          /**
           * Creates a dust context from a 
           * views model and helper attributes,
           * applies that context to the retrieved
           * dust template, and renders the template.
           * If no view is passed, then it renders
           * the template. If the render errors,
           * it emits an event on the view object.
           * @name render
           * @function
           * @public
           * @param view {Object} Backbone view
           */
          render: function(view) {
            var model, helpers, base, context,
              result = '';

            if (view) {
              model = jsonify(view.model) || {};
              helpers = view.helpers || {};
              base = dust.makeBase(helpers);
              context = base.push(model);
            } else {
              context = {};
            }

            dust.render(key, context, function(error, output) {
              if (error) {
                view.$el.trigger('dust:error', error);
              } else {
                result = output;
              }
            });

            return result;
          }
        });

      });
    }
  };
});
