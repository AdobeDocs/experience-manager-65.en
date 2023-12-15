---

title: Mitigating Struts 2 RCE Vulnerabilities for Experience Manager Forms
description: Mitigating Struts 2 RCE Vulnerabilities for Experience Manager Forms
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Security
geptopics: SG_AEMFORMS/categories/jee
role: Admin

---

# Mitigating Struts 2 RCE Vulnerabilities for Experience Manager Forms {#mitigatin-struts2-rce-vulnerabilities-for-aem-forms}

## Issue

Critical security vulnerabilities have been reported for Struts 2 RCE, a popular and open-source web application framework for developing Java EE web applications. The following vulnerabilities have been analyzed:

| Vulnerability  | What's impacted?  | What's not impacted?  |
|---|---|---|
| [CVE-2023-50164](https://cve.mitre.org/cgi-bin/cvename.cgi?name=2023-50164)  | Experience Manager 6.5 Forms on JEE (all versions from 6.5 GA to 6.5.19.0)  | <ul><li> Experience Manager Forms Workbench (all versions)</li> <li> Experience Manager Forms on OSGi (all versions) </li> <li> Experience Manager Forms as a Cloud Service </li> <ul>|

## Resolution

The following table lists resolution for all impacted versions: 

| Release  | Current Version  | User action  |
|---|---|---|
| Experience Manager 6.5 Forms on JEE  |  6.5.19.0 | [Install the latest service pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/aem-forms-current-service-pack-installation-instructions.html?lang=en) |
| Experience Manager 6.5 Forms on JEE  |  6.5.13.0 - 6.5.18.0| Use one of the following methods: <ul><li>  <a href="https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/aem-forms-current-service-pack-installation-instructions.html?lang=en"> Install the latest service pack </a> </li> <li> <a href ="#use-manual-mitigation-steps"> Use manual mitigation steps </a> |
| Experience Manager 6.5 Forms on JEE  |  6.5 - 6.5.12.0 | [Install the latest service pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/aem-forms-current-service-pack-installation-instructions.html?lang=en)  </br> </br> **NOTE:** AEM Forms currently support versions 6.5.13.0 through 6.5.19.0. If you're using an older version, we recommend upgrading to 6.5.13.0 or a later release. For instructions to install AEM 6.5.13.0 or later release, see release notes.|

### Use manual mitigation steps {#use-manual-mitigation-steps}

You can use the manual mitigation steps to resolve the issue on AEM 6.5 Form Server running Service Pack 13 to AEM 6.5 Form Server running Service Pack 18 (6.5.13.0 - 6.5.18.0):

1. Shut down all the server instances and locators.
1. Download the [struts-core 2.5.33 jar](https://repo1.maven.org/maven2/org/apache/struts/struts2-core/2.5.33/struts2-core-2.5.33.jar).
1. Download the AEM Forms on JEE Manual Patching Tool from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/patch_utility/archive-patcher-1.0.0.zip).
1. Unzip the manual patching tool archive. It extracts the following files:
    * archive-patcher-1.0.0.jar
    * patch-archive.bat
    * patch-archive.sh
1. Open the terminal window and navigate to the folder containing the extracted files.
1. Use the manual patching tool to search, list, and replace all the struts2 jar files. To search and replace the struts2-core-2.5.30 jar file and struts2-core.jar:

    
>[!BEGINTABS]

>[!TAB Windows]

1. Run the following command to list all the    struts2            jar files:

        ```

        patch-archive.bat                  -root=C:\Adobe\Adobe_Experience_Manager_Forms\.            ..\export -pattern=.*struts2-core-2.5.   30.jar$

        ```

        Replace the path in the above command with path of your AEM Form server.

1. Run the following commands in the listed order    for           recursive in-place replacement:

        ```
        
        patch-archive.bat                  -root=C:\Adobe\Adobe_Experience_Manager_Forms\.            ..\export -pattern=.*struts2-core-2.5.   30.jar$     -action=replace    C:\temp\struts2-core-2.5.33.jar

        
        patch-archive.bat                  -root=C:\Users\labuser\Desktop\check    -pattern=.         *struts2-core.jar$    -action=replace           C:\Users\labuser\Desktop\struts2-core.   jar          -action=replace           C:\Users\labuser\Desktop\struts2-core.jar
        
        ```

        Replace the path in the above command with  path of your AEM Form server and the           `struts2-core-2.5.33.jar` file.

1. Start your AEM Forms Server. 


>[!TAB Linux]

1. Run the following command to list all the    struts2            jar files:

        ```

        patch-archive.sh                   -root=\Users\labuser\Adobe\Adobe_Experience_Man            ager_Forms\...\export    -pattern=.         *struts2-core-2.5.30.jar$

        ```

        Replace the path in the above command with path of your AEM Form server.

1. Run the following commands for recursive    in-place            replacement:

        ```
        
        patch-archive.sh                   -root=\Users\labuser\Adobe\Adobe_Experience_Man            ager_Forms\...\export    -pattern=.         *struts2-core-2.5.30.jar$    -action=replace        \temp\struts2-core-2.5.   33.jar

        
        patch-archive.sh                   -root=\Users\labuser\Desktop\check    -pattern=.   *struts2-core.jar$    -action=replace                  \Users\labuser\Desktop\struts2-core.   jar                -action=replace            \Users\labuser\Desktop\struts2-core.jar
        
        ```

        Replace the path in the above command with    path of your AEM Form server and the    `struts2-core-2.5.33.jar` file.

1. Start your AEM Forms Server. 

>[!ENDTABS]




<!-- 
### Manual patching tool 


>[!BEGINTABS]

>[!TAB Windows]

    ```
    
    patch-archive.bat [-root=dir-or-file] [-pattern=regex] [-action=list(default)|delete|replace <replacement-file>]

    ```

* **dir-or-file**: Specifies path of directory containing multiple archives to patch. The default path for AEM Forms on JEE is <>. 
* **regex**: Specifies regular expression identifying a file or an archive entry to patch. It is tested against each file's or archive entry's absolute path. For example, the pattern `.*struts2-core-2.5.30.jar$` search for all the lines that end with the exact string `struts2-core-2.5.30.jar`.
* **list**: Lists the matched files or archive entries. It recursively searches for and reports all instances of the supplied pattern matched in any entry present in any archive file (zip/jar/war/ear) inside the supplied root directory. No changes are made to any file. It is the default action of the tool, when no action is specified.
* **delete**: Deletes the matched files or archive entries. If the matched entity is an archive, deletion happens before traversing it. This prevents any potentially matching entries inside it from being reported.  
* **replace**: Substitutes the matched files or archive entries with the supplied replacement. If the matched entity is an archive, replacement happens before traversing it. This prevents any potentially matching entries inside it from being reported.

>[!TAB macOS]

    ```
    
    patch-archive.sh [-root=dir-or-file] [-pattern=regex] [-action=list(default)|delete|replace <replacement-file>]

    ```

* **dir-or-file**: Specifies path of directory containing multiple archives to patch. The default path for AEM Forms on JEE is <>. 
* **regex**: Specifies regular expression identifying a file or an archive entry to patch. It is tested against each file's or archive entry's absolute path. For example, the pattern `.*struts2-core-2.5.30.jar$` search for all the lines that end with the exact string `struts2-core-2.5.30.jar`.
* **list**: Lists the matched files or archive entries. It recursively searches for and reports all instances of the supplied pattern matched in any entry present in any archive file (zip/jar/war/ear) inside the supplied root directory. No changes are made to any file. It is the default action of the tool, when no action is specified.
* **delete**: Deletes the matched files or archive entries. If the matched entity is an archive, deletion happens before traversing it. This prevents any potentially matching entries inside it from being reported.  
* **replace**: Substitutes the matched files or archive entries with the supplied replacement. If the matched entity is an archive, replacement happens before traversing it. This prevents any potentially matching entries inside it from being reported.  

>[!TAB Linux]

    ```
    
    patch-archive.sh [-root=dir-or-file] [-pattern=regex] [-action=list(default)|delete|replace <replacement-file>]

    ```

* **dir-or-file**: Specifies path of directory containing multiple archives to patch. The default path for AEM Forms on JEE is <>. 
* **regex**: Specifies regular expression identifying a file or an archive entry to patch. It is tested against each file's or archive entry's absolute path. For example, the pattern `.*struts2-core-2.5.30.jar$` search for all the lines that end with the exact string `struts2-core-2.5.30.jar`.
* **list**: Lists the matched files or archive entries. It recursively searches for and reports all instances of the supplied pattern matched in any entry present in any archive file (zip/jar/war/ear) inside the supplied root directory. No changes are made to any file. It is the default action of the tool, when no action is specified.
* **delete**: Deletes the matched files or archive entries. If the matched entity is an archive, deletion happens before traversing it. This prevents any potentially matching entries inside it from being reported.  
* **replace**: Substitutes the matched files or archive entries with the supplied replacement. If the matched entity is an archive, replacement happens before traversing it. This prevents any potentially matching entries inside it from being reported.  



>[!ENDTABS]









--> 