package org.transitime.avl;

import java.io.InputStream;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONObject;
import org.transitime.avl.PollUrlAvlModule;
import org.transitime.db.structs.AvlReport;
import org.transitime.modules.Module;
import java.io.*;
import java.util.*;
import java.net.URL;
import java.net.URLConnection;
import org.json.JSONTokener;

public class KombusAvlModule extends PollUrlAvlModule {

	private static String avlURL="http://jsonplaceholder.typicode.com/posts/1";
//      private static String avlURL="http://www.rozklady.kiedybus.pl/kombus/dane.json";

        public static String positionsURL="http://iplaner.pl:8081/api/positions/";

        public KombusAvlModule(String agencyId) {
                super(agencyId);
        }

        @Override
        protected String getUrl() {

                return avlURL;
        }

        @Override
        protected ArrayList<AvlReport> processData(InputStream inp) throws Exception {

	ArrayList<AvlReport> avlReports = new ArrayList<AvlReport>();
        String username = "info@goeuropa.eu";
        String password = "g03ur0p4";

URL url = new URL(this.positionsURL);
URLConnection uc = url.openConnection();
String userpass = username + ":" + password;
String basicAuth = "Basic " + javax.xml.bind.DatatypeConverter.printBase64Binary(userpass.getBytes());
uc.setRequestProperty ("Authorization", basicAuth);
InputStream in = uc.getInputStream();

//      InputStream in = new URL(this.devicesURL).openStream();

        Scanner s = new Scanner(in).useDelimiter("\\A");
        String JSON_DATA = s.hasNext() ? s.next() : "";
        System.out.println("JSON DATA: " + JSON_DATA);

//      JSONObject obj = new JSONObject(JSON_DATA);
                                        JSONArray array = (JSONArray) new JSONTokener(JSON_DATA).nextValue();
                for (int i=0; i<array.length(); ++i) {
                                                JSONObject entry = array.getJSONObject(i);
                                                String vehicleId = String.valueOf(entry.getInt("id"));


                                                Double latitude = entry.getDouble("latitude");
                                                Double longitude = entry.getDouble("longitude");
float heading=Float.NaN;
float speed = (float)entry.getDouble("speed");
                                                String time = entry.getString("deviceTime");


                                                        //2016-09-07 17:02:48
						SimpleDateFormat dateformater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

                                                        Date timestamp=dateformater.parse(time.replace( "T" , " " ));
//System.out.println("data:"+vehicleId+ timestamp.getTime()+ latitude+longitude+ heading+ speed);
                                                AvlReport avlReport =
                                                                new AvlReport(vehicleId, timestamp.getTime(), latitude,
                                                                                longitude, heading, speed, "Swarzedz");

                                                //processAvlReport(avlReport);
						avlReports.add(avlReport);
                                                        }
return avlReports;
        }
        /**
         * Just for debugging
         */
        public static void main(String[] args) {
                // Create a WexfordCoachAvlModule for testing
                Module.start("org.transitime.custom.kombus.KombusAvlModule");
        }
}

