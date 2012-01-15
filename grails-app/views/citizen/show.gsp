
<%@ page import="com.hamburger.Citizen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'citizen.label', default: 'Citizen')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "id")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.passportNo.label" default="Passport No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "passportNo")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.passportType.label" default="Passport Type" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.PassportType.${citizenInstance?.passportType}" default="${citizenInstance?.passportType?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.firstName.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "firstName")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.lastName.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "lastName")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.placeOfBirth.label" default="Place Of Birth" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "placeOfBirth")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.dateOfBirth.label" default="Date Of Birth" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.dateOfBirth}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.maritalStatus.label" default="Marital Status" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.MaritalStatus.${citizenInstance?.maritalStatus}" default="${citizenInstance?.maritalStatus?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.sex.label" default="Sex" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.Sex.${citizenInstance?.sex}" default="${citizenInstance?.sex?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.religion.label" default="Religion" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.Religion.${citizenInstance?.religion}" default="${citizenInstance?.religion?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "email")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.portrait.label" default="Portrait" /></td>
                            
							<td><img src="${createLink(controller: 'image', action: 'renderImage', id: citizenInstance.id, params:['property':'portrait', 'domain':'Citizen'])}"/></td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "address")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.postCode.label" default="Post Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "postCode")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "city")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.phoneNo.label" default="Phone No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "phoneNo")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.occupation.label" default="Occupation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "occupation")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.addressInIndonesia.label" default="Address In Indonesia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "addressInIndonesia")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.phoneNoInIndonesia.label" default="Phone No In Indonesia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "phoneNoInIndonesia")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.nameOfSpouse.label" default="Name Of Spouse" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "nameOfSpouse")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.citizenshipOfSpouse.label" default="Citizenship Of Spouse" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "citizenshipOfSpouse")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.passportIssuingOffice.label" default="Passport Issuing Office" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "passportIssuingOffice")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.passportIssuingDate.label" default="Passport Issuing Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.passportIssuingDate}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.passportExpiryDate.label" default="Passport Expiry Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.passportExpiryDate}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.registrationDate.label" default="Registration Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.registrationDate}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.registrationNo.label" default="Registration No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "registrationNo")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.residencePermitType.label" default="Residence Permit Type" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.ResidencePermitType.${citizenInstance?.residencePermitType}" default="${citizenInstance?.residencePermitType?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.residencePermitExpiryDate.label" default="Residence Permit Expiry Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.residencePermitExpiryDate}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.citizenshipStatus.label" default="Citizenship Status" /></td>
                            
							<td valign="top" class="value"><g:message code="com.hamburger.enumType.CitizenshipStatus.${citizenInstance?.citizenshipStatus}" default="${citizenInstance?.citizenshipStatus?.encodeAsHTML()}" /></td>
								
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.remarkOfCitizenshipStatus.label" default="Remark Of Citizenship Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: citizenInstance, field: "remarkOfCitizenshipStatus")}</td>
							
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.attachments.label" default="Attachments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${citizenInstance.attachments}" var="a">
                                    <li><g:link controller="attachment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.dateCreated}" /></td>
                            
						</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="citizen.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${citizenInstance?.lastUpdated}" /></td>
                            
						</tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${citizenInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
