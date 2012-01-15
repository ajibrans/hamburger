import com.hamburger.Role

import com.hamburger.User
import com.hamburger.UserRole
import com.hamburger.Person
import com.hamburger.Citizen
import com.hamburger.importer.ExcelImporter

class BootStrap {
	def springSecurityService

    def init = { servletContext ->
		
//		def userRole = getOrCreateRole("ROLE_USER")
//		def adminRole = getOrCreateRole("ROLE_ADMIN")
//		
//		def ajibrans = User.findByUsername("ajibrans")
//		
//		println "ajibrans: " + ajibrans
//		
//		if (!ajibrans) {
//			ajibrans = new Person (
//				//firstName: "Ayatullah Jibran",
//				//lastName: "Shidqie",
//				username: "ajibrans",
//				//password: springSecurityService.encodePassword("password"),
//				password: "password",
//				enabled: true)
//				if (ajibrans.save()) {
//					println "save succeed"
//				} else {
//					println "save failed"
//					ajibrans.errors.each {err ->
//						println err
//					}
//				}
//				
//				UserRole.create ajibrans, adminRole
//		}
//		
//		//String fileName = "c:\\dev\\HEAD\\plugins\\excel-import\\test\\projects\\sample\\test-data\\books.xls"
//		String fileName = /.\data\test database bremen_updated_full.xls/
//		ExcelImporter importer = new ExcelImporter(fileName);
//	
//		def citizensMapList = importer.getCitizens();
//		println "size: " + citizensMapList.size()
//	
//		def row = 1
//		def dateProps = ['dateOfBirth', 'dateOfResidencePermit', 'registrationDate', 'dateOfIssue', 'dateOfExpiry']
//		citizensMapList.each { Map citizenParams ->
//		 
//			println "row: " + row
//			citizenParams.each { key, value ->
//				if (key in dateProps) {
//					println "key: " + key + " value: |" + value + "|"
//					
//					citizenParams[key] = value?.toDate()
//				}		
//			}
//			
//			if (citizenParams.postCode) {
//				citizenParams.postCode = Integer.toString(citizenParams.postCode.intValue())
//			}
//			
////			citizenParams.each { key, value ->				
////				println "[" + key + ":" + value + "] " + value?.class
////			}
//			
////			citizenParams.residencePermitType = Enum.valueOf(com.hamburger.ResidencePermitType.class, citizenParams.residencePermitType);
////			citizenParams.religion = Enum.valueOf(com.hamburger.CitizenReligion.class, citizenParams.religion);
////			citizenParams.status = Enum.valueOf(com.hamburger.CitizenStatus.class, citizenParams.status);
////			citizenParams.sex = Enum.valueOf(com.hamburger.CitizenSex.class, citizenParams.sex);
////			citizenParams.citizenshipStatus = Enum.valueOf(com.hamburger.CitizenshipStatus.class, citizenParams.citizenshipStatus);
////			 
//			def newCitizen = new Citizen(citizenParams)			
//			if (!newCitizen.save()) {
//				println "Citizen not saved, errors = ${newCitizen.errors}"
//			}
//			
//			row++
//		}		
    }
	
    def destroy = {
    }
	
	private getOrCreateRole(name) {
		def role = Role.findByAuthority(name)
		if (!role) role = new Role(authority: name).save()
		if (!role)  println "Unable to save role ${name}"
		return role
	}
}
