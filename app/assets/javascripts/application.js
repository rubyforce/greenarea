// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//

//= require gritter
//= require vendors/html5
//= require vendors/jquery.fancybox
//= require ajax
//= require sign-in_sign-up
//= require rating
//
//= require vendors/infobubble
//= require vendors/semantic.min
//
//= require angular
//= require angularjs/rails/resource
//= require angular-ui
//= require ng-rails-csrf
//= require greenarea
//

$(function() {
  $('.ui.rating').rating();
});

