$(document).ready(function(){
	// in game-data
	$(".deleteGame h3").click(destroyGame);

  $(".gameData").click(selectGame);
  $("#select").click(hideSelect);
  // set absolute positioned div width
  $(".selectGame").children(".selectButton").children(".watchButton").width($(".selectGame").width())
  $(".selectGame").children(".selectButton").children(".myGame").width($(".selectGame").width())
});

$(".games.show").ready(function(){
	// in game-action
	setGameListeners();
})

$(".games.watch").ready(function(){
	// in game-data
	setInterval(watchingGame, 500);
})

function selectGame(){
  $(this).parent().children("#select").show();
}

function hideSelect(){
  $(this).hide()
}