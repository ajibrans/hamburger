package com.hamburger.enumType

enum Sex implements org.springframework.context.MessageSourceResolvable { 
	
	MALE, FEMALE
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}
