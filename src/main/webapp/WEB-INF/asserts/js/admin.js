$(function(){
	$(".settings").find(".model").each(function(){
		$(this).mouseover(function(){
			$(this).addClass("model-high");
		}).mouseout(function(){
			$(this).removeClass("model-high");
		});
	});
	
	$(".settings").find(".model a").each(function(){
		$(this).click(function(){
			alert("hello");
			$($(this).attr("target")).load($(this).attr("data-target"));
		})
	});
});