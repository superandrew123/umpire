function Game(){
	this.id = $('.umpCount').attr("id");
	this.outs = $(".outs").html();
	this.awayName = $(".away").html();
	this.homeName = $(".home").html();
	this.awayScore = $(".awayS").html();
	this.homeScore = $(".homeS").html();
	this.inning = $(".inning").html();
	//Game.games will be used for queuing 'undo' actions
	Game.games.push(this);
};

Game.games = [];

Game.prototype.insertValues = function(){
	$(".outs").html(this.outs);
	$(".awayS").html(this.awayScore);
	$(".homeS").html(this.homeScore);
	$(".inning").html(this.inning);
};