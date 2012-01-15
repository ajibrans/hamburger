package com.hamburger

import com.hamburger.enumType.Religion;
import com.hamburger.enumType.Sex;
import com.hamburger.enumType.MaritalStatus;
import com.hamburger.enumType.CitizenshipStatus;
import com.hamburger.enumType.PassportType
import com.hamburger.enumType.ResidencePermitType;

class Citizen {
	
	String passportNo
	PassportType passportType
	String firstName
	String lastName
	String placeOfBirth
	Date dateOfBirth
	MaritalStatus maritalStatus
	Sex sex
	Religion religion
	String email
	byte[] portrait	
	String address
	String postCode
	String city
	String phoneNo
	String occupation
	String addressInIndonesia
	String phoneNoInIndonesia
	String nameOfSpouse
	String citizenshipOfSpouse
	
	String passportIssuingOffice
	Date passportIssuingDate
	Date passportExpiryDate
	Date registrationDate
	String registrationNo
	ResidencePermitType residencePermitType
	Date residencePermitExpiryDate
	CitizenshipStatus citizenshipStatus
	String remarkOfCitizenshipStatus
	
	byte[] attachment1
	byte[] attachment2
	byte[] attachment3
	byte[] attachment4
	byte[] attachment5
	byte[] attachment6
	
	Date dateCreated
	Date lastUpdated 
	
	static hasMany = [attachments: Attachment]
	
    static constraints = {
		passportNo(blank:false)
		/**
		 * nullable is set to true -> grails template will add blank select option for each optional property (e.g., nullable is true)
		 * custom validator is added to prevent blank/null value
		 */
		passportType(nullable:true 
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		firstName(blank:false)
		lastName(blank:false)
		placeOfBirth(blank:false)
		dateOfBirth(blank:false)
		/**
		 * nullable is set to true -> grails template will add blank select option for each optional property (e.g., nullable is true)
		 * custom validator is added to prevent blank/null value
		 */
		maritalStatus(nullable:true 
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		sex(nullable:true
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		religion(nullable:true
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		email(nullable: true, email:true)
		portrait(nullable: true, maxSize: 1000000)
		address(blank:false)
		postCode(blank:false)
		city(blank:false)
		phoneNo(nullable:true)
		occupation(nullable:true)
		addressInIndonesia(widget:'textarea', nullable:true)
		phoneNoInIndonesia(nullable:true)
		nameOfSpouse(nullable:true)
		citizenshipOfSpouse(nullable:true)
		
		passportIssuingOffice(blank:false)
		passportIssuingDate(blank:false)
		passportExpiryDate(blank:false)
		registrationDate(blank:false)
		registrationNo(blank:false)
		/**
		 * nullable is set to true -> grails template will add blank select option for each optional property (e.g., nullable is true)
		 * custom validator is added to prevent blank/null value
		 */
		residencePermitType(nullable:true
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		/**
		 * it's mandatory when residencePermitType is BEFRISTET
		 */
		residencePermitExpiryDate(nullable:true
			,validator: { value, citizen ->
				if (ResidencePermitType.BEFRISTET == citizen.residencePermitType && !value) {
					return ['default.blank.message']
				}
			})
		/**
		 * nullable is set to true -> grails template will add blank select option for each optional property (e.g., nullable is true)
		 * custom validator is added to prevent blank/null value
		 */
		citizenshipStatus(nullable:true
			,validator: { value, citizen ->
				if (!value) {
					return ['default.blank.message']
				}
			})
		/**
		 * it's mandatory when citizenshipStatus is INACTIVE
		 */
		remarkOfCitizenshipStatus(widget:'textarea', 
				validator: { value, citizen ->
				if (CitizenshipStatus.INACTIVE == citizen.citizenshipStatus) {
					return ['default.blank.message']
				}
			})
		attachment1()
		attachment2()
		attachment3()
		attachment4()
	}
	
	String toString() {
		return "$firstName $lastName"
	}
}
