---
title: Repository Restructuring for AEM Communities in 6.4
description: Learn how to make the necessary changes to migrate to the new repository structure in AEM 6.4 for Communities.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
feature: Upgrading
exl-id: 4d2bdd45-a29a-4936-b8da-f7e011d81e83
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Repository Restructuring for AEM Communities in 6.5 {#repository-restructuring-for-aem-communities-in}

As described on the parent [Repository Restructuring in AEM 6.4](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.5 should use this page to assess the work effort associated with repository changes impacting the AEM Communities Solution. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

**With 6.5 Upgrade**

* [E-mail Notification Templates](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#e-mail-notification-templates)
* [Subscription Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#subscription-configurations)

**Prior to Future Upgrade**

* [Badging Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#badging-configurations)
* [Classic Communities Console Designs](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#classic-communities-console-designs)
* [Facebook Social Login Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#facebook-social-login-configurations)
* [Language Options Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#language-options-configurations)

* [Pinterest Social Login Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#pinterest-social-login-configurations)
* [Scoring Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#scoring-configurations)
* [Twitter Social Login Configurations](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#twitter-social-login-configurations)
* [Misc](/help/sites-deploying/communities-repository-restructuring-in-aem-6-5.md#misc)

## With 6.5 Upgrade {#with-upgrade}

### E-mail Notification Templates {#e-mail-notification-templates}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/community/notifications</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/settings/community/notifications</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Manual migration ia needed if you want to move to new path under "<code>/apps/settings</code>". You can use the Granite Configuration Manager to perform the migration.</p> <p>You can perform the migration by setting the property <code>mergeList</code> to <code>true</code> on the "<code>/libs/settings/community/subscriptions</code>" node and add an <code>nt:unstructured</code> child node.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Subscription Configurations {#subscription-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/community/subscriptions</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/settings/community/subscriptions</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Manual migration ia needed if you want to move to new path under "<code>/apps/settings</code>". You can use the Granite Configuration Manager to perform the migration.</p> <p>You can perform the migration by setting the property <code>mergeList</code> to <code>true</code> on the "<code>/libs/settings/community/subscriptions</code>" node and add an <code>nt:unstructured</code> child node.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Watchwords Configurations {#watchwords-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td>/etc/watchwords</td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td>/libs/community/watchwords</td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>A Lazy Migration task is available to clean up the Communities Configurations.<br /> <p>The Task moves watchwords from <code>/etc/watchwords</code> to <code>/conf/global/settings/community/watchwords</code>.</p> <p>If customized watchwords are stored in SCM, then they should be deployed to <code>/apps/settings/...</code> and you must ensure that there is not an overlaying <code>/conf/global/settings/...</code> configuration that would take precedence.</p> <p>Migration task removes <code>/etc</code> locations.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

## Prior to Future Upgrade {#prior-to-upgrade}

### Badging Configurations {#badging-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/community/badging</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><strong>Badge Rules:</strong></p> <p><code>/libs/settings/community/badging</code></p> <p><strong>Badge Images:</strong></p> <p>For default images: <code>/etc/community/badging/images are moved to /libs/community/badging/images</code></p> <p>For custom images: <code>/content/community/badging/images</code></p> <p> </p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Manual Migration is required.</p> <p>If your instance has customized the badging/scoring rules, there is no automated way to place all the rules under a bucket. Need customer inputs on which conf bucket (global or sitespecific) you want to use for your site.</p> <p>No UI available to configure the badging and scoring for a site.</p> <p>To align with new repository structure:</p>
    <ol>
     <li>Create a site context bucket using the <strong>Configuration Browser</strong> under <strong>Tools</strong></li>
     <li>Go to the Site root</li>
     <li>Set <code>cq:confproperty</code> to the bucket path where you want to store all your settings. The same can be set via the site <strong>Edit Wizard - Set cloud config input</strong>.</li>
     <li>Move relevant badging rules and scoring rules from <code>/etc/community/*</code> to the site context bucket created in the previous step.</li>
     <li>Adjust badging Rules and scoring Rules properties on site root to have relative references to new rule locations.
      <ol>
       <li>For example, if the poperty for <code>cq:conf = /conf/we-retail</code>, then <code>badgingRules [] = community/badging/rules</code> if rules are now moved to this new bucket.</li>
      </ol> </li>
     <li>Similarly, adjust the references to scoring rules in a badging rule node to have a relativepath.</li>
    </ol> <p> </p> <p>Finally, clean up by removing the resource <code>/etc/community/badging</code></p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Classic Communities Console Designs {#classic-communities-console-designs}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/social/console</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/social/console</code></p> <p><code>/apps/settings/wcm/designs/social/console</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>N/A</td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Facebook Social Login Configurations {#facebook-social-login-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudservices/facebookconnect</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code class="code">/conf/global/settings/cloudconfigs/facebookconnect
       </code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/facebookconnect</code></p> <p> </p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new Facebook Cloud Configurations must be migrated to the New Location.</p>
    <ol>
     <li>Migrate existing configurations in the Previous Location to the New Location.
      <ol>
       <li>Manually recreate new Facebook Social Login Configurations via the AEM authoring UI at <strong>Tools &gt; Cloud Services &gt; Facebook Social Login Configuration</strong>.<br /> or <br /> </li>
       <li>Copy any new Facebook Cloud Configurations from Previous Location to the appropriate New Location, under <code>/conf/global or /conf/&lt;tenant&gt;</code>.</li>
      </ol> </li>
     <li>Update any AEM Communities Site root to reference the new Facebook Social Login Configuration by setting the <code>[cq:Page]/jcr:content@cq:conf</code> property to the absolute path in the New Location.</li>
     <li>Disassociate the legacy Facebook Connect Cloud Service from any AEM Communities site roots updated to reference the New Location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Language Options Configurations {#language-options-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/social/config/languageOpts</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/social/translation/languageOpts</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>N/A<br /> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Pinterest Social Login Configurations {#pinterest-social-login-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudservices/pinterestconnect</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code class="code">/conf/global/settings/cloudconfigs/pinterestconnect
       </code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/pinterestconnect</code></p> <p> </p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new Pinterest Cloud Configurations must be migrated to the New Location.</p>
    <ol>
     <li>Migrate existing configurations in the Previous Location to the New Location.
      <ol>
       <li>Manually recreate new Pinterest Social Login Configurations via the AEM authoring UI at <strong>Tools &gt; Cloud Services &gt; Pinterest Social Login Configuration</strong>.<br /> or</li>
       <li>Copy any new Pinterest Cloud Configurations from Previous Location to the appropriate New Location under <code>/conf/global or /conf/&lt;tenant&gt;</code>.</li>
      </ol> </li>
     <li>Update any AEM Communities Site root to reference the new Pinterest Social Login Configuration by settings the <code>[cq:Page]/jcr:content@cq:conf</code> property to the absolute path in the New Location.</li>
     <li>Disassociate the legacy Pinterest Connect Cloud Service from any AEM Communities site roots updated to reference the New Location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Scoring Configurations {#scoring-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/community/scoring</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/settings/community/scoring</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>To align with new repository structure, scoring rules can be stored in <code>/apps/settings/</code> or /<code>conf/.../settings</code></p>
    <ol>
     <li>For <code>/apps/settings</code>, this would act as global or default rules managed in SCM.</li>
    </ol> <p>Create context-aware configs in <code>/conf/</code> by using CRXDELite:</p>
    <ol>
     <li>Create the configs in the desired <code>/conf/.../settings</code> location<br /> </li>
     <li>Communities site must have the <code>cq:conf </code>property property set.
      <ol>
       <li>If no <code>cq:conf</code> is set, scoring rules would be directly read from the given path for property '<code>scoringRules</code>' at the site's root node, for example: <code>/content/we-retail/us/en/community/jcr:content</code></li>
      </ol> </li>
    </ol> <p>Cleanup: Remove the resource <code>/etc/community/scoring</code></p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Twitter Social Login Configurations {#twitter-social-login-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudservices/twitterconnect</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code class="code">/conf/global/settings/cloudconfigs/twitterconnect
       </code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/twitterconnect</code></p> <p> </p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new Twitter Cloud Configurations must be migrated to the New Location.</p>
    <ol>
     <li>Migrate existing configurations in the Previous Location to the New Location.
      <ol>
       <li>Manually recreate new Twitter Social Login Configurations via the AEM authoring UI at <strong>Tools &gt; Cloud Services &gt; Twitter Social Login Configuration</strong>.<br /> or <br /> </li>
       <li>Copy any new Twitter Cloud Configurations from Previous Location to the appropriate New Location, under <code>/conf/global or /conf/&lt;tenant&gt;</code>.</li>
      </ol> </li>
     <li>Update any AEM Communities Site root to reference the new Twitter Social Login Configuration by setting the <code>[cq:Page]/jcr:content@cq:conf</code> property to the absolute path in the New Location.</li>
     <li>Disassociate the legacy Twitter Connect Cloud Service from any AEM Communities site roots updated to reference the New Location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Misc {#misc}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/community/templates</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/settings/community/templates</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Adobe has provided a migration utility at:</p> <p><a href="https://github.com/Adobe-Marketing-Cloud/aem-communities-ugc-migration/tree/master/bundles/communities-template-migration">https://github.com/Adobe-Marketing-Cloud/aem-communities-ugc-migration/tree/master/bundles/communities-template-migration</a></p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>The existing custom templates would move to <code>/conf/global/settings/community/template/&lt;groups/sites/functions&gt;</code></td>
  </tr>
 </tbody>
</table>
