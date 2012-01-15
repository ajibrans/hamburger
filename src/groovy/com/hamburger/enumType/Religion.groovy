package com.hamburger.enumType

enum Religion implements org.springframework.context.MessageSourceResolvable { 
	
	ISLAM, CHRISTIAN, CATHOLIC, BUDHA, HINDU, OTHERS, UNKNOWN
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}
