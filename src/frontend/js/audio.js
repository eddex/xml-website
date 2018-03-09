
function stopAudio() {
	var sounds = document.getElementsByTagName('audio');
	for(i=0; i<sounds.length; i++) {
		sounds[i].pause();
		sounds[i].currentTime = 0.0;
	}
}

function playWelcome() {
	stopAudio();
	var audio = document.getElementById("welcomeClip"); 
	audio.play(); 
}

function playDesign() {
	stopAudio();
	var audio = document.getElementById("designClip");
	audio.play();
}


function playGroText() {
	stopAudio();
	var audio = document.getElementById("groTextClip"); 
	audio.play();
}


function playHohKontrast() {
	stopAudio();
	var audio = document.getElementById("hohKontrastClip"); 
	audio.play();
}

function playHohKonGroText() {
	stopAudio();
	var audio = document.getElementById("hohKonGroTextClip");
	audio.play();
}


function playStandard() {
	stopAudio();
	var audio = document.getElementById("standardClip"); 
	audio.play();
}

function playBasketball() {
	stopAudio();
	var audio = document.getElementById("basketballClip");  
	audio.play();
}

function playHandball() {
	stopAudio();
	var audio = document.getElementById("handballClip"); 
	audio.play(); 
}

function playWandern() {
	stopAudio();
	var audio = document.getElementById("treckingClip"); 
	audio.play(); 
}


function playJoggen() {
	stopAudio();
	var audio = document.getElementById("joggingClip"); 
	audio.play(); 
}

function playSauna() {
	stopAudio();
	var audio = document.getElementById("saunaClip"); 
	audio.play(); 
}

function playWellness() {
	stopAudio();
	var audio = document.getElementById("wellnessClip"); 
	audio.play(); 
}


function playVitaParcours() {
	stopAudio();
	var audio = document.getElementById("vitaClip"); 
	audio.play(); 
}

function playSchwimmen() {
	stopAudio();
	var audio = document.getElementById("swimmingClip"); 
	audio.play(); 
}

function playSpinning() {
	stopAudio();
	var audio = document.getElementById("spinningClip"); 
	audio.play(); 
}

function playInlineSkating() {
	stopAudio();
	var audio = document.getElementById("inlineClip"); 
	audio.play(); 
}