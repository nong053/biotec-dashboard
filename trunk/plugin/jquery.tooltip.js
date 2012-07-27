jQuery.fn.tooltip = function(option){
	//alert("hello plugin");
	var optionDefault={
		txt:"kpi expand",
		color:"black"
	}
	var ex = jQuery.extend(optionDefault,option);

return	$(this).hover(function(e){
	var $left = e.pageX+10;
	var $top = e.pageY+10;
	$("#tooltip").empty()
	.append(ex.txt)
	.css({"color":ex.color,"left":$left,"top":$top})
	.show("1000");

	},function(){
	$("#tooltip").hide();
	});
	
}