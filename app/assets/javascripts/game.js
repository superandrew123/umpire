$(document).ready(function(){
	// in game-data
	$(".deleteGame h3").click(destroyGame);
});

$(".games.show").ready(function(){
	// in game-action
	setGameListeners();
})

$(".games.watch").ready(function(){
	// in game-data
	setInterval(watchingGame, 500);
})