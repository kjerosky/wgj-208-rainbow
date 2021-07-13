function convertMillisecondsToTimeString(milliseconds) {
	var seconds = milliseconds div 1000;

	var tenthsOfSecondString = string((milliseconds mod 1000) div 100);

	var secondsPart = seconds mod 60;
	var secondsString = (secondsPart < 10 ? "0" : "") + string(secondsPart);

	var minutesString = string(seconds div 60);

	return string(minutesString) + ":" + secondsString + "." + tenthsOfSecondString;
}
