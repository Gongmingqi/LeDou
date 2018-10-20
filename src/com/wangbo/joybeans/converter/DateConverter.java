package com.wangbo.joybeans.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 自定义日期转换
 * @author Administrator
 *
 */
public class DateConverter implements Converter<String, Date>{

	/**
	 * 转换放在该方法中
	 */
	@Override
	public Date convert(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
