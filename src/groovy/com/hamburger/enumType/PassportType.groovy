package com.hamburger.enumType

enum PassportType implements org.springframework.context.MessageSourceResolvable { 
	
	GREEN, BLUE, DIPLOMATIC, SPLP_OTHERS
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}
