<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/template/includes.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Specify Parameters</title>

  <!-- Load in Select2 files so can create fancy route selector -->
  <link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
  <script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>

  <link href="params/reportParams.css" rel="stylesheet"/>  
</head>
<body>
<%@include file="/template/header.jsp" %>
<div id="title">
   Wybierz parametry dla wykresu przestrzegania rozkładów według linii
</div>

<div id="mainDiv">
<form action="schAdhByTimeChart.jsp" method="POST">
   <%-- For passing agency param to the report --%>
   <input type="hidden" name="a" value="<%= request.getParameter("a")%>">
   
   <jsp:include page="params/routeSingle.jsp" />
 
   <jsp:include page="params/fromToDateTime.jsp" />
     
   <div class="param">
    <label for="allowableEarly">Dopuszczalne przyspieszenie:</label>
    <input id="allowableEarly" name="allowableEarly"
    	title="Dopuszczalne przyspieszenie, aby prognoza była nadal akceptowana. Proszę użyć wartości ujemnej, aby wskazać przyspieszenie." 
    	size="1"
    	value="1.0" /> <span class="note">minut</span>
  </div>
 
   <div class="param">
    <label for="allowableLate">Dopuszczalne opóźnienie:</label>
    <input id="allowableLate" name="allowableLate"
    	title="Dopuszczalne opóźnienie, aby prognoza była nadal akceptowana. Proszę użyć wartości dodatniej, aby wskazać przyspieszenie." 
    	size="1" 
    	value="4.0"/> <span class="note">minut</span>
  </div>
    
    <jsp:include page="params/submitReport.jsp" />
  </form>
</div>

</body>
</html>