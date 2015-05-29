function setGameListeners(){
  $(".strikesBox").on("tap", tapStrike);
  $(".clear").on("tap", tapClear);
  $(".outsBox").on("tap", tapOut);
  $(".awayBox").on("tap", tapAway);
  $(".homeBox").on("tap", tapHome);
  $(".undo").on("tap", tapUndo);
  $(".nameTeams").on("tap", nameTeams());
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
  var game = new Game();
  saveGame(game);
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
  $(".awayS").html(score);
  var game = new Game();
  saveGame(game);
}

function tapHome(){
  var score = $(".homeS").html();
  score++;
  $(".homeS").html(score);
  var game = new Game();
  saveGame(game);
}

function tapUndo(){
  if (Game.games.length > 0){
    var game = Game.games.pop();
    game.insertValues();
  } else {
    console.log("No moves to undo")
  }
}

function nameTeams() {
  
}