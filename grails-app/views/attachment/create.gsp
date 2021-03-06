

<%@ page import="com.hamburger.Attachment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${attachmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${attachmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="attachment.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attachmentInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${attachmentInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="attachment"><g:message code="attachment.attachment.label" default="Attachment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attachmentInstance, field: 'attachment', 'errors')}">
                                    <input type="file" id="attachment" name="attachment" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="citizen"><g:message code="attachment.citizen.label" default="Citizen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: attachmentInstance, field: 'citizen', 'errors')}">
                                    <g:select name="citizen.id" from="${com.hamburger.Citizen.list()}" optionKey="id" value="${attachmentInstance?.citizen?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
