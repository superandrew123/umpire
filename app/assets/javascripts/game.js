
$(document).ready(function(){
	setListeners();
});



function setListeners(){
	$(".strikesBox").click(tapStrike);
	$(".clear").click(tapClear);
	$(".outsBox").click(tapOut);
	$(".awayBox").click(tapAway);
	$(".homeBox").click(tapHome);
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
	tapClear();
	$(".outs").html(outs);
}

function increaseInning(){
	var game = new Game();
	var inning = game.inning.split(" ");
	if (inning[0] == "Top") {
		inning[0] = "Bot ";
		$(".inning").html(inning);
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
