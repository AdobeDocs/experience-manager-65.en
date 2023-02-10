---
title: Development Tools
seo-title: Development Tools
description: To develop your JCR, Apache Sling or AEM applications, a number of tool sets are available
seo-description: To develop your JCR, Apache Sling or AEM applications, a number of tool sets are available
uuid: 1bee3a52-5d76-4b0c-a222-a02e12ff3a43
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: 76c570e5-46ed-46be-9864-4fe4a83f0caf
exl-id: 97310ed5-f8fb-416c-8a66-68f652abeaa0
---
# Development Tools{#development-tools}

To develop your JCR, Apache Sling or AEM applications, the following tool sets are available:

* one set consisting of [CRXDE Lite](/help/sites-developing/developing-with-crxde-lite.md) and WebDAV. CRXDE Lite is embedded into CRX/AEM and enables you to perform standard development tasks in the browser. With CRXDE Lite, you can create and edit files (like .jsp and .java), folders, templates, components, dialogs, nodes, properties and bundles while logging and integrating with SVN.

  CRXDE Lite is recommended when you do not have direct access to the CRX/AEM server, when you develop an application by extending or modifying the out-of-the-box components and Java bundles or when you do not need a dedicated debugger, code completion and syntax highlighting.

* one set consisting of an Integrated Development Environment (for example: [Eclipse](/help/sites-developing/howto-projects-eclipse.md) or [IntelliJ](/help/sites-developing/ht-intellij.md)), a build tool (for example: [Apache Maven](/help/sites-developing/ht-projects-maven.md)), FileVault which has been developed by Adobe to map a repository to a file system, a version control system (for example: Subversion), a bug tracker system (for example: Jira), a central dependency management system (for example: Apache Archiva) and a build automation system (for example: Apache Continuum).

  This setup allows you to fully integrate your application (content, code, configuration) into any development environment and process.The link between the different elements is the file system representation of the repository through FileVault, as all of the aforementioned development tools can work with files.

## Extensions for Integrated Development Environments {#extensions-for-integrated-development-environments}

Adobe released the following extensions:

* [AEM Eclipse Extension](/help/sites-developing/aem-eclipse.md)
* [AEM Brackets Extension](/help/sites-developing/aem-brackets.md)

### Other Tools {#other-tools}

AEM ships with other tools that facilitate development:

* [Dialog Editor](/help/sites-developing/dialog-editor.md)
* [Using Translator to Manage Dictionaries](/help/sites-developing/i18n-translator.md)
* [Managing Packages Using Maven](/help/sites-developing/vlt-mavenplugin.md)
* [How to Develop AEM Projects Using Eclipse](/help/sites-developing/howto-projects-eclipse.md)
* [How to Build AEM Projects using Apache Maven](/help/sites-developing/ht-projects-maven.md)
* [How to Develop AEM Projects using IntelliJ IDEA](/help/sites-developing/ht-intellij.md)
* [How to use the VLT Tool](/help/sites-developing/ht-vlttool.md)
* [How to use the Proxy Server Tool](/help/sites-developing/ht-proxy-server.md)
* [AEM Modernization Tools](/help/sites-developing/modernization-tools.md)
* [AEM Repo Tool](/help/sites-developing/aem-repo-tool.md)

Tools that facilitate creation of new projects:

* [AEM Project Archetype](https://github.com/Adobe-Marketing-Cloud/aem-project-archetype)
* [AEM Lazybones Templates](https://github.com/Adobe-Consulting-Services/lazybones-aem-templates)

>[!NOTE]
>
>Following tutorial might be of interest for starting a new AEM project:
>[Getting Started with AEM Sites Part 1 - Project Setup](https://helpx.adobe.com/experience-manager/kt/sites/using/getting-started-wknd-tutorial-develop/part1.html)
