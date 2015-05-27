$(document).ready(function(){
	$(".deleteGame h3").click(destroyGame);
});

$(".games.show").ready(function(){
	setGameListeners();
})

function setGameListeners(){
	$(".strikesBox").on("tap", tapStrike);
	$(".clear").on("tap", tapClear);
	$(".outsBox").on("tap", tapOut);
	$(".awayBox").on("tap", tapAway);
	$(".homeBox").on("tap", tapHome);
	$(".undo").on("tap", tapUndo)
};

function tapStrike(){
	var strikes = $(".strikes").html();
	strikes++;
	if(strikes == 3){
		tapOut();
		strikes = 0;
	}
	$(".strikes").html(strikes);
}

function tapClear(){
	$(".strikes").html("0");
}

function tapOut(){
	var outs = $(".outs").html();
	outs++;
	if(outs == 3){
		increaseInning();
		outs = 0;
	} else {
		new Game();
	}
	tapClear();
	$(".outs").html(outs);
}

function increaseInning(){
	var game = new Game();
	var inning = game.inning.split(" ");
	if (inning[0] == "Top") {
		inning[0] = "Bot ";
		$(".inning").html(inning);
		game.inning = inning[0] + inning[1];
	}else {
		inning[0] = "Top ";
		inning[1]++;
		$(".inning").html(inning);
		game.inning = inning[0] + inning[1];
	};
	saveGame(game);
}

function tapAway(){
	var score = $(".awayS").html();
	score++;
	new Game();
	$(".awayS").html(score);
}

function tapHome(){
	var score = $(".homeS").html();
	score++;
	new Game();
	$(".homeS").html(score);
}

function tapUndo(){
	if (Game.games.length > 0){
		var game = Game.games.pop();
		game.insertValues();
	} else {
		console.log("No moves to undo")
	}
}
