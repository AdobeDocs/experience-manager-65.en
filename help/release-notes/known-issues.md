---
title: Known Issues
seo-title: Known Issues
description: Release notes specific to the Known Issues with Adobe Experience Manager 6.3.
seo-description: Release notes specific to the Known Issues with Adobe Experience Manager 6.3.
uuid: ef1d2c46-6478-4a6b-a42d-b1a7b142a9ef
contentOwner: msm-service
topic-tags: release-notes
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: 7c38fdbb-d4d1-456c-9fbb-ca64dcd86042
index: y
internal: n
snippet: y
---

# Known Issues{#known-issues}

This page keeps a list of known issues from Adobe Experience Manager 6.5 that was released in April 2019.

[Contact support](https://helpx.adobe.com/support/experience-manager.html) if you need more information about the known issues.

## Platform {#platform}

An issue is reported where the CRX-Quickstart, and its contents, are deleted.

On each of these actions, please ensure that the property "*htmllibmanager.fileSystemOutputCacheLocation*" is never an empty string:

1. Calling "*/libs/granite/ui/content/dumplibs.rebuild.html?invalidate=true*".  
2. Upgrading to AEM 6.5.   
3. Executing "lazy content migration" on AEM 6.5.

A [Knowledge Base](https://helpx.adobe.com/experience-manager/kb/avoid-crx-quickstart-deletion-in-aem-6-5.html) article is available with further details and the workaround for this issue.

<!--
Comment Type: draft

<h2>Hybrid Devices</h2>
-->

<!--
Comment Type: draft

<p>Hybrid Devices are not supported. Various issues can be encountered when using such devices. However, these procedures will solve most of the issues:</p>
<p>If you are using Chrome as browser:<br /> - Type chrome://flags/ in the address bar and press Enter.<br /> - Click on Enable touch events &gt; Disabled.<br /> - Restart the browser (all tabs and windows).<br /> <br /> If you are using Firefox as browser:<br /> - Type about:config in the address bar and press Enter.<br /> - Filter the settings to dom.w3c.<br /> - Make sure that the settings are 0 and false.<br /> - Restart Browser.</p>
<p>If you are using Edge as browser:</p>
<p>- Type about:flags in the address bar and press Enter.<br /> - Scroll down to Experimental features then Touch.<br /> - Click on option called "Enable touch events".<br /> - Select Always Off.<br /> - Restart Browser.</p>
<p><object data-extension-version="0.5.0.161" data-install-updates-user-configuration="true" data-supports-flavor-configuration="true" style="display: none;"> </object></p>
-->

<!--
Comment Type: draft

<h2>Platform</h2>
-->

<!--
Comment Type: draft

<ul>
<li><strong>Operations Dashboard: </strong>Progress bar is not shown when backup file is missing .zip extension. (GRANITE-10713)</li>
<li><strong>HTL:</strong> Java Use object with trailing whitespace in the package declaration freezes the SightlyJavaCompilerService (GRANITE-20836)</li>
<li><strong>Apache Felix/Sling:</strong> Config file still present in the repository even after configuration.delete() (GRANITE-20618)</li>
<li><strong>Cloud Settings:</strong> Console gets broken after editing configuration container (GRANITE-20726)</li>
<li><strong>Security: </strong>IMS integration fails with custom context path (GRANITE-20639)</li>
<li><strong>Security:</strong> Improve default JAAS Ranking of SSO, External and Default LoginModules (GRANITE-20590</li>
<li><strong>Tooling - CRX DE Lite:</strong> Ridge of properties view keeps moving up (GRANITE-12040)</li>
<li><strong>Tooling - CRX DE Lite:</strong> Cannot save changes to "Long" Value Types unless you double-click on Property Name (GRANITE-12351)<br /> </li>
<li><strong>Tooling - CRX DE Lite:</strong> ctrl+F search on open text files goes stuck on RegExp search (GRANITE-5996)<br /> </li>
<li><strong>Tooling - CRX DE Lite: </strong>Node property not displayed after renaming the node (GRANITE-7160)</li>
<li><strong>UI: </strong>Pulldown "more..." doesn't showing all elements when opened at a popover element on IE and Firefox (GRANITE-16326)</li>
<li><strong>UI:</strong> Info tooltip gets hidden when using fixed columns layout with 2 side-by-side columns (GRANITE-16869)</li>
<li><strong>UI:</strong> Unhandled error when impersonating as a user that does not exist (GRANITE-23228). Workaround by <a href="/sites/developing/using/customizing-errorhandler-pages.md">implementing an error handler</a> to customize error message.<br /> </li>
<li><strong><strong>Omnisearch: </strong></strong>Searches with backslash cause exception (GRANITE-11769)</li>
<li><strong>Omnisearch: </strong>Open "View Settings" in list view cause search filter to change (GRANITE-16524)</li>
<li><strong>Omnisearch:</strong> Wrong list of columnn configs shown when doing Assets search from Sites (GRANITE-16527)<br /> </li>
<li><strong>Omnisearch: </strong>Left rail predicates are getting along with the Omnisearch server request (GRANITE-20524)</li>
<li><strong>Omnisearch:</strong> Omnisearch does not support context paths (GRANITE-16044)</li>
</ul>
-->

<!--
Comment Type: draft

<h2>Sites</h2>
-->

<!--
Comment Type: draft

<p>...</p>
-->

## Assets {#assets}

<!--
Comment Type: remark
Last Modified By: Ashish Gupta . (asgupta)
Last Modified Date: 2019-04-07T14:59:21.958-0400
<p>Assets team is validating this list and shall update it on 4/8 or 4/9. The issues in 6.4 Assets are drafted.<br /> </p>
-->

* **Search: **Search does not result any returns if the search string contains leading space(s) ([OAK-4786](https://issues.apache.org/jira/browse/OAK-4786))

* **Folder Metadata Schema**: After adding a choice button, the ID and Value field are not rendered as expected and the delete functionality does not work. (CQ-4261144)
* When renaming an asset, it is not possible to use a whitespace in the asset name. (CQ-4266403)

<!--
Comment Type: draft

<ul>
<li><strong>Search: </strong>Search does not result any returns if the search string contains leading space(s) (<a href="https://issues.apache.org/jira/browse/OAK-4786">OAK-4786</a>)</li>
<li><strong>UI</strong>: Asset UI hangs after Copy-Paste and Select-All (CQ-4236142)</li>
<li><strong>UI</strong>: Unable to Move assets after lazy loading (CQ-4236134)</li>
<li><strong>Search</strong>:<strong> </strong>In Classic UI, Tags are not visible in Search (CQ-4235239)</li>
<li><strong>Reports</strong>:<strong> </strong>Error in Asset Modification Report creation (CQ-4239744)</li>
<li><strong>Reports</strong>:<strong> </strong>Scheduled, regular Asset report generation fails inconsistently (some reports remain queued) (CQ-4239089)</li>
<li><strong>Metadata</strong>:<strong> </strong>On adding multi value text field to Asset schema, required field cascading rule doesn’t work (CQ-4239333)</li>
<li><strong>BrandPortal</strong>:<strong> </strong>Publish to BrandPortal is not working for collections (CQ-4238731)</li>
<li><strong>Upload</strong>: When uploading assets with special characters in the file name, the validation error message about the unallowed characters is not displayed for each assets. While it is displayed for only the first asset, the interface clearly indicates to the user that the file name of the provided asset are not allowed. (CQ-4256876)</li>
</ul>
-->

<!--
Comment Type: draft

<h2>Dynamic Media</h2>
-->

<!--
Comment Type: draft

<p>...</p>
-->

<!--
Comment Type: draft

<h2>Communities</h2>
-->

<!--
Comment Type: remark
Last Modified By: Vishal. Gupta (vishgupt)
Last Modified Date: 2019-04-04T08:44:49.300-0400
<p>No known issues in AEM 6.5 Communities.</p>
-->

<!--
Comment Type: draft

<p>...</p>
-->

## Forms {#forms}

<!--
Comment Type: remark
Last Modified By: Vishal. Gupta (vishgupt)
Last Modified Date: 2019-04-04T08:45:41.038-0400
<p>Updated for AEM 6.5 Forms.</p>
-->

* When AEM Forms is installed on Linux oprating system, Digital Signature with Hardware Security Module do not work. (CQ-4266721)  
* (AEM Forms on WebSphere only) The **Forms Workflow **&gt; **Task Search** option does not return any result if you search for an **Administrator** with **Username** as the search criteria. (CQ-4266457)  

* AEM Forms fails to convert .tif and .tiff files with JPEG compression to PDF Documents. (CQ-4265972)
* The **AEM Forms Assets Scanner** and **Letter to Interactive Communication Migration** options do not work on the **AEM Forms Migration** page. (CQ-4266572)  

* (JBoss 7 only) When you upgrade from a previous version to AEM 6.5 Forms and the previous version had processes (.lca) that created and used a copy of the default submit or default render process, HTML5 Forms using such processes (.lca) fails to perform the required actions. (CQ-4243928)
* In an adaptive from, when a form data model service is invoked from the rule editor to dynamically update values of the image choice component, values of the image choice component are not updated. (CQ-4254754)  
* AEM Forms Designer installer requires the 32-bit version of [Visual C++ redistributable runtime package 2012](https://support.microsoft.com/en-in/help/2977003/the-latest-supported-visual-c-downloads) and [Visual C++ redistributable runtime packages 2013](https://support.microsoft.com/en-in/help/3179560/update-for-visual-c-2013-and-visual-c-redistributable-package). Ensure that the aforementioned redistributable runtime packages are installed before starting the installation. (CQ-4265668)

* When an adaptive form is configured to dynamically update values of a component and the publish instance that hosts the form is accessed through the dispatcher, the functionality to dynamically update values of a fields stop working. To resolve the issue, on the publish instance, open CRXDE, navigate to /libs/fd/af/runtime/clientlibs/guideChartReducer, and create the property listed in below.

    * Name: allowProxy
    * Type: Boolean
    * Value: true
    * Protected: False
    * Mandatory: False
    * Multiple: False
    * Auto Created: Flase

The property enables the client libraries under the runtime folder to access proxies. (CQ-4268679)

<!--
Comment Type: draft

<ul>
<li>(AEM Forms JEE only) When boostrapping JBoss application server while running Configuration Manager returns EJB invocation and bootstrap failure errors. However, you can ignore them. (Ref# CQ-4229793)</li>
<li>The Agent UI takes a while to load Interactive Communications that include chart or image elements. (Ref# CQ-4236630)</li>
<li>The data display format in print preview is dd-mm-yyyy while in the web preview is dd-mmm-yy (Ref# CQ-4237045)<br /> </li>
<li>The Interactive Communication Web channel supports only ordered and unordered lists. In list document fragments, compound listing and indentation are not supported for Web channel of the Interactive Communication. (Ref# CQ-4233672)</li>
<li>The following issues are observed when web channel syncs with print channel:
<ul>
<li>Web channel take a while to sync when switching from print channel for the first time.</li>
<li>Web channel does not sync if the print channel includes an unconfigured chart component. To resolve the issue, delete the chart component and sync again.</li>
<li>Sync sometimes fails with the "An error occurred while synchronizing the Live Copy" error. To resolve the issue, refresh the page.</li>
<li>The static text in a layout fragment is replaced with table cell name when the first column in the table is a header column in the print channel template.</li>
<li>Cannot add components or assets at any location other than at the bottom of a web channel communication. To place it at another location, add a panel at the bottom of web channel and reorder using the content tree.</li>
<li>Can move content into inherited target area of web channel without removing the live copy inheritance. (Ref# CQ-4239780)</li>
</ul> </li>
</ul>
<ul>
<li>Authentication configurations for SOAP-based web services are not visible and thus cannot be configured in cloud services. To resolve the issue:</li>
</ul>
<p style="margin-left: 40px;">1. In CRXDE Lite console, go to the following node.<br /> /libs/fd/fdm/gui/components/admin/fdmcloudservice/createcloudconfigwizard/cloudservices/<br /> wsdlauthenticationsettings/items/fixedcolumns/items/container/items/wsdl/items/<br /> selectAuthentication/items/custom.<br /> 2. Update the value of the value property to the same as the value of the text property.<br /> 3. Click Save All to save the configuration.</p>
<p>(Ref# CQ-4238462)</p>
-->

