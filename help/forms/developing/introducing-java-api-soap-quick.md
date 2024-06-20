---
title: Introducing Java&trade; API QuickStart
description: Learn how AEM Forms operations can be performed using the AEM Forms Java&trade; strongly typed API enabled with SOAP connection.

contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop, development-tools

role: Developer
exl-id: 1d4062ef-fb24-4527-b899-896ce757beda
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Introducing Java&trade; API Quick Start {#introducing-java-api-quickstart} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

Adobe AEM Forms API Quick Start can help you accelerate your efforts to develop programs that interact with AEM Forms services. *Quick Start*s are complete programs that you can copy and paste into your own projects and use as a starting point. You can run a Quick Start to see how it behaves and modify it for your own needs.

AEM Forms operations can be performed using the AEM Forms strongly typed API and the connection mode should be set to SOAP.

Java&trade; strongly typed API Quick Start provides a listing of JAR files that are required to execute the Java&trade; application. Most Java&trade; Quick Starts are console applications that run within `main`. However, the Forms Java&trade; strongly typed API Quick Start is implemented as a Java&trade; servlet that runs within a web application.

The JAR file listing is in a comment section at the beginning of the Quick Start. For example, the following comment is in an Output quick start and is a typical JAR file listing found in each Java&trade; Quick Start.

```java
 /*
     * This Java Quick Start uses the SOAP mode and contains the following JAR files
     * in the class path:
     * 1. adobe-output-client.jar
     * 2. adobe--client.jar
     * 3. adobe-usermanager-client.jar
     *
     * These JAR files are in the following path:
     * <install directory>/Adobe/Adobe_Experience_Manager_forms/SDK/client-libs/common
     *
     * The adobe-utilities.jar file is in the following path:
     * <install directory>/Adobe/Adobe_Experience_Manager_forms/SDK/client-libs/jboss
     *
     * The jboss-client.jar file is in the following path:
     * <install directory>/Adobe/Adobe_Experience_Manager_forms/jboss/bin/client
     *
     * If you want to invoke a remote AEM Forms instance and there is a
     * firewall between the client application and AEM Forms, then it is
     * recommended that you use the SOAP mode. When using the SOAP mode,
     * you have to include additional JAR files in the following
     * path
     * <install directory>/Adobe/Adobe_Experience_Manager_forms/SDK/client-libs/thirdparty
     *
     * For information about the SOAP
     * mode and the additional JAR files that need to be included,
     * see "Setting connection properties" in Programming
     * with AEM Forms
     *
     * For complete details about the location of the AEM Forms JAR files,
     * see "Including AEM Forms library files" in Programming
     * with AEM Forms
     */
```

## Multiple Services Quick Start {#multiple-services-quick-start}

Most Quick Starts in *Programming with AEM Forms on JEE* invoke a specific service to perform an operation. However, some Quick Starts invoke multiple AEM Forms services to perform a given workflow. The following list provides Java&trade; quick starts that invoke more than one AEM Forms service:

[Quick Start (SOAP mode): Passing a document in the AEM Forms Repository to the Output service using the Java&trade; API](/help/forms/developing/output-service-java-api-quick.md#quick-start-soap-mode-passing-a-document-located-in-the-repository-to-the-output-service-using-the-java-api) (invokes the Repository and Output service)

[Quick Start (SOAP mode): Creating a PDF document based on fragments using the Java&trade; API](/help/forms/developing/output-service-java-api-quick.md#quick-start-soap-mode-creating-a-pdf-document-based-on-fragments-using-the-java-api) (invokes the Assembler and Output service)

[Quick Start (SOAP mode): Creating PDF Documents with submitted XML data using the Java&trade; API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-creating-pdf-documents-with-submitted-xml-data-using-the-java-api) (invokes the Forms, Output, and Document Management service)

[Quick Start (SOAP mode): Passing documents to the Forms Service using the Java&trade; API](/help/forms/developing/forms-service-api-quick-starts.md#quick-start-soap-mode-passing-documents-to-the-forms-service-using-the-java-api) (invokes the Forms and Document Management service)

[Quick Start (SOAP mode): Digitally signing a XFA-based Form using the Java&trade; API](/help/forms/developing/signature-service-java-api-quick.md#quick-start-soap-mode-digitally-signing-a-xfa-based-form-using-the-java-api) (invokes the Forms and Signature service)

[Quick Start (SOAP mode): Managing roles and permissions using the Java&trade; API](/help/forms/developing/user-manager-java-api-quick.md#quick-start-soap-mode-managing-roles-and-permissions-using-the-java-api) (invokes the DirectoryManager and the AuthorizationManager service )

[Quick Start (SOAP mode): Passing documents to the Output Service using the Java&trade; API](/help/forms/developing/output-service-java-api-quick.md#quick-start-soap-mode-passing-documents-to-the-output-service-using-the-java-api) (invoke the Output and Document Management service)

>[!NOTE]
>
>Quick Starts in Programming with AEM Forms are based on AEM Forms being deployed on JBoss&reg; Application Server and the Microsoft&reg; Windows&reg; operating system. However, if you are using another operating system, such as UNIX&reg;, replace Windows-specific paths with paths that are supported by the applicable operating system. Likewise, if you are using another J2EE application server, ensure that you specify valid connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)

>[!NOTE]
>
>Most web service Quick Starts are written in C# and use the .NET framework. However, you can create client application logic that is able to invoke AEM Forms services in any development environment that supports SOAP standards. (See [Invoking AEM Forms Using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services).)
