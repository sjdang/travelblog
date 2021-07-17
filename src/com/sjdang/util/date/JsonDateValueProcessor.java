package com.sjdang.util.date;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * @ClassName: com.sjdang.util.date.JsonDateValueProcessor
 * @Description: TODO(JSON日期时间转换格式定义)
 * @author SJDANG
 * @date 2018年2月17日 下午10:59:36
 * @version V1.0
 */
public class JsonDateValueProcessor implements JsonValueProcessor {
	
	private String format = UtilDate.ZH_Y_M_D_H_M_S;

	public JsonDateValueProcessor() {}

	public JsonDateValueProcessor(String format) {
		this.format = format;
	}
	
	@Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		String[] obj = {};
		if (value instanceof Date[]) {
			SimpleDateFormat sf = new SimpleDateFormat(format);
			Date[] dates = (Date[]) value;
			obj = new String[dates.length];
			for (int i = 0; i < dates.length; i++) {
				obj[i] = sf.format(dates[i]);
			}
		}
		return obj;
	}
	
	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		if (value instanceof Date) {
			String str = new SimpleDateFormat(format).format((Date) value);
			return str;
		}
		return value;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

}
