// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(window).load(function() {

	var ball = $(".ball");
	var headerbar = $(".headerBar");

	var rolling = true;
	var wait = false;

	var ballinterval = setInterval(function() {

		if ( !rolling && !wait ) {

			wait = true;

			setTimeout( function() {
				dropAndRoll();
			}, 11500);
		}
	}, 500);

	dropAndRoll();

	var interval = setInterval( function() {

		if ( (ball.offset().left > headerbar.offset().left + headerbar.width()) && rolling ) {
			rolling = false;
			ball.stop(true, false).delay(800).animate( {
					top: "+=1000"
				}, 1500, 'linear', function() {
					$(".ball").css("top", "-20px");
				});
		}
	}, 500);

	var seed = $(".seed");

	seed.click( function() {
        $.ajax({
            url: "/main/seedshow/"+$(this).attr("id"),
            type: "GET",
            dataType: "script"
        });
		// popup($(this));
	});

	function dropAndRoll() {

		wait = false;
		rolling = true;
		var ball = $(".ball");
		var headerbar = $(".headerBar");

		ball.css("left", headerbar.offset().left);
		ball.css("opacity", 1);

		ball.animate( {
			top: "26px"
		}, 200).animate({
			top: "20px"
		}, 300).animate({
			top: "26px"
		}, 300).delay(400).animate({
			left: "+=5000"
		}, 100000, 'linear');
	}

	function popup(seed) {

		var body = $("body");
		body.append("<div class='backdrop'></div>");

		var backdrop = $(".backdrop");

		var popupwrap = $("<div class='popupwrap'></div>");
		body.prepend(popupwrap);

		var popup = $("<div class='popup'></div>");

		$(window).resize(function() {

			var windowheight = $(window).height();
			var popupheight = popup.outerHeight();

			popup.css("margin-top", (windowheight - popupheight)/2);
		});

		popupwrap.append(popup);

		popupwrap.click( function() {

			$(this).remove();
			backdrop.remove();
		});

		popup.click( function() {
			return false;
		});

		var title = "<div class='popuptitle'>Jennifer Aniston - Smartwater</div>";
		var description = "<div class='popupdesc'>Jennifer Aniston tries her hand at making a viral video in this new clip for Smartwater. </br></br> The 42-year-old actress teamed up with YouTube star Keenan Cahill and some “internet boys” to help her come up with the perfect ad to showcase Smartwater. </br></br> Be sure to watch what happens as Jen tries to teach a parrot how to say “I love Smartwater” and what she does to guarantee 100,000 views on the video! </br></br> Love the Double Rainbow shoutout!<div class='popuptitle'>";
		var media = "<iframe width='580' height='325' src='http://www.youtube.com/embed/Rc47LcvIxyI' frameborder='0' allowfullscreen></iframe>";

		var close = $("<div class='popupclose'></div>");
		close.click( function() {
			popupwrap.remove();
			backdrop.remove();
		});

		popup.append(title);
		popup.append(media);

		var buttoncont = $("<div class='buttonContainer'></div>");
		var uparrow = $("<div class='uparrow'></div>");
		buttoncont.append(uparrow);

		var facebook = $("<div class='facebook'></div>");
		buttoncont.append(facebook);

		var twitter = $("<div class='twitter'></div>");
		buttoncont.append(twitter);

		var linkedin = $("<div class='linkedin'></div>");
		buttoncont.append(linkedin);

		popup.append(buttoncont);

		popup.append(description);

		popup.append(close);

		$(window).resize();
	}
});