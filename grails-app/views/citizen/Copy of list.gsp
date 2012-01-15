
<%@ page import="com.hamburger.Citizen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'citizen.label', default: 'Citizen')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <!-- custom - filterpane plugin -->
        <g:javascript library="prototype" />
        <g:javascript library="scriptaculous" />
        <filterpane:includes />
        <!-- end custom - filterpane plugin -->
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
            <!-- custom - filterpane plugin -->
            <filterpane:currentCriteria domainBean="com.hamburger.Citizen" dateFormat="dd.MM.yyyy"
                removeImgDir="images" removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no" />
               <!-- end custom - filterpane plugin -->
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'citizen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="passportNo" title="${message(code: 'citizen.passportNo.label', default: 'Passport No')}" />
                        
                            <g:sortableColumn property="portrait" title="${message(code: 'citizen.portrait.label', default: 'Portrait')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'citizen.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'citizen.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'citizen.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${citizenInstanceList}" status="i" var="citizenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${citizenInstance.id}">${fieldValue(bean: citizenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "passportNo")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "portrait")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: citizenInstance, field: "email")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
            	<!-- custom - filterpane plugin -->
                <filterpane:paginate total="${citizenInstanceTotal}" domainBean="com.hamburger.Citizen" />
                <filterpane:filterButton text="Filter Me" appliedText="Change Filter" />
                <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
                <!-- end custom - filterpane plugin -->
            </div>
            <!-- custom - filterpane plugin -->
            <filterpane:filterPane domain="com.hamburger.Citizen" 
            						titleKey="fp.tag.filterPane.titleText"
                                   dialog="true"
                                   visible="n"
                                   filterPropertyValues="${[dateOfBirth:[precision:'day'], dateOfResidencePermit:[precision:'day'],
									   						registrationDate:[precision:'day'], dateOfIssue:[precision:'day'],
									   						dateOfExpiry:[precision:'day']]}"
                                   showSortPanel="n"
                                   showTitle="n" />
            <!-- end custom - filterpane plugin -->
        </div>
    </body>
</html>
