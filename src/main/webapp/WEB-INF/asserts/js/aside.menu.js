$(function(){
	$("a[data-asyn-load='true'").each(function(){
		$(this).click(function(){
			//alert($(this).attr("data-request-url"));
			$($(this).attr("target")).load($(this).attr("data-request-url"));
		})
	});
	
	$(".settings").find(".model").each(function(){
		$(this).mouseover(function(){
			$(this).addClass("model-high");
		}).mouseout(function(){
			$(this).removeClass("model-high");
		});
	});
	
});