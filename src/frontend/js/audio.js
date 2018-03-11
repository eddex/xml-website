function setCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
function eraseCookie(name) {   
    document.cookie = name+'=; Max-Age=-99999999;';  
}

function changeAudio() {
  "use strict";
	var elem = document.getElementById("audioButton");
	if (getCookie('audioTest'))
	{
		elem.innerHTML = "Audio: AUS <span class='glyphicon glyphicon-volume-off' />";
		setCookie('audioTest', false, 7);
	}
	else
	{
		elem.innerHTML = "Audio: EIN <span class='glyphicon glyphicon-volume-up' />";
		setCookie('audioTest', true, 7);
	}
}

function getAudio() {
	var elem = document.getElementById("audioButton");
	if (getCookie('audioTest')) {
		elem.innerHTML = "Audio: EIN <span class='glyphicon glyphicon-volume-up' />";
	}
	else {
		elem.innerHTML = "Audio: AUS <span class='glyphicon glyphicon-volume-off' />";
	}
}

function stopAudio() {
	var sounds = document.getElementsByTagName('audio');
	for(i=0; i<sounds.length; i++) {
		sounds[i].pause();
		sounds[i].currentTime = 0.0;
	}
}

function playWelcome() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("welcomeClip"); 
		audio.play(); 
	}
}

function playDesign() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("designClip");
		audio.play();
	}
}


function playGroText() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("groTextClip"); 
		audio.play();
	}
}


function playHohKontrast() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("hohKontrastClip"); 
		audio.play();
	}
}

function playHohKonGroText() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("hohKonGroTextClip");
		audio.play();
	}
}


function playStandard() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("standardClip"); 
		audio.play();
	}
}

function playBasketball() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("basketballClip");  
		audio.play();
	}
}

function playHandball() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("handballClip"); 
		audio.play(); 
	}
}

function playWandern() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("treckingClip"); 
		audio.play(); 
	}
}


function playJoggen() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("joggingClip"); 
		audio.play(); 
	}
}

function playSauna() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("saunaClip"); 
		audio.play(); 
	}
}

function playWellness() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("wellnessClip"); 
		audio.play(); 
	}
}


function playVitaParcours() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("vitaClip"); 
		audio.play(); 
	}
}

function playSchwimmen() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("swimmingClip"); 
		audio.play(); 
	}
}

function playSpinning() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("spinningClip"); 
		audio.play(); 
	}
}

function playInlineSkating() {
	if (getCookie('audioTest'))
	{
		stopAudio();
		var audio = document.getElementById("inlineClip"); 
		audio.play(); 
	}
}