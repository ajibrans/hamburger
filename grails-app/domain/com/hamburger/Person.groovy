package com.hamburger

class Person extends User {

	Citizen profile
	
    static constraints = {
		profile(nullable: true, unique: true)
    }
	
	public Person() {
		password = "password"
	 }
}
