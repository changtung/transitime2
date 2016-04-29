<%@page import="org.transitime.db.webstructs.WebAgency"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String agencyId = request.getParameter("a");
if (agencyId == null || agencyId.isEmpty()) {
    response.getWriter().write("You must specify agency in query string (e.g. ?a=mbta)");
    return;
}
%>
<html>
<head>
<%@include file="/template/includes.jsp" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Strony statusu</title>
</head>
<body>
<%@include file="/template/header.jsp" %>
<div id="mainDiv">
<div id="title">Dynamiczne mapy dla <%= WebAgency.getCachedWebAgency(agencyId).getAgencyName() %></div>
<ul class="choicesList">
  <li><a href="../maps/map.jsp?a=<%= agencyId %>"
    title="Dynamiczna mapa dla wybranej linii">
      Mapa dla wybranej linii</a></li>
  <li><a href="../maps/map.jsp?a=<%= agencyId %>&showUnassignedVehicles=true"
    title="Dynamiczna mapa dla wybranej linii, ale pokazuje także pojazdy obecnie nie przypisane do żadnej linii">
      Mapa uwzględniająca nieprzypisane pojazdy</a></li>
  <li><a href="../maps/schAdhMap.jsp?a=<%= agencyId %>"
    title="Pokaż aktualne przestrzeganie rozkładów pojazdów na mapie">
      Mapa przestrzegania rozkładu</a></li>
</ul>
</div>
</body>
</html>