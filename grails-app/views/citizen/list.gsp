
<%@ page import="com.hamburger.Citizen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'citizen.label', default: 'Citizen')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'citizen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="passportNo" title="${message(code: 'citizen.passportNo.label', default: 'Passport No')}" />
                        
                            <g:sortableColumn property="passportType" title="${message(code: 'citizen.passportType.label', default: 'Passport Type')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'citizen.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'citizen.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="placeOfBirth" title="${message(code: 'citizen.placeOfBirth.label', default: 'Place Of Birth')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${citizenInstanceList}" status="i" var="citizenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${citizenInstance.id}">${fieldValue(bean: citizenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "passportNo")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "passportType")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "placeOfBirth")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${citizenInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
