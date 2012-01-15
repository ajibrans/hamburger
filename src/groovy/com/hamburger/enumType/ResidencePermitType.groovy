package com.hamburger.enumType

enum ResidencePermitType implements org.springframework.context.MessageSourceResolvable { 
	
	BEFRISTET, UNBEFRISTET, NIEDERLASSUNG, UNKNOWN, DUAL_CITIZENSHIP
	
	Object[] getArguments() { [] as Object[] }
	
	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}
	
	String getDefaultMessage() { name() }
}
