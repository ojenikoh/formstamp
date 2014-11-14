require('../../bower_components/angular/angular.js')
require('../../bower_components/angular-route/angular-route.js')
require('../../bower_components/angular-sanitize/angular-sanitize.js')
require('../../bower_components/angular-animate/angular-animate.js')
require('../../../src/coffee/formstamp.coffee')

app = require('./module')
require('./sampleDirective')
require('./markdown')

require('../views/index.html')
require('../views/readme.html')

require('./form')
require('../views/form.html')

require('./select')
require('../views/select.html')

require('./multiselect')
require('../views/multiselect.html')

require('./radio')
require('../views/radio.html')

require('./check')
require('../views/check.html')

require('./datetime')
require('../views/datetime.html')

require('../less/app.less')
require('../less/flags.css')


app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/readme.html'
      controller: 'ReadmeCtrl'
    .when '/fs-form',
      templateUrl: 'views/form.html'
      controller: 'FormBuilderCtrl'
    .when '/select',
      templateUrl: 'views/select.html'
      controller: 'SelectCtrl'
    .when '/multiselect',
      templateUrl: 'views/multiselect.html'
      controller: 'MultiSelectCtrl'
    .when '/radio',
      templateUrl: 'views/radio.html'
      controller: 'RadioCtrl'
    .when '/check',
      templateUrl: 'views/check.html'
      controller: 'CheckCtrl'
    .when '/datetime',
      templateUrl: 'views/datetime.html'
      controller: 'DatetimeCtrl'
    .otherwise
      templateUrl: '/views/404.html'

app.run ($rootScope) ->
  $rootScope.brand = "Formstamp"
  $rootScope.sitemap = {
    main: [
      {label: 'Form Builder', href: '#/fs-form'}
      {label: 'Select', href: '#/select'}
      {label: 'MultiSelect', href: '#/multiselect'}
      {label: 'Radio', href: '#/radio'}
      {label: 'Checkbox', href: '#/check'}
      {label: 'Date/Time', href: '#/datetime'}
    ]
  }


app.controller 'WelcomeCtrl', ()->

app.readme = require('../../../README.md')

app.controller 'ReadmeCtrl', ($sce, $scope)->
  console.log($sce.trustAsHtml(app.readme))
  $scope.readme = $sce.trustAsHtml(app.readme)

