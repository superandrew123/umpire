function saveGame(game){
	var url = "/games/" + $('.umpCount').attr("id");
	var data = {
		game: {
			id: game.id,
			outs: game.outs,
			home_score: game.homeScore,
			away_score: game.awayScore,
			inning: game.inning
		}
	};
	$.ajax(url, {
		method: 'PATCH',
		data: data
	});
}

function destroyGame(){
	var $table = $(this).parent().parent().next();
	var url = "/games/" + $(this).parent().parent().next().attr("id");
	var method = "DELETE";
	$.ajax(url, {
		method: method,
		complete: function(){
			$table.parent().hide()
		}
	});
}

function watchingGame(){
	var game = new Game();
	var data = {
		game: {
			id: game.id
		}
	}
	$.ajax('/watch',{
		method: 'GET',
		data: data
	})
}