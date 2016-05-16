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
<title>API Calls</title>
</head>
<body>
<%@include file="/template/header.jsp" %>
<div id="mainDiv">
<div id="title">Zapytania API dla <%= WebAgency.getCachedWebAgency(agencyId).getAgencyName() %></div>
<div id="subtitle" style="margin-bottom: 20px;">Uwaga: To jest niepełna lista zapytań API</div>
<div id="subtitle">Zapytania API specyficzne dla przewoźnika</div>
<ul class="choicesList">
  <li><a href="routeApiParams.jsp?a=<%= agencyId %>"
    title="Summary data for all routes, listed in order. Useful for creating a UI selector for routes.">
      Linie</a></li>
  <li><a href="routeDetailsApiParams.jsp?a=<%= agencyId %>"
    title="Detailed data for selected routes. Includes stop and path information needed to show route on map.">
      Szczegóły linii</a></li>
      
  <li><a href="vehiclesApiParams.jsp?a=<%= agencyId %>"
    title="Data for vehicles, including GPS info, for a route. Useful for showing location of vehicles on map.">
      Pojazdy</a></li>
  <li><a href="vehiclesDetailsApiParams.jsp?a=<%= agencyId %>"
    title="Detailed data for vehicles, including GPS info, for a route. Contains additional data such as schedule adherence and assignment information.">
      Szczegóły pojazdów</a></li>
  <li><a href="vehicleConfigsApiParams.jsp?a=<%= agencyId %>"
    title="Configuration data for vehicles. A way of getting list of vehicles configured for agency.">
      Konfiguracje pojazdów</a></li>
      
  <li><a href="predsByRouteStopApiParams.jsp?a=<%= agencyId %>"
    title="Predictions for specified route and stop.">
      Prognozy według linii/przystanku</a></li>
  <li><a href="predsByLocApiParams.jsp?a=<%= agencyId %>"
    title="Predictions for stops near specified latitude, longitude for the agency.">
      Prognozy według lokalizacji</a></li>
  <li><a href="tripApiParams.jsp?a=<%= agencyId %>"
    title="Data for a single trip. Includes trip pattern and schedule info.">
      Kurs</a></li>
  <li><a href="tripWithTravelTimesApiParams.jsp?a=<%= agencyId %>"
    title="Data for a single trip. Includes trip pattern and schedule info as well as historic travel times used for generating predictions.">
      Kurs z czasami przejazdu</a></li>
  <li><a href="blocksTerseApiParams.jsp?a=<%= agencyId %>"
    title="Data for a block assignment. Shows each trip that makes up the block in a terse format, without trip pattern or schedule info.">
      Zadanie (grupa zadań)</a></li>
  <li><a href="blocksApiParams.jsp?a=<%= agencyId %>"
    title="Data for a block assignment. Shows each trip that makes up the block in a verbose format, including trip pattern and schedule info.">
      Szczegóły zadania (grupy kursów)</a></li>

  <li><a href="serviceIdsApiParams.jsp?a=<%= agencyId %>"
    title="Data for all service IDs configured for agency.">
      ID usługi</a></li>
  <li><a href="serviceIdsCurrentApiParams.jsp?a=<%= agencyId %>"
    title="Data for service IDs that are currently active for agency.">
      ID usługi bieżącej</a></li>

  <li><a href="calendarsApiParams.jsp?a=<%= agencyId %>"
    title="Data for all calendars configured for agency.">
      Kalendarze</a></li>
  <li><a href="calendarsCurrentApiParams.jsp?a=<%= agencyId %>"
    title="Data for calendars that are currently active for agency.">
      Kalendarze bieżące</a></li>

  <li><a href="gtfsRealtimeTripUpdatesApiParams.jsp?a=<%= agencyId %>"
    title="GTFS-realtime Trip Updates includes prediction data for entire agency">
      GTFS-realtime Trip Updates</a></li>
  <li><a href="gtfsRealtimeVehiclePositionsApiParams.jsp?a=<%= agencyId %>"
    title="GTFS-realtime Vehicle Positions for entire agency">
      GTFS-realtime Vehicle Positions</a></li>

  <li><a href="siriVehicleMonitoringApiParams.jsp?a=<%= agencyId %>"
    title="SIRI Vehicle Monitoring for specified route or entire agency">
      SIRI Vehicle Monitoring</a></li>
  <li><a href="siriStopMonitoringApiParams.jsp?a=<%= agencyId %>"
    title="SIRI Stop Monitoring for specified route and stop">
      SIRI Stop Monitoring</a></li>

  <li><a href="horizStopsScheduleApiParams.jsp?a=<%= agencyId %>"
    title="Rozkład dla linii. przystanki poziomo">
      Rozkład dla linii, przystanki poziomo</a></li>
  <li><a href="vertStopsScheduleApiParams.jsp?a=<%= agencyId %>"
    title="Rozkład dla linii. przystanki pionowo">
      Rozkład dla linii, przystanki pionowo</a></li>
</ul>

<div id="subtitle">Niespecyficzne dla przewoźnika</div>
<ul class="choicesList">
  <li><a href="agenciesApiParams.jsp"
    title="List of all agencies available through the API">
      Przewoźnik</a></li>
  <li><a href="predsByLocForAllAgenciesApiParams.jsp?a=<%= agencyId %>"
    title="Predictions for stops near specified latitude, longitude. Will return predictions for all agencies that have nearby stops.">
      Prognozy według lokalizacji</a></li>
</ul>
</div>
</body>
</html>