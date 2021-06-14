$('#menu li > a').mouseenter(function(){
	$(this).siblings().children('a').css("visibility","visible");
	$(this).siblings().animate({opacity: "1"}, 200);
});
$('#menu li').mouseleave(function(){
	$(this).children('#sub-menu').children('a').css("visibility","hidden");
	$(this).children('#sub-menu').animate({opacity: "0"}, 300);
});
$(window).scroll(function(){
    if ($(window).scrollTop() == 0) {
	    $('header a').css("color","white");
	    $('#menu li > a').css("color","white");
      	$('#sub_back').fadeOut(150);
    }
    else{
	    $('header a').css("color","black");
	    $('#menu li > a').css("color","black");
    	$('#sub_back').fadeIn(150);
    }
})