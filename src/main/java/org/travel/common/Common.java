package org.travel.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;

import org.travel.base.Message;

public class Common {
	public static Boolean isNullOrEmpty(Object object) {
		if (object == null) {
			return true;
		}
		if (object instanceof String) {
			String s = (String) object;
			if (s.length() == 0) {
				return true;
			}
		}
		return false;
	}

	public static Message createMessage(String message, String notifycation, int statusCode, HttpServletResponse resp) {
		Message messages = new Message(notifycation, message);
		resp.setStatus(statusCode);
		return messages;
	}

	public static Date convertStringToDate(String date) {
		try {
			if (!Common.isNullOrEmpty(date)) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd-yyyy");
				return simpleDateFormat.parse(date);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			return null;
		}
		return null;
	}

	public static String convertDateToString(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
		String strDate = dateFormat.format(date);
		return strDate;
	}
}
