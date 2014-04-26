// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require raphael
//= require morris
//= require_tree .
//= require bootstrap.min

function display() {
	// obtains the string from the selected option
	var selected_option = document.getElementById('health_log_type').value;
	
	for (i=1; i<=7; i++) {
		if (i.toString().match(selected_option)) {
			document.getElementById(i.toString()).style.display = 'block';
		} else {
			document.getElementById(i.toString()).style.display = 'none';
		}
	}
}
