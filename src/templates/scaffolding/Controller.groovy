<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
    }

    def create = {
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return [${propertyName}: ${propertyName}]
    }

    def save = {
	<%
	// custom - convert blank params to null when the corresponding property is type of Enum
	persistentPropNames = domainClass.persistentProperties*.name
	props = domainClass.properties.findAll { persistentPropNames.contains(it.name)}
	Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
	props.each { p ->
		if (p.isEnum() && p.optional) { %>
		// custom - convert blank params to null when the corresponding property is type of Enum
		if (params.${p.name} && (params.${p.name} == '' || params.${p.name} == 'null')) {
			params.${p.name} = null
		}
	<%}}
	// end custom
	%>
        def ${propertyName} = new ${className}(params)
        if (${propertyName}.save(flush: true)) {
            flash.message = "\${message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
            redirect(action: "show", id: ${propertyName}.id)
        }
        else {
            render(view: "create", model: [${propertyName}: ${propertyName}])
        }
    }

    def show = {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            [${propertyName}: ${propertyName}]
        }
    }

    def edit = {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [${propertyName}: ${propertyName}]
        }
    }

    def update = {
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            if (params.version) {
                def version = params.version.toLong()
                if (${propertyName}.version > version) {
                    <% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
                    ${propertyName}.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[], "Another user has updated this ${className} while you were editing")
                    render(view: "edit", model: [${propertyName}: ${propertyName}])
                    return
                }
            }
			// custom - list of excludes of bindData() if necessary
			def excludes = []
		<%
		
		// custom - convert blank params to null when the corresponding property is type of Enum
		persistentPropNames = domainClass.persistentProperties*.name
		props = domainClass.properties.findAll { persistentPropNames.contains(it.name)}
		Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
		props.each { p ->
			if (p.isEnum() && p.optional) { %>
			// custom - convert blank params to null when the corresponding property is type of Enum
			if (params.${p.name} && (params.${p.name} == '' || params.${p.name} == 'null')) {
				params.${p.name} = null
			}
			<%} else if (p.type == ([] as byte[]).class) { %>
			// custom - remove the property from param keys when it is type of byte[] and it's null (empty)
			if (params.${p.name}?.isEmpty()) {
				excludes.add("${p.name}")
			}
		<%}}
		// end custom
		%>
			// custom - explicitly invoke bindData which has the possibility to exclude properties if necessary (e.g., for uploaded file property)
            //${propertyName}.properties = params
			bindData(${propertyName}, params, [exclude:excludes])
            if (!${propertyName}.hasErrors() && ${propertyName}.save(flush: true)) {
                flash.message = "\${message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])}"
                redirect(action: "show", id: ${propertyName}.id)
            }
            else {
                render(view: "edit", model: [${propertyName}: ${propertyName}])
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ${propertyName} = ${className}.get(params.id)
        if (${propertyName}) {
            try {
                ${propertyName}.delete(flush: true)
                flash.message = "\${message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "\${message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "\${message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])}"
            redirect(action: "list")
        }
    }
}
