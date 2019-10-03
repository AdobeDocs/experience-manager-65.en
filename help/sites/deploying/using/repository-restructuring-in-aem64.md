---
title: Repository Restructuring in AEM 6.5
seo-title: Repository Restructuring in AEM 6.5
description: Learn about the repository restructuring in AEM 6.5
seo-description: Learn about the repository restructuring in AEM 6.5
uuid: bc577c82-3279-4ddd-898c-607864868db0
contentOwner: sarchiz
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: upgrading
discoiquuid: 274a7f5a-d509-4ca9-9ae5-30e48f34f171
docset: aem65
redirecttarget: /content/help/en/experience-manager/6-5/sites/deploying/using/repository-restructuring.html

---

# Repository Restructuring in AEM 6.5{#repository-restructuring-in-aem}

## Introduction {#introduction}

Prior to AEM 6.5, customer code was deployed in unpredictable areas of the JCR that were subject to change on upgrades. Because of this, it was common for formal AEM releases (Major Versions, Feature Packs, Service Packs or Hotfixes) to overwrite custom code, configuration or content. In addition, customer changes sometimes overwrote AEM product code or content, breaking product functionality.

These conflicts were not always auto-resolvable, requiring significant processing time to flag, and required human intervention to resolve, the resolution of which was not always clear. By clearly delineating hierarchies for AEM product code and customer code, these conflicts can be avoided.

To that end, beginning in AEM 6.5 and to be continued in future releases, content is being restructured out of `/etc` to other folders in the repository, along with guidelines on what content goes  where,  adhering to the following high-level rules:

* AEM product code will always be placed in `/libs`, which must not be overwritten by custom code
* Custom  code should be placed in `/apps`, `/content`, and `/conf`

This article is organized into three sections, representing the type of content that has been moved out of `/etc`:

1. Configuration
1. Client-Side Libraries
1. Miscellaneous

Each section includes:

* a table with the restructured locations and additional context. In the near future, it is expected that the tables will be formatted into a flatter structure for improved readability.
* an extensibility strategy allowing custom code to successfully extend AEM application code residing under `/libs`.

## Backwards Compatibility {#backwards-compatibility}

In most cases,  backwards  compatibility to the old locations is maintained after upgrading to AEM 6.5. This is achieved by the old locations being preserved and respected by product code, in addition to the new locations being added. In most cases, conditional logic is used to check if the legacy folder exists and to read content from there instead of the new location.

On their own timeline after the 6.5 upgrade, customers are encouraged to remove the old locations so content in the new locations is used. The tables below  includes  instructions to adhere to the new content structure per-location.

>[!NOTE]
>
>An in-place upgraded instance will include old content locations in addition to the new locations. A fresh developer install will only include the new locations.

## How to Read the Tables {#how-to-read-the-tables}

The table in each section includes:

* the AEM solution (Sites, Assets, Forms, etc) for which this content is relevant
* the old (6.4 and earlier) location
* the new 6.5 location
* Instructions to align with the new content structure. For example, it may be necessary to execute a script or to move files manually in the weeks or months after a 6.5 upgrade
* The approach that AEM has used to maintain backwards compatibility of old content locations for customers upgrading to AEM 6.5 from a previous version

## Configuration {#configuration}

The content locations in this section generally refer to content that resides under a `/settings` folder under `/libs`, `/apps`, or `/conf`.

### Extensibility Strategy {#extensibility-strategy}

In general, but with a few exceptions, content under this section can be extended using Apache Sling's [   Context Aware   Configuration](https://sling.apache.org/documentation/bundles/context-aware-configuration/context-aware-configuration.html) feature.

In a nutshell,  Context Aware  Configuration allows content in one part of the repository to be overlayed multiple times by content in other parts of the repository. For example, content in `/libs` can be overlayed by  content  in `/apps`, which can then be overlayed by  content  in `/conf`. Moreover, content in a global folder under `/conf` can be overlayed by a specific "tenant" or "site" (e.g. `/conf/we-retail/settings`).

Typically,   Context Aware   Configuration is used as a strategy for extending feature configurations, but there are cases where it's used by other content types.

The table below includes an additional column named "Configuration Type" to explain the extent to which a  configuraiton  can be overlayed. Here is additional detail on these configuration types:

**not context-aware**

* Resources happen to be in context-aware folder structures (like `/libs/settings`) but always referenced via absolute path so context awareness is not in effect.
* Resources could be anywhere. For example, Assets DRM Licenses could be at `/content/my-customer/licenses/creative-commons.html`
* Examples:

    * Workflow scripts -> `/apps/settings/workflow/scripts/noop.ecma`
    * Assets DRM Licenses -> `/apps/settings/dam/drm/my-license`

**only global**

* Feature with only Global Configuration
* As a reference point, take the precedence of settings in this example: `/libs/settings` < `/apps/settings` < `/conf/global`

* AEM supports only global configuration, and not tenant-ized configurations
* AEM will always begin to look up configurations at the /conf/global level first

* Examples:

    * Workflow Launchers -> `/libs/settings/workflow/launcher`
    * Workflow Models -> `/conf/global/settings/workflow/models`

**tenant-aware**

* For tenant-aware configurations, see this example for the precedence of configuration paths: `/libs/settings` < `/apps/settings` < `/conf/global` < `/conf/we-retail`, where we-retail is the tenant name. Tenant-aware configurations also support sub-tenants.

* AEM supports tenantized configurations. It respects `cq:conf` property on hierarchy
* Examples:

    * Editable Templates -> `/conf/we-retail/settings/wcm/templates`
    * Cloud Configs -> `/conf/we-retail/settings/cloudsettings`

<table>
 <tbody> 
  <tr> 
   <td><strong>Solution</strong></td> 
   <td><strong>Previous Location</strong><br /> </td> 
   <td><strong>New Location</strong></td> 
   <td><strong>Context Aware Configuration Type</strong><br /> </td> 
   <td><strong>Backward Compatibility Approach</strong></td> 
   <td><strong>Requirements to align to latest model</strong></td> 
  </tr> 
  <tr> 
   <td>AEM Sites / AEM Forms</td> 
   <td><p><code>/etc/cloudservices/typekit</code></p> <p><code>/etc/cloudservices/recaptcha</code></p> <p><code>/etc/cloudservices/echosign</code></p> </td> 
   <td><p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/typekit</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/recaptcha</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/echosign</code></p> </td> 
   <td>tenant-aware</td> 
   <td><p>Legacy cloudservices.</p> <p>Persisted on an in-place upgrade. Code to list and read them still present in AEM as a fallback.</p> </td> 
   <td>Lazy content migration utility can be triggered by Forms Migration UI, in order to automatically convert to the new path.<br /> </td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/cloudservices/fdm</code></td> 
   <td><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/fdm</code></td> 
   <td>tenant-aware</td> 
   <td><p>Legacy cloudservices.</p> <p>Persisted on an in-place upgraded setup. Code to list and read them still present in AEM as a fallback.</p> </td> 
   <td>Lazy content migration utility can be triggered by Forms Migration UI, in order to automatically convert to the new path.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/adhocassetshare</code></td> 
   <td><code>/libs/settings/dam/adhocassetshare</code></td> 
   <td>tenant-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, OOTB ones.</td> 
   <td>Project level customizations need to be cut and pasted into the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/workflow/notification/email/downloadasset</code></td> 
   <td><code>/libs/settings/dam/workflow</code></td> 
   <td>tenant-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, OOTB ones.</td> 
   <td>Project level customizations need to be cut and pasted into the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/drm/licenses/</code></td> 
   <td><code>/libs/settings/dam/drm</code></td> 
   <td>not context-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, OOTB ones.</td> 
   <td>Project level customizations need to be cut and pasted into the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/indesign/scripts</code></td> 
   <td><code>/libs/settings/dam/indesign</code></td> 
   <td>tenant-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, OOTB ones.</td> 
   <td><p>Project level customizations need to be cut and pasted under the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</p> <p>When running customized Asset Ingestion workflow, references to the old location in /etc would still exist in the Media Extraction Process Configuration. Along with moving the scripts out of /etc to the equivalent /apps and /conf paths, customized Media Extraction process arguments need to be changed from absolute to relative paths, to accommodate for the changes.</p> <p>For more info, see <a href="https://helpx.adobe.com/experience-manager/6-2/assets/using/indesign.html">this page</a>.</p> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/video</code></td> 
   <td><code>/libs/settings/dam/video</code></td> 
   <td>tenant-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, out of the box ones.</td> 
   <td>Project level customizations need to be cut and pasted into the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/notification/email/default</code></td> 
   <td><code>/libs/settings/dam/notification</code></td> 
   <td>tenant-aware</td> 
   <td>Legacy content structures are honored with a higher priority than new, out of the box ones.</td> 
   <td>Project level customizations need to be cut and pasted into the equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites / AEM Assets</td> 
   <td><code>/etc/designs</code><br /> </td> 
   <td><code>/libs/settings/wcm/designs</code></td> 
   <td>not context-aware</td> 
   <td><p>Consuming Services are aware of old location.</p> <p>Configurations from the legacy location are considered</p> </td> 
   <td><br /> Move custom content from <code>/etc/design</code> to <code>/apps/settings/wcm/design</code> for alignment with the new repository structure. In the future, consider upgrading your sites to use editable templates functionality, which replaces the need for design mode and thus this content.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/scaffolding</code></td> 
   <td><p><code>/libs/settings/wcm/template-types/scaffolding/scaffolding</code></p> <p><code>/apps/settings/wcm/template-types/scaffolding/scaffolding</code></p> </td> 
   <td>not contex-aware</td> 
   <td>The components in the old location under <code>/etc/scaffolding</code> will continue to function, but have been deprecated.</td> 
   <td>Adobe recommends you use the new scaffold components under the new location.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/blueprints</code></td> 
   <td><p>/libs/msm for out of the box Screens and Commerce blueprint configurations</p> <p> </p> </td> 
   <td>not context-aware</td> 
   <td><p>Consuming Services are aware of the old location.</p> <p>Configurations from the legacy location are considered.</p> </td> 
   <td>The configurations need to be copied over to the new locations.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/mobile</code></td> 
   <td><code>/libs/settings/mobile</code></td> 
   <td>tenant-aware</td> 
   <td>The feature leverages the Configuration Manager and still supports the old location as fallback.</td> 
   <td> 
    <ol> 
     <li>Relocate the configurations from <code>/etc</code> to <code>/conf/&lt;tenant&gt;/settings/mobile</code></li> 
     <li>Then, update the reference in the content as follows:</li> 
    </ol> <p><code>/content/&lt;tenant&gt;/jcr:content/cq:deviceGroups{String[]}=mobile/groups/responsive</code></p> </td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/msm/rolloutConfigs</code></td> 
   <td><code>/libs/msm/wcm/rolloutconfigs</code></td> 
   <td>N/A</td> 
   <td><p>Consuming services are aware of the old location.</p> <p>If configurations are detected in the legacy location, they will be used.</p> </td> 
   <td>To align with the new model, configurations need to be created in the new locations, and the old ones under <code>/etc</code> must be deleted.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/segmentation/contexthub</code></td> 
   <td><code>/conf/we-retail/settings/wcm/segments</code></td> 
   <td>tenant-aware</td> 
   <td><p>Segments from the old location:</p> 
    <ul> 
     <li>Remain in read-only mode in audience console.</li> 
     <li>Still loaded on the page (if the given path is selected in <strong>Page Properties &gt; Personalization &gt; Segments Path</strong>).</li> 
     <li>Can be used for content targetting.</li> 
    </ul> </td> 
   <td>You can use the <a href="../../../sites/deploying/using/upgrading-code-and-customizations.md#migrateconfigurations" target="_blank">Segments Migration Tool</a> to migrate to the new location.</td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/social/config/languageOpts</code></td> 
   <td><code>/libs/social/translation/languageOpts</code></td> 
   <td>N/A</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/community/templates</code></td> 
   <td><code>/libs/settings/community/templates</code></td> 
   <td> </td> 
   <td><p>The code is aware of the location of the old template. Existing templates will continue to be referred and read/write from <code>/etc</code>.</p> <p><br /> For e-mail templates, if the customer was already having his custom templates at another path by configuring <strong>Templates root</strong> path in <strong>AEM Communities Email Reply Configuration</strong> then it would stay as it is.</p> </td> 
   <td><p>A <a href="https://github.com/Adobe-Marketing-Cloud/aem-communities-ugc-migration/tree/master/bundles/communities-template-migration" target="_blank">migration utility</a> can align to the latest AEM Communities templates model.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/community/badging</code></td> 
   <td><p><strong>Badge Rules:</strong></p> <p><code>/libs/settings/community/badging</code></p> <p><strong>Badge Images:</strong></p> <p>The out of the box images in the old location at <code>/etc/community/badging/images</code> are moved to <code>/libs/community/badging/images </code> </p> <p> </p> <p>Custom images are moved to <code>/content/community/badging/images</code>.</p> <p> </p> </td> 
   <td>tenant-aware</td> 
   <td><p>The code is aware of the old badging paths.</p> <p><br /> It will check the existence of older paths<br /> first. If they are not present, it will use the new paths.</p> </td> 
   <td><p>Manual Migration is required in order to align to the latest model. Follow the steps below in order to achieve this:</p> 
    <ol> 
     <li>Create a site context bucket using the configuration browser under <strong>Tools</strong></li> 
     <li>Go to the site root</li> 
     <li>Set the <code>cq:conf</code> property to the bucket path where you want to store all the configurations. The same can be set via the <strong>Site Edit Wizard - Set Cloud Config Input</strong>, and then saving the changes</li> 
     <li>Move the relevant badging rules and scoring rules from <code>etc/community/*</code> to the site context bucket created in the previous step</li> 
     <li>Adjust the <code>badgingRules</code> and <code>scoringRules</code> properties on the site root to have relative references to the new rule locations. As an example, if <code>cq:conf</code> is set to <code>/conf/we-retail</code>, the value for <code>badgingRules</code> will be <code>community/badging/rules</code> if rules are now moved to this new bucket</li> 
     <li>Similarly, adjust the references to scoring rules in a badging rule node to have a relative path.</li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><p><code>/etc/cloudservices/facebookconnect</code></p> <p><code>/etc/cloudservices/twitterconnect</code></p> <p><code>/etc/cloudservices/pinterestconnect</code></p> </td> 
   <td><p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/facebookconnect</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/twitterconnect</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/pinterestconnect</code></p> </td> 
   <td>tenant-aware</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/community/scoring</code></td> 
   <td><code>/libs/settings/community/scoring</code></td> 
   <td> </td> 
   <td><p>The code is aware of the old badging paths.</p> <p><br /> It will check the existence of older paths<br /> first. If they are not present, it will use the new paths.</p> </td> 
   <td><p>Manual migration steps are required to align with the latest model.</p> <p>The steps are the same in the badging rules above.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/community/notifications</code></td> 
   <td><code>/libs/settings/community/notifications</code></td> 
   <td>not context-aware</td> 
   <td><p>These configurations are not backward compatible. See the "Requirements to align to the latest model" column for steps on how to migrate to the new locations.<br /> </p> <br /> </td> 
   <td><p>A manual migration is required to align to the latest model. You can use the Granite Configuration Manager to move the configurations to the new path under <code>/apps/settings</code>.</p> <p>Therefore, you need to set the <code>mergeList</code> property to true on the <code>/libs/settings/community/subscriptions</code> node and then add an <code>nt:unstructured</code> child node.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/community/subscriptions</code></td> 
   <td><code>/libs/settings/community/subscriptions</code></td> 
   <td>not context-aware</td> 
   <td>These configurations are not backward compatible. See the "Requirements to align to the latest model" column for steps on how to migrate to the new locations.</td> 
   <td><p>A manual migration is required to align to the latest model. You can use the Granite Configuration Manager to move the configurations to the new path under <code>/apps/settings</code>.</p> <p>Therefore, you need to set the <code>mergeList</code> property to true on the <code>/libs/settings/community/subscriptions</code> node and then add an <code>nt:unstructured</code> child node.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/socialconfig/srpc/defaultconfiguration</code></td> 
   <td><code>/conf/global/settings/community/srpc/defaultconfiguration</code></td> 
   <td>global</td> 
   <td>These configurations are backwards compatible. If the old paths are detected they will be used. Otherwise, the new paths will take precedence.</td> 
   <td><p>Lazy Content Migration Task is available in the form of <code>CQ64CommunitiesConfigsCleanupTask</code>.</p> <p>For more info, see the <a href="../../../sites/deploying/using/lazy-content-migration.md" target="_blank">Lazy Migration documentation</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Communities</td> 
   <td><code>/etc/watchwords</code></td> 
   <td><code>/libs/community/watchwords</code></td> 
   <td>N/A</td> 
   <td>These configurations are backwards compatible. If the old paths are detected they will be used. Otherwise, the new paths will take precedence.</td> 
   <td><p>Lazy Content Migration Task is available in the form of <code>CQ64CommunitiesConfigsCleanupTask</code>.</p> <p>Watchwords will have to be manually moved from <code>/etc/watchwords</code> to <code>/conf/global/settings/community/watchwords</code>.</p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/models</code></td> 
   <td><p><code>/libs/settings/workflow/models</code></p> <p><code>/conf/global/settings/workflow/models</code><br /> </p> <p><code>/var/workflow/models</code></p> </td> 
   <td>global</td> 
   <td><p>Legacy location is used if present and no configuration exists in <code>/libs</code> or <code>/conf</code>.</p> <p>When editing OOTB workflow models, context-aware overlays must be created under <code>/conf</code> to allow them to be modifiable.</p> <p>Package export needs to include the model in <code>/libs</code> or <code>/conf</code> and the runtime model in <code>/var/workflow/models.</code></p> </td> 
   <td><p>Newly created models will be created in the <code>/conf/global/settings</code> location.</p> <p>Any edits in <code>/etc</code> or <code>/libs</code> require you to explicitly create an override in <code>/conf/global/settings</code> before editing can be done. The Edit button has to be selected, and it will cause the override in <code>/conf</code> to be created and editing allowed.</p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/launcher</code></td> 
   <td><p><code>/libs/settings/workflow/launcher</code></p> <p><code>/conf/global/settings/workflow/launcher</code></p> </td> 
   <td>global</td> 
   <td>Legacy location is used if present and no configuration<br /> exists in <code>/libs</code> or <code>/conf</code> locations. This way, custom launchers are preserved.</td> 
   <td><p>Newly created or edited launcher configurations are located in the <code>/conf</code> location.</p> <p>All launchers should be moved from the legacy <code>/etc</code> location to<code> /conf/global/settings/workflow/launcher.</code></p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/models</code></td> 
   <td><p><code>/libs/settings/workflow/models</code></p> <p><code>/conf/global/settings/workflow/models</code></p> </td> 
   <td>global</td> 
   <td>Legacy location is used if present and no configuration<br /> exists in <code>/libs</code> or <code>/conf</code> locations. This way, custom workflow models are preserved.</td> 
   <td><p>All workflow models should be moved from the legacy <code>/etc</code> location to <code>/conf/global/settings/workflow/models</code>.</p> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/notification</code></td> 
   <td><p><code>/libs/settings/workflow/notification</code></p> <p><code>/conf/global/settings/workflow/notification</code></p> </td> 
   <td>not context-aware</td> 
   <td><p>For backwards compatibility, the legacy location is used if present.</p> <p>Previously, out of the box templates had to be overridden by editing them in <code>/etc</code>. Now, override should be stored in <code>/conf/global</code>.</p> </td> 
   <td>For more info, please consult the Workflow documentation.<br /> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/cloudservices/translation</code></td> 
   <td><p><code>/libs/settings/cloudconfigs/translation/translationcfg</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translation/translationcfg</code></p> <p> </p> </td> 
   <td>tenant-aware</td> 
   <td>Legacy cloudservices. Will be persisted on an in-place upgraded set up. Code to list them and read them is still present in the product as a fallback.</td> 
   <td><p>In order to move cloud configurations to <code>/conf</code>, you can either:</p> 
    <ul> 
     <li>Create configurations using the new Touch UI<br /> or<br /> </li> 
     <li>Copy the configurations from <code>/etc/cloudservices/translation</code> to their respective new location(s)</li> 
    </ul> <p>Once this is done, the configurations need to be associated with Sites via <strong>Sites → Properties</strong> in the user interface.</p> <p><em>Note: Translation connectors must be compatible with AEM 6.5 for this to work.</em></p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/cloudservices/msft-translation</code></td> 
   <td><p><code>/libs/settings/cloudconfigs/translation/msft-translation</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translation/msft-translation</code></p> </td> 
   <td>tenant-aware</td> 
   <td>Legacy cloudservices. Will be persisted on an in-place upgraded set up. Code to list them and read them is still present in the product as a fallback.</td> 
   <td><p>In order to move cloud configurations to <code>/conf</code>, you can either:</p> 
    <ul> 
     <li>Create configurations using the new Touch UI or<br /> </li> 
     <li>Copy older configurations from <code>/etc/cloudservices/translation</code> to their respective new location(s)</li> 
    </ul> <p>Once this is done, the configurations need to be associated with Sites via <strong>Sites → Properties</strong> in the user interface.</p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/cloudsettings</code></td> 
   <td><p><code>/libs/settings/cloudsettings</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudsettings</code></p> </td> 
   <td>tenant-aware</td> 
   <td><p>Existing entries under <code>/etc</code> remain in place on upgrading the instance.</p> <p>Accessing the cloud settings UI after the upgrade will copy over the existing cloud settings to the new repository structure while preserving the existing content for backward compatibility.</p> </td> 
   <td><p>Content models are the same, only the location has been changed to align with context-aware configurations.</p> <p>The <a href="../../../sites/deploying/using/lazy-content-migration.md">Lazy Migration task</a> covering these cloud settings will perform the following actions:</p> 
    <ul> 
     <li>Copy existing cloud settings in <code>/etc/cloudsettings</code> to <code>/conf/global/settings/cloudsettings</code></li> 
     <li>Remove all children of <code>/etc/cloudsettings</code></li> 
    </ul> <p>There are, however, manual steps that are required after the upgrade and before running the lazy migration tasks:</p> 
    <ul> 
     <li>All references pointing to <code>/etc/cloudsettings/*</code> need to be updated to point to <code>/conf/global</code></li> 
    </ul> <p>Caveat:</p> 
    <ul> 
     <li>The <code>/etc/cloudsettings</code> container needs to be preserved</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/cloudservices/dmscene7</code></td> 
   <td><code>/conf/global/settings/cloudservices/dmscene7</code></td> 
   <td>only global</td> 
   <td><p>Cloud configuration for Dynamic Media - Scene7 (<code>dynamicmedia_scene7</code> runmode) setup will stay at the same location. The process is working as is. If you need to adjust the cloud configuration value, then there are two options for doing that:</p> 
    <ol> 
     <li>Update an existing configuration via the old cloud configuration UI.</li> 
     <li>Create a new cloud configuration via new Touch UI. This will have higher precedence than the old one.</li> 
    </ol> </td> 
   <td><p>In order to align to the latest model, you need to run the script located at:</p> 
    <ul> 
     <li><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/presets/viewer</code></td> 
   <td><p><code>/libs/settings/dam/dm/presets/viewer</code></p> <p><code>/conf/global/settings/dam/dm/presets/viewer</code></p> </td> 
   <td>only global</td> 
   <td><p>The OOTB viewer presets will only be available in the new location, while the custom viewer preset will still be under <code>/etc</code> until a modification is incurred.</p> <p>After it has been modified, it will be saved in the new location via Lazy Migration. The embed image server will look at both the legacy path and the new path upon receiving a request. Therefore, there is no need to change their embed code or URL.</p> </td> 
   <td><p>The out of the box viewer preset will only available in the new location. For the custom viewer preset, you need to run the migration script at this location:</p> 
    <ul> 
     <li><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
    </ul> <p>Similar to the backward compatibility case, you don't have to adjust the copyURL/embed code to point to <code>/conf</code>. The existing request to <code>/etc</code> will be re-routed under the hood to the correct content from <code>/conf</code>.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/imageserver/macros</code></td> 
   <td><code>/conf/global/settings/dam/dm/presets/macro</code></td> 
   <td>only global</td> 
   <td>The macro under <code>/etc</code> is still valid. If modify it, the modified node will be moved to the new location under <code>/conf</code> via a Lazy Migration task.</td> 
   <td><p>You need to run the migration script at this location:</p> 
    <ul> 
     <li><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
    </ul> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/video/dynamicmedia/Adaptive Video Encoding</code></td> 
   <td><code>/libs/settings/dam/dm/presets/video/jcr:content/Adaptive Video Encoding</code></td> 
   <td>N/A</td> 
   <td><p>The out of the box video profile will be removed without updating the asset folders property to link to the profile.</p> <p>The encoding process has built-in translation between the old and new location. It will convert the old path to look into the new profile path.</p> </td> 
   <td>No changes required.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/video/dynamicmedia</code></td> 
   <td><code>/conf/global/settings/dam/dm/presets/video/jcr:content</code></td> 
   <td>only global</td> 
   <td><p>The custom video profile will be kept as is until you modify it.</p> <p>Then, it will be moved to the new location via a Lazy Migration task. This is similar to the out of the box video preset on encoding look-up. The encoding process has a built-in path translator to look into old location first and then the new location for video profile.</p> </td> 
   <td><p>In order to align to the latest model, you can run the migration script under:</p> 
    <ul> 
     <li><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
    </ul> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/cloudservices/dynamicmediaservices</code></td> 
   <td><code>/conf/global/settings/dam/dm/cloudservices/dynamicmediaservices</code></td> 
   <td>only global</td> 
   <td><p>This cloud configuration for Dynamic Media hybrid setup (<code>dynamicmedia</code> runmode) will stay at the same location. The process is working as-is. If you need to adjust the config value, you can do it in two ways.</p> 
    <ol> 
     <li>Update an existing config via the old cloud configuration UI.</li> 
     <li>Create a new cloud configuration via the new touch UI. This will have higher precedence than the old one.</li> 
    </ol> </td> 
   <td><p>You need to run the migration script in order to align to the latest model. You can find the script at this location:<br /> </p> 
    <ul> 
     <li><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/cloudservices/youtube</code></td> 
   <td><code>/libs/settings/dam/dm/youtube</code></td> 
   <td>only global</td> 
   <td><p>The cloud config for the DM-Youtube setup will stay at the same location. The process is working as-is. If you need to adjust the cloud config value, you can do it in two ways:</p> 
    <ol> 
     <li>Update an existing config via the old cloud config UI.</li> 
     <li>Create a new cloud config via the new touch UI. This will have higher precedence than the old one.</li> 
    </ol> </td> 
   <td><p>You can run a migration script to align with the latest model. The script can be found at this location:<br /> </p> <p><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> <p> </p> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/presets/analytics</code></td> 
   <td><code>/libs/settings/dam/dm/analytics</code></td> 
   <td>only global</td> 
   <td>No action required.</td> 
   <td><p>You can run a migration script to align to the latest mode. The script can be found at this location:<br /> </p> <p><em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><p><code>/etc/notification/email/default/com.day.cq.replication</code></p> <p><code>/etc/notification/email/default/com.day.cq.wcm.core.page</code></p> </td> 
   <td><code>/libs/settings/notification-templates</code></td> 
   <td>only global</td> 
   <td>The templates in <code>/etc/notification/email/default/</code> are given precedence over the ones in <code>/libs/settings/notification-templates</code>.</td> 
   <td>In order to align to the latest model, you can create new templates under <code>/apps/settings/notification-templates</code> and perform new modifications there.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><p><code>/etc/msm/rolloutconfigs/launch</code></p> <p><code>/etc/msm/rolloutconfigs/pushonmodifyshallow</code></p> </td> 
   <td><p><code>/libs/msm/launches/rolloutconfigs/launch</code></p> <p><code>/libs/msm/launches/rolloutconfigs/pushonmodifyshallow</code></p> </td> 
   <td>N/A</td> 
   <td><p>Consuming Services are aware of the old location.</p> <p>If configurations are detected in the legacy location, they will be used.</p> </td> 
   <td>To align with the new model, configurations need to be created in the new locations, and the old ones under <code>/etc</code> must be deleted.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/translation/supportedLanguages</code></td> 
   <td><p><code>/libs/settings/translation/supportedLanguages</code></p> <p><code>/apps/settings/translation/supportedLanguages</code></p> </td> 
   <td>not context-aware</td> 
   <td>A caveat is that customized languages need to be added to the list.<br /> </td> 
   <td>Overlay and update the new list with additional languages (if any). Alternatively, copying the old list to <code>/apps</code> location would also work.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/models/translation/translation_rules.xml</code></td> 
   <td><p><code>/libs/settings/translation/rules/translation_rules.xml</code></p> <p><code>/apps/settings/translation/rules/translation_rules.xml</code></p> <p><code>/conf/global/settings/translation/rules/translation_rules.xml</code></p> </td> 
   <td>only global</td> 
   <td>Will be persisted on an inplace upgraded set up. Code to list them and read them still present in the product.</td> 
   <td>To persist the changes, copy the XML file from <code>/etc</code> to <code>/libs</code> or <code>/conf</code>. Alternatively,<strong> </strong>remove file from <code>/etc</code>.</td> 
  </tr> 
 </tbody> 
</table>

## Client-Side Libraries {#client-side-libraries}

[Client-Side Libraries](https://helpx.adobe.com/experience-manager/6-3/sites/developing/using/clientlibs.html) are javascript and CSS code processed in the browser.

### Extensibility Strategy {#extensibility-strategy-1}

AEM provides an extensibility framework to append multiple JavaScript files. Any file with the same "categories" property will be appended, allowing custom code to extend AEM code that resides under `/libs`.

<table>
 <tbody> 
  <tr> 
   <td><strong>Solution</strong></td> 
   <td><strong>Previous Location</strong><br /> </td> 
   <td><strong>New Location</strong></td> 
   <td><strong>Backward Compatibility Approach</strong></td> 
   <td><strong>Requirements to align to latest model</strong></td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/fp</code></td> 
   <td><code>/libs/fd/fp/components</code></td> 
   <td><p>Legacy clientlib that will be persisted on an instance that has been upgraded via an in-place upgrade.</p> <p>New clientlibs have the same category names along with the "<strong><code>replaces</code></strong>" property to avoid merging of old and new clientlibs.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/rte</code></td> 
   <td><code>/libs/fd/rte</code></td> 
   <td><p>Legacy clientlibs that will be persisted on an instance that has been upgraded via an inplace upgrade.</p> <p>New clientlibs have the same category names along with the "<strong><code>replaces</code></strong>" property to avoid merging of old and new clientlibs.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/af</code></td> 
   <td><code>/libs/fd/af/authoring/clientlibs</code></td> 
   <td>Legacy clientlibs. Will be persisted on an instance that has been upgraded via an inplace upgrade. New clientlibs have the same category names along with the "<strong><code>replaces</code></strong>" property to avoid merging of old and new clientlibs.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/themes/themeLibrary</code></td> 
   <td>This no longer features as part of the AEM 6.5 out of the box package.</td> 
   <td><p>Out of the box themes in Adaptive Forms.</p> <p>Will be persisted on an inplace upgraded set up.</p> </td> 
   <td>This is partly user-generated content. This will be delivered as a reference content package with the <code>aem-forms-reference-themes</code> name.</td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/expeditor</code></td> 
   <td><code>/libs/fd/expeditor/clientlibs</code></td> 
   <td>Legacy clientlibs. Will be persisted on an instance that has been upgraded via an inplace upgrade. New clientlibs have the same category names along with the "<strong><code>replaces</code></strong>" property to avoid merging of old and new clientlibs.</td> 
   <td>No action required.<p> </p> </td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/clientlibs/fd/fmaddon</code></td> 
   <td><code>/libs/fd/fmaddon</code></td> 
   <td>Legacy Analytics and Target clientlibs which are not meant to be directly consumed. </td> 
   <td>Cleaned up post-upgrade using a cleanup filter.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><p><code>/etc/clientlibs/foundation/asseteditor</code></p> <p><code>/etc/clientlibs/foundation/assetshare</code></p> <p><code>/etc/clientlibs/foundation/assetinsights</code></p> </td> 
   <td><code>/libs/dam/clientlibs</code></td> 
   <td>Legacy clientlibs have different client category names.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><code>/etc/clientlibs/ckeditor</code></td> 
   <td><code>/libs/clientlibs/ckeditor</code></td> 
   <td>These are legacy clientlibs. They will be persisted on an inplace upgraded set up. New clientlibs have the same category names along with the "<code>replaces</code>" property to avoid the merging of old and new clientlibs.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/foundation/sitecatalyst</code></td> 
   <td><code>/libs/cq/analytics/clientlibs/analytics</code></td> 
   <td><p>These are legacy clientlibs. Will be persisted on an inplace upgraded set up.</p> <p>New clientlibs have the same category names.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/foundation/personalization</code></td> 
   <td><code>/libs/cq/personalization/clientlibs/personalization</code></td> 
   <td><p>These are legacy clientlibs. Will be persisted on an inplace upgraded set up.</p> <p>New clientlibs have the same category names.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/foundation/searchpromote</code></td> 
   <td><code>/libs/cq/searchpromote/clientlibs/searchpromote</code></td> 
   <td><p>These are legacy clientlibs. Will be persisted on an inplace upgraded set up.</p> <p>New clientlibs have the same category names</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/foundation/target</code></td> 
   <td><code>/libs/cq/target/clientlibs/target</code></td> 
   <td><p>These are legacy clientlibs. Will be persisted on an inplace upgraded set up.</p> <p>New clientlibs have the same category names.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/address</code></td> 
   <td><code>/libs/cq/address/clientlibs</code></td> 
   <td>New clientlibs have the same category names.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/wcm/foundation</code></td> 
   <td><code>/libs/wcm/foundation/clientlibs</code></td> 
   <td>Legacy clientlibs. Will be persisted on an inplace upgraded set up. New clientlibs have the same category names along with the "<strong>replaces</strong>" property to avoid merging of old and new clientlibs.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Sites</td> 
   <td><code>/etc/clientlibs/wcm/foundation/grid/grid_base.less</code></td> 
   <td><p><code>/libs/wcm/foundation/clientlibs/grid/grid_base.less</code></p> </td> 
   <td><p>On an inplace upgrade the legacy file (/etc/clientlibs/wcm/…_) will remain and not be automatically removed, so references to the legacy /etc/clientlibs/wcm/foundation/grid/grid_base.less will continue to be stasified.</p> <p><em>Note that the is is an outlier case where this LESS file is referenced by absolute path via LESS @import statements, and NOT by clientlib category.</em></p> <p>If customer LESS referencing the `grid_base.less` is pointing to a non-existing file, the Editable Template Layout mode will break, and any adjustments made with it will not be present (ie. all components will be the full width of the page).</p> </td> 
   <td>Update any references in custom code (i.e. in any LESS files that reference the moved grid_base.less file) to point to the new location, and remove the legacy location.</td> 
  </tr> 
 </tbody> 
</table>

These are other restructurings that don't fall under the previous sections.

### Extensibility Strategy {#extensibility-strategy-2}

See each table row for any supported extensibility model. Content in this section is not typically extended.

## Miscellaneous {#miscellaneous}

<table>
 <tbody> 
  <tr> 
   <td><strong>Solution</strong></td> 
   <td><strong>Previous Location</strong><br /> </td> 
   <td><strong>New Location</strong></td> 
   <td><strong>Backward Compatibility Approach</strong></td> 
   <td><strong>Requirements to align to latest model</strong></td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/designs/fd/fp</code></td> 
   <td><code>/libs/fd/fp</code></td> 
   <td><p>Legacy AEM Forms Portal OOTB templates. These templates will remain in /etc after an in-place upgraded setup.</p> <p>In the template listing, the word<em> "deprecated</em>" will be added to the template title to differentiate them with the newer templates.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Forms</td> 
   <td><code>/etc/ 
     <g class="gr_ gr_205 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" data-gr-id="205" id="205">
       aep 
     </g></code></td> 
   <td><code>/var/ 
     <g class="gr_ gr_206 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" data-gr-id="206" id="206">
       fd 
     </g>/content/annotations</code></td> 
   <td>Legacy Correspondence Management annotation files. Not meant to be directly consumed. Will be cleaned up after upgrade using a cleanup filter.</td> 
   <td>Legacy location cleaned-up post-upgrade using a cleanup filter.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/tags</code></td> 
   <td><code>/content/ 
     <g class="gr_ gr_202 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" data-gr-id="202" id="202">
       cq 
     </g> 
     <g class="gr_ gr_209 gr-alert gr_gramm gr_inline_cards gr_run_anim Style replaceWithoutSep" data-gr-id="209" id="209">
       :tags 
     </g></code></td> 
   <td>The Tag Manager API supports both the legacy and the new location. When the JCR Tag Manager Factory OSGi Component starts, it detects if it is running on an upgraded instance or a legacy one, and uses the appropriate location.<br /> </td> 
   <td><p>In order to properly align with the new model:</p> 
    <ol> 
     <li>Replace the references to the old model (<code>/etc/tags</code>) with the new one (<code>/content/ 
       <g class="gr_ gr_201 gr-alert gr_spell gr_inline_cards gr_run_anim ContextualSpelling ins-del multiReplace" data-gr-id="201" id="201">
         cq 
       </g>:tags</code>) by using the <code>tagID.</code></li> 
     <li>Log in to CRXDE Lite</li> 
     <li>Move the tags from <code>/etc/tags</code> to <code>/content/cq:tags</code></li> 
     <li>Restart the OSGi Component <code class="code">com.day.cq.tagging.impl.JcrTagManagerFactoryImpl.
        </code></li> 
    </ol> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/instances</code></td> 
   <td><code>/var/workflow/instances</code></td> 
   <td>Legacy location used in processing of<br /> in-flight workflows. New workflows use the new location in <code>/var.</code></td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/scripts</code></td> 
   <td><p><code>/libs/workflow/scripts</code></p> <p><code>/apps/workflow/scripts</code></p> </td> 
   <td><p>Existing Workflow Model Steps that reference workflow scripts in the legacy location at <code>/etc/workflow/scripts</code> will continue to point to these scripts after the upgrade, and execute properly.</p> <p>Note the AEM UI for authoring the workflow steps’ (Process, Splits, etc.) no longer lists scripts under <code>/etc/workflow/scripts</code> in the drop-down used select to workflow scripts.</p> </td> 
   <td><p>Workflows leveraging these scripts will continue to work as expected if the associated workflow process step isn't edited in AEM.</p> <p>However, for full backward compatibility, including when steps are edited, requires manual action by the customer post-upgrade:</p> 
    <ul> 
     <li>The scripts must be moved from <code>/etc/workflow/scripts</code> to <code>/apps/workflow/scripts.</code></li> 
     <li>Any<strong> </strong>references to <code>/etc/workflow/scripts</code> in workflow model steps must be updated to reference the new <code>/apps/workflow/scripts</code> location.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/replication/treeactivation</code></td> 
   <td><code>/libs/replication/treeactivation</code></td> 
   <td>ClassicUI utility page remains in place on upgrade.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Assets</td> 
   <td><code>/etc/dam/jobs</code></td> 
   <td><code>/var/dam/jobs</code></td> 
   <td><p>Temporary location to hold zip files generated for AEM Assets download action invocation.</p> <p>There is no need to update since when the client requests to download the asset, It will generate the file in the new location.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/products</code></td> 
   <td><code>/var/commerce/products</code></td> 
   <td><p>The old content remains in place and usable after the upgrade.</p> <p>A Lazy Migration task is provided for migration to the new location.</p> </td> 
   <td><p>The migration is performed via a Lazy Migration task: <code>CQ64CommerceMigrationTask.</code></p> <p>It performs the following steps:</p> 
    <ul> 
     <li>Adjusts references from the old location to point to the new location</li> 
     <li>Moves content from the old location to new location</li> 
     <li><p>Removes the old location to eventually activate the usage of the new location in the whole system</p> </li> 
    </ul> <p>The locations covered by the task are:</p> 
    <ul> 
     <li>/etc/commerce/products</li> 
     <li>/etc/commerce/collections<br /> </li> 
     <li>/etc/commerce/orders<br /> </li> 
     <li>/etc/commerce/payment-methods<br /> </li> 
     <li>/etc/commerce/shipping-methods<br /> </li> 
    </ul> <p>For larger catalogs it's recommended to run the commerce migration task individually by passing the following Java system property to AEM:</p> 
    <ul> 
     <li>property name: <code>com.adobe.upgrade.forcemigration</code></li> 
     <li>property value: <code>com.day.cq.compat.codeupgrade.impl.cq64.CQ64CommerceMigrationTask</code></li> 
    </ul> <p>After migration AEM requires a restart.</p> </td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/orders</code></td> 
   <td><code>/var/commerce/orders</code></td> 
   <td><p>The old content remains in place and usable after the upgrade.</p> <p>A Lazy Migration task is provided for migration to the new location.</p> </td> 
   <td>See the description above for <code>/etc/commerce/products</code>.</td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/collections</code></td> 
   <td><code>/var/commerce/collections</code></td> 
   <td><p>The old content remains in place and usable after the upgrade.</p> <p>A Lazy Migration task is provided for migration to the new location.</p> </td> 
   <td>See the description above for <code>/etc/commerce/products</code>.</td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/classifications</code></td> 
   <td><code>/var/commerce/classifications</code></td> 
   <td>No action required.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/shipping-methods</code></td> 
   <td><code>/var/commerce/shipping-methods</code></td> 
   <td><p>The old content remains in place and usable after the upgrade.</p> <p>A Lazy Migration task is provided for migration to the new location.</p> </td> 
   <td>See the description above for <code>/etc/commerce/products</code>.</td> 
  </tr> 
  <tr> 
   <td>AEM Commerce</td> 
   <td><code>/etc/commerce/payment-methods</code></td> 
   <td><code>/var/commerce/payment-methods</code></td> 
   <td><p>The old content remains in place and usable after the upgrade.</p> <p>A Lazy Migration task is provided for migration to the new location.</p> </td> 
   <td>See the description above for <code>/etc/commerce/products</code>.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/taskmanagement</code></td> 
   <td><code>/var/taskmanagement</code></td> 
   <td><p>New tasks are created under <code>/var/taskmanagement</code></p> <p>Existing tasks in the legacy location will still visible in the AEM inbox.</p> </td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/packages</code></td> 
   <td><code>/var/workflow/packages</code></td> 
   <td><p>AEM Packages created through AEM Package Manager are still stored in <code>/etc/workflow/packages.</code></p> <p>Other Packages created via AEM Sites and Workflows continue to be stored in<code>/var/workflow/packages.</code></p> <p>Packages found in both <code>/etc/workflow/packages</code> and <code>/var/workflow/packages</code> can still be edited via AEM's Package Manager. </p> </td> 
   <td><p>No action required.</p> <p> </p> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/workflow/instances</code></td> 
   <td><code>/var/workflow/instances</code></td> 
   <td>New workflow instances will be created under <code>/var</code> automatically.</td> 
   <td>No action required.</td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/commerce/searchpromote</code></td> 
   <td><code>/var/cq/searchpromote</code></td> 
   <td><p>New location for Search and Promote feed content.</p> <p>The old URL continues to work and the request is forwarded by a ServletFilter to the new location.</p> </td> 
   <td>No action required.<br /> <br /> </td> 
  </tr> 
  <tr> 
   <td>All</td> 
   <td><code>/etc/dtm-hook</code></td> 
   <td><code>/var/cq/dtm/web-hook</code></td> 
   <td><p>New location for DTM Web-Hooks.</p> <p>The old URL continues to work and the request is forwarded by a ServletFilter to the new location.</p> </td> 
   <td>No action required.<br /> <br /> </td> 
  </tr> 
 </tbody> 
</table>

