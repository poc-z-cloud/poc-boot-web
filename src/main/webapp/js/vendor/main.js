jQuery(function($) {'use strict',

	//Initiat WOW JS
	new WOW().init();
	
	//goto top
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop: $("body").offset().top
		}, 500);
	});	

	(function($){
	$(document).ready(function(){
		$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
			event.preventDefault(); 
			event.stopPropagation(); 
			$(this).parent().siblings().removeClass('open');
			$(this).parent().toggleClass('open');
		});
	});
})(jQuery);
});

$(window).scroll(function() {
    if ( $(window).scrollTop() > 300) {
    	$('.gototop').fadeIn('slow');
    } else {
    	$('.gototop').fadeOut('slow');
    }
});

$(function() { $.support.transition = false; })