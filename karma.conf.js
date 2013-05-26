// Karma configuration
// Generated on Sun May 12 2013 12:58:53 GMT-0700 (PDT)


// base path, that will be used to resolve files and exclude
basePath = 'app/assets/javascripts/';


// list of files / patterns to load in the browser
files = [
  MOCHA,
  MOCHA_ADAPTER,
  REQUIRE,
  REQUIRE_ADAPTER,
  {pattern: 'app/**/*.coffee', included: false},
  {pattern: 'lib/**/*.js', included: false},
  {pattern: 'lib/**/*.coffee', included: false},
  {pattern: 'app/**/*.dust', included: false},
  {pattern: 'vendor/**/*.js', included: false},
  {pattern: 'test/**/*_spec.coffee', included: false},
  'test/test-main.coffee'
];


// list of files to exclude
exclude = [
  'app.coffee'
];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['dots', 'growl'];


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
browsers = ['PhantomJS'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;

// Preprocessors
preprocessors = {
  '**/*.coffee': 'coffee',
  'app/**/*.coffee': 'coverage',
  'app/**/*.js': 'coverage'
};
