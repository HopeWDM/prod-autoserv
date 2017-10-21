// power
var wc_mainHL_power = 'GEEK_ERR';
var wc_mainHR_power = 'GEEK_ERR';
var wc_catwalk01_power = 'GEEK_ERR';
var wc_catwalk02_power = 'GEEK_ERR';
var wc_catwalk03_power = 'GEEK_ERR';
var wc_foldbackHL_power = 'GEEK_ERR';
var wc_foldbackHR_power = 'GEEK_ERR';
var bridge_mainLeft_power = 'GEEK_ERR';
var bridge_mainRight_power = 'GEEK_ERR';
var bridge_mainCenter_power = 'GEEK_ERR';
var bridge_foldbackCenter_power = 'GEEK_ERR';
var chapel_mainSide_power = 'GEEK_ERR';
var chapel_mainCenter_power = 'GEEK_ERR';
var chapel_foldbackSide_power = 'GEEK_ERR';
var gym_mainSide_power = 'GEEK_ERR';
var well_mainCenter_power = 'GEEK_ERR';
var rmRR1_mainCenter_power = 'GEEK_ERR';
var rm128_mainCenter_power = 'GEEK_ERR';
var rm101A_mainCenter_power = 'GEEK_ERR';
var rm101C_mainCenter_power = 'GEEK_ERR';
var rm102_mainCenter_power = 'GEEK_ERR';
var rm104_mainCenter_power = 'GEEK_ERR';
var rm212_mainCenter_power = 'GEEK_ERR';
var rm214_mainCenter_power = 'GEEK_ERR';
var rm216_mainCenter_power = 'GEEK_ERR';

// hours
var wc_mainHL_hours = 'GEEK_ERR';
var wc_mainHR_hours = 'GEEK_ERR';
var wc_catwalk01_hours = 'GEEK_ERR';
var wc_catwalk02_hours = 'GEEK_ERR';
var wc_catwalk03_hours = 'GEEK_ERR';
var wc_foldbackHL_hours = 'GEEK_ERR';
var wc_foldbackHR_hours = 'GEEK_ERR';
var bridge_mainLeft_hours = 'GEEK_ERR';
var bridge_mainRight_hours = 'GEEK_ERR';
var bridge_mainCenter_hours = 'GEEK_ERR';
var bridge_foldbackCenter_hours = 'GEEK_ERR';
var chapel_mainSide_hours = 'GEEK_ERR';
var chapel_mainCenter_hours = 'GEEK_ERR';
var chapel_foldbackSide_hours = 'GEEK_ERR';
var gym_mainSide_hours = 'GEEK_ERR';
var well_mainCenter_hours = 'GEEK_ERR';
var rmRR1_mainCenter_hours = 'GEEK_ERR';
var rm128_mainCenter_hours = 'GEEK_ERR';
var rm101A_mainCenter_hours = 'GEEK_ERR';
var rm101C_mainCenter_hours = 'GEEK_ERR';
var rm102_mainCenter_hours = 'GEEK_ERR';
var rm104_mainCenter_hours = 'GEEK_ERR';
var rm212_mainCenter_hours = 'GEEK_ERR';
var rm214_mainCenter_hours = 'GEEK_ERR';
var rm216_mainCenter_hours = 'GEEK_ERR';

// indicator
var wc_mainHL_hours = 'GEEK_ERR';
var wc_mainHR_hours = 'GEEK_ERR';
var wc_catwalk01_hours = 'GEEK_ERR';
var wc_catwalk02_hours = 'GEEK_ERR';
var wc_catwalk03_hours = 'GEEK_ERR';
var wc_foldbackHL_hours = 'GEEK_ERR';
var wc_foldbackHR_hours = 'GEEK_ERR';
var bridge_mainLeft_indicator = 'GEEK_ERR';
var bridge_mainRight_indicator = 'GEEK_ERR';
var bridge_mainCenter_indicator = 'GEEK_ERR';
var bridge_foldbackCenter_indicator = 'GEEK_ERR';
var chapel_mainSide_indicator = 'GEEK_ERR';
var chapel_mainCenter_indicator = 'GEEK_ERR';
var chapel_foldbackSide_indicator = 'GEEK_ERR';
var gym_mainSide_indicator = 'GEEK_ERR';
var well_mainCenter_indicator = 'GEEK_ERR';
var rmRR1_mainCenter_indicator = 'GEEK_ERR';
var rm128_mainCenter_indicator = 'GEEK_ERR';
var rm101A_mainCenter_indicator = 'GEEK_ERR';
var rm101C_mainCenter_indicator = 'GEEK_ERR';
var rm102_mainCenter_indicator = 'GEEK_ERR';
var rm104_mainCenter_indicator = 'GEEK_ERR';
var rm212_mainCenter_indicator = 'GEEK_ERR';
var rm214_mainCenter_indicator = 'GEEK_ERR';
var rm216_mainCenter_indicator = 'GEEK_ERR';

var sdBLUE = '<img src="graphics/blue-dot.png" alt="blue-dot">';
var sdGRAY = '<img src="graphics/gray-dot.png" alt="gray-dot">';
var sdGREEN = '<img src="graphics/green-dot.png" alt="green-dot">';
var sdORANGE = '<img src="graphics/flashing-orange.gif" alt="warning/error">';
var sdRED = '<img src="graphics/red-dot.png" alt="red-dot">';

// this function stolen from:
// http://www.philnicholas.com/2009/05/11/reloading-your-javascript-without-reloading-your-page/
// ...but with a tweak to the last line,
// to make it actually work
function LoadMyJs(scriptName) {
	var docHeadObj = document.getElementsByTagName("head")[0];
	var dynamicScript = document.createElement("script");
	dynamicScript.type = "text/javascript";
	dynamicScript.src = scriptName;
	docHeadObj.appendChild(dynamicScript);
}
		
//var myVar = setInterval(doStuffOverAndOver,500);
function goForth() {
	setInterval(doStuffOverAndOver,500);
}

function doStuffOverAndOver() {
	LoadMyJs('http://prod-autoserv.hopewdm.org/javascript-beta/status_vars.js');
	readVars();
	runThings();
}

function runThings() {
	powerToStatusDot();
	replaceInnerHTML();
}

function replaceInnerHTML() {
	/* Power statuses */
	document.getElementById("wc_mainHL_power").innerHTML = wc_mainHL_power;
	document.getElementById("wc_mainHR_power").innerHTML = wc_mainHR_power;
	document.getElementById("wc_catwalk01_power").innerHTML = wc_catwalk01_power;
	document.getElementById("wc_catwalk02_power").innerHTML = wc_catwalk02_power;
	document.getElementById("wc_catwalk03_power").innerHTML = wc_catwalk03_power;
	document.getElementById("wc_foldbackHL_power").innerHTML = wc_foldbackHL_power;
	document.getElementById("wc_foldbackHR_power").innerHTML = wc_foldbackHR_power;
	document.getElementById("bridge_mainLeft_power").innerHTML = bridge_mainLeft_power;
	document.getElementById("bridge_mainRight_power").innerHTML = bridge_mainRight_power;
	document.getElementById("bridge_mainCenter_power").innerHTML = bridge_mainCenter_power;
	document.getElementById("bridge_foldbackCenter_power").innerHTML = bridge_foldbackCenter_power;
	document.getElementById("chapel_mainSide_power").innerHTML = chapel_mainSide_power;
	document.getElementById("chapel_mainCenter_power").innerHTML = chapel_mainCenter_power;
	document.getElementById("chapel_foldbackSide_power").innerHTML = chapel_foldbackSide_power;
	document.getElementById("gym_mainSide_power").innerHTML = gym_mainSide_power;
	document.getElementById("well_mainCenter_power").innerHTML = well_mainCenter_power;
	document.getElementById("rmRR1_mainCenter_power").innerHTML = rmRR1_mainCenter_power;
	document.getElementById("rm128_mainCenter_power").innerHTML = rm128_mainCenter_power;
	document.getElementById("rm101A_mainCenter_power").innerHTML = rm101A_mainCenter_power;
	document.getElementById("rm101C_mainCenter_power").innerHTML = rm101C_mainCenter_power;
	document.getElementById("rm102_mainCenter_power").innerHTML = rm102_mainCenter_power;
	document.getElementById("rm104_mainCenter_power").innerHTML = rm104_mainCenter_power;
	document.getElementById("rm212_mainCenter_power").innerHTML = rm212_mainCenter_power;
	document.getElementById("rm214_mainCenter_power").innerHTML = rm214_mainCenter_power;
	document.getElementById("rm216_mainCenter_power").innerHTML = rm216_mainCenter_power;
	
	/* Hours times */
	document.getElementById("wc_mainHL_hours").innerHTML = wc_mainHL_hours;
	document.getElementById("wc_mainHR_hours").innerHTML = wc_mainHR_hours;
	document.getElementById("wc_catwalk01_hours").innerHTML = wc_catwalk01_hours;
	document.getElementById("wc_catwalk02_hours").innerHTML = wc_catwalk02_hours;
	document.getElementById("wc_catwalk03_hours").innerHTML = wc_catwalk03_hours;
	document.getElementById("wc_foldbackHL_hours").innerHTML = wc_foldbackHL_hours;
	document.getElementById("wc_foldbackHR_hours").innerHTML = wc_foldbackHR_hours;
	document.getElementById("bridge_mainLeft_hours").innerHTML = bridge_mainLeft_hours;
	document.getElementById("bridge_mainRight_hours").innerHTML = bridge_mainRight_hours;
	document.getElementById("bridge_mainCenter_hours").innerHTML = bridge_mainCenter_hours;
	document.getElementById("bridge_foldbackCenter_hours").innerHTML = bridge_foldbackCenter_hours;
	document.getElementById("chapel_mainSide_hours").innerHTML = chapel_mainSide_hours;
	document.getElementById("chapel_mainCenter_hours").innerHTML = chapel_mainCenter_hours;
	document.getElementById("chapel_foldbackSide_hours").innerHTML = chapel_foldbackSide_hours;
	document.getElementById("gym_mainSide_hours").innerHTML = gym_mainSide_hours;
	document.getElementById("well_mainCenter_hours").innerHTML = well_mainCenter_hours;
	document.getElementById("rmRR1_mainCenter_hours").innerHTML = rmRR1_mainCenter_hours;
	document.getElementById("rm128_mainCenter_hours").innerHTML = rm128_mainCenter_hours;
	document.getElementById("rm101A_mainCenter_hours").innerHTML = rm101A_mainCenter_hours;
	document.getElementById("rm101C_mainCenter_hours").innerHTML = rm101C_mainCenter_hours;
	document.getElementById("rm102_mainCenter_hours").innerHTML = rm102_mainCenter_hours;
	document.getElementById("rm104_mainCenter_hours").innerHTML = rm104_mainCenter_hours;
	document.getElementById("rm212_mainCenter_hours").innerHTML = rm212_mainCenter_hours;
	document.getElementById("rm214_mainCenter_hours").innerHTML = rm214_mainCenter_hours;
	document.getElementById("rm216_mainCenter_hours").innerHTML = rm216_mainCenter_hours;

	/* Status indicators */
	document.getElementById("wc_mainHL_indicator").innerHTML = wc_mainHL_indicator;
	document.getElementById("wc_mainHR_indicator").innerHTML = wc_mainHR_indicator;
	document.getElementById("wc_catwalk01_indicator").innerHTML = wc_catwalk01_indicator;
	document.getElementById("wc_catwalk02_indicator").innerHTML = wc_catwalk02_indicator;
	document.getElementById("wc_catwalk03_indicator").innerHTML = wc_catwalk03_indicator;
	document.getElementById("wc_foldbackHL_indicator").innerHTML = wc_foldbackHL_indicator;
	document.getElementById("wc_foldbackHR_indicator").innerHTML = wc_foldbackHR_indicator;
	document.getElementById("bridge_mainLeft_indicator").innerHTML = bridge_mainLeft_indicator;
	document.getElementById("bridge_mainRight_indicator").innerHTML = bridge_mainRight_indicator;
	document.getElementById("bridge_mainCenter_indicator").innerHTML = bridge_mainCenter_indicator;
	document.getElementById("bridge_foldbackCenter_indicator").innerHTML = bridge_foldbackCenter_indicator;
	document.getElementById("chapel_mainSide_indicator").innerHTML = chapel_mainSide_indicator;
	document.getElementById("chapel_mainCenter_indicator").innerHTML = chapel_mainCenter_indicator;
	document.getElementById("chapel_foldbackSide_indicator").innerHTML = chapel_foldbackSide_indicator;
	document.getElementById("gym_mainSide_indicator").innerHTML = gym_mainSide_indicator;
	document.getElementById("well_mainCenter_indicator").innerHTML = well_mainCenter_indicator;
	document.getElementById("rmRR1_mainCenter_indicator").innerHTML = rmRR1_mainCenter_indicator;
	document.getElementById("rm128_mainCenter_indicator").innerHTML = rm128_mainCenter_indicator;
	document.getElementById("rm101A_mainCenter_indicator").innerHTML = rm101A_mainCenter_indicator;
	document.getElementById("rm101C_mainCenter_indicator").innerHTML = rm101C_mainCenter_indicator;
	document.getElementById("rm102_mainCenter_indicator").innerHTML = rm102_mainCenter_indicator;
	document.getElementById("rm104_mainCenter_indicator").innerHTML = rm104_mainCenter_indicator;
	document.getElementById("rm212_mainCenter_indicator").innerHTML = rm212_mainCenter_indicator;
	document.getElementById("rm214_mainCenter_indicator").innerHTML = rm214_mainCenter_indicator;
	document.getElementById("rm216_mainCenter_indicator").innerHTML = rm216_mainCenter_indicator;
	
}

/*
var indicatorStrings = [
	bridge_mainLeft_indicator,
	bridge_mainRight_indicator,
	bridge_mainCenter_indicator,
	bridge_foldbackCenter_indicator,
	chapel_mainSide_indicator,
	chapel_mainCenter_indicator,
	chapel_foldbackSide_indicator,
	gym_mainSide_indicator,
	well_mainCenter_indicator,
];
*/

function powerToStatusDot() {
	/* Worship Center */
	wc_mainHL_indicator = statusDot(wc_mainHL_power);
	wc_mainHR_indicator = statusDot(wc_mainHR_power);
	wc_catwalk01_indicator = statusDot(wc_catwalk01_power);
	wc_catwalk02_indicator = statusDot(wc_catwalk02_power);
	wc_catwalk03_indicator = statusDot(wc_catwalk03_power);
	wc_foldbackHL_indicator = statusDot(wc_foldbackHL_power);
	wc_foldbackHR_indicator = statusDot(wc_foldbackHR_power);

	/* Bridge */
	bridge_mainLeft_indicator = statusDot(bridge_mainLeft_power);
	bridge_mainRight_indicator = statusDot(bridge_mainRight_power);
	bridge_mainCenter_indicator = statusDot(bridge_mainCenter_power);
	bridge_foldbackCenter_indicator = statusDot(bridge_foldbackCenter_power);

	/* Chapel */
	chapel_mainSide_indicator = statusDot(chapel_mainSide_power);
	chapel_mainCenter_indicator = statusDot(chapel_mainCenter_power);
	chapel_foldbackSide_indicator = statusDot(chapel_foldbackSide_power);

	/* Gym */
	gym_mainSide_indicator = statusDot(gym_mainSide_power);

	/* Well */
	well_mainCenter_indicator = statusDot(well_mainCenter_power);

	/* Classrooms */
	rmRR1_mainCenter_indicator = statusDot(rmRR1_mainCenter_power);
	rm128_mainCenter_indicator = statusDot(rm128_mainCenter_power);
	rm101A_mainCenter_indicator = statusDot(rm101A_mainCenter_power);
	rm101C_mainCenter_indicator = statusDot(rm101C_mainCenter_power);
	rm102_mainCenter_indicator = statusDot(rm102_mainCenter_power);
	rm104_mainCenter_indicator = statusDot(rm104_mainCenter_power);
	rm212_mainCenter_indicator = statusDot(rm212_mainCenter_power);
	rm214_mainCenter_indicator = statusDot(rm214_mainCenter_power);
	rm216_mainCenter_indicator = statusDot(rm216_mainCenter_power);
}

//indicatorStrings.forEach(statusDot);

function statusDot(sdVal) { // "sd" = "status dot"
	if (sdVal == "off") {
		return sdRED;
	}
	else {
		if (sdVal == "on") {
			return sdGREEN;
		}
		else {
			if (sdVal == "in-between") {
				return sdBLUE;
			}
			else {
				if (sdVal == "no response") {
					return sdGRAY;
				}
				else {
					return sdORANGE;
				}
			}
		}
	}
}
