$(document).ready(function() {	
	$('#messageText').keydown(function (e) {
  	if (e.ctrlKey && e.keyCode == 13) {
  	  // Ctrl-Enter pressed
  	  $('#submitButton').click();
  	}
	});
});
