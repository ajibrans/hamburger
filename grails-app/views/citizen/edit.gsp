

<%@ page import="com.hamburger.Citizen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'citizen.label', default: 'Citizen')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${citizenInstance}">
            <div class="errors">
                <g:renderErrors bean="${citizenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${citizenInstance?.id}" />
                <g:hiddenField name="version" value="${citizenInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passportNo"><g:message code="citizen.passportNo.label" default="Passport No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'passportNo', 'errors')}">
                                    <g:textField name="passportNo" value="${citizenInstance?.passportNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passportType"><g:message code="citizen.passportType.label" default="Passport Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'passportType', 'errors')}">
                                    <g:select name="passportType" from="${com.hamburger.enumType.PassportType?.values()}" keys="${com.hamburger.enumType.PassportType?.values()*.name()}" value="${citizenInstance?.passportType?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="citizen.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${citizenInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="citizen.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${citizenInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="placeOfBirth"><g:message code="citizen.placeOfBirth.label" default="Place Of Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'placeOfBirth', 'errors')}">
                                    <g:textField name="placeOfBirth" value="${citizenInstance?.placeOfBirth}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateOfBirth"><g:message code="citizen.dateOfBirth.label" default="Date Of Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'dateOfBirth', 'errors')}">
                                    <richui:dateChooser name="dateOfBirth" format="${message(code:'default.date.format')}" value="${citizenInstance?.dateOfBirth}" navigator="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="maritalStatus"><g:message code="citizen.maritalStatus.label" default="Marital Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'maritalStatus', 'errors')}">
                                    <g:select name="maritalStatus" from="${com.hamburger.enumType.MaritalStatus?.values()}" keys="${com.hamburger.enumType.MaritalStatus?.values()*.name()}" value="${citizenInstance?.maritalStatus?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sex"><g:message code="citizen.sex.label" default="Sex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'sex', 'errors')}">
                                    <g:select name="sex" from="${com.hamburger.enumType.Sex?.values()}" keys="${com.hamburger.enumType.Sex?.values()*.name()}" value="${citizenInstance?.sex?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="religion"><g:message code="citizen.religion.label" default="Religion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'religion', 'errors')}">
                                    <g:select name="religion" from="${com.hamburger.enumType.Religion?.values()}" keys="${com.hamburger.enumType.Religion?.values()*.name()}" value="${citizenInstance?.religion?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="citizen.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${citizenInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="portrait"><g:message code="citizen.portrait.label" default="Portrait" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'portrait', 'errors')}">
                                    <input type="file" id="portrait" name="portrait" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="citizen.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${citizenInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postCode"><g:message code="citizen.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'postCode', 'errors')}">
                                    <g:textField name="postCode" value="${citizenInstance?.postCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="citizen.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${citizenInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phoneNo"><g:message code="citizen.phoneNo.label" default="Phone No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'phoneNo', 'errors')}">
                                    <g:textField name="phoneNo" value="${citizenInstance?.phoneNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="occupation"><g:message code="citizen.occupation.label" default="Occupation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'occupation', 'errors')}">
                                    <g:textField name="occupation" value="${citizenInstance?.occupation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addressInIndonesia"><g:message code="citizen.addressInIndonesia.label" default="Address In Indonesia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'addressInIndonesia', 'errors')}">
                                    <g:textArea name="addressInIndonesia" cols="40" rows="5" value="${citizenInstance?.addressInIndonesia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phoneNoInIndonesia"><g:message code="citizen.phoneNoInIndonesia.label" default="Phone No In Indonesia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'phoneNoInIndonesia', 'errors')}">
                                    <g:textField name="phoneNoInIndonesia" value="${citizenInstance?.phoneNoInIndonesia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nameOfSpouse"><g:message code="citizen.nameOfSpouse.label" default="Name Of Spouse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'nameOfSpouse', 'errors')}">
                                    <g:textField name="nameOfSpouse" value="${citizenInstance?.nameOfSpouse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="citizenshipOfSpouse"><g:message code="citizen.citizenshipOfSpouse.label" default="Citizenship Of Spouse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'citizenshipOfSpouse', 'errors')}">
                                    <g:textField name="citizenshipOfSpouse" value="${citizenInstance?.citizenshipOfSpouse}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passportIssuingOffice"><g:message code="citizen.passportIssuingOffice.label" default="Passport Issuing Office" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'passportIssuingOffice', 'errors')}">
                                    <g:textField name="passportIssuingOffice" value="${citizenInstance?.passportIssuingOffice}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passportIssuingDate"><g:message code="citizen.passportIssuingDate.label" default="Passport Issuing Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'passportIssuingDate', 'errors')}">
                                    <richui:dateChooser name="passportIssuingDate" format="${message(code:'default.date.format')}" value="${citizenInstance?.passportIssuingDate}" navigator="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passportExpiryDate"><g:message code="citizen.passportExpiryDate.label" default="Passport Expiry Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'passportExpiryDate', 'errors')}">
                                    <richui:dateChooser name="passportExpiryDate" format="${message(code:'default.date.format')}" value="${citizenInstance?.passportExpiryDate}" navigator="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registrationDate"><g:message code="citizen.registrationDate.label" default="Registration Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'registrationDate', 'errors')}">
                                    <richui:dateChooser name="registrationDate" format="${message(code:'default.date.format')}" value="${citizenInstance?.registrationDate}" navigator="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registrationNo"><g:message code="citizen.registrationNo.label" default="Registration No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'registrationNo', 'errors')}">
                                    <g:textField name="registrationNo" value="${citizenInstance?.registrationNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residencePermitType"><g:message code="citizen.residencePermitType.label" default="Residence Permit Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'residencePermitType', 'errors')}">
                                    <g:select name="residencePermitType" from="${com.hamburger.enumType.ResidencePermitType?.values()}" keys="${com.hamburger.enumType.ResidencePermitType?.values()*.name()}" value="${citizenInstance?.residencePermitType?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="residencePermitExpiryDate"><g:message code="citizen.residencePermitExpiryDate.label" default="Residence Permit Expiry Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'residencePermitExpiryDate', 'errors')}">
                                    <richui:dateChooser name="residencePermitExpiryDate" format="${message(code:'default.date.format')}" value="${citizenInstance?.residencePermitExpiryDate}" navigator="true" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="citizenshipStatus"><g:message code="citizen.citizenshipStatus.label" default="Citizenship Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'citizenshipStatus', 'errors')}">
                                    <g:select name="citizenshipStatus" from="${com.hamburger.enumType.CitizenshipStatus?.values()}" keys="${com.hamburger.enumType.CitizenshipStatus?.values()*.name()}" value="${citizenInstance?.citizenshipStatus?.name()}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="remarkOfCitizenshipStatus"><g:message code="citizen.remarkOfCitizenshipStatus.label" default="Remark Of Citizenship Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'remarkOfCitizenshipStatus', 'errors')}">
                                    <g:textArea name="remarkOfCitizenshipStatus" cols="40" rows="5" value="${citizenInstance?.remarkOfCitizenshipStatus}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="attachments"><g:message code="citizen.attachments.label" default="Attachments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: citizenInstance, field: 'attachments', 'errors')}">
                                    
<ul>
<g:each in="${citizenInstance?.attachments?}" var="a">
    <li><g:link controller="attachment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="attachment" action="create" params="['citizen.id': citizenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attachment.label', default: 'Attachment')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
