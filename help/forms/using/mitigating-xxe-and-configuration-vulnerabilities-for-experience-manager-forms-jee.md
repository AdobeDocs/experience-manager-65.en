---
title: Mitigating XXE, Struts Dev Mode Configuration, and Remote Code Execution Vulnerabilities for AEM Forms on JEE
description: Mitigating XXE, Configuration, and Remote Code Execution Vulnerabilities for AEM Forms on JEE
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin
exl-id: 9fade12f-a038-4fd6-8767-1c30966574c5
solution: Experience Manager, Experience Manager Forms
release-date: 2025-08-05
---
# Mitigating RCE (CVE-2025-49533), Struts Dev Mode Configuration (CVE-2025-54253), XXE (CVE-2025-54254), and Vulnerabilities for AEM Forms on JEE {#mitigating-xxe-configuration-rce-vulnerabilities-aem-forms}

## Quick Reference

| **Impact Level** | **Affected Versions** | **Recommended Action** |
|---|---|---|
| **Critical** | AEM 6.5 Forms on JEE Service Pack 23 (6.5.23.0) | [Install latest hotfix](#option-1-for-users-on-version-65230-install-latest-hotfix)  |
| **Critical** | AEM 6.5 Forms on JEE Service Pack 18 to 22 (6.5.18.0 - 6.5.22.0) |[Manually install the fixes](#option-2-for-users-on-65180---65220-manual-hotfix-installation) |
| **Critical** | AEM 6.5 Forms on JEE Service Pack 17 (6.5.17.0) or earlier | Upgrade to a supported Service Pack version, then apply the recommended mitigation steps for your new version |
| **Not Affected** | AEM Forms on OSGi, Workbench, Cloud Service | No action required |

**Vulnerabilities Addressed:**

- Remote code execution (CVE-2025-49533)
- Configuration security issues (CVE-2025-54253)
- XML External Entity (XXE) processing (CVE-2025-54254)

## Overview

### What's Affected

| Vulnerability | Impact | Affected Components |
|---|---|---|
| **CVE-2025-49533**: Remote Code Execution | Unauthenticated code execution in GetDocumentServlet | AEM 6.5 Forms on JEE Service Pack 23 (6.5.23.0) and earlier |
| **CVE-2025-54253**: Configuration Issues | Struts development mode enabled in admin UI | AEM 6.5 Forms on JEE Service Pack 23 (6.5.23.0) and earlier |
| **CVE-2025-54254**: XXE Processing | Document Security module allows unauthorized file access | AEM 6.5 Forms on JEE Service Pack 23 (6.5.23.0) and earlier |


### What's Not Affected

- Experience Manager Forms Workbench (all versions)
- Experience Manager Forms on OSGi (all versions)  
- Experience Manager Forms as a Cloud Service

## Resolution Options


### Before You Start

Before making any changes, take a backup of the EAR file or DSC file you're about to modify or update:

- Locate the original EAR or DSC file in your deployment directory.
- Copy the file to a secure backup location outside the deployment directory.
- Ensure the backup is complete and accessible before proceeding with any updates.

This precaution allows you to restore the original state in case you encounter any issues during the update process.

### Option 1: (For users on version 6.5.23.0) Install Latest Hotfix 

1. [Download the hotfix for 6.5.23.0](/help/release-notes/aem-forms-hotfix.md).
1. Follow standard [hotfix/patch installation instructions](/help/release-notes/jee-patch-installer-65.md)
1. If you are using Document Security (formerly Rights Management) on IBM WebSphere or Oracle WebLogic, set the following Java system property (JVM argument) before starting the AEM Forms server:

   ```
   -Dcom.adobe.forms.jee.services.allowDoctypeDeclaration=true
   ```

1. Restart the application server

### Option 2: (For users on 6.5.18.0 - 6.5.22.0) Manual Hotfix Installation

+++Manual Hotfix Installation for 6.5.18.0 through 6.5.22.0

**Step 1: Download and Extract the Hotfix Package**

- Download the [hotfix for 6.5.18.0 - 6.5.22.](/help/release-notes/aem-forms-hotfix.md) from the Adobe Software Distribution Portal
- Extract it locally

**Step 2: Navigate to the Correct Version Folder**

- Based on the Service Pack version installed on your environment, go to the matching folder.

   Example for Service Pack 20 the folder is:

   ```
   <extracted-hotfix>/SP20/
   ```

**Step 3: Locate the Deployment Directory**

- On your AEM Forms on JEE server, go to:

   ```
   [AEM installation directory]/deploy
   ```

   Example: `adobe/adobe-experience-manager-forms/deploy`



**Step 4: Update and replace the EAR files**

>[!BEGINTABS]

>[!TAB JBoss]

1. Open `adobe-core-jboss.ear` and replace `adminui.war` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/jboss/adminui.war
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/jboss/adminui.war`

1. Inside the `adobe-core-jboss.ear`, go to the `lib/` folder and replace `adobe-uisupport.jar` with:

   ```
   adobe-xxe-configuration-hotfix/SP[version]/adobe-uisupport.jar
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/adobe-uisupport.jar`

1. Save the EAR. Ensure changes are saved properly. 


1. Replace `adobe-edcserver-jboss.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/jboss/adobe-edcserver-jboss.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/jboss/adobe-edcserver-jboss.ear`

1. Replace `adobe-forms-jboss.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/jboss/adobe-forms-jboss.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/jboss/adobe-forms-jboss.ear`



>[!TAB WebLogic]

1. Open `adobe-core-weblogic.ear` and replace `adminui.war` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/weblogic/adminui.war
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/weblogic/adminui.war`

1. Inside the `adobe-core-weblogic.ear`, replace `adobe-uisupport.jar` with:

   ```
   adobe-xxe-configuration-hotfix/SP[version]/adobe-uisupport.jar
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/adobe-uisupport.jar`

1. Save the EAR. Ensure changes are saved properly. 


1. Replace `adobe-edcserver-weblogic.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/weblogic/adobe-edcserver-weblogic.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/weblogic/adobe-edcserver-weblogic.ear`

1. Replace `adobe-forms-weblogic.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/weblogic/adobe-forms-weblogic.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/weblogic/adobe-forms-weblogic.ear`

>[!TAB WebSphere]

1. Open `adobe-core-websphere.ear` and replace `adminui.war` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/websphere/adminui.war
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/websphere/adminui.war`

1. Inside the `adobe-core-websphere.ear`, replace `adobe-uisupport.jar` with:

   ```
   adobe-xxe-configuration-hotfix/SP[version]/adobe-uisupport.jar
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/adobe-uisupport.jar`

1. Save the EAR. Ensure changes are saved properly. 


1. Replace `adobe-edcserver-websphere.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/websphere/adobe-edcserver-websphere.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/websphere/adobe-edcserver-websphere.ear`

1. Replace `adobe-forms-websphere.ear` with 

   ```
   adobe-xxe-configuration-hotfix/SP[version]/websphere/adobe-forms-websphere.ear
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/websphere/adobe-forms-websphere.ear`

>[!ENDTABS]



**Step 5: Update `adobe-rightsmanagement-<appserver>-dsc.jar`file with**

   ```
   adobe-xxe-configuration-hotfix/SP[version]/<appserver>/adobe-rightsmanagement-<appserver>-dsc.jar
   ```

   For example, `adobe-xxe-configuration-hotfix/SP20/jboss/adobe-rightsmanagement-jboss-dsc.jar`

**Step 6: Additional Configuration for Document Security on WebSphere and WebLogic**: 

If you are using Document Security (formerly Rights Management), set the following Java system property (JVM argument) before starting the AEM Forms server:

   ```
   -Dcom.adobe.forms.jee.services.allowDoctypeDeclaration=true
   ```


**Step 7: Re-run the Configuration Manager**

- Launch the Configuration Manager to re-deploy the updated EAR and apply the hotfix

+++

### Option 3: (For users on 6.5.17.0 and earlier) Upgrade Path 

1. [Upgrade to a supported Service Pack version](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md)
1. Follow Option 1 or Option 2 above based on your new version

## References

- [CWE-611: Improper Restriction of XML External Entity Reference](https://cwe.mitre.org/data/definitions/611.html)
- [CWE-16: Configuration](https://cwe.mitre.org/data/definitions/16.html)
- [OWASP XXE Prevention Cheat Sheet](https://owasp.org/www-community/vulnerabilities/XML_External_Entity_XXE_Processing)
- [Adobe Experience Manager Forms Security Best Practices](https://experienceleague.adobe.com/docs/experience-manager-65/administering/security/security.html)