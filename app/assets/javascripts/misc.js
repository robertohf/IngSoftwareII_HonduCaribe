$(document).on("ready page:load", function(){
	$(".js-employees-filter").on("ajax:success", function(e,data,status,xhr){
		$(".js-employees-table").html(data)
	});

	$("#q").on("keyup", function(e){
		//$(".js-employees-filter").trigger("submit");
	});
});
