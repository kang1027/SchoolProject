$('#menu li > a').mouseenter(function(){
	$(this).siblings().children('a').css("visibility","visible");
	$(this).siblings().stop().animate({opacity: "1"}, 200);
});
$('#menu li').mouseleave(function(){
	$(this).children('#sub-menu').children('a').css("visibility","hidden");
	$(this).children('#sub-menu').stop().animate({opacity: "0"}, 300);
});