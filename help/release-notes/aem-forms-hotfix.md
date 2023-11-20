---
title: Hotfix for AEM Form Service Pack
description: Provides information on how to download and install the hotfix for AEM Forms Service Pack
---

# Adobe Experience Manager Hotfixes{#aem-form-hotfix}

The installation of the latest [AEM Forms Service Pack](/help/release-notes/release-notes.md) is recommended that includes security, performance, stability, and key customer fixes and enhancements released since the general availability of Adobe Experience Manager 6.5. 

## Hotfixes for Adaptive Forms {#hotfix-for-adaptive-forms}

<table>
  <tbody>
  <tr>
    <td><strong>Date</strong></td>
    <td><strong>Hotfix Names</strong></td>
    <td><strong>Fixes</strong></td>
   </tr>
   <tr>
    <td>November 20, 2023</td>
     <td>
     <ul>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-linux-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Linux</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-win-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Windows</a> </li>
     <li><a href="https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/fd/adobe-aemfd-osx-pkg-6.0.1016-002.zip">Hotfix for AEM Service Pack 6.5.18.0 for Mac OS</a></li>
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

## Downloading and installing Hotfix {#download-install-hotfix}

Perform the following steps to download and install the Hotfix:

  1. Download [Hotfix](#hotfix-for-adaptive-forms) from the SD link.
  1. Extract the Hotfix archive file so you can obtain an Experience Manager package (.zip) and bundle (.jar) files.
  1. Upload and install the package (.zip) via the Package Manager.
  1. Open the configuration manager bundles `https://server:host/system/console/bundles`, upload, and install the bundle (.jar). 
