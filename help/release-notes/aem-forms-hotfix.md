---
title: Hotfixes for AEM Forms 
description: Provides information on how to download and install a hotfix for AEM Forms. 
exl-id: 37287332-3c8d-4ddc-a77e-3c5ee332898b
---
# Adobe Experience Manager Forms Hotfixes{#aem-form-hotfix}

This article lists the critical fixes implemented to address known issues, improve system stability, and enhance overall performance of AEM Forms. 

>[!NOTE]
>
> The hotfixes are designed to be cumulative, encompassing all preceding fixes. When you apply the latest hotfix to a release, it not only addresses the most recent issue but also incorporates all prior bug fixes and enhancements.

## Hotfixes for Adaptive Forms {#hotfix-for-adaptive-forms}

<table>
  <tbody>
  <tr>
    <td><strong>Date</strong></td>
    <td><strong>Hotfix download link (AEM Software Distribution link)</strong></td>
    <td><strong>Fixed issues</strong></td>
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
    <li>On AEM Forms on the JEE server, the HTML5 Forms that make use of the context path fail to render. (FORMS-12485).</li>
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
    <li> The OOTB Scribble Signature component fails to render for a preview in an adaptive form. (FORMS-12073).</li>
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

## Download and install a Hotfix {#download-install-hotfix}

Perform the following steps to download and install the Hotfix:

  1. Download [Hotfix](#hotfix-for-adaptive-forms) from the Software Distribution link.
  1. Extract the Hotfix archive file so you can obtain an Experience Manager package (.zip) and bundle (.jar) files.
  1. Upload and install the package (.zip) via the [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/content/sites/administering/contentmanagement/package-manager.html?lang=es#accessing).
  1. Open the configuration manager bundles `https://server:host/system/console/bundles`, upload, and install the bundle (.jar). The hotfix is installed. 
