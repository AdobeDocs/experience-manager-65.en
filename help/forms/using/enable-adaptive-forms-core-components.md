---
title: How to enable Adaptive Forms Core Components on AEM 6.5 Forms?
description: Step-by-Step guide to help you enable Adaptive Forms Core Components on an AEM 6.5 Forms environment.
keywords: Enable Core Components, Core Components Adaptive Forms, Core Components on 6.5, Adaptive Forms Core Components on AEM 6.5, AF Core Components on AEM 6.5, AEM 6.5 Forms Core Components
contentOwner: Khushwant Singh
topic-tags: Adaptive Forms
docset: aem65
role: Admin, Developer
feature: "Adaptive Forms,Core Components"
exl-id: 6585ea71-6242-47d3-bc59-6f603cf507b6
solution: Experience Manager, Experience Manager Forms
---
# Enable Adaptive Forms Core Components on AEM 6.5 Forms {#enable-adaptive-forms-core-components}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service     | [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/setup-configure-migrate/enable-adaptive-forms-core-components.html)|
| AEM 6.5  |    This Article                  |

<!--**Applies to:** ✅ Adaptive Form Core Components ❎ [Adaptive Form Foundation Components](/help/forms/using/create-adaptive-form.md).-->

Enabling Adaptive Forms Core Components lets you start creating, publishing, and delivering [Core Components based Adaptive Forms](create-an-adaptive-form-core-components.md) and [Headless Adaptive Forms](https://experienceleague.adobe.com/docs/experience-manager-headless-adaptive-forms/using/overview.html) from your AEM 6.5 Forms environment. 

To enable Adaptive Forms Core Components on your AEM 6.5 Forms environment, setup and deploy an [AEM Archetype 41 or later](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/archetype/overview.html) based project (with forms options enabled) on all of your Author and Publish instances. 

This article provides detailed instructions to setup and deploy AEM Archetype 41 or later based project on your AEM 6.5 Forms environment to enable Adaptive Forms Core Components. You can refer to the list below for **AEM 6.5** compatible versions for enabling Forms Core Components:

## Prerequisites {#prerequisites}

Before enabling Adaptive Forms Core Components on an AEM 6.5 Forms environment: 

* [Upgrade to AEM 6.5 Forms Service Pack 16 (6.5.16.0) or later](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/aem-forms-current-service-pack-installation-instructions.html). 

* Install the latest release of [Apache Maven](https://maven.apache.org/download.cgi).

* Install a plain text editor. For example, Microsoft Visual Studio Code. 

## Create and deploy latest AEM Archetype based project 

To create an AEM Archetype 41 or [later](https://github.com/adobe/aem-project-archetype) based project and deploy it to all of your Author and Publish instances:  

1. Log in to your computer, hosting and running your AEM 6.5 Forms instance, as an administrator.
1. Open the command prompt or terminal and run the following command to create AEM Archetype project (with forms options enabled):

    * Microsoft Windows
    
     ```Shell
     
        mvn -B org.apache.maven.plugins:maven-archetype-plugin:3.2.1:generate ^
        -D archetypeGroupId=com.adobe.aem ^
        -D archetypeArtifactId=aem-project-archetype ^
        -D archetypeVersion=41 ^
        -D appTitle="My Form" ^
        -D appId="myform" ^
        -D groupId="com.myform" ^
        -D includeFormsenrollment="y" ^
        -D aemVersion="6.5.15" 

     ```

    * Linux or Apple macOS

     ```Shell

        mvn -B org.apache.maven.plugins:maven-archetype-plugin:3.2.1:generate \
        -D archetypeGroupId=com.adobe.aem \
        -D archetypeArtifactId=aem-project-archetype \
        -D archetypeVersion=41 \
        -D appTitle="My Form" \
        -D appId="myform" \
        -D groupId="com.myform" \
        -D includeFormsenrollment="y" \
        -D aemVersion="6.5.15" 

     ```    

    When you execute the above command, be sure to consider the following points:

    * Do not change the value of the `aemVersion` property from `6.5.15.0` to anything else.  
    
    * Set the `archetypeVersion` property to `41` or later. For latest version, see system requirements section in [AEM Project Archetype](https://github.com/adobe/aem-project-archetype) documentation. 
    
    * Update the command to reflect the specific values for your environment, including the `appTitle`, `appId`, and `groupId`. Also, set the value of the  `includeFormsenrollment` property to `y`. If you use Forms Portal, set the `includeExamples=y` option to include Forms Portal Core Components in your project.


1. (Only for Archetype version 41 based projects) After the AEM Archetype project is created, enable themes for Core Components based Adaptive Forms. To enable themes:  

    1. Open the [AEM Archetype Project Folder]/ui.apps/src/main/content/jcr_root/apps/__appId__/components/adaptiveForm/page/customheaderlibs.html for editing:

    1. Add the following code at line 21: 

        ```XML 

        <sly data-sly-use.clientlib="core/wcm/components/commons/v1/templates/clientlib.html"
        data-sly-use.formstructparser="com.adobe.cq.forms.core.components.models.form.FormStructureParser"
        data-sly-test.themeClientLibRef="${formstructparser.themeClientLibRefFromFormContainer}">
        <sly data-sly-test="${themeClientLibRef}" data-sly-call="${clientlib.css @ categories=themeClientLibRef}"/>
        </sly>

        ```

        ![Add above mentioned code at line 21](/help/forms/using/assets/code-to-enable-themes.png)

    1. Save and close the file. 

1. Update project to include latest version of Forms Core Components: 

     1. Open the [AEM Archetype Project Folder]/pom.xml for editing. 
     1. Set version of `core.forms.components.version` and `core.forms.components.af.version` to the [latest Forms Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/version.html#aem-as-form-version-history) version and ensure both have the same version as **Forms Core Components** mentioned in the table, and set version of `core.wcm.components.version` as given in the [WCM Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/versions.html).

        >[!WARNING]
        >
        >* When creating an Archetype project with version 45, the `[AEM Archetype Project Folder]/pom.xml` initially sets the forms core components version to 1.1.28. Before building or deploying the Archetype project, update the forms core components version to 1.1.26. You can find the latest version in the [AEM 6.5 Forms version history](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/version.html#aem-as-form-version-history).
     
        >[!NOTE]
        >
        >* If you set up any other topology, ensure that you add the submit, prefill, and other URLs to the allowlist at the Dispatcher layer.

     1. Save and close the file.  


1. After the AEM Archetype project is created successfully, build the deployment package for your environment. To build the package:
    
    1. Navigate to the root directory of your AEM Archetype project. 

    1. Run the following command to build the AEM Archetype project for your environment: 

        ```Shell
        
        mvn clean install


        ```

        ![archetypebuild-success](/help/forms/using/assets/corecomponent-build-successful.png)


    After the AEM Archetype project is successfully built, an AEM Package is generated. You can find the package at [AEM Archetype Project Folder]\all\target\[appid].all-[version].zip

1. Use the [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html?lang=en) to deploy the [AEM Archetype Project Folder]\all\target\[appid].all-[version].zip package on all the Author and Publish instances.

>[!NOTE]
>
>
>
> * In case you encounter difficulty accessing the login dialog on a publish instance, to install the package through the Package Manager, try using the URL: `http://[Publish Server URL]:[PORT]/system/console` to login. This lets you access the login page on a Publish instance, allowing you to proceed with the installation process.
> * Do not delete or discard the Archetype project, after deploying it to your environment. The Archetype project is required to add customized and new Adaptive Forms Core Components themes to your environment. 

The Core Components are enabled for your environment. A blank Core Components based Adaptive Form template and Canvas 3.0 theme are deployed to your environment, enabling you to [create Core Components based Adaptive Forms](create-an-adaptive-form-core-components.md).

## Frequently Asked Questions

### What are core components?

The [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html) are a set of standardized Web Content Management (WCM) components for AEM to speed up development time and reduce maintenance cost of your websites. 

### What all is capabilities are added on enabling core components?


When the  Adaptive Forms Core Components are enabled for your environment, a blank Core Components based Adaptive Form template and Canvas 3.0 theme are added to your environment. After enabling Adaptive Forms Core Components for your environment, you can:

* Create Core Components based Adaptive Forms.
* Create Core Components based Adaptive Form templates.
* Create custom themes for Core Components based Adaptive Form templates.
* Serve Core Component based Adaptive Form's JSON representations to channels such as mobile, web, native apps, and services that require a form's headless representation.

## What's Next

* [Create a Core Components based Adaptive Form](/help/forms/using/create-an-adaptive-form-core-components.md)
* [Create or Add an Adaptive Form to an AEM Sites Page or Experience Fragment](create-or-add-an-adaptive-form-to-aem-sites-page.md)
* [Create themes for Core Components based Adaptive Forms](create-or-customize-themes-for-adaptive-forms-core-components.md)
* [Create a template for Core Components based Adaptive Forms](template-editor.md)
