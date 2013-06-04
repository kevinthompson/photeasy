// Karma configuration
// Generated on Sun Jun 02 2013 16:53:36 GMT-0700 (PDT)


// base path, that will be used to resolve files and exclude
basePath = '.js/';

// frameworks to use
frameworks = ['mocha', 'requirejs'];


// list of files / patterns to load in the browser
files = [
  {pattern: 'vendor/**/*.js', included: false},
  {pattern: 'lib/**/*.js', included: false},
  {pattern: 'app/templates/**/*.dust', included: false},
  {pattern: 'app/**/*.js', included: false},
  {pattern: 'test/**/*_spec.js', included: false},
  'test/test-main.js'
];


// list of files to exclude
exclude = [
  'main.js',
  'marketing.js',
  'active_admin.js'
];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
reporters = ['dots', 'coverage', 'growl'];

coverageReporter = {
  type : 'html',
  dir : '../docs/js/coverage/'
};

// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['Chrome'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;

// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;

preprocessors = {
  'app/**/*.js': 'coverage',
  'lib/dust.helpers.js': 'coverage',
  'lib/dusty.js': 'coverage'
};

// plugins to load
plugins = [
  'karma-mocha',
  'karma-requirejs',
  'karma-coverage',
  'karma-growl-reporter',
  'karma-chrome-launcher'
];
