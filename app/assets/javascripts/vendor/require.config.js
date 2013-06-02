var jam = {
    "packages": [
        {
            "name": "backbone",
            "location": "../vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "backbone.babysitter",
            "location": "../vendor/backbone.babysitter",
            "main": "lib/amd/backbone.babysitter.js"
        },
        {
            "name": "backbone.marionette",
            "location": "../vendor/backbone.marionette",
            "main": "lib/core/amd/backbone.marionette.js"
        },
        {
            "name": "backbone.wreqr",
            "location": "../vendor/backbone.wreqr",
            "main": "lib/amd/backbone.wreqr.js"
        },
        {
            "name": "dustjs-linkedin",
            "location": "../vendor/dustjs-linkedin",
            "main": "./lib/dust"
        },
        {
            "name": "jquery",
            "location": "../vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "json",
            "location": "../vendor/json",
            "main": "json.js"
        },
        {
            "name": "text",
            "location": "../vendor/text",
            "main": "text.js"
        },
        {
            "name": "underscore",
            "location": "../vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "version": "0.2.17",
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "underscore": {
            "exports": "_"
        }
    }
};

if (typeof require !== "undefined" && require.config) {
    require.config({
    "packages": [
        {
            "name": "backbone",
            "location": "../vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "backbone.babysitter",
            "location": "../vendor/backbone.babysitter",
            "main": "lib/amd/backbone.babysitter.js"
        },
        {
            "name": "backbone.marionette",
            "location": "../vendor/backbone.marionette",
            "main": "lib/core/amd/backbone.marionette.js"
        },
        {
            "name": "backbone.wreqr",
            "location": "../vendor/backbone.wreqr",
            "main": "lib/amd/backbone.wreqr.js"
        },
        {
            "name": "dustjs-linkedin",
            "location": "../vendor/dustjs-linkedin",
            "main": "./lib/dust"
        },
        {
            "name": "jquery",
            "location": "../vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "json",
            "location": "../vendor/json",
            "main": "json.js"
        },
        {
            "name": "text",
            "location": "../vendor/text",
            "main": "text.js"
        },
        {
            "name": "underscore",
            "location": "../vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "underscore": {
            "exports": "_"
        }
    }
});
}
else {
    var require = {
    "packages": [
        {
            "name": "backbone",
            "location": "../vendor/backbone",
            "main": "backbone.js"
        },
        {
            "name": "backbone.babysitter",
            "location": "../vendor/backbone.babysitter",
            "main": "lib/amd/backbone.babysitter.js"
        },
        {
            "name": "backbone.marionette",
            "location": "../vendor/backbone.marionette",
            "main": "lib/core/amd/backbone.marionette.js"
        },
        {
            "name": "backbone.wreqr",
            "location": "../vendor/backbone.wreqr",
            "main": "lib/amd/backbone.wreqr.js"
        },
        {
            "name": "dustjs-linkedin",
            "location": "../vendor/dustjs-linkedin",
            "main": "./lib/dust"
        },
        {
            "name": "jquery",
            "location": "../vendor/jquery",
            "main": "dist/jquery.js"
        },
        {
            "name": "json",
            "location": "../vendor/json",
            "main": "json.js"
        },
        {
            "name": "text",
            "location": "../vendor/text",
            "main": "text.js"
        },
        {
            "name": "underscore",
            "location": "../vendor/underscore",
            "main": "underscore.js"
        }
    ],
    "shim": {
        "backbone": {
            "deps": [
                "underscore",
                "jquery"
            ],
            "exports": "Backbone"
        },
        "underscore": {
            "exports": "_"
        }
    }
};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}