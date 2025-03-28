---
title: Mitigating for Spring Framework vulnerabilties for AEM Forms on JEE
description: Mitigating for Spring Framework vulnerabilties for AEM Forms on JEE
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---

# Mitigating Spring Framework Vulnerabilities for AEM Forms on JEE

This document provides guidance on addressing two critical Spring Framework vulnerabilities that affect AEM Forms on JEE:

- **[CVE-2024-38819](https://spring.io/security/cve-2024-38819)**: Path traversal vulnerability in functional web frameworks
- **[CVE-2024-38820](https://spring.io/security/cve-2024-38820)**: Spring Framework DataBinder Case Sensitive Match Exception

## Affected Versions

- Adobe Experience Manager 6.5 Forms on JEE 
- Versions AEM 6.5 Forms GA to 6.5.22.0

## Resolution 

### Version-Specific Solutions

| AEM Forms Version | Required Action |
|-------------------|-----------------|
| 6.5.22.0 | 1. [Download the hotfix for your environment](/help/release-notes/aem-forms-hotfix.md). </br> 2. To install this fix, follow the instructions to [install Service Pack on an AEM Form on JEE](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).|
| 6.5.17.0 - 6.5.21.0 | [Apply manual mitigation steps](#manual-mitigation-steps). |
| 6.5 - 6.5.16.0 | 1. [Install the latest service pack](/help/release-notes/release-notes.md)<br>2. [Implement the appropriate solution](#version-specific-solutions) based on your updated version. |

> **Note**: AEM Forms officially supports only the six most recent service packs. Users on older versions should first upgrade to the latest service pack and then install the required hotfix.

## Deployment Considerations

### For Clustered Environments

When working with a clustered deployment:

- Apply JAR file replacements (Step #4) on **all nodes** in the cluster
- Maintain consistency by using identical JAR versions across all servers
- Complete updates on all nodes before initiating any service restarts
- Implement a coordinated restart strategy to minimize system downtime

### For Single Node Environments

When working with a standalone deployment:

- Follow a simplified process as there are no locator servers to manage
- Omit any steps related to locator server configuration or startup
- Complete all other steps as instructed, especially JAR replacements and manifest updates
- Restart your application server after implementing all changes

## Manual Mitigation Steps

1. Stop the Application servers.
1. Stop and locator servers.
1. Remove Spring JARs from Core EAR:
   1. Navigate to `[Adobe_Experience_Manager_Forms installation directory]/deploy`. 
   1. Open the `adobe-core-<appserver>.ear` file using an archive manager tool. Where `<appserver>` can be JBoss, WebLogic, or WebSphere, depending on your environment: 
   - **For JBoss:** Navigate to the `ear/lib` folder and delete the following JAR files:
         - `spring-core-<version>.jar`
         - `spring-web-<version>.jar`
   
   - **For WebLogic or WebSphere:** Delete the following JAR files from the root of the EAR:
         - `spring-core-<version>.jar`
         - `spring-web-<version>.jar`
   
   - **For all application servers:** At the root level of the `adobe-core-<appserver>.ear`, open the `adobe-dscf.jar` file and edit the `META-INF/MANIFEST.MF` file to remove any references to the following JAR files:
         - `spring-core-<version>.jar`
         - `spring-web-<version>.jar`

1. Replace JAR Files from Geode distribution:
   1. Navigate to `<Adobe_Experience_Manager_Forms>/lib/caching/lib`
   1. Replace the existing JAR files with the updated versions:
     - `spring-context-<version>.jar` → `spring-context-6.1.14.jar`
     - `spring-beans-<version>.jar` → `spring-beans-6.1.14.jar`
     - `spring-core-<version>.jar` → `spring-core-6.1.14.jar`
     - `spring-jcl-<version>.jar` → `spring-jcl-6.1.14.jar`
     - `spring-web-<version>.jar` → `spring-web-6.1.14.jar`

     To get the newer JAR files, download the spring-6.1.14-jars.zip file from [Adobe Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/spring-6.1.14-jars.zip) and extract the ZIP file to access the updated Spring framework JAR files.

   1. Update the MANIFEST.MF files in the following JAR files:
     - `geode-server-all-<version>.jar`
     - `gfsh-dependencies.jar`
     
     For each JAR:
     - Open the JAR using an archive manager tool
     - Locate and extract the `META-INF/MANIFEST.MF` file
     - Edit the MANIFEST.MF file in a text editor
     - Find the "Class-Path" section and update all Spring framework references:
       - `spring-core-<version>.jar` to `spring-core-6.1.14.jar`
       - `spring-web-<version>.jar` to `spring-web-6.1.14.jar`
       - `spring-context-<version>.jar` to `spring-context-6.1.14.jar`
       - `spring-beans-<version>.jar` to `spring-beans-6.1.14.jar`
       - `spring-jcl-<version>.jar` to `spring-jcl-6.1.14.jar`
     - Save the modified MANIFEST.MF file
     - Replace the original MANIFEST.MF in the JAR with your updated version
     - Save the JAR file

   1. Common Issues to Watch For:
      - Ensure no duplicate entries in the manifest
      - Maintain proper line endings
      - Verify all referenced JARs exist in the specified locations

   1. Verification Steps:
      - Check if the manifest is properly updated
      - Verify all Spring dependencies are correctly referenced
      - Ensure no old version references remain
      - Test the application to confirm no class loading issues

1. Run the Configuration Manager. 

1. Restart Servers:
   - Start the Locator Servers using JDK 17
   - Start the Application Servers using the same JDK version (JDK 8 or JDK 11) that was previously used. 
