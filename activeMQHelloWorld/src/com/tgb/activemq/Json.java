package com.tgb.activemq;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.JSONUtils;

public class Json {
	public static void main(String args[]) throws ParseException{
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX");
		String b = "2012-06-05T00:00:00+00:00";
		d = df.parse(b);
		System.out.println(df.format(d));
		
	    JsonConfig jsonConfig = new JsonConfig();  
	    jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd'T'HH:mm:ssXXX"));  
		
		try {
			String jsonString = "{\"id\":\"123\", \"text\":\"scsdcs\", \"list\":\'[{\"name\":\"11\"},{\"name\":\"22\"}]\'}";
			JSONObject jsonObject = JSONObject.fromObject(jsonString); 
			
//			String[] dateFormats = new String[] {"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ssXXX"}; 
//			JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(dateFormats));
			
			A a = (A) JSONObject.toBean(jsonObject, A.class);
			
			//a.setTime(df.parse(jsonObject.getString("time")));
			System.out.println(a.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}

