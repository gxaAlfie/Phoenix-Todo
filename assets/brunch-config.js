exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        before: ["css/app.scss"]
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor", "scss", "fonts"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    sass: {
      mode: "native",
      options: {
        includePaths: ["node_modules/bootstrap/scss", "node_modules/font-awesome/scss"],
        precision: 8
      }
    },
    copycat: {
      "fonts": ["static/fonts", "node_modules/font-awesome/fonts"],
      verbose: false,
      onlyChanged: true
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery',
      Tether: 'tether',
      Popper: 'popper.js',
      bootstrap: 'bootstrap',
      datetimepicker: 'jquery-datetimepicker'
    },
    styles: {
      'jquery-datetimepicker': ['jquery.datetimepicker.css']
    }
  }
};
