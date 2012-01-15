package com.hamburger.enumType

enum CitizenshipStatus implements org.springframework.context.MessageSourceResolvable { 
	
	ACTIVE, INACTIVE
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}

