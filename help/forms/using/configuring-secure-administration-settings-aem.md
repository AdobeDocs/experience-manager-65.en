---
title: Configuring Secure Administration Settings for AEM Forms on JEE

description: Learn how to administer user accounts and services that, although required in a private development environment, are not required in a production environment of AEM Forms on JEE.


content-type: reference
topic-tags: Security
products: SG_EXPERIENCEMANAGER/6.4

role: Admin,User
exl-id: 40bc01b4-a59e-4420-81d6-2887857bddce
solution: Experience Manager, Experience Manager Forms
feature: "Document Security,Adaptive Forms"
---
# Configuring Secure Administration Settings for AEM Forms on JEE {#configuring-secure-administration-settings-for-aem-forms-on-jee}

Learn how to administer user accounts and services that, although required in a private development environment, are not required in a production environment of AEM Forms on JEE.

Generally, developers do not use the production environment to build and test their applications. Therefore, you must administer user accounts and services that, although required in a private development environment, are not required in a production environment.

This article describes methods for reducing the overall attack surface through administration options that AEM Forms on JEE provides.

## Disabling non-essential remote access to services {#disabling-non-essential-remote-access-to-services}

After AEM Forms on JEE is installed and configured, many services are available for remote invocation over SOAP and Enterprise JavaBeans™ (EJB).The term remote, in this case, refers to any caller that has network access to the SOAP, EJB, or Action Message Format (AMF) ports for the application server.

Although the AEM Forms on JEE services require valid credentials to be passed for an authorized caller, you should allow only remote access to the services that you need to be remotely accessible. To achieve limited accessibility, you should reduce the set of remotely accessible services to the minimum possible for a functioning system and then enable remote invocation for the additional services that you need.

AEM Forms on JEE services always need at least SOAP access. These services are typically required for use by Workbench but also include services that are called by the Workspace web application.

Complete this procedure using the Applications and Services web page in Administration Console:

1. Log in to Administration Console by typing the following URL in a web browser:

   ```java
            https://[host name]:'port'/adminui
   ```

1. Click **Services &gt; Applications and Services &gt; Preferences**.
1. Set the Preferences to view up to 200 services and endpoints on the same page.
1. Click **Services** &gt; **Applications and Services** &gt; **Endpoint Management**.
1. Select **EJB** from the **Provider** list and then click **Filter**.
1. To disable all EJB endpoints, select the check box beside each one in the list and click **Disable**.
1. Click **Next** and repeat the previous step for all EJB endpoints. Ensure that EJB is listed in the Provider column before you disable endpoints.
1. Select **SOAP** from the **Provider** list and then click **Filter**.
1. To remove SOAP endpoints, select the check box beside each one in the list and click **Remove**. Do not remove the following endpoints:

    * AuthenticationManagerService
    * DirectoryManagerService
    * JobManager
    * event_management_service
    * event_configuration_service
    * ProcessManager
    * TemplateManager
    * RepositoryService
    * TaskManagerService
    * TaskQueueManager
    * TaskManagerQueryService
    * WorkspaceSingleSignOn
    * ApplicationManager

1. Click **Next** and repeat the previous step for SOAP endpoints that are not in the above list. Ensure that SOAP is listed in the Provider column before you remove endpoints.

## Disabling non-essential anonymous access to services {#disabling-non-essential-anonymous-access-to-services}

Some Forms Server services permit unauthenticated (anonymous) invocation for some operations. This means that one or more operations exposed by the service may be invoked as any authenticated user or as no authenticated user at all.

1. Log in to administration console by typing the following URL in a web browser:

   ```java
            https://[host name]:'port'/adminui
   ```

1. Click **Services &gt; Applications and Services &gt; Service Management**.
1. Click the name of the service that you want to disable (for example, AuthenticationManagerService).
1. Click the **Security tab**, deselect **Anonymous Access Allowed**, and click **Save**.
1. Complete steps 3 and 4 for the following services:

    * AuthenticationManagerService
    * EJB
    * Email
    * JobManager
    * WatchedFolder
    * UsermanagerUtilService
    * Remoting
    * RepositoryProviderService
    * EMCDocumentumRepositoryProvider
    * IBMFilenetRepositoryProvider
    * FormAugmenter
    * TaskManagerService
    * TaskManagerConnector
    * TaskManagerQueryService
    * TaskQueueManager
    * TaskEndpointManager
    * UserService
    * WorkspaceSearchTemplateService
    * WorkspacePropertyService
    * OutputService
    * FormsService

   If you intend to expose any of these services for remote invocation, you should also consider disabling anonymous access for these services. Otherwise, any caller with network access to this service may invoke the service without passing valid credentials.

   Anonymous access should be disabled for any services that are not needed. Many internal services require anonymous authentication to be enabled because they need to be invoked by potentially any user in the system without being preauthorized.

## Changing the default global time-out {#changing-the-default-global-time-out}

End users can authenticate to AEM Forms through Workbench, AEM Forms web applications, or custom applications that invoke AEM Forms server services. One global time-out setting is used to specify how long such users can interact with AEM Forms (using a SAML-based Assertion) before they are forced to reauthenticate. The default setting is two hours. On a production environment, the amount of time needs to be reduced to the minimum number of minutes acceptable.

### Minimize reauthentication time limit {#minimize-reauthentication-time-limit}

1. Log in to administration console by typing the following URL in a web browser:

   ```java
            https://[host name]:'port'/adminui
   ```

1. Click **Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files**.
1. Click **Export** to produce a config.xml file with the existing AEM Forms settings.
1. Open the XML file in an editor and locate the following entry:

   `<entry key="assertionValidityInMinutes" value="120"/>`

1. Change the value to any number greater than 5 (in minutes) and save the file. 
1. In administration console, navigate to the Import And Export Configuration Files page. 
1. Enter the path to the modified config.xml file or click Browse to navigate to it. 
1. Click **Import** to upload the modified config.xml file and then click **OK**.
