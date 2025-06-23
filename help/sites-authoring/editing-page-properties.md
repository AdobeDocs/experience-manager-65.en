---
title: Editing Page Properties
description: Define the required properties for a page in Adobe Experience Manager.
exl-id: 3cd9374f-6f16-40fb-97cf-5f9a750b8dd2
solution: Experience Manager, Experience Manager Sites
feature: Authoring
role: User,Admin,Architect,Developer
mini-toc-levels: 2
---

# Editing Page Properties{#editing-page-properties}

You can define the required properties for a page. These can vary depending on the nature of the page. For example, some pages might be connected to a live copy while others are not and the live copy information becomes available as appropriate.

## Page Properties {#page-properties}

The properties are distributed across several tabs.

### Basic {#basic}

#### Title &amp; Tags {#tile}

* **Title** - The title of the page is shown in various locations 
  * For example, the **Websites** tab list and the **Sites** card/list views.
  * This is a mandatory field.
* **Tags** - Here you can add or remove tags from the page by updating the list in the selection box.
  * After selecting a tag, it is listed below the selection box. You can remove a tag from this list using the x.
  * A new tag can be entered by typing the name in an empty selection box.
    * The new tag is created when you hit Enter.
    * The new tag is shown with a small star on the right indicating that it is a new tag.
  * With the drop-down, you can select from existing tags.
  * An x appears when you mouse-over a tag entry in the selection box, which can be used to remove that tag for this page.
  * For more information about tags, see [Using Tags.](/help/sites-authoring/tags.md)
* **Hide in Navigation** - Indicates whether the page is shown or hidden in the page navigation of the resulting site

#### Branding {#branding}

Apply a consistent brand identity across pages by appending a brand slug to each page title. This functionality requires use of the Page Component from release 2.14.0 or later of the [Core Components.](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html)

* **Override** - Check to define the brand slug on this page.
  * The value is inherited by any child pages unless they also have their **Override** values set.
* **Override value** - The text of the brand slug to be appended to the page title
  * The value is appended to the page title after a pipe character such as `Cycling Tuscany | Always ready for the WKND`

#### More Titles &amp; Description {#more}

* **Page Title** - A title to be used on the page
  * Typically used by title components
  * If empty, the **Title** is used.
* **Navigation Title** - You can specify a separate title for use in the navigation (for example, if you want something more concise).
  * If empty, the **Title** is used.
* **Subtitle** - A subtitle for use on the page
* **Description** - Your description of the page, its purpose, or any other details you want to add

#### On/OffTime {#on-time}

The on/off time for a page is a convenient way to temporarily hide content that is already published. The content remains on the publish instance when it is off. Turning a page off does not unpublish the content.

* **On Time** - The date and time at which the published page is made visible (rendered) on the publish environment. The page must be published, either manually or by pre-configured auto-replication.

  * If already [published,](/help/sites-authoring/publishing-pages.md) this page is available on the publish instance, but kept dormant (hidden) until rendering at the specified time.
  * If not published and [configured for auto-replication,](/help/sites-deploying/replication.md) the page is automatically published, then rendered, at the specified time.
  * If not published and not configured for auto-replication, the page is not automatically published, so a 404 is seen when an attempt to access the page is made.
  
* **Off Time** - Similar to and often used in combination with **On Time**, this defines the time at which the published page is hidden on the publish environment.

Leave these fields (**On Time** and **Off Time**) empty for pages you want to publish and have available immediately and have available on the publish environment until they are deactivated (the normal scenario).

>[!NOTE]
>If either the **On Time** or **Off Time** is in the past, and automatic replication is configured, then the relevant action is triggered immediately.

>[!TIP]
>
>On/off times deal strictly with content that is already published (either manually or via auto-replication). For this reason, publishing workflows such as those for approving content are not triggered by to on/off times and on/off times do not affect the page's publication status. For this reason, on/off times are most appropriate for temporarily showing/hiding content that is already approved and published.
>
>If you wish to publish new content with all associated workflows or entirely remove (unpublish content) from your site, consider [managing your publication.](/help/sites-authoring/publishing-pages.md#manage-publication)

#### Vanity URL {#vanity-url}

Enter a vanity URL for this page, which can let you have a shorter and/or more expressive URL.

For example, if the Vanity URL is set to `welcome`to the page identified by the path `/v1.0/startpage`for the website `http://example.com,` then `http://example.com/welcome`would be the vanity URL of `http://example.com/content/v1.0/startpage`

>[!CAUTION]
>
>Vanity URLs:
>
>* Must be unique.
>* Do not support regex patterns.
>* Should not be set to an existing page.

Configure Dispatcher to enable access to vanity URLs. See [Enabling Access to Vanity URLs](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html#enabling-access-to-vanity-urls-vanity-urls) for more details.

* **Add** - Tap or click to add a vanity URL.
* **Remove** - Tap or click to remove a vanity URL.
**Redirect Vanity URL** - Indicates whether you want the page to use the vanity URL or redirect to the page's actual URL

### Advanced {#advanced}

#### Settings {#settings}

* **Language** - The page language
* **Language Root** - Must be checked if the page is the root of a language copy
* **Redirect** - Indicates the page to which this page should automatically redirect
* **Design** - Indicates the [design](/help/sites-developing/designer.md) to be used for this page.
* **Alias** - Specifies an alias to be used with this page
  * For example, if you define an alias of `private` for the page `/content/wknd/us/en/magazine/members-only`, then this page can also be accessed via `/content/wknd/us/en/magazine/private`
  * Creating an alias sets the `sling:alias` property on the page node, which only impacts the resource, not the repository path.
  * Pages accessed by aliases in the editor cannot be published. [Publish options](/help/sites-authoring/publishing-pages.md) in the editor are only available for pages accessed via their actual paths.
  * For further details, see [Localized page names under SEO and URL Management Best Practices](/help/managing/seo-and-url-management.md#localized-page-names).

#### Configuration {#configuration}

* **Inherited from &lt;*path*&gt;** - Enable/disable inheritance of the **Cloud Configuration** for the page
* **Cloud Configuration** - The path to the configuration

#### Template Settings {#templates}

* **Allowed Templates** - [Defines the list of templates that are available](/help/sites-authoring/templates.md#allowingatemplate) within this sub-branch

#### Authentication Requirement {#authentication}

* **Enable** - Enable (or disable) the use of authentication so you can access the page
* **Login Page** - The page to be used for login

>[!NOTE]
>
>Closed user groups for the page are defined on the **[Permissions](/help/sites-authoring/editing-page-properties.md#permissions)** tab.

>[!CAUTION]
>
>The **[Permissions](#permissions)** tab allows the editing of CUG configurations based on the presence of the `granite:AuthenticationRequired` mixin. If page permissions are configured using deprecated CUG configurations, based on the presence of `cq:cugEnabled` property, a warning message is shown under **Authentication Requirement** and the option is not editable, nor are the [Permissions](/help/sites-authoring/editing-page-properties.md#permissions) editable.
>
>
>In such a case the CUG permissions must be edited in the [classic UI](/help/sites-classic-ui-authoring/classic-page-author-edit-page-properties.md).

#### Export {#export}

* **Configuration** - Specifies an export configuration

#### SEO {#seo}

* **Canonical Url** - Used to overwrite the page's canonical URL
  * If left blank the page's URL is its canonical URL.
* **Robots Tags** - Use the dropdown to select the robots tags to control the behavior of search engine crawlers
  * Some options conflict with each other, in which case the more permissive option take precedence.
* **Generate Sitemap** - When selected, a `sitemap.xml` is generated for this page, and its descendants.

### Images {#images}

#### Featured Image {#featured-image}

This section is used to select and configure the image to be featured. This is used in components referencing the page; for example, teasers, page lists, etc.

* **Image** -  You can **Pick** an asset, or browse for a file to upload, then **Edit**, or **Clear** the selected image.
* **Alternative Text** - Text used to represent the meaning and/or function of the image, commonly used by screen readers
* **Inherit - Value taken from the DAM asset** - When checked, the alternative text is populated with the value of the `dc:description`metadata in DAM.

#### Thumbnail {#thumbnail}

SThis section is used to select and configure the image thumbnail for the page. This is used in components referencing the page; for example, teasers, page lists, etc.

* **Generate Preview** - Generates a preview of the page that you want to use as a thumbnail
* **Upload Image** - Uploads an image that you want to use as a thumbnail
* **Select Image** - Selects an existing Asset that you want to use as the thumbnail
* **Revert** - This option becomes available after you have changed the thumbnail. If you do not want to keep your change, you can revert that change before saving.

### Cloud Services {#cloud-services}

* **Cloud Service Configurations** - Defines which configuration is used for cloud services for the page
* **Inherited from** - For Live Copies and Language Copies, cloud configurations are by default inherited from the Blueprint.
  * Uncheck to override inheritance

### Personalization {#personalization}

#### ContextHub Configurations {#contexthub}

* **Inherited from** - ContextHub configurations are by default inherited from the parent page.
  * Uncheck to override inheritance.
* **ContextHub Path** - Selects the [ContextHub Configuration](/help/sites-developing/ch-configuring.md)
* **Segments Path** - Selects the [Segments Path](/help/sites-administering/segmentation.md).

#### Targeting Configuration {#targeting}

Select a [Brand to specify a scope for Targeting.](/help/sites-authoring/target-adobe-campaign.md)

>[!NOTE]
>This option requires the user account to be in the `Target Adminstrators`group.

### Permissions {#permissions}

Use the **Permissions** tab to define which users, groups, or [closed user groups (CUGs)](https://experienceleague.adobe.com/docs/experience-manager-learn/assets/advanced/closed-user-groups.html) can access and/or modify the page.

* [Add Permissions](/help/sites-administering/user-group-ac-admin.md)
* [Edit Closed User Group](/help/sites-administering/cug.md#applying-your-closed-user-group-to-content-pages)
* View the [Effective Permissions](/help/sites-administering/user-group-ac-admin.md)

>[!CAUTION]
>
>The **Permissions** tab allows editing of CUG configurations based on the presence of the `granite:AuthenticationRequired` mixin. If page permissions are configured using deprecated CUG configurations, based on the presence of `cq:cugEnabled` property, a warning message is shown and the CUG permissions are not editable, nor is the Authentication Requirement on the [Advanced](/help/sites-authoring/editing-page-properties.md#advanced) tab editable.
>
>
>In such a case the CUG permissions must be edited in the [classic UI](/help/sites-classic-ui-authoring/classic-page-author-edit-page-properties.md).

>[!NOTE]
>
>The Permissions tab does not allow the creation of empty CUG groups, which can be useful as a simple way to deny access to every user. To do this, CRX Explorer must be used. See the document [User, Group, and Access Rights Administration](/help/sites-administering/user-group-ac-admin.md) for more information.

### Blueprint {#blueprint}

This tab is only visible for pages that serve as blueprints. Blueprints serve as the basis for Live Copies, and are part of [Multi Site Management.](/help/sites-administering/msm.md)

* **Rollout** - Initiates a rollout of blueprint content to the Live Copies
* **Live Copy Overview** - Opens a window to browse the Live Copy page structure
* **Current Live Copies** - A list of pages that are based on (that is, are Live Copies of) the selected blueprint page
* **Rollout Config** - Defines the rollout configuration for the page

### Live Copy {#live-copy}

This tab is only visible for pages that are configured as live copies. As with [blueprints,](#blueprint) Live Copies are part of [Multi Site Management.](/help/sites-administering/msm.md)

* **Synchronize** - Synchronizes Live Copy with blueprint, keeping local modifications
* **Reset** - Resets Live Copy to state of blueprint, removing local modifications
* **Suspend** - Suspends Live Copy from further rollout modifications
* **Detach** - Detaches Live Copy from blueprint

#### Source {#source}

* Displays the path of the blueprint for this Live Copy

#### Status {#status}

* Lists current Live Copy status of the page

#### Configuration {#live-copy-config}

* **Live Copy Inheritance** - If checked, the Live Copy configuration is effective on all children.
* **Inherit Rollout Configs from Parent** - If checked, the rollout configuration is inherited from the parent of the page.
* **Choose Rollout Config** - Defines the circumstances under which modifications are propagated from the Blueprint and only available when **Inherit Rollout Configs from Parent** is not selected
* **List of excluded paths**

## Editing Page Properties {#editing-page-properties-1}

You can define page properties:

* From the **Sites** console:

  * [Creating a page](/help/sites-authoring/managing-pages.md#creating-a-new-page) (a subset of the properties)

  * Clicking or tapping **Properties**

    * For a single page
    * For multiple pages (only a subset of the properties are available for editing en masse)

* From the page editor:

  * Using **Page Information** (then **Open Properties**)

### From the Sites Console - Single Page {#from-the-sites-console-single-page}

Clicking or tapping **Properties** to define the page properties:

1. Using the **Sites** console, navigate to the location of the page for which you want to view and edit properties.

1. Select the **Properties** option for the required page using either:

   * [Quick actions](/help/sites-authoring/basic-handling.md#quick-actions)
   * [Selection mode](/help/sites-authoring/basic-handling.md#selectionmode)

   The page properties are shown using the appropriate tabs.

1. Either view or edit the properties as required.

1. Then use **Save** to save your updates followed by **Close** so you can return to the console.

### When Editing a Page {#when-editing-a-page}

When editing a page, you can use **Page Information** to define the page properties:

1. Open the page for which you want to edit properties.

1. Select the **Page Information** icon to open the selection menu:

   ![screen_shot_2018-03-22at095740](assets/screen_shot_2018-03-22at095740.png)

1. Select **Open Properties** and a dailog box opens letting you edit the properties, sorted by the appropriate tab. The following buttons are also available at the right of the toolbar:

    * **Cancel**
    * **Save & Close**

1. Use the **Save & Close** button to save the changes.

### From the Sites Console - Multiple Pages {#from-the-sites-console-multiple-pages}

From the **Sites** console, you can select several pages then use **View Properties** to view and/or edit the page properties. This is referred to as bulk editing of page properties.

>[!NOTE]
>
>Bulk editing of properties is also available for Assets. It is similar, but differs in a few points. See [Editing Properties of Multiple Assets](/help/assets/metadata.md) for details.
>
>There is also the [Bulk Editor](/help/sites-administering/bulk-editor.md). This editor lets you search for content from multiple pages using GQL (Google Query Language), and then edit the content directly using the Bulk Editor before saving your changes to the originating pages.

You can select multiple pages for bulk editing by various methods, including:

* When browsing the **Sites** console
* After using **Search** to locate a set of pages

![epp-01](assets/epp-01.png)

After selecting the pages and then clicking or tapping the **Properties option**, the bulk properties are shown:

![epp-02](assets/epp-02.png)

You can only bulk edit pages that:

* Share the same resource type
* Are not part of a livecopy

  * If any of the pages are in a live copy, then a message is shown when the properties are opened.

Once you have entered Bulk Editing, you can do the following:

* **View**

  When viewing Page Properties for multiple pages, you can see the following:

  * A list of the pages impacted

    * You can select/deselect if necessary

  * Tabs

    * As when viewing properties for a single page, the properties are ordered under tabs.

  * A subset of properties

    * Properties that are available on all selected pages and have been explicitly defined as available to bulk editing are visible.
    * If you reduce the page selection to one page, then all properties are visible.

  * Common properties with a common value

    * Only properties with a common value are shown in View mode.
    * When the field is multi-value (for example, Tags), values are only shown when *all* are common. If only some are common, they are only shown when editing.

  When no properties with a common value exist, a message is displayed.

* **Edit**

  When editing Page Properties for multiple pages:

  * You can update the values in the fields available.

    * The new values are applied to all selected pages when you select **Done**.
    * When the field is multi-value (for example, Tags), you can either append a new value or remove a common value.

  * Fields that are common, but have different values across the various pages, are indicated with a special value such as the text `<Mixed Entries>`. 

>[!NOTE]
>
>The page component can be configured to specify the fields available for bulk editing. See [Configuring your page for bulk editing of page properties](/help/sites-developing/bulk-editing.md).
