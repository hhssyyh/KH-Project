<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Lato:400,300,700,900" rel="stylesheet">
 <style>
 body {
 background-color: #000000; 
 }
 

h1:before {
  content: "";
  background: rgba(255, 255, 255, 0.1);
  bottom: -4px;
  width: 25%;
  height: 1px;
  left: 0;
  position: absolute;
}

.back {
  padding: 50px 0 150px 0;
}

.color-6 {
  background: #353535;
}


body * {
  font-family: Lato !important;
}
 
 
 a {
	transition: all 0.2s linear;
}
a:hover {
	  transform: scale(1.4);
}
 

</style> 
<style>
.menu a {
	display: block;
  color: rgba(255, 255, 255, 0.8);
  font-family: Lato;
  font-size: 40pt;
  font-weight: 400;
  padding: 25px 25px;
  /**/
  position: relative;
  display: block;
  text-decoration: none;
  text-transform: uppercase;
*, *:after, *:before {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

</style>
<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

    <div class="row">
      <ul class="menu align-center expanded text-center ">
        <li><a href="/admin/usermanage">USER</a></li>
        <li><a href="/admin/partnermanage">PARTNER</a></li>
        <li><a href="/admin/noticelist">NOTICE</a></li>
      </ul>
    </div>
</body>
</html>