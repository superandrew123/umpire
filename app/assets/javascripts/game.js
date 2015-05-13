$(document).ready(function(){
	checkNames();
	setListeners();
});

function checkNames(){
	// Check length of name and shorten if it's too much
	
};

function setListeners(){
	$(".strikesBox").on("tap", tapStrike);
	$(".clear").on("tap", tapClear);
	$(".outsBox").on("tap", tapOut);
	$(".awayBox").on("tap", tapAway);
	$(".homeBox").on("tap", tapHome);
	$(".undo").on("tap", tapUndo)
	$(".deleteGame h3").click(destroyGame);
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
	}
	new Game();
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
		saveInning(game);
	}else {
		inning[0] = "Top ";
		inning[1]++;
		$(".inning").html(inning);
		game.inning = inning[0] + inning[1];
		saveInning(game);
	};
}

function tapAway(){
	var score = $(".awayS").html();
	score++;
	$(".awayS").html(score);
}

function tapHome(){
	var score = $(".homeS").html();
	score++;
	$(".homeS").html(score);
}

function tapUndo(){
	var game = Game.games.pop();
	game.insertValues();
}
