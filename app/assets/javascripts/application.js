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
//= require turbolinks
//= require cocoon
//= require_tree .


var do_on_load = function() { 
  	$('#search').keyup(function () {
	  	 $.get($("#gs").attr("action"), $("#gs").serialize(), null, "script");
		  return false;
	});
	$('#search').keyup(function (){
	if(!$(this).val()){
		$('#groups').css( "display", "none" );
	}
	else
	{
	   $('#groups').css( "display", "block" );	
	}
	});

  $('form').on('cocoon:after-insert', function(e, insertedItem) {

    phone_number = 0;

	$('.tel.optional:not(.string)').delay(100).each(function(i,e){
		phone_number+=1;
		$(e).text("Phone \#"+phone_number);
		console.log("Index "+phone_number);
	});


  });

  $('form').on('cocoon:after-remove', function(e, insertedItem) {

    phone_number = 0;

	$('.tel.optional:not(.string)').delay(100).each(function(i,e){
		phone_number+=1;
		$(e).text("Phone \#"+phone_number);
		console.log("Index "+phone_number);
	});


  });

}

$(document).ready(do_on_load)
$(window).bind('page:change', do_on_load)