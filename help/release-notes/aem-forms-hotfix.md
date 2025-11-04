---
title: Hotfixes for AEM Forms 
description: Provides information on how to download and install a hotfix for AEM Forms. 
exl-id: 37287332-3c8d-4ddc-a77e-3c5ee332898b
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
---
# Adobe Experience Manager Forms Hotfixes{#aem-form-hotfix}

This article lists the critical fixes implemented to address known issues, improve system stability, and enhance overall performance of AEM Forms. 

>[!NOTE]
>
> The hotfixes are designed to be cumulative, encompassing all preceding fixes. When you apply the latest hotfix to a release, it not only addresses the most recent issue but also incorporates all prior bug fixes and enhancements.

## Hotfixes for AEM Forms {#hotfix-for-aem-forms}

<table>
  <tbody>
  <tr>
    <td><strong>Date</strong></td>
    <td><strong>Hotfix download link (AEM Software Distribution link)</strong></td>
    <td><strong>Fixed issues</strong></td>
  </tr>
  <tr>
    <td>
      <strong>Oct 14, 2025</strong><br>
      <em>Applies to:</em> ImgToPdf is failing with AEM Forms SP23 Jboss<br>
    </td>
    <td>
    <ul> For resolution, contact  <a href="https://business.adobe.com/in/support/main.html">Adobe Experience Manager Forms Support</a>
    </ul>
    </td>
    <td>
    <ul>
    <li> <b>(FORMS-22029):</b> Improves PDF conversion reliability by addressing an issue where PDF Generator (PDFG) fails to convert image files to PDF after upgrading to SP23, causing unexpected post-processing errors.
      <ul>
  <tr>
    <td>
      <strong>Sept 23, 2025</strong><br>
    </td>
    <td>
    <ul>
    <strong>Jboss:</strong>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/jboss/adobe-aem-forms-jee-hotfix3-6.5.23.0-win-jboss.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for JBoss JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/jboss/adobe-aem-forms-jee-hotfix3-6.5.23.0-linux-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for JBoss JEE server</a></li>
    <strong>Weblogic:</strong>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/weblogic/adobe-aem-forms-jee-hotfix3-6.5.23.0-win-weblogic.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Weblogic JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/weblogic/adobe-aem-forms-jee-hotfix3-6.5.23.0-linux-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Weblogic JEE server</a></li>
    <strong>Websphere:</strong>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/websphere/adobe-aem-forms-jee-hotfix3-6.5.23.0-win-websphere.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Websphere JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-23-0-hotfix-3/websphere/adobe-aem-forms-jee-hotfix3-6.5.23.0-linux-websphere.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Websphere JEE server</a></li>
    </ul>
    </td>
    <td>
    <ul>
    <strong>This hotfix fixes the following:</strong> 
    <li> <b>(FORMS-21378):</b> Improved form submission reliability by addressing an issue where submissions fail when Server-Side Validation (SSV) is enabled and computed Meta Info is empty.

   <li> <b>(FORMS-21721):</b> Improved an issue where PS to PDF and HTML to PDF (WebKit) conversions fail after deploying  the hotfix (released on <b>Aug 05, 2025</b>) for 6.5.23.0. 
    </li>
    </ul>
    </td>    
  </tr>
    </ul>
    </td>
  <tr>
    <td>
      <strong>Aug 05, 2025</strong><br>
      <em>Applies to:</em> AEM 6.5 Forms Service Pack 23<br>
      <em>Setup instructions:</em>
      <a href="/help/forms/using/mitigating-xxe-and-configuration-vulnerabilities-for-experience-manager-forms-jee.md#option-1-for-users-on-version-65230-install-latest-hotfix">
        Mitigating XXE, Configuration, and Remote Code Execution (CVE-2025-49533) Vulnerabilities for AEM Forms on JEE
      </a>
    </td>
    <td>
    <ul>
    <li><strong>Jboss:</strong></li>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/jboss/adobe-aem-forms-jee-hotfix2-6.5.23.0-win-jboss.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for JBoss JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/jboss/adobe-aem-forms-jee-hotfix2-6.5.23.0-linux-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for JBoss JEE server</a></li>
    <li><strong>Weblogic:</strong></li>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/weblogic/adobe-aem-forms-jee-hotfix2-6.5.23.0-win-weblogic.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Weblogic JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/weblogic/adobe-aem-forms-jee-hotfix2-6.5.23.0-linux-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Weblogic JEE server</a></li>
    <li><strong>Websphere:</strong></li>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/websphere/adobe-aem-forms-jee-hotfix2-6.5.23.0-win-websphere.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Websphere JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-02/websphere/adobe-aem-forms-jee-hotfix2-6.5.23.0-linux-websphere.zip">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Websphere JEE server</a></li>
    </ul>
    </td>
    <td>
    <ul>
    <li>Enhanced security by addressing a Remote Code Execution (RCE) vulnerability in Adobe Experience Manager (AEM) Forms. The issue was related to Struts development mode in the admin user interface (UI), which allowed arbitrary Object-Graph Navigation Language (OGNL) evaluation through debug functionality. This fix ensures that Struts development mode is disabled and appropriate security filters are applied to prevent unauthorized access.</li>
    <li>Improved protection against Extensible Markup Language (XML) External Entity (XXE) vulnerabilities in the Electronic Document Component (EDC) module of Adobe Experience Manager (AEM) Forms. The vulnerabilities were due to improper handling of XML documents without XXE protections, which could lead to local file reads. The fix includes:
      <ul>
        <li>Ensuring that the DocumentBuilderFactory used in the SecurityCheckHandler class is configured to prevent XXE attacks.</li>
        <li>Updating the EDC web service to handle XML documents securely, preventing unauthorized access to local files.</li>
      </ul>
    </li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>
      <strong>Aug 05, 2025</strong><br>
      <em>Applies to:</em> AEM 6.5 Forms Service Pack 18 – 22<br>
      <em>Setup instructions:</em>
      <a href="/help/forms/using/mitigating-xxe-and-configuration-vulnerabilities-for-experience-manager-forms-jee.md#option-2-for-users-on-65180---65220-manual-hotfix-installation">
        Manual Hotfix Installation for Service Packs 18–22
      </a>
    </td>
    <td>
    <ul>
    <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/adobe-xxe-configuration-hotfix.zip">Patch for AEM 6.5 Forms Service Pack 18 - AEM 6.5 Forms Service Pack 22 </a></li>
    </ul>
    </td>
    <td>
    <ul>
    <li>Enhanced security by addressing a Remote Code Execution (RCE) vulnerability in Adobe Experience Manager (AEM) Forms. The issue was related to Struts development mode in the admin user interface (UI), which allowed arbitrary Object-Graph Navigation Language (OGNL) evaluation through debug functionality. This fix ensures that Struts development mode is disabled and appropriate security filters are applied to prevent unauthorized access.</li>
    <li>Improved protection against Extensible Markup Language (XML) External Entity (XXE) vulnerabilities in the Document Security module of Adobe Experience Manager (AEM) Forms. The vulnerabilities were due to improper handling of XML documents without XXE protections, which could lead to local file reads. The fix includes:
      <ul>
        <li>Ensuring that the DocumentBuilderFactory used in the SecurityCheckHandler class is configured to prevent XXE attacks.</li>
        <li>Updating the Document Security web service to handle XML documents securely, preventing unauthorized access to local files.</li>
      </ul>
    </li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>Jul 10, 2025-</td>
    <td>
    <ul>
    <li><strong>Jboss:</strong></li>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/jboss/adobe-aem-forms-jee-hotfix-6.5.23.0-win-jboss.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for JBoss JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/jboss/adobe-aem-forms-jee-hotfix-6.5.23.0-linux-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for JBoss JEE server</a></li>
    <li><strong>Weblogic:</strong></li>
    <li>Windows- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/weblogic/adobe-aem-forms-jee-hotfix-6.5.23.0-win-weblogic.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Weblogic JEE server</a></li>
    <li>Linux- <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/weblogic/adobe-aem-forms-jee-hotfix-6.5.23.0-linux-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Weblogic JEE server</a></li>
    <li><strong>Websphere:</strong></li>
    <li>Windows: <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/websphere/adobe-aem-forms-jee-hotfix-6.5.23.0-win-websphere.zip">Hotfix for AEM Service Pack 6.5.23.0 on Windows for Websphere JEE server</a></li>
    <li>Linux: <a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-2/websphere/adobe-aem-forms-jee-hotfix-6.5.23.0-linux-websphere.tar.gz">Hotfix for AEM Service Pack 6.5.23.0 on Linux for Websphere JEE server</a></li>
    </ul>
    </td>
    <td>
    <ul>
    <li><strong>This hotfix fixes the following:</strong>
      <ul>
        <li><strong>FORMS-20533:</strong> AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x for the forms component. This delivers previously missed Struts changes that were not included in SP23. The support was added via a Hotfix that you can download and install to add support for the latest version of Struts.</li>
        <li><strong>FORMS-20532:</strong> AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x for the output component. This delivers previously missed Struts changes that were not included in SP23. The support was added via a Hotfix that you can download and install to add support for the latest version of Struts.</li>
        <li><strong>FORMS-20203:</strong> When a user upgrades Struts from AEM Service Pack 2.5.x to AEM Forms Service Pack 6.x, the Policies UI fails to display all configurations, such as the option to add a watermark. You can download and install the Hotfix to resolve this issue.</li>
        <li><strong>FORMS-20360:</strong> After upgrading to AEM Forms Service Pack 6.5.23.0, the ImageToPDF conversion service fails with the error:<br>
        <code>17:15:44,468 ERROR [com.adobe.pdfg.GeneratePDFImpl] (default task-49) ALC-PDG-001-000-ALC-PDG-011-028-Error occurred while converting the input image file to PDF. com/adobe/internal/pdftoolkit/core/encryption/EncryptionImp</code><br>
        You can download and install the Hotfix to resolve this issue.</li>
      </ul>
    </li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>March 26, 2025 </br> </br> To install this fix, follow the instructions <a href="/help/forms/using/mitigating-spring-framework-vulnerabilities-for-aem-forms-on-jee.md"> Mitigating Spring Framework Vulnerabilities for AEM Forms on JEE</a>.</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/jboss/adobe-aem-forms-jee-hotfix-6.5.22.0-win-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Windows for JBoss JEE server </a> </li>
      <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/jboss/adobe-aem-forms-jee-hotfix-6.5.22.0-linux-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Linux for JBoss JEE server </a> </li>
       <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/weblogic/adobe-aem-forms-jee-hotfix-6.5.22.0-win-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Windows for Weblogic JEE server </a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/weblogic/adobe-aem-forms-jee-hotfix-6.5.22.0-linux-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Linux for Weblogic JEE server</a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/websphere/adobe-aem-forms-jee-hotfix-6.5.22.0-win-websphere.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Windows for Websphere JEE server </a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/aem-6-5-0-hotfix-vuln-30727/websphere/adobe-aem-forms-jee-hotfix-6.5.22.0-linux-websphere.tar.gz">Hotfix for AEM Service Pack 6.5.22.0 on Linux for Websphere JEE server</a> </li>
     </ul>
     </td>
    <td>
    <ul>
    <li>Mitigating Spring Framework Vulnerabilities for AEM Forms on JEE</li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>July 10, 2024</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/jboss/win/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-windows-jboss.zip.zip">Hotfix for AEM Service Pack 6.5.21.0 on Windows for JBoss JEE server </a> </li>
      <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/jboss/linux/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-linux-jboss.tar.gz">Hotfix for AEM Service Pack 6.5.21.0 on Linux for JBoss JEE server </a> </li>
       <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/websphere/win/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-windows-websphere.zip.zip">Hotfix for AEM Service Pack 6.5.21.0 on Windows for Webshpere JEE server </a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/websphere/linux/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-linux-websphere.tar.gz">Hotfix for AEM Service Pack 6.5.21.0 on Linux for Webshpere JEE server</a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/weblogic/win/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-windows-weblogic.zip.zip">Hotfix for AEM Service Pack 6.5.21.0 on Windows for Weblogic JEE server </a> </li>
        <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/aemforms-6-5-0-0089/weblogic/linux/adobe-aem-forms-jee-service-pack-6.5.21.0-hotfix-linux-weblogic.tar.gz">Hotfix for AEM Service Pack 6.5.21.0 on Linux for Weblogic JEE server</a> </li>
     </ul>
     </td>
    <td>
    <ul><li>When a user updates to AEM Forms Service Pack 20 (6.5.20.0) on JEE server and generates PDFs using output services, the PDFs render with accessibility issues. (LC-3922112)</li><li>Tagged PDFs generated using output service on AEM Forms JEE show "Inappropriate structure warning". (LC-3922038)</li><li>When a form is submitted on AEM Forms JEE, the instances of a repeating XML element are removed from the data. (LC-3922017)</li><li>When a user on a Linux environment renders an adaptive form (on JEE) in HTML, it fails to render properly. (LC-3921957)</li><li>When a user converts an XTG file to PostScript format using the Output Service on AEM Forms JEE, it fails with the error: AEM_OUT_001_003: Unexpected Exception: PAExecute Failure: XFA_RENDER_FAILURE. (LC-3921720)</li><li>After upgrading to AEM Forms Service Pack 18 (6.5.18.0) on JEE server, when a user submits a form, it fails to render HTML5 or PDF Forms and XMLFM crashes. (LC-3921718)
    </ul>
    </td>    
  </tr>
  <tr>
    <td>June 21, 2024</td>
     <td>
     <ul>
     <li><a href="https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fexperience.adobe.com%2F%23%2Fdownloads%2Fcontent%2Fsoftware-distribution%2Fen%2Faem.html%3Fpackage%3D%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2FPaperCaptureSvc.zip&data=05%7C02%7Cruchitas%40adobe.com%7Cf50f80aab6994875271a08dc91f2f137%7Cfa7b1b5a7b34438794aed2c178decee1%7C0%7C0%7C638545719814675925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=9pTrMfiMD%2B5kQezxsZwTdOmaaktxURR99d7f6wHr%2FWQ%3D&reserved=0">Hotfix for AEM Service Pack  6.5.21.0 or AEM Forms Service Pack 6.5.22.0 on JBoss JEE server </a> </li>
      <li><a href="https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fexperience.adobe.com%2F%23%2Fdownloads%2Fcontent%2Fsoftware-distribution%2Fen%2Faem.html%3Fpackage%3D%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2FPaperCaptureSvc.zip&data=05%7C02%7Cruchitas%40adobe.com%7Cf50f80aab6994875271a08dc91f2f137%7Cfa7b1b5a7b34438794aed2c178decee1%7C0%7C0%7C638545719814675925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=9pTrMfiMD%2B5kQezxsZwTdOmaaktxURR99d7f6wHr%2FWQ%3D&reserved=0">Hotfix for AEM Service Pack 6.5.21.0 or AEM Forms Service Pack 6.5.22.0 on Weblogic JEE server </a> </li>
       <li><a href="https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fexperience.adobe.com%2F%23%2Fdownloads%2Fcontent%2Fsoftware-distribution%2Fen%2Faem.html%3Fpackage%3D%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2FPaperCaptureSvc.zip&data=05%7C02%7Cruchitas%40adobe.com%7Cf50f80aab6994875271a08dc91f2f137%7Cfa7b1b5a7b34438794aed2c178decee1%7C0%7C0%7C638545719814675925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=9pTrMfiMD%2B5kQezxsZwTdOmaaktxURR99d7f6wHr%2FWQ%3D&reserved=0">Hotfix for AEM Service Pack 6.5.21.0 or AEM Forms Service Pack 6.5.22.0 on Webshpere JEE server </a> </li>
        <li><a href="https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fexperience.adobe.com%2F%23%2Fdownloads%2Fcontent%2Fsoftware-distribution%2Fen%2Faem.html%3Fpackage%3D%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2FPaperCaptureSvc.zip&data=05%7C02%7Cruchitas%40adobe.com%7Cf50f80aab6994875271a08dc91f2f137%7Cfa7b1b5a7b34438794aed2c178decee1%7C0%7C0%7C638545719814675925%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=9pTrMfiMD%2B5kQezxsZwTdOmaaktxURR99d7f6wHr%2FWQ%3D&reserved=0">Hotfix for AEM Service Pack 6.5.21.0 or AEM Forms Service Pack 6.5.22.0 on OSGi server </a> </li>
     </ul>
     </td>
    <td>
    <ul>
    <li> After upgrading to AEM Forms Service Pack 6.5.21.0 or AEM Forms Service Pack 6.5.22.0, the PaperCapture service fails to perform OCR (Optical Character Recognition) operations on PDFs. For installation instructions, refer to the <a href="/help/forms/using/papercapture-service-resolution.md"> troubleshooting</a> article.(CQDOC-21680) </li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>June 21, 2024</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2Fccm-ccr-content-10.0.206.zip">Hotfix for AEM Service Pack 6.5.21.0 </a> </li>
     </ul>
     </td>
    <td>
    <ul>
    <li>Draft letters with XML data are getting stuck in the loading state during preview. For downloading and installation instructions of the hotfix, refer to the<a href="#install-hotfix"> Download and install hotfix for draft letter issue</a> section.(FORMS-14521)</li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>May 16, 2024</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-win-pkg-6.0.1192-010.zip">Hotfix for AEM Service Pack 6.5.20.0 for Microsoft Windows</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-linux-pkg-6.0.1192-010.zip">Hotfix for AEM Service Pack 6.5.20.0 for Linux </a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-osx-pkg-6.0.1192-010.zip">Hotfix for AEM Service Pack 6.5.20.0 for Apple macOS</a> </li>
     </ul>
     </td>
    <td>
    <ul>
    <li>In an Adaptive Form based on an XDP with embedded scripts on checkboxes, the scripts are not executed for elements after such checkboxes. A hotfix is available for this issue. (FORMS-14244) </li>
     <li> Rows in the date picker widget are truncated when traversing through months in the pop-up widget for fields with Edit/Display pattern. A hotfix is available for this issue. (FORMS-13620) </li>
     <li>Form submissions are failing when trying to use the DOR (Document of Record) service in the backend. The error message encountered is: "Submit Action couldn't complete because Form Resource isn't correctly assigned." (FORMS-13798) </li>
     <li>When an Adaptive Form is submitted from an Adobe Experience Manager Publish instance to an Adobe Experience Manager Workflow, the workflow fails to save the attachments.  (FORMS-14209) </li>
     <li> On installing AEM 6.5 Forms Service Pack 20 package (AEM Forms add-on package for SP20),the AEM Sites user interface (UI) exhibits significant performance degradation.  (FORMS-13791) </li>
     <li>The prefill service fails with a null pointer exception in Interactive Communications. (CQDOC-21355)</li>
     <li>Configurations using the legacy cloud service for Adobe Analytics with user credential-based authentication, fail to function correctly, causing the failure of analytics rules to execute. (FORMS-15428)
    </ul>
    </td>    
  </tr>
  <tr>
    <td>January 29, 2024</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffd%2Fforms-foundation-qs-content-4.0.170-FORMS-12692-B0001.zip">Hotfix for AEM Service Pack 6.5.19.0 for Windows on JEE server</a> </li>
     </ul>
     </td>
    <td>
    <ul>
    <li>On AEM Forms on the JEE server, the HTML5 Forms that make use of the context path fail to render. (FORMS-12485, FORMS-12691).</li>
    </ul>
    </td>    
  </tr>
  <tr>
    <td>January 29, 2024</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffd%2Fadobe-aemfd-win-pkg-6.0.1016-004.zip">Hotfix for AEM Service Pack 6.5.18.0 for Microsoft Windows</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffd%2Fadobe-aemfd-linux-pkg-6.0.1016-004.zip">Hotfix for AEM Service Pack 6.5.18.0 for Linux</a></li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffd%2Fadobe-aemfd-osx-pkg-6.0.1016-004.zip">Hotfix for AEM Service Pack 6.5.18.0 for Apple macOS</a></li>
     </ul>
     </td>
    <td>
    <ul>
    <li> The out-of-the-box Scribble Signature component fails to render for a preview in an adaptive form. (FORMS-12073).</li>
    </ul>
    </td>    
   </tr>
   <tr>
    <td>November 20, 2023</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-linux-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Linux</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-win-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Microsoft Windows</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-osx-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Apple macOS</a></li>
     </ul>
     </td>
    <td>
    <ul>
    <li>Inline signing stops working, when a redirect URL is set in the guide container of an Adaptive Form. (FORMS-10493)</li>
    <li>Document of Record (DoR) templates fail to publish for localized Adaptive Forms. (FORMS-10535)</li>
    <li>Interactive Communication with large inline images fails to open in edit mode. (FORMS-10578)</li>
    </ul>
    </td>    
  </tr>
  <tbody>
</table>

## Download and install an OSGi Hotfix {#download-install-hotfix}

Perform the following steps to download and install the Hotfix:

  1. Download [Hotfix](#hotfix-for-adaptive-forms) from the Software Distribution link.
  1. Extract the Hotfix archive file so you can obtain an Experience Manager package (.zip) and bundle (.jar) files.
  1. Upload and install the package (.zip) via the [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/content/sites/administering/contentmanagement/package-manager.html?lang=es#accessing).
  1. Open the configuration manager bundles `https://server:host/system/console/bundles`, upload, and install the bundle (.jar). The hotfix is installed. 

## Install an JEE patch {#download-install-jee-patch}

For instructions to install a JEE patch, see the [AEM Forms JEE Patch Installer documentation](/help/release-notes/jee-patch-installer-65.md).


## Download and install hotfix for draft letter issue {#install-hotfix}
 
To resolve the issue, perform the following steps:

1. Download the [hotfix](#hotfix-for-adaptive-forms) from the Software Distribution portal.
2. Upload and install the package (.zip) using the [CRX Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/content/sites/administering/contentmanagement/package-manager.html?lang=es#accessing).
