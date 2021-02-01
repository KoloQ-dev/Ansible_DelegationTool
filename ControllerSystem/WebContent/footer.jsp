<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/metisMenu.min.js"></script>
<script src="js/raphael.min.js"></script>
<script src="js/startmin.js"></script>

<script>
	function storeAnsibleTaskRegisterDir(path) {
		setCookie("ansibletaskregister_dir", path, 1);
	}
	
	function loadAnsibleTaskRegisterDir() {
		return getCookie("ansibletaskregister_dir");
	}
	
	function setCookie(cname, cvalue) {
		var d = new Date();
		d.setTime(d.getTime() + (1 * 60 * 60 * 1000));
		var expires = "expires="+d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	
	function getCookie(cname) {
	  var name = cname + "=";
	  var ca = document.cookie.split(';');
	  for(var i = 0; i < ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) == ' ') {
	      c = c.substring(1);
	    }
	    if(c.indexOf(name) == 0) {
	      return c.substring(name.length, c.length);
	    }
	  }
	  return "";
	}
</script>