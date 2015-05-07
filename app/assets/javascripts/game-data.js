function saveInning(game){
	var url = "/games/" + $('.umpCount').attr("id");
	var data = {
		home_score: game.homeScore,
		away_score: game.awayScore,
		inning: game.inning
	};
	$.ajax(url, {
		method: 'PATCH',
		data: data
	});
}