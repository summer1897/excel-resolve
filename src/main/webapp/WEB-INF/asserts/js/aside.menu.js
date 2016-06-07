$(function(){
	$("#admin-menu").find(".list-item a").each(function(){
		$(this).click(function(){
//			alert($(this).attr("data-target"));
			$($(this).attr("target")).load($(this).attr("data-target"));
		})
	});
});