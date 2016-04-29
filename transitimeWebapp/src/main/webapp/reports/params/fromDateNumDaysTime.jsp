<%-- For specifying a begin date, number of days, begin time, and end time --%> 

<script>
$(function() {
  var calendarIconTooltip = "Popup calendar to select date";
  
  $( "#beginDate" ).datepicker({
	dateFormat: "mm-dd-yy",
    showOtherMonths: true,
    selectOtherMonths: true,
    // Show button for calendar
    buttonImage: "images/calendar.png",
    buttonImageOnly: true,
    showOn: "both",
    // Don't allow going past current date
    maxDate: 0,
    // onClose is for restricting end date to be after start date, 
    // though it is potentially confusing to user
    onClose: function( selectedDate ) {
      // Strangely need to set the title attribute for the icon again
      // so that don't revert back to a "..." tooltip
      // FIXME $(".ui-datepicker-trigger").attr("title", calendarIconTooltip);
    }
  });
  
  // Use a better tooltip than the default "..." for the calendar icon
  $(".ui-datepicker-trigger").attr("title", calendarIconTooltip);
});
</script>

<%
String currentDateStr = org.transitime.utils.Time.dateStr(new java.util.Date());
%>
  
  <div class="param">
    <label for="beginDate">Data początkowa:</label>
    <input type="text" id="beginDate" name="beginDate" 
    	title="Pierwszy dzień zakresu, dla którego chcesz analizować dane. 
    	<br><br> Data początkowa musi być wcześniejsza niż data końcowa." 
    	size="10"
    	value="<%= currentDateStr%>" />
  </div>

  <div class="param">
    <label for=numDays>Liczba dni:</label>
    <select id="numDays" name="numDays" 
    	title="Liczba dni, dla których chcesz analizować dane." >
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
    </select>
  </div>
  
  <div class="param">
    <label for="beginTime">Czas początkowy:</label>
    <input id="beginTime" name="beginTime"
    	title="Opcjonalny czas początkowy, w celu zmniejszenia zapytania. Przydatne, jeśli chcesz na przykład zobaczyć rezultaty dla godzin szczytu. Pozostaw puste, jeśli chcesz zobaczyÄ dane dla całego dnia. 
    		<br/><br/>Format: gg:mm, np. 07:00" 
    	size="3"
    	value="" /> <span class="note">(hh:mm)</span>
  </div>

  <div class="param">
    <label for="endTime">Czas końcowy:</label>
    <input id="endTime" name="endTime" 
    	title="Opcjonalny czas końcowy w celu zmniejszenia zapytania. Przydatne, jeśli chcesz na przykład zobaczyć rezultaty dla godzin szczytu. Pozostaw puste, jeśli chcesz zobaczyć dane dla całego dnia.. 
    		<br/><br/>Format: gg:mm, np. 09:00. 
    		Używaj '23:59' dla północy."
    	size="3"
    	value="" /> <span class="note">(hh:mm)</span>
  </div>