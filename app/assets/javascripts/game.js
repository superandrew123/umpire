$(document).ready(function(){
	// in game-data
	$(".deleteGame").click(destroyGame);

  $(".gameData").click(selectGame);
  $("#select").click(hideSelect);
  $(".resumeButton").click(hideResume);
  // set absolute positioned div width
  $(".watchButton").width($(".selectGame").width())
  setResumeWidth();
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

function hideResume(){
  $(this).parent().parent().hide()
}
function setResumeWidth(){
  var width = $(".selectGame").width();
  var resumeWidth = width * 0.7;
  var deleteWidth = width * 0.3;
  $(".resumeButton").width(resumeWidth);
  $(".deleteGame").width(deleteWidth);
}