---
title: Deprecated and Removed Features
seo-title: Deprecated and Removed Features
description: Release notes specific to deprecated and removed features in Adobe Experience Manager 6.5.
seo-description: Release notes specific to deprecated and removed features in Adobe Experience Manager 6.5.
uuid: 81d9a064-e712-4eff-bd3b-6e15513a5435
contentOwner: msm-service
topic-tags: release-notes
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5
discoiquuid: e8e2e01b-0117-48c3-86d8-609d29a147be
docset: aem65

---

# Deprecated and Removed Features{#deprecated-and-removed-features}

Adobe constantly evaluates product capabilities, to over time reinvent or replace older features with more modern alternatives to improve overall customer value, always under careful consideration of backward compatibility.

To communicate the impending removal/replacement of AEM capabilities, the following rules apply:

1. Announcement of deprecation comes first. While deprecated, capabiiities are still available, but they will not be further enhanced.
1. Removal of deprecated capabilities will occur in the following major release at the earliest. Actual target date for removal will be announced.

This process gives customers at least one release cycle to adapt their implementation to a new version or successor of a deprecated capability, before actual removal.

## Deprecated Features {#deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5. Generally, features that are planned to be removed in a future release are set to deprecated first, with an alternative provided.

Customers are advised to review if they make use of the feature/capability in their current deployment, and make plans to change their implementation to use the alternative provided.

<table>
 <tbody>
  <tr>
   <td>Area</td>
   <td>Feature</td>
   <td>Replacement</td>
  </tr>
  <tr>
   <td>Creative Cloud integration</td>
   <td><p><a href="/help/sites-administering/creative-cloud.md">AEM to Creative Cloud Folder Sharing</a> was introduced in AEM 6.2 as a way to give creative users access to assets from AEM, so that they could open them in CC applications and upload new files or save changes to AEM. A new capability released in Creative Cloud application, Adobe Asset Link, provides a much better user expereince and more powerful access to assets from AEM directly from inside Photoshop, InDesign, and Illustrator.</p> <p>Adobe does not plan to make further enhancements to the AEM to Creative Cloud Folder Sharing integration. While the feature is included in AEM, customers are strongly advised to use replacement solutions.</p> </td>
   <td>Customers are advised to switch to new Creative Cloud integration capabilities, including Adobe Assset Link or AEM Desktop App. Please review <a href="/help/assets/aem-cc-integration-best-practices.md">AEM and Creative Cloud Integration Best Practices</a> for more details.</td>
  </tr>
  <tr>
   <td>Assets</td>
   <td>
    <ol>
     <li>AssetDownloadServlet is disabled by default for the publish instances. For more details, see <a href="/help/sites-administering/security-checklist.md">AEM security checklist</a>.</li>
     <li>If a user does not have sufficient (read and write) permissions on /content/dam/collections, the user cannot create a Collection.</li>
    </ol> </td>
   <td>
    <ol>
     <li>Configuration described at <a href="/help/sites-administering/security-checklist.md">AEM Security checklist</a>.</li>
     <li>Honor the access control setup of user and ensure appropriate permissions.<br /> </li>
    </ol> </td>
  </tr>
  <tr>
   <td>Adobe Search &amp; Promote</td>
   <td><p>The integation with Adobe Search &amp; Promote is deprecated.</p> <p>Adobe does not plan to make further enhancements to the Search &amp; Promote integration. Note that Search &amp; Promote integration remains fully supported while being deprecated.</p> </td>
   <td> </td>
  </tr>
  <tr>
   <td>DTM Tag Manager</td>
   <td>The integration with DTM (Dynamic Tag Manager) is deprecated.</td>
   <td>Switch to use Adobe Experience Platform Launch as a tag manager</td>
  </tr>
  <tr>
   <td>Adobe Target</td>
   <td>With adding the ability for AEM to connect to Adobe Target service using the Adobe I/O based Adobe Target Standard API (Rest API) in AEM 6.5, the Target Classic API (XML) way is deprecated.</td>
   <td><a href="https://helpx.adobe.com/experience-manager/kt/sites/using/aem-sites-target-standard-technical-video-understand.html">Reconfigure the integration to use the new API</a></td>
  </tr>
  <tr>
   <td>Adobe Target</td>
   <td>Using the mbox.js based integration with Adobe Target in AEM is deprecated.</td>
   <td>Switch to use at.js 1.x</td>
  </tr>
  <tr>
   <td>Commerce</td>
   <td><p><a href="https://github.com/adobe/commerce-cif-api" target="_blank">CIF REST</a> was provided in 2018 as a set of microservices to enable integrations between AEM and commerce engines.</p> <p>After Adobe acquired Magento in mid 2018, Adobe decided to change its approach for two reasons: </p> <p><strong>1.</strong> Magento has its own set of Commerce APIs (REST and GraphQL) and it's not good practice to maintain two sets of APIs </p> <p><strong>2.</strong> Market trends indicated that customers were moving towards GraphQL, because it's a more efficient way of querying data. In 2019, Adobe has released the new Commerce Integration Framework using Magento's GraphQL APIs as the source of truth.</p> <p>Adobe doesn't plan to make any further investment in CIF REST. Customers are strongly advised to use the replacement solution.</p> </td>
   <td><p>For AEM-Magento integrations, switch to <a href="https://github.com/adobe/aem-cif-project-archetype" target="_blank">AEM CIF Archetype</a>, and <a href="https://github.com/adobe/aem-core-cif-components" target="_blank">AEM CIF Core Components</a></p> <p>Have a look at <a href="https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/integrations.html#!AdobeDocs/commerce-cif-documentation/master/integrations/02-AEM-Magento.md" target="_blank">AEM and Magento Integration using Commerce Integration Framework</a> for more information.</p> <p>Support for third party (other than Magento) integrations with the new approach is on our roadmap.</p> </td>
  </tr>
  <tr>
   <td>Components (AEM Sites)</td>
   <td><p>Adobe does not plan to make further enhancements to most of the Foundation Components stored in /libs/foundation/components.</p> <p>Look for the <strong>cq:deprecated</strong> and <strong>cq:deprecatedReason</strong> property in the component folder.</p> <p>AEM 6.5 has the Foundation Components included, and customers upgrading from earlier releases can keep using them as is. Further, the Foundation Components remain fully supported while being deprecated. </p> </td>
   <td>Customers are advised to use the Core Components for future projects. Existing sites can remain as is or use the <a href="https://github.com/adobe/aem-modernize-tools">AEM Modernize Tools Suite</a> to refactor the site to use Core Components.</td>
  </tr>
  <tr>
   <td>Components (AEM Sites)</td>
   <td>Design Importer Components /libs/wcm/designimporter/components have been marked as deprecated starting 6.5. Adobe does not plan to make further enhancements to that implementation of the design importer.</td>
   <td>Adobe is planning to provide an alternative implementation of the use case in future releases.</td>
  </tr>
  <tr>
   <td>Components (AEM Forms)</td>
   <td><p>Signature step allows users to verify and sign an adaptive form. In previous releases, the signature step could use both Adobe Sign and Scribble Signature components as signature fields. In AEM 6.5 Forms, Scribble Signature-based signing experience of Signature Step is deprecated.</p> </td>
   <td>
    <ul>
     <li>If you have performed a fresh installation:
      <ul>
       <li>Use Adobe Sign based signing experience within a Signature step in an adaptive form.</li>
       <li>Use standalone Scribble Signature component in an adaptive form, interactive communication, and HTML5 Forms.</li>
      </ul> </li>
     <li>If you have upgraded from a previous release to AEM 6.5 Forms:<br />
      <ul>
       <li>Continue using Scribble Signature-based signing experience of Signature Step with forms that already use the feature.<br /> </li>
       <li>Use standalone Scribble Signature component or Adobe Sign based signing experience within a Signature step, when you create a new form. </li>
      </ul> </li>
    </ul> <p> </p> <p> </p> </td>
  </tr>
  <tr>
   <td>Foundation</td>
   <td><p>Granite Offloading Framework</p> <p>Adobe does not plan to make further enhancements to the offloading framework that was introduced in 5.6.1 to externalize asset processing. </p> </td>
   <td>Adobe is working on a next-generation cloud-native offloading framework.</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>Hobbes.js </p> <p>Adobe does not plan to make further enhancements to the hobbes.js UI testing framework.</p> </td>
   <td>Adobe recommends customers to Selenium automation</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>jQuery UI client library</p> <p>Adobe does not plan to further maintain and update the jQuery UI client library that is shipped as part of the distribution (Quickstart)</p> </td>
   <td>Adobe recommends customers that still require jQuery UI for thier code to add it into thier project code base.</td>
  </tr>
  <tr>
   <td>Developres</td>
   <td><p>jQuery Animiation client library (granite.jquery.animation)</p> <p>Adobe does not plan to further maintain and update the jQuery Animation client library that is shipped as part of the distribution (Quickstart)</p> </td>
   <td>Adobe recommends customers that still require jQuery Animations for thier code to add it into thier project code base.</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>Handlebars client library</p> <p>Adobe does not plan to further maintain and update the Handlebar client library that is shipped as part of the distribution (Quickstart)</p> </td>
   <td>Adobe recommends customers that still require Handlebars for thier code to add it into thier project code base.</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>Lawnchair client library</p> <p>Adobe does not plan to further maintain and update the Lawnchair client library that is shipped as part of the distribution (Quickstart)</p> </td>
   <td>Adobe recommends customers that still require Lawnchair for thier code to add it into thier project code base.</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>Granite.Sling.js client library</p> <p>Adobe does not plan to further enhance the Granite.Sling.js client library that is shipped as part of the distribution (Quickstart)</p> </td>
   <td>Adobe recommends customers that are relying on the capablity of the library to refactor thier code to no longer use it.</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td>Using YUI to compress/minify JavaScript client libraries. Adobe does not plan to further update the YUI library. Up until AEM 6.4, YUI was default to minify JavaScript with the option to switch to Google Closure Compiler (GCC). Starting AEM 6.5, GCC is default.</td>
   <td>Adobe recommends customers that upgrade to AEM 6.5 to switch to GCC for thier implementation</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td><p>Classic UI Dialog Editor in CRXDE lite</p> <p>Adobe does not plan to further enhance the Classic UI Dialog Editor that is shipped as part of the distribution (Quickstart)</p> </td>
   <td> </td>
  </tr>
 </tbody>
</table>

## Removed Features {#removed-features}

This section lists features and capabilities that have been removed from AEM 6.5. Prior releases had these capabilites marked as depreacted.

<table>
 <tbody>
  <tr>
   <td><strong>Area </strong></td>
   <td><strong>Feature</strong></td>
   <td><strong>Replacement</strong></td>
  </tr>
  <tr>
   <td>Integrations</td>
   <td>ExactTarget integration has been removed from the default distribution (Quickstart) and it is no longer available.</td>
   <td>No replacement</td>
  </tr>
  <tr>
   <td>Integrations</td>
   <td>Salesforce Force API integration has been removed from the default distribution (Quickstart) and is now an extra package to install from PackageShare.</td>
   <td>Feature is still available.</td>
  </tr>
  <tr>
   <td>Forms</td>
   <td>Support for Adobe Central Migration Bridge service has been removed as Adobe Central product is no longer supported.</td>
   <td>No replacement<br /> </td>
  </tr>
  <tr>
   <td>Forms</td>
   <td>com.adobe.fd.df.fdinternal.model.ConfigurationInstance</td>
   <td>No replacement</td>
  </tr>
  <tr>
   <td>Forms<br /> </td>
   <td>com.adobe.fd.ccm.channels.print.fdinternal.api.service.PrintDataTransformer<br /> </td>
   <td>No replacement</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td>Firebug Lite has been removed from the default distribution (Quickstart)</td>
   <td>Use the browser built-in developer consoles</td>
  </tr>
  <tr>
   <td>Developers</td>
   <td>Remove customJavaScriptPath support in HTML Client Library Manager.</td>
   <td>No replacement</td>
  </tr>
  <tr>
   <td>Assets</td>
   <td>The Assets Offloading feature has been removed in AEM 6.5</td>
   <td>No replacement</td>
  </tr>
  <tr>
   <td>Cache</td>
   <td><code>system/console/slingjsp</code> is removed is no longer available in AEM 6.5.</td>
   <td>Classes and Slightly cache is stored under the <strong>Apache Sling Commons FileSystem ClassLoader</strong> bundle. You can check the bundle number in the <strong>AEM Web Console</strong> and remove the cache folder directly from the file system (<code>crx-quickstart/launchpad/felix/bundle&lt;ID&gt;</code>).</td>
  </tr>
 </tbody>
</table>

## Pre-announcement for Next Release {#pre-announcement-for-next-release}

This section is used to pre-announce changes in future release, that are not deprecated, but will impact customers. These are provided for planning purpose.

<table>
 <tbody>
  <tr>
   <td>Area<br /> </td>
   <td>Feature<br /> </td>
   <td>Annoucement</td>
  </tr>
  <tr>
   <td>Foundation</td>
   <td>UI Framework</td>
   <td>Adobe is planning to deprecate the Coral UI 2 components in 2019. Coral UI 3 was introduced with AEM 6.2, and AEM 6.5 is fully based on Coral 3. Adobe recommends customers and partners that have build custom UIs with Coral 2 to refactored them to Coral 3. Adobe is providing a tool to convert Coral 2 dialogs to Coral 3 - <a href="/help/sites-developing/dialog-conversion.md">Read more</a>.</td>
  </tr>
 </tbody>
</table>

