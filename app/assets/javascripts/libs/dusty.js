define([
  'module', 
  'text', 
  'dust'],

function(module, text, dust) {
  var FOLDER = 'templates/';

  module.config();

  function jsonify(obj) {
    if (!obj || !(obj instanceof Object)) {
      return;
    }
    return JSON.parse(JSON.stringify(obj));
  }

  return {
    load: function(name, req, load, config) {
      text.get(req.toUrl(name), function(template) {
        var key = name.replace(FOLDER, '');
        dust.loadSource(template);

        load({
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
                view.trigger('dust:render:error', error);
              } else {
                result = output;
                view.trigger('dust:render:success', output);
              }
            });

            return result;
          }
        });

      });
    }
  };
});
