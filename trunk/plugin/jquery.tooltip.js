jQuery.fn.tooltip = function(option){
	//alert("hello plugin");
	var optionDefault={
		//id:this.id,
		//txt:$(this).text(),
		txt:$("Empty String!"),
		color:"black"
	}
	var ex = jQuery.extend(optionDefault,option);

return	$(this).hover(function(e){
	var thisID = this.id;
	var $left = e.pageX+10;
	var $top = e.pageY+10;
	var classT = ".tootip#"+thisID;
	$(classT).css({"left":$left+"px","top":$top+"px"}).fadeIn();
	//$(classT).empty()
	//	.append(ex.txt)
	//.css({"color":ex.color,"left":$left,"top":$top})
	//	.show("1000");
	//console.log(thisID);
	//console.log($(classT).text());
	},function(){
	$(".tootip").hide();
	});
	
}