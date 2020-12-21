<%@page contentType="text/html; charset=UTF-8"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>

<meta http-equiv="Content-Language" content="th" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Welcome</title>
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="webjars/jquery-ui/1.12.1/jquery-ui.css" />
    <link rel="stylesheet" href="webjars/jquery-ui/1.12.1/jquery-ui.min.css" />
    <link rel="stylesheet" href="webjars/jquery-ui/1.12.1/jquery-ui.theme.css" />
    <link rel="stylesheet" href="webjars/jquery-ui/1.12.1/jquery-ui.theme.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <style>
  body {

  transition: background-color .5s;
   font-family: 'Mali', cursive;
  background-color:#f3f3f3;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;

  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
 background: rgb(235,102,55);
background: linear-gradient(180deg, rgba(235,102,55,0.8916608879880077) 0%, rgba(235,102,55,1) 71%, rgba(235,102,55,1) 100%);
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: white;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}
.tbHeader {
      	background: #3c8dbc;
      	color: white;
}


.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
  margin-left: 0px;
  padding-left: 1px;
  padding-top: 0px;
  padding-right: 1px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
/*   background-color: white; */

  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

background: rgb(235,102,55);
background: linear-gradient(180deg, rgba(235,102,55,0.8916608879880077) 0%, rgba(235,102,55,1) 71%, rgba(235,102,55,1) 100%);
}

.panel-heading{
 box-shadow:0 1px 1px -1px rgba(0, 0, 0, 0.34), 0 0 6px 0 rgba(0, 0, 0, 0.14);

}




/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}


.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
a{
color: white;
}

.checkbox label:after,
     .radio label:after {
         content: '';
         display: table;
         clear: both;
     }

     .checkbox .cr,
     .radio .cr {
         position: relative;
         display: inline-block;
         border: 1px solid #a9a9a9;
         border-radius: .25em;
         width: 1.3em;
         height: 1.3em;
         float: left;
         margin-right: .5em;
     }

     .radio .cr {
         border-radius: 50%;
     }

     .checkbox .cr .cr-icon,
     .radio .cr .cr-icon {
         position: absolute;
         font-size: .8em;
         line-height: 0;
         top: 50%;
         left: 20%;
     }

     .radio .cr .cr-icon {
         margin-left: 0.04em;
     }

     .checkbox label input[type="checkbox"],
     .radio label input[type="radio"] {
         display: none;
     }

     .checkbox label input[type="checkbox"] + .cr > .cr-icon,
     .radio label input[type="radio"] + .cr > .cr-icon {
         transform: scale(3) rotateZ(-20deg);
         opacity: 0;
         transition: all .3s ease-in;
     }

     .checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
     .radio label input[type="radio"]:checked + .cr > .cr-icon {
         transform: scale(1) rotateZ(0deg);
         opacity: 1;
     }

     .checkbox label input[type="checkbox"]:disabled + .cr,
     .radio label input[type="radio"]:disabled + .cr {
         opacity: .5;
     }
.datepicker{
    left : 540 !important;
    margin-left : 250px;
}

		
    </style>
</head>
<body>
<div class="container-fulid">
		

		<div id="mySidenav" class="sidenav" style="width:250px;">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="#">Home</a>
			  <a href="#">Expenditure</a>
		
		</div>

		<div id="main" style="margin-left: 250px;">
		  <div class="tab" id="tabId">

			  <button class="tablinks" onclick="openNav()" ><span style="font-size:18px;cursor:pointer" ><a href="#">&#9776; Menu</a></span></button>
			  <button class="tablinks active" onclick="openCity(event, 'Paris')" style="font-size:18px;"><a href="#">ค่าใช้จ่าย</a></button>
			  <button class="tablinks" onclick="openCity(event, 'Paris')" style="font-size:18px;"><a href="#">ประเภทรายได้/อื่นๆ</a></button>

			  <div id="iconNon" style="padding-left: 900px;">
			  <button type="button" class="btn btn-default btn-lg" ><span class="glyphicon glyphicon-user" aria-hidden="true" style="color: white;"></span> <a href="#"> Non</a></button>
			  </div>

			</div>

		</div>
		
		
		    <script src="webjars/momentjs/2.24.0/moment.js"></script>
            <script src="webjars/momentjs/2.24.0/min/moment.min.js"></script>
            <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
            <script src="webjars/jquery/1.9.1/jquery.js"></script>
            <script src="webjars/jquery-ui/1.12.1/jquery-ui.js"></script>
            <script src="webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
             <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
            <script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
            <script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>

        <script>
        $( document ).ready(function() {

        });
        function openNav() {
        	  document.getElementById("mySidenav").style.width = "250px";
        	  document.getElementById("main").style.marginLeft = "0px";
        	  document.getElementById("iconNon").style.paddingLeft  = "900px";
        	  
        	  document.body.style.marginLeft = "250px";
        	  
        }
        document.getElementById("iconNon").style.paddingLeft  = "1150px";

       	function closeNav() {
       		  document.getElementById("iconNon").style.paddingLeft  = "1150px";
        	  document.getElementById("mySidenav").style.width = "0";
        	  document.getElementById("main").style.marginLeft= "0";
        	 /*  document.body.style.backgroundColor = "white";
        	  document.getElementById("tabId").style.backgroundColor = "white"; */
        	  document.body.style.marginLeft = "0";
        	}
	
</script>
    </div>
</body>
</html>