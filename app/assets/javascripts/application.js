// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require taggle-full
//= require_tree .


// var tags = new Taggle('tags');
// var container = example4.getContainer();
// var input = example4.getInput();



// $('.carousel.carousel-slider').carousel({
//     fullWidth: true
//   });

  // var instance = M.Carousel.init({
  //   fullWidth: true
  // });

 $(document).ready(function(){
    $('.carousel').carousel({
    	// fullWidth: true,
  		indicators: true
    });

    new Taggle($('.example1.textarea')[0])
	new Taggle($('tags'))
  });


     