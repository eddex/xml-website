var cookieName = 'audio';
var audioStatus = false;

function playAudio() {
  "use strict";
  audioStatus = true;
}

function muteAudio() {
  "use strict";
  audioStatus = false;
}

function stopAudio() {
	var sounds = document.getElementsByTagName('audio');
	for(i=0; i<sounds.length; i++) {
		sounds[i].pause();
		sounds[i].currentTime = 0.0;
	}
}

function playWelcome() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("welcomeClip"); 
		audio.play(); 
	}
}

function playDesign() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("designClip");
		audio.play();
	}
}


function playGroText() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("groTextClip"); 
		audio.play();
	}
}


function playHohKontrast() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("hohKontrastClip"); 
		audio.play();
	}
}

function playHohKonGroText() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("hohKonGroTextClip");
		audio.play();
	}
}


function playStandard() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("standardClip"); 
		audio.play();
	}
}

function playBasketball() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("basketballClip");  
		audio.play();
	}
}

function playHandball() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("handballClip"); 
		audio.play(); 
	}
}

function playWandern() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("treckingClip"); 
		audio.play(); 
	}
}


function playJoggen() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("joggingClip"); 
		audio.play(); 
	}
}

function playSauna() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("saunaClip"); 
		audio.play(); 
	}
}

function playWellness() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("wellnessClip"); 
		audio.play(); 
	}
}


function playVitaParcours() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("vitaClip"); 
		audio.play(); 
	}
}

function playSchwimmen() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("swimmingClip"); 
		audio.play(); 
	}
}

function playSpinning() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("spinningClip"); 
		audio.play(); 
	}
}

function playInlineSkating() {
	if (audioStatus)
	{
		stopAudio();
		var audio = document.getElementById("inlineClip"); 
		audio.play(); 
	}
}