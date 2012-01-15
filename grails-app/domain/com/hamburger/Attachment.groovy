package com.hamburger

class Attachment {
	
	String name
	byte[] attachment
	
	static belongsTo = [citizen:Citizen]

    static constraints = {
		name(blank:false)
		attachment(blank:false, maxSize: 1000000)
    }
}
