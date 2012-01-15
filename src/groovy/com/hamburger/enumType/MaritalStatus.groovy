package com.hamburger.enumType

enum MaritalStatus implements org.springframework.context.MessageSourceResolvable { 
	
	SINGLE, MARRIED, DIVORCED, UNKNOWN
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}
