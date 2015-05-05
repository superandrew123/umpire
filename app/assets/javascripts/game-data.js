function saveInning(){
	url = "/games/" + $('.umpCount').attr("id");
	data = {
		home_score: $(".homeS").html(),
		away_score: $(".awayS").html(),
		inning: $(".inning").html()
	};
	$.ajax(url, {
		method: 'PATCH',
		data: data
	});
}