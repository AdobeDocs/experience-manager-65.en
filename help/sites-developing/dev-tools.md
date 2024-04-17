---
title: Development Tools
description: To develop your JCR, Apache Sling, or Adobe Experience Manager applications, several tool sets are available.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
exl-id: 97310ed5-f8fb-416c-8a66-68f652abeaa0
solution: Experience Manager, Experience Manager Sites
feature: Developing,Developer Tools
role: Developer
---
# Development Tools{#development-tools}

To develop your JCR, Apache Sling or Adobe Experience Manager (AEM) applications, the following tool sets are available:

* one set consisting of [CRXDE Lite](/help/sites-developing/developing-with-crxde-lite.md) and WebDAV. CRXDE Lite is embedded into CRX/AEM and enables you to perform standard development tasks in the browser. With CRXDE Lite, you can create and edit files (like .jsp and .java), folders, templates, components, dialogs, nodes, properties, and bundles while logging and integrating with SVN.

  CRXDE Lite is recommended when you do not have direct access to the CRX/AEM server, when you develop an application by extending or modifying the out-of-the-box components and Java&trade; bundles or when you do not need a dedicated debugger, code completion and syntax highlighting.

* one set consisting of the following:
  * An Integrated Development Environment. For example, [Eclipse](/help/sites-developing/howto-projects-eclipse.md) or [IntelliJ](/help/sites-developing/ht-intellij.md).
  * A build tool. For example, [Apache Maven](/help/sites-developing/ht-projects-maven.md).
  * FileVault which has been developed by Adobe to map a repository to a file system, a version control system. For example, Subversion.
  * A bug tracker system. For example, Jira.
  * A central dependency management system. For example, Apache Archiva.
  * And a build automation system. For example, Apache Continuum.

  This setup lets you fully integrate your application (content, code, configuration) into any development environment and process. The link between the different elements is the file system representation of the repository through FileVault, as all the previously mentioned development tools can work with files.

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

* [AEM Project Archetype](https://github.com/adobe/aem-project-archetype)
* [AEM Lazybones Templates](https://github.com/Adobe-Consulting-Services/lazybones-aem-templates)

>[!NOTE]
>
>Following tutorial might be of interest for starting a new AEM project:
>[Getting Started with AEM Sites Part 1 - Project Setup](https://helpx.adobe.com/experience-manager/kt/sites/using/getting-started-wknd-tutorial-develop/part1.html)
