package com.sjdang.util.enums;


public enum ExampleEnum {
	
	MAN_JIAN("1", "MANJIAN", ""),
	XIAN_SHI("2", "XIANSHI", "");
	
	private String type;
	private String code;
	private String name;
	
	public String getType() {
		return type;
	}
	public String getCode() {
		return code;
	}
	public String getName() {
		return name;
	}

	private ExampleEnum(String type, String code, String name) {
		this.type = type;
		this.code = code;
		this.name = name;
	}
	
	public static String getNameByType(String type) {
		for(ExampleEnum activity : ExampleEnum.values()) {
			if(activity.getType().equals(type)) {
				return activity.getName();
			}
		}
		return null;
	}
	
	public static String getCodeByType(String type) {
		for(ExampleEnum activity : ExampleEnum.values()) {
			if(activity.getType().equals(type)) {
				return activity.getCode();
			}
		}
		return null;
	}
	
	
}
