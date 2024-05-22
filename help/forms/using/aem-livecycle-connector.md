---
title: Connecting AEM Forms with Adobe LiveCycle
description: Adobe Experience Manager (AEM) LiveCycle connector lets you start LiveCycle ES4 Acrobat Services from within AEM apps and workflows.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
role: Admin,User
exl-id: 562f8a22-cbab-4915-bc0d-da9bea7d18fa
solution: Experience Manager, Experience Manager Forms
feature: Interactive Communication
---
# Connecting AEM Forms with Adobe LiveCycle {#connecting-aem-forms-with-adobe-livecycle}

Adobe Experience Manager (AEM) LiveCycle connector enables seamless invocation of Adobe LiveCycle ES4 Acrobat Services from within AEM web apps and workflows. LiveCycle provides a rich client SDK, which allows client applications to start LiveCycle services using Java&trade; APIs. AEM LiveCycle Connector simplifies using these APIs within the OSGi environment.

## Connecting AEM server to Adobe LiveCycle {#connecting-aem-server-to-adobe-livecycle}

AEM LiveCycle Connector is part of the [AEM Forms add-on package](/help/forms/using/installing-configuring-aem-forms-osgi.md). After installing the AEM Forms add-on package, do the following steps so you can add details of the LiveCycle server to the AEM Web Console.

1. In the AEM web console configuration manager, locate the Adobe LiveCycle Client SDK configuration component.
1. Click the component so you can edit the configuration server URL, user name, and password.
1. Review the settings and click **Save**.

Although the properties are self-explanatory, the important ones are as follows:

* **Server URL** - Specifies URL to the LiveCycle server. If you want LiveCycle and AEM to communicate over https, start AEM with the following JVM

  ```java
  argument
   -Djavax.net.ssl.trustStore=<<em>path to LC keystore</em>>
  ```

  option.

* **Username**- Specifies the user name of the account which is used to establish communication between AEM and LiveCycle. The account is a LiveCycle user account who has the permissions to start Acrobat Services.
* **Password**- Specifies the password.
* **Service Name** - Specifies the services which are started using the user credentials provided in the Username and Password fields. By default, no credentials are passed while starting LiveCycle services.

## Starting document services {#starting-document-services}

Client applications can programmatically start LiveCycle services using a Java&trade; API, Web Services, Remoting, and REST. For Java&trade; clients, the application can use the LiveCycle SDK. The LiveCycle SDK provides a Java&trade; API for starting these services remotely. For example, to convert a Microsoft&reg; Word Document to PDF, the client starts GeneratePDFService. The invocation flow consists of the following steps:

1. Create a ServiceClientFactory instance.
1. Each service provides a client class. To start a service, create a client instance of the service.
1. Start the service and process the result.

AEM LiveCycle Connector simplifies the flow by exposing these client instances as OSGi services that can be accessed using standard OSGi means. The LiveCycle connector provides the following features:

* Client instances as OSGi Service: The clients packaged as OSGI bundles are listed in the [Acrobat Services list](/help/forms/using/aem-livecycle-connector.md#p-document-services-list-p) section. Each client jar registers the client instance as an OSGi service with the OSGi Service Registry.
* User Credential Propagation: The connection details required to connect to the LiveCycle server are managed at a central place.
* ServiceClientFactory Service: To start the processes, the client application can access the ServiceClientFactory instance.

### Starting via Service References from OSGi Service Registry {#starting-via-service-references-from-osgi-service-registry}

To start an exposed service from within AEM, perform the following steps:

1. Determine maven dependencies. Add the dependency to the required client jar in your maven pom.xml file. At a minimum, add dependency to adobe-livecycle-client and adobe-usermanager-client jars.

   ```xml
   <dependency>
     <groupId>com.adobe.livecycle</groupId>
     <artifactId>adobe-livecycle-client</artifactId>
     <version>11.0.0</version>
   </dependency>
   <dependency>
     <groupId>com.adobe.livecycle</groupId>
     <artifactId>adobe-usermanager-client</artifactId>
     <version>11.0.0</version>
   </dependency>
   <dependency>
     <groupId>com.adobe.livecycle</groupId>
     <artifactId>adobe-cq-integration-api</artifactId>
     <version>11.0.0</version>
   </dependency>
   ```

   To start a service, add a corresponding Maven dependency for the service. For the list of dependencies, see [Acrobat Services List](/help/forms/using/aem-livecycle-connector.md#p-document-services-list-p). For example, for the Generate PDF service add the following dependency:

   ```xml
   <dependency>
     <groupId>com.adobe.livecycle</groupId>
     <artifactId>adobe-generatepdf-client</artifactId>
     <version>11.0.0</version>
   </dependency>
   ```

1. Obtain the service reference. Get a handle to the service instance. If you are writing a Java&trade; class, you can use the Declarative Services annotations.

   ```java

   import com.adobe.livecycle.generatepdf.client.GeneratePdfServiceClient;
   import com.adobe.livecycle.generatepdf.client.CreatePDFResult;
   import com.adobe.idp.Document;

   @Reference
   GeneratePdfServiceClient generatePDF;
   ...

   Resource r = resourceResolver.getResource("/path/tp/docx");
   Document sourceDoc = new Document(r.adaptTo(InputStream.class));
   CreatePDFResult result = generatePDF.createPDF2(
                       sourceDoc,
                       extension, //inputFileExtension
                       null, //fileTypeSettings
                       null, //pdfSettings
                       null, //securitySettings
                       settingsDoc, //settingsDoc
                       null //xmpDoc
               );
   ```

   The above code snippet starts the createPDF API of GeneratePdfServiceClient to convert a document to PDF. You can perform a similar invocation in a JSP using the following code. The major difference is that the following code uses Sling ScriptHelper to access the GeneratePdfServiceClient.

   ```jsp

   <%@ page import="com.adobe.livecycle.generatepdf.client.GeneratePdfServiceClient" %>
   <%@ page import="com.adobe.livecycle.generatepdf.client.CreatePDFResult" %>
   <%@ page import="com.adobe.idp.Document" %>

   GeneratePdfServiceClient generatePDF = sling.getService(GeneratePdfServiceClient.class);
   Document sourceDoc = ...
   CreatePDFResult result = generatePDF.createPDF2(
                       sourceDoc,
                       extension, //inputFileExtension
                       null, //fileTypeSettings
                       null, //pdfSettings
                       null, //securitySettings
                       settingsDoc, //settingsDoc
                       null //xmpDoc
               );
   ```

### Starting via ServiceClientFactory {#starting-via-serviceclientfactory}

The ServiceClientFactory class is required sometimes. For example, you require ServiceClientFactory to call processes.

```java

import com.adobe.livecycle.dsc.clientsdk.ServiceClientFactoryProvider;
import com.adobe.idp.dsc.clientsdk.ServiceClientFactory;

@Reference
ServiceClientFactoryProvider scfProvider;

...
ServiceClientFactory scf = scfProvider.getDefaultServiceClientFactory();
...
```

## RunAs support {#runas-support}

Almost every Acrobat Services in LiveCycle require authentication. You can use any of the following options to start these services without providing explicit credentials in the code:

### Allowlist configuration {#allowlist-configuration}

LiveCycle Client SDK configuration contains a setting about service names. This configuration is a list of services for which the invocation logic uses an administrator credential out of the box. For example, if you add DirectoryManager services (part of the User Management API) to this list, any client code can directly use the service. In addition, the invocation layer automatically passes on the configured credentials as part of the request sent to the LiveCycle server.

### RunAsManager {#runasmanager}

As part of the integration, a new service RunAsManager is provided. It lets you programmatically control a credential to be used when calling the LiveCycle server.

```java
import com.adobe.livecycle.dsc.clientsdk.security.PasswordCredential;
import com.adobe.livecycle.dsc.clientsdk.security.PrivilegedAction;
import com.adobe.livecycle.dsc.clientsdk.security.RunAsManager;
import com.adobe.idp.dsc.registry.component.ComponentRegistry;

@Reference
private RunAsManager runAsManager;

List<Component> components = runAsManager.doPrivileged(new PrivilegedAction<List<Component>>() {
            public List<Component> run() {
                return componentRegistry.getComponents();
            }
        });
assertNotNull(components);
```

If you want to pass a different credential, you can use the overloaded method that takes a PasswordCredential instance.

```java
PasswordCredential credential = new PasswordCredential("administrator","password");
List<Component> components = runAsManager.doPrivileged(new PrivilegedAction<List<Component>>() {
    public List<Component> run() {
        return componentRegistry.getComponents();
    }
},credential);
```

### InvocationRequest property {#invocationrequest-property}

If you call a process or make direct use of the ServiceClientFactory class, and create an InvocationRequest, you can specify a property to indicate that the invocation layer should use configured credentials.

```java
import com.adobe.idp.dsc.InvocationResponse
import com.adobe.idp.dsc.InvocationRequest
import com.adobe.livecycle.dsc.clientsdk.ServiceClientFactoryProvider
import com.adobe.idp.dsc.clientsdk.ServiceClientFactory
import com.adobe.livecycle.dsc.clientsdk.InvocationProperties

ServiceClientFactoryProvider scfp = sling.getService(ServiceClientFactoryProvider.class)
ServiceClientFactory serviceClientFactory = scfp.getDefaultServiceClientFactory()
InvocationRequest ir = serviceClientFactory.createInvocationRequest("sample/LetterSubmissionProcess", "invoke", new HashMap(), true);

//Here we are invoking the request with system user
ir.setProperty(InvocationProperties.INVOKER_TYPE,InvocationProperties.INVOKER_TYPE_SYSTEM)

InvocationResponse response = serviceClientFactory.getServiceClient().invoke(ir);
```

## Acrobat Services list {#document-services-list}

### Adobe LiveCycle Client SDK API bundle {#adobe-livecycle-client-sdk-api-bundle}

The following services are available:

* com.adobe.idp.um.api.AuthenticationManager
* com.adobe.idp.um.api.DirectoryManager
* com.adobe.idp.um.api.AuthorizationManager
* com.adobe.idp.dsc.registry.service.ServiceRegistry
* com.adobe.idp.dsc.registry.component.ComponentRegistry

#### Maven dependencies {#maven-dependencies}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-livecycle-client</artifactId>
  <version>11.0.0</version>
</dependency>
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-usermanager-client</artifactId>
  <version>11.0.0</version>
</dependency>

```

### Adobe LiveCycle Client SDK Bundle {#adobe-livecycle-client-sdk-bundle}

The following services are available:

* com.adobe.livecycle.dsc.clientsdk.security.RunAsManager
* com.adobe.livecycle.dsc.clientsdk.ServiceClientFactoryProvider

#### Maven dependencies {#maven-dependencies-1}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-livecycle-cq-integration-api</artifactId>
  <version>1.1.10</version>
</dependency>
```

### Adobe LiveCycle TaskManager Client bundle {#adobe-livecycle-taskmanager-client-bundle}

The following services are available:

* com.adobe.idp.taskmanager.dsc.client.task.TaskManager
* com.adobe.idp.taskmanager.dsc.client.TaskManagerQueryService
* com.adobe.idp.taskmanager.dsc.client.queuemanager.QueueManager
* com.adobe.idp.taskmanager.dsc.client.emailsettings.EmailSettingService
* com.adobe.idp.taskmanager.dsc.client.endpoint.TaskManagerEndpointClient
* com.adobe.idp.taskmanager.dsc.client.userlist.UserlistService

#### Maven dependencies {#maven-dependencies-2}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-taskmanager-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Workflow Client Bundle {#adobe-livecycle-workflow-client-bundle}

The following service is available:

* com.adobe.idp.workflow.client.WorkflowServiceClient

#### Maven dependencies {#maven-dependencies-3}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-workflow-client-sdk</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle PDF Generator Client bundle {#adobe-livecycle-pdf-generator-client-bundle}

The following service is available:

* com.adobe.livecycle.generatepdf.client.GeneratePdfServiceClient

#### Maven dependencies {#maven-dependencies-4}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-generatepdf-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Application Manager Client bundle {#adobe-livecycle-application-manager-client-bundle}

The following services are available:

* com.adobe.idp.applicationmanager.service.ApplicationManager
* com.adobe.livecycle.applicationmanager.client.ApplicationManager
* com.adobe.livecycle.design.service.DesigntimeService

#### Maven dependencies {#maven-dependencies-5}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-applicationmanager-client-sdk</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Assembler Client bundle {#adobe-livecycle-assembler-client-bundle}

The following service is available:

* com.adobe.livecycle.assembler.client.AssemblerServiceClient

#### Maven dependencies {#maven-dependencies-6}

```xml

<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-assembler-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Form Data Integration Client bundle {#adobe-livecycle-form-data-integration-client-bundle}

The following service is available:

* com.adobe.livecycle.formdataintegration.client.FormDataIntegrationClient

#### Maven dependencies {#maven-dependencies-7}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-formdataintegration-client</artifactId>
  <version>11.0.0</version>
</dependency>

```

### Adobe LiveCycle Forms Client bundle {#adobe-livecycle-forms-client-bundle}

The following service is available:

* com.adobe.livecycle.formsservice.client.FormsServiceClient

#### Maven dependencies {#maven-dependencies-8}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-forms-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Output Client bundle {#adobe-livecycle-output-client-bundle}

The following service is available:

* com.adobe.livecycle.output.client.OutputClient

#### Maven dependencies {#maven-dependencies-9}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-output-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Reader Extensions Client bundle {#adobe-livecycle-reader-extensions-client-bundle}

The following service is available:

* com.adobe.livecycle.readerextensions.client.ReaderExtensionsServiceClient

#### Maven dependencies {#maven-dependencies-10}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-reader-extensions-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Rights Manager Client bundle {#adobe-livecycle-rights-manager-client-bundle}

The following services are available:

* com.adobe.livecycle.rightsmanagement.client.DocumentManager
* com.adobe.livecycle.rightsmanagement.client.EventManager
* com.adobe.livecycle.rightsmanagement.client.ExternalUserManager
* com.adobe.livecycle.rightsmanagement.client.LicenseManager
* com.adobe.livecycle.rightsmanagement.client.WatermarkManager
* com.adobe.livecycle.rightsmanagement.client.PolicyManager
* com.adobe.livecycle.rightsmanagement.client.AbstractPolicyManager

#### Maven dependencies {#maven-dependencies-11}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-rightsmanagement-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Signatures Client bundle {#adobe-livecycle-signatures-client-bundle}

The following service is available:

* com.adobe.livecycle.signatures.client.SignatureServiceClientInterface

#### Maven dependencies {#maven-dependencies-12}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-signatures-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Truststore Client bundle {#adobe-livecycle-truststore-client-bundle}

The following services are available:

* com.adobe.truststore.dsc.TrustConfigurationService
* com.adobe.truststore.dsc.CRLService
* com.adobe.truststore.dsc.CredentialService
* com.adobe.truststore.dsc.CertificateService

#### Maven dependencies {#maven-dependencies-13}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-truststore-client</artifactId>
  <version>11.0.0</version>
</dependency>
```

### Adobe LiveCycle Repository Client bundle {#adobe-livecycle-repository-client-bundle}

The following services are available:

* com.adobe.repository.bindings.ResourceRepository
* com.adobe.repository.bindings.ResourceSynchronizer

#### Maven dependencies {#maven-dependencies-14}

```xml
<dependency>
  <groupId>com.adobe.livecycle</groupId>
  <artifactId>adobe-repository-client</artifactId>
  <version>11.0.0</version>
</dependency>
```
