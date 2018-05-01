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
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require taggle-full
//= require_tree .
//= require jquery.slick

// --------Create function to initialize tags---------
// var tags = new Taggle('tags');
// var container = example4.getContainer();
// var input = example4.getInput();


 $(document).ready(function(){

    $('.carousel').carousel({
    	indicators: true,
    	numVisible: 3,

    	onCycleTo: function(art) {
      		var film = art.href.split('films/')[1];
    		// $("#film-describe").append("<%= escape_javascript("#{render :partial => 'partials/describe'}").html_safe %>");
   		}
  });

    new Taggle($('#film-tags')[0])

  });





 


     