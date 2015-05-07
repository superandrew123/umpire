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

function destroyGame(){
	var $table = $(this).parents().eq(4)
	var url = "/games/" + $('.gameData').attr("id");
	var method = "DELETE";
	$.ajax(url, {
		method: method,
		complete: function(){
			$table.remove();
		}
	});
}