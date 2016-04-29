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
<title>Raporty historyczne</title>
</head>
<body>
<%@include file="/template/header.jsp" %>
<div id="mainDiv">
<div id="title">Raporty historyczne dla <%= WebAgency.getCachedWebAgency(agencyId).getAgencyName() %></div>

<div id="subtitle">Dokładność prognozy<br/><span style="font-size: small">(tylko dla przewoźników, dla których w bazie danych przechowywana jest dokładność prognoz)</span></div>
<ul class="choicesList">
  <li><a href="predAccuracyRangeParams.jsp?a=<%= agencyId %>"
    title="Pokazuje % prognoz, które były dokładne przy założonym przedziale.">
      Wykres zakresu dokładności prognoz</a></li>
  <li><a href="predAccuracyIntervalsParams.jsp?a=<%= agencyId %>"
    title="Pokazuje średnią dokładnośćprognoz dla każdej długości prognoz. Pokazuje także górne i dolne granice. Pozwala sprawdzić dla założonego %, jaka jest dokładność prognozy dla prognoz leżących w założonym przedziale prognoz.">
      Wykres interwału dokładności prognoz</a></li>
  <li><a href="predAccuracyScatterParams.jsp?a=<%= agencyId %>" 
    title="Pokazuje pojedyncze punkty w czasie dla dokładności prognoz. Przydatne przy wyszukiwaniu problemów z prognozami.">
      Wykres punktowy dokładności prognoz</a></li>
  <li><a href="predAccuracyCsvParams.jsp?a=<%= agencyId %>"
    title="Dla wyświetlanie danych skuteczności prognoz w formacie CSV.">
      Pobranie dokładności prognozy do pliku CSV</a></li>
</ul>

<div id="subtitle">Raporty przestrzegania rozkładów</div>
<ul class="choicesList">
  <li><a href="schAdhByRouteParams.jsp?a=<%= agencyId %>"
    title="Wyświetla dane historyczne przestrzeganie rozkładów według linii na wykresie słupkowym. Potrafi porównać przestrzeganie rozkładów dla wielu linii.">
      Przestrzeganie rozkładów według linii</a></li>
  <li><a href="schAdhByStopParams.jsp?a=<%= agencyId %>"
    title="Wyświetla dane historyczne przestrzegania rozkładów dla każdego przystanku na liniach w wykresie słupkowym.">
      Przestrzeganie rozkładów według przystanku</a></li>
  <li><a href="schAdhByTimeParams.jsp?a=<%= agencyId %>"
    title="Wyświetla dane historyczne przestrzegania rozkładów dla linii pogrupowanych według spóźnione/przyspieszone. Wynikający wykres krzywej pokazuje dystrybucję opóźnionych/przyspieszonych czasów ">
      Przestrzeganie rozkładów (opóźnienia/przyspieszenia)</a></li>
</ul>

<div id="subtitle">Raporty monitoringu GPS</div>
<ul class="choicesList">
  <li><a href="avlMapByRouteParams.jsp?a=<%= agencyId %>"
    title="Wyświetla historyczne dane monitoringu GPS dla linii na mapie.">
      Dane monitoringu GPS na mapie według linii</a></li>
  <li><a href="avlMapByVehicleParams.jsp?a=<%= agencyId %>"
    title="Wyświetla historyczne dane monitoringu GPS dla pojazdu na mapie">
      Dane monitoringu GPS według pojazdu</a></li>
  <li><a href="lastAvlReport.jsp?a=<%= agencyId %>"
    title="Wyświetla czas ostatniego zgłoszenia się pojazdu w ciągu ostatnich 24 godzin.">
      Ostatni raport GPS według pojazdu</a></li>
</ul>

<div id="subtitle">Różne raporty</div>
<ul class="choicesList">
  <li><a href="scheduleHorizStopsParams.jsp?a=<%= agencyId %>"
    title="Wyświetla tabelaryczny rozkład jazdy dla linii.">
      Rozkład dla linii</a></li>
  <li><a href="scheduleVertStopsParams.jsp?a=<%= agencyId %>"
    title="Wyświetla tabelaryczny rozkład jazdy dla linii. Przystanki wyświetlone są pionowo, co jest przydatne przy małej ilości kursów.">
      Rozkład dla linii (przystanki pionowo)</a></li>
</ul>
</div>
</body>
</html>