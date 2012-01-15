package com.hamburger

class CitizenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [citizenInstanceList: Citizen.list(params), citizenInstanceTotal: Citizen.count()]
    }

    def create = {
        def citizenInstance = new Citizen()
        citizenInstance.properties = params
        return [citizenInstance: citizenInstance]
    }

    def save = {
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.passportType && (params.passportType == '' || params.passportType == 'null')) {
			params.passportType = null
		}
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.maritalStatus && (params.maritalStatus == '' || params.maritalStatus == 'null')) {
			params.maritalStatus = null
		}
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.sex && (params.sex == '' || params.sex == 'null')) {
			params.sex = null
		}
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.religion && (params.religion == '' || params.religion == 'null')) {
			params.religion = null
		}
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.residencePermitType && (params.residencePermitType == '' || params.residencePermitType == 'null')) {
			params.residencePermitType = null
		}
	
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.citizenshipStatus && (params.citizenshipStatus == '' || params.citizenshipStatus == 'null')) {
			params.citizenshipStatus = null
		}
	
        def citizenInstance = new Citizen(params)
        if (citizenInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'citizen.label', default: 'Citizen'), citizenInstance.id])}"
            redirect(action: "show", id: citizenInstance.id)
        }
        else {
            render(view: "create", model: [citizenInstance: citizenInstance])
        }
    }

    def show = {
        def citizenInstance = Citizen.get(params.id)
        if (!citizenInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
            redirect(action: "list")
        }
        else {
            [citizenInstance: citizenInstance]
        }
    }

    def edit = {
        def citizenInstance = Citizen.get(params.id)
        if (!citizenInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [citizenInstance: citizenInstance]
        }
    }

    def update = {
        def citizenInstance = Citizen.get(params.id)
        if (citizenInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (citizenInstance.version > version) {
                    
                    citizenInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'citizen.label', default: 'Citizen')] as Object[], "Another user has updated this Citizen while you were editing")
                    render(view: "edit", model: [citizenInstance: citizenInstance])
                    return
                }
            }
			// custom - list of excludes of bindData() if necessary
			def excludes = []
		
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.passportType && (params.passportType == '' || params.passportType == 'null')) {
				params.passportType = null
			}
			
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.maritalStatus && (params.maritalStatus == '' || params.maritalStatus == 'null')) {
				params.maritalStatus = null
			}
			
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.sex && (params.sex == '' || params.sex == 'null')) {
				params.sex = null
			}
			
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.religion && (params.religion == '' || params.religion == 'null')) {
				params.religion = null
			}
			
			// custom - remove the property from param keys when it is type of byte[] and it's null (empty)
			if (params.portrait?.isEmpty()) {
				excludes.add("portrait")
			}
		
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.residencePermitType && (params.residencePermitType == '' || params.residencePermitType == 'null')) {
				params.residencePermitType = null
			}
			
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.citizenshipStatus && (params.citizenshipStatus == '' || params.citizenshipStatus == 'null')) {
				params.citizenshipStatus = null
			}
			
			// custom - explicitly invoke bindData which has the possibility to exclude properties if necessary (e.g., for uploaded file property)
            //citizenInstance.properties = params
			bindData(citizenInstance, params, [exclude:excludes])
            if (!citizenInstance.hasErrors() && citizenInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'citizen.label', default: 'Citizen'), citizenInstance.id])}"
                redirect(action: "show", id: citizenInstance.id)
            }
            else {
                render(view: "edit", model: [citizenInstance: citizenInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def citizenInstance = Citizen.get(params.id)
        if (citizenInstance) {
            try {
                citizenInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'citizen.label', default: 'Citizen'), params.id])}"
            redirect(action: "list")
        }
    }
}
