// var main = function() {
// 	$(".splash").hide();
// 	$(".strikesTr, .ballsTr").jrumble();
// 	$(".homeSTr, .awaySTr, .reset, .outsTr").jrumble({
// 		x: 12,
// 		y: 12,
// 		rotation: 6
// 	});
// 	var outs = 0;
// 	var inning = ["Top ", 1];
// 	var homeS = 0;
// 	var awayS = 0;
// 	var strikes = 0;
// 	var balls = 0;
// 	var home = "Home";
// 	var away = "Away";
// 	$(".enterNames").click( function (){
// 		$(".splash").fadeIn();
// 		$(".umpCount").fadeOut();
// 	});
// 	$(".nameSubmit").click( function(){
// 		home = document.getElementById("homeInput").value;
// 		away = document.getElementById("awayInput").value;
// 		if (home.length > 5) {
//       	$(".home").css('font-size', '90%');
//   		} else if (home.length > 10) {
//       	$(".home").css('font-size', '80%');			
// 		}	
// 		if (away.length > 5) {
//       	$(".away").css('font-size', '90%');
//   		} else if (away.length > 10) {
//       	$(".away").css('font-size', '80%');			
// 		}

// 		$(".splash").fadeOut();
// 		$(".umpCount").fadeIn();
// 		$(".home").html(home);
// 		$(".away").html(away);
// 	});
// 	$(".strikes").html(strikes);
// 	$(".strikesTr").click( function() {
// 		strikes++;
// 		$(".strikes").html(strikes);
// 		if(strikes == 3){
// 			outs++;
// 			strikes = 0;
// 			balls = 0;
// 				$(".outsTr").trigger('startRumble');
// 				$(".outsTr").addClass("active");
// 				$(".outsTr").trigger('startRumble');
// 				setTimeout(function(){
// 					$(".outsTr").trigger('stopRumble');
// 					$(".outsTr").removeClass("active");
// 				}, 250)
// 			$(".outs").html(outs);
// 			$(".strikes").html(strikes);
// 			$(".balls").html(balls);
// 			if(outs > 2){
// 				$(".outs").html(outs);
// 				if (inning[0] == "Top ") {
// 					inning[0] = "Bot ";
// 					$(".inning").html(inning);
// 				}else {
// 					inning[0] = "Top ";
// 					inning[1]++;
// 					$(".inning").html(inning);
// 			};
// 			outs = 0;
// 			$(".outs").html(outs);
// 		};
// 		};
// 		$this = $(this);
// 		$this.trigger('startRumble');
// 		setTimeout(function(){$this.trigger('stopRumble');}, 100)		



// 	});
// 	$(".balls").html(balls);
// 	$(".ballsTr").click( function() {
// 		balls++;
// 		$(".balls").html(balls);
// 		if (balls == 4){
// 			balls = 0;
// 			strikes = 0;
// 			$(".balls").html(balls);
// 			$(".strikes").html(strikes);
// 		};
// 		$this = $(this);
// 		$this.trigger('startRumble');
// 		setTimeout(function(){$this.trigger('stopRumble');}, 100)	
// 	});	
// 	$(".outs").html(outs);
// 	$(".inning").html(inning);
	
// 	$(".outsTr").click( function() {
// 		balls = 0;
// 		strikes = 0;
// 		$(".balls").html(balls);
// 		$(".strikes").html(strikes);
// 		if (outs < 3){
// 			outs++;
// 			$(".outs").html(outs);	
// 		};

// 		if(outs > 2){
// 			$(".outs").html(outs);
// 			if (inning[0] == "Top ") {
// 				inning[0] = "Bot ";
// 				$(".inning").html(inning);
// 			}else {
// 				inning[0] = "Top ";
// 				inning[1]++;
// 				$(".inning").html(inning);
// 				saveInning();
// 			};
// 		outs = 0;
// 		$(".outs").html(outs);
// 		};
// 		$this = $(this);
// 		$this.trigger('startRumble');
// 		$this.addClass("active");
// 		$this.trigger('startRumble');
// 		setTimeout(function(){
// 			$this.trigger('stopRumble');
// 			$this.removeClass("active");
// 		}, 250)		
// 	});
// 	$(".homeS").html(homeS);
// 	$(".homeSTr").click( function() {
// 		homeS++;

// 		$(".homeS").html(homeS);
// 		$this = $(this);
// 		$this.addClass("active");
// 		$this.trigger('startRumble');
// 		setTimeout(function(){
// 			$this.trigger('stopRumble');
// 			$this.removeClass("active");
// 		}, 250)
		
// 	});
	
// 	$(".awayS").html(homeS);
// 	$(".awaySTr").click( function() {
// 		awayS++;
// 		$(".awayS").html(awayS);
// 		$this = $(this);
// 		$this.addClass("active");
// 		$this.trigger('startRumble');
// 		setTimeout(function(){
// 			$this.trigger('stopRumble');
// 			$this.removeClass("active");
// 		}, 250)
// 	});	

// 	$(".reset").click( function(){
// 		outs = 0;
// 		inning = ["Top ", 1];
// 		homeS = 0;
// 		awayS = 0;
// 		strikes = 0;
// 		balls = 0;
// 		$(".outs").html(outs);
// 		$(".strikes").html(strikes);
// 		$(".balls").html(balls);
// 		$(".inning").html(inning);
// 		$(".homeS").html(homeS);
// 		$(".awayS").html(awayS);

// 	});
// 	$(".clear").click(function(){
// 		strikes = 0;
// 		balls = 0;
// 		$(".strikes").html(strikes);
// 		$(".balls").html(balls);		
// 	});


// };



// $(document).ready(main);