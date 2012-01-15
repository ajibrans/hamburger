package com.hamburger

class ImageController {
    def imageService
    
    def renderImage = {
		
		def domainClass = grailsApplication.domainClasses.find{it.name == params.domain}?.clazz
		if (!domainClass) log.error("domain class $params.domain not found")
		
		def obj = domainClass?.get(params.id)
		if (!obj) log.error("$params.domain instance with id $params.id not found")
		
		try {
			def prop = obj?.getProperty(params.property)	
			response.contentLength = prop.length
			response.outputStream.write(prop)
		} catch (e) {
			log.error(e.message)
			response.sendError(404)
		}
    }

    def tiny = {
        if (params.id) {
            def image = imageService.getUserTinyThumbnail(params.id)
            response.contentLength = image.length
            response.outputStream.write(image)
        }
        else {
            response.sendError(404)
        }

    }
	
	def getPdfFile = {
		
		def domainClass = grailsApplication.domainClasses.find{it.name == params.domain}?.clazz
		if (!domainClass) log.error("domain class $params.domain not found")
		
		def obj = domainClass?.get(params.id)
		if (!obj) log.error("$params.domain instance with id $params.id not found")
		
		try {
			def prop = obj?.getProperty(params.property)
		
			def fileName = obj?.getProperty("name") ? obj.getProperty("name") : "pdfFile" 
			log.debug("setting the output stream, file name $fileName")
	
			response.setHeader("Content-disposition", "attachment; filename=\"$fileName\"");
			response.setContentType("application/pdf")
			OutputStream out = response.getOutputStream()
			out << prop
		} catch (e) {
			log.error(e.message)
			response.sendError(404)
		}
		
	}
}
