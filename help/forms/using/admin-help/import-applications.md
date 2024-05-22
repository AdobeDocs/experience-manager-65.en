---
title: Import and manage applications
description: Learn how to import and manage applications. An application is a container for storing assets that are required for implementing an AEM forms solution. 
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/importing_and_managing_applications_and_archives
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: f17726c0-3591-4d25-a8b5-3a7024249a56
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Import and manage applications{#import-and-manage-applications}

In AEM forms, an *application* is a container for storing assets that are required for implementing an AEM forms solution. Examples of assets are form designs, form fragments, images, processes, DDX files, form Guides, HTML pages, and SWF files. During the development phase of a project, Workbench users can deploy applications directly from the Applications view in Workbench. Once deployed, these applications appear in administration console, on the Applications tab on the Application Management page.

When an application is complete and ready for deployment to a production server, the Workbench user packages the application into a *AEM forms application file* (.lca). Then an administrator uses administration console to import and deploy the application file, using the Applications tab on the Application Management page.

You can also use the archives tab on the Application Management page to import LCAs that were created using workbench 8.x.

>[!NOTE]
>
>There is a known issue that LCA files from a future release are not necessarily backward compatible. While it may be possible to view and import LCA files from a future release of AEM forms (for example, a preview release), doing so is not supported and may result in aberrant behavior.

Use the Applications tab to import and manage applications that were created in Workbench. Application administrators can also export the runtime configuration for an application. Exporting the runtime configuration eliminates the need to manually reconfigure settings in the production environment before starting deployed applications. The runtime configuration file contains:

* service configuration settings
* pool configuration settings
* endpoint configuration settings
* security profiles

## Import an application or archive {#import-an-application-or-archive}

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Click Import.
1. Click Browse and select the .lca file to import and click Preview. The Preview Application page displays information about the application.
1. (Optional) To see a list of the assets contained in the application, click View Assets.
1. (Optional) To deploy the assets to the runtime, select Deploy Assets To Runtime When Import Is Complete. If you do not select this option, you can deploy the assets later.
1. Click Import. The application appears on the Applications tab.
1. Log into the CRX repository with administrator credentials.
1. Navigate to content/dam/lcapplications

   >[!NOTE]
   >
   >The imported applications display in the lcapplications node.

1. Click on one of the imported applications.

   The Properties tab on the right displays the properties of the selected CRX node.

   The **syncState** property indicates the state of synchronization of data between the AEM Forms Server and the CRX repository. As soon as the import process begins this state is set to 0 (zero). This state indicates the data is currently not synchronized. When the data is synchronized, the state is set to 1.

## Deploy an application {#deploy-an-application}

You can deploy applications that you have imported, or that Workbench users imported from Workbench.

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Select the checkbox next to the application that you want to deploy and click Deploy.
1. Click OK in the confirmation dialog box that appears.

## Undeploy an application {#undeploy-an-application}

You can undeploy applications from the runtime.

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Select the checkbox next to the application that you want to undeploy and click Undeploy.
1. Click OK in the confirmation dialog box that appears.

## Remove an application from the server {#remove-an-application-from-the-server}

Undeploy the application before removing it from the server.

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Select the checkbox next to the application that you want to remove and click Remove.
1. Click OK in the confirmation dialog box that appears.

## Import an application's runtime configuration {#import-an-application-s-runtime-configuration}

If an application administrator exported the runtime configuration for an application, you can import it into the deployed application. You can import it using either the administration console or via scripted LCA deployment.

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Click the name of the application.
1. Click Import Runtime Config.
1. Click Browse and select the XML file that contains the runtime configuration.
1. Click Import.

## Export an application's runtime configuration {#export-an-application-s-runtime-configuration}

You can export the runtime configuration information for deployed applications.

1. In administration console, click Services &gt; Applications and Services &gt; Application Management.
1. Click the name of the application.
1. Click Export Runtime Config and save the configuration file (XML) that is produced.

## Scripted deployment of AEM forms applications {#scripted-deployment-of-aem-forms-applications}

You can also use a scripted deployment tool to deploy application files, including a settings.xml file that specifies the following settings:

* service configuration settings
* pool configuration settings
* endpoint configuration settings
* security profiles

Scripted deployment eliminates the need to manually reconfigure settings in the production environment before starting deployed applications.

1. From a command prompt, navigate to *[aem-forms root]*/sdk/misc/Foundation/ArchiveManagement.
1. Review the ReadMe.txt file for more detailed instructions.
1. Manually modify the scriptedDeploy.bat and sample-files/sample.xml files as described in the readme.txt file.
1. Run the scriptedDeploy.bat file. This action deploys the AEM forms archive file with the override settings.
