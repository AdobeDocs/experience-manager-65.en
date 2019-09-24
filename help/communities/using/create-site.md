---
title: Author a New Community Site
seo-title: Author a New Community Site
description: How to author a new AEM Communities site
seo-description: How to author a new AEM Communities site
uuid: e1033437-d37e-4cb9-984b-d0b2d45fb910
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: introduction
content-type: reference
discoiquuid: b08babbb-4c9f-4d71-ace8-d8adaecb1137
index: y
internal: n
snippet: y
---

# Author a New Community Site{#author-a-new-community-site}

| ** [⇐ Initial Setup](/communities/using/setup.md)** |** [Experience the Published Site ⇒](../../communities/using/published-site.md)** |
|---|---|

## Create a Community Site {#create-a-community-site}

Use the author instance to create a community site. On AEM Author instance:

1. Sign in with administrator privileges.
1. From global navigation, go to **Navigation, Communities, Sites.**

The Communities Sites console provides a wizard to guide one through the steps of creating a community site. It is possible to move forward to the `Next`step or `Back`to the previous step before committing the site in the final step.

To begin creating a new community site:

* select the `Create`button.

![](assets/createcommunitysite.png) 

### Step 1: Site Template {#step-site-template}

![template to create site](assets/create-site.png)

On the [Site Template step](../../communities/using/sites-console.md#step2013asitetemplate), enter a title, description, the name for the URL, and select a community site template, for example:

* **Community Site Title**: `Getting Started Tutorial`

* **Community Site Description**: `A site for engaging with the community.`  

* **Community Site Root**: (leave blank for default root `/content/sites`)  

* **Cloud Configurations**: (leave blank if no cloud configurations are specified) provide path to the specified cloud configurations. 
* **Community Site Base Language**: (leave untouched for single language: English) use the drop-down list to choose one *or more* base languages from the available languages- German, Italian, French, Japanese, Spanish, Portuguese (Brazil), Chinese (Traditional), and Chinese (Simplified). One community site will be created for each language added, and will exist within the same site folder following the best practice described in [Translating Content for Multilingual Sites](../../sites/administering/using/translation.md). The root page of each site will contain a child page named by the language code of one of the languages selected, such as 'en' for English or 'fr' for French.

* **Community Site Name**: engage

    * double-check the name as it is not easily changed after the site is created
    * the initial URL will be displayed underneath the Community Site Name
    * for a valid URL, append a base language code + ".html"
    * *for example*, http://localhost:4502/content/sites/ `engage/en.html`

* **Template**: pull down to choose `Reference Site`

Select **Next**

### Step 2: Design {#step-design}

The Design step is presented in two sections for selecting the theme and branding banner:

#### COMMUNITY SITE THEME {#community-site-theme}

Select the desired style to apply to the template. When selected, the theme will be overlaid with a check mark.

#### COMMUNITY SITE BRANDING {#community-site-branding}

(optional) Upload a banner image to display across the site pages. The banner is pinned to the left edge of the browser, between the community site header and navigation links. The banner height is cropped to 120 pixels. There is no resizing of the banner to fit the width of the browser and 120 pixel height.

![](assets/chlimage_1-58.png) ![](assets/chlimage_1-59.png)

Select **Next**.

### Step 3: Settings {#step-settings}

On the Settings step, before selecting `Next`, note that there are seven sections providing access to configurations involving user management, tagging, moderation, group management, analytics, translation and enablement.

Visit the [Getting Started with AEM Communities for Enablement](/communities/using/getting-started-enablement.md) tutorial to experience working with the enablement features.

#### User Management {#user-management}

Check all checkboxes for [User Management](../../communities/using/sites-console.md#user-management)

* to allow site visitors to self-register
* to allow site visitors to view the site without signing in
* to allow members to send and receive messages from other community members
* to allow signing-in with Facebook instead of registering and creating a profile
* to allow signing-in with Twitter instead of registering and creating a profile

>[!NOTE]
>
>For a production environment, it is necessary to create custom Facebook and Twitter applications. See [Social Login with Facebook and Twitter](/communities/using/social-login.md).

![community site settings](assets/site-settings.png) 

#### TAGGING {#tagging}

The tags which may be applied to community content are controlled by selecting AEM namespaces previously defined through the [Tagging Console](/sites/administering/using/tags.md#tagging-console) (such as the [Tutorial namespace](/communities/using/setup.md#create-tutorial-tags)).

Finding namespaces is easy using type-ahead search. For example,

* type 'tut'
* select `Tutorial`

![](assets/chlimage_1-60.png) 

#### ROLES {#roles}

[Community member roles](/communities/using/users.md) are assigned through the settings in the Roles section.

To let a community member (or group of members) experience the site as the community manager, use the type-ahead search and select the member or group name from the options in the drop-down.

For example,

* type "q"
* select [Quinn Harper](/communities/using/enablement-setup.md#publishcreateenablementmembers)

>[!NOTE]
>
>[Tunnel service](https://helpx.adobe.com/experience-manager/6-3/communities/using/deploy-communities.html#tunnel-service-on-author) allows selection of members and groups existing only in the  publish  environment.

![user roles in new site](assets/site-admin-1.png) 

#### MODERATION {#moderation}

Accept the default global settings for [moderating](../../communities/using/sites-console.md#moderation) user-generated content (UGC).

![](assets/chlimage_1-61.png) 

#### ANALYTICS {#analytics}

If Adobe Analytics is licensed and an Analytics cloud service and framework have been configured, then it is possible to enable Analytics and select the framework.

See [Analytics Configuration for Communities Features](../../communities/using/analytics.md).

![](assets/chlimage_1-62.png) 

#### TRANSLATION {#translation}

The [Translation settings](../../communities/using/sites-console.md#translation) specify the base language for the site as well as whether or not UGC may be translated and into which language, if so.

* check **Allow Machine Translation**
* leave default languages selected for translation by the default Machine Translation service
* leave default translation provider and config
* there's no need for a global store because there are no language copies
* select **Translate entire page**
* leave default persistence option

![](assets/chlimage_1-63.png) 

#### ENABLEMENT {#enablement}

Leave empty when creating an engagement community.

For a similar tutorial to quickly create an [enablement community](../../communities/using/overview.md#enablement-community), see [Getting Started with AEM Communities for Enablement](/communities/using/getting-started-enablement.md).

Select **Next**.

### Step 4: Create Communities Site {#step-create-communities-site}

Select **Create.**

![](assets/chlimage_1-64.png)

When the process completes, the folder for the new site is displayed in the Communities - Sites console.

![](assets/communitiessitesconsole.png) 

## Publish the Community Site {#publish-the-community-site}

The created site should be managed from the Communities - Sites console, the same console from where new sites may be created.

After selecting the community site's folder to open it, hover over the site icon such that four action icons appear:

![](assets/siteactionicons-1.png)

On selecting the fourth ellipses icon (More Actions), Export Site and Delete Site options show up.

![](assets/siteactionsnew-1.png)

From left to right they are:

* **Open Site** 
  select the pencil icon to open the community site in author edit mode, to add and/or configure page components

* **Edit Site** 
  select the properties icon to open the community site for modification of properties, such as the title or to change the theme

* **Publish Site** 
  select the world icon to publish the community site (for example if your publish server is running on your local machine, then to localhost:4503 by default)  

* **Export Site** 
  select the export icon to create a package of the community site that is both stored in [package manager](../../sites/administering/using/package-manager.md) and downloaded.  
  Note that UGC is not included in the site package.

* **Delete Site  
  **select the delete icon to delete the community site from within Communities &gt; Sites console. This action removes all the items associated with the site, such as UGC, user groups, assets and database records.

![](assets/siteactions.png)

>[!NOTE]
>
>If not using the default port 4503 for the publish instance, then edit the default replication agent to set the port number to the correct value.
>
>On the author instance, from the main menu:
>
>1. Navigate to Tools &gt; Operations &gt; Replication menu.
>1. Select "Agents on author".
>1. Select "Default Agent (publish)".
>1. Next to "Settings" select "Edit".
>1. In pop-up dialog for Agent Settings, select Transport tab.
>1. In URI, change the port number, 4503, to the desired port number >
>    * for example, to use port 6103:   
>      http://localhost:6103/bin/receive?sling:authRequestLogin=1
>
>1. Select "OK".
>1. (optional) Select "Clear" or "Force Retry" to reset the replication queue.
>

#### Select Publish {#select-publish}

After ensuring the publish server is running, select the world icon to publish the community site.

![](assets/chlimage_1-65.png)

When the community site has been successfully published, a message briefly appears :

![](assets/chlimage_1-66.png) 

### New Community User Groups {#new-community-user-groups}

Along with the new community site, new user groups are created which have the appropriate permissions set for various administrative functions. For details, visit [User Groups for Community Sites](/communities/using/users.md#usergroupsforcommunitysites).

For this new community site, given the site name "engage" in Step 1, the four new user groups may be seen from the [Groups console](/communities/using/members.md) (global navigation: Communities, Groups):

* Community Engage Community managers
* Community Engage Group administrators
* Community Engage Members
* Community Engage Moderators
* Community Engage Privileged members
* Community Engage Site content manager

Note that [Aaron McDonald](/communities/using/tutorials.md#demo-users) is a member of

* Community Engage Community managers
* Community Engage Moderators
* Community Engage Members (indirectly as a member of Moderators group)

![](assets/chlimage_1-67.png) 

#### http://localhost:4503/content/sites/engage/en.html {#http-localhost-content-sites-engage-en-html}

![](assets/chlimage_1-68.png) 

## Configure for Authentication Error {#configure-for-authentication-error}

Once a site has been configured and pushed to publish, [configure login mapping](../../communities/using/sites-console.md#configure-for-authentication-error) ( `Adobe Granite Login Selector Authentication Handler`) on the publish instance. The benefit is that when login credentials are not entered correctly, the authentication error will redisplay the community site's login page with an error message.

Add a `Login Page Mapping` as

* /content/sites/engage/en/signin:/content/sites/engage/en

## Optional Steps {#optional-steps}

### Change the Default Home Page {#change-the-default-home-page}

When working with the publish site for demonstration purposes, it might be useful to change the default home page to the new site.

To do so requires using [CRXDE](http://localhost:4503/crx/de) Lite to edit the [resource-mapping](../../sites/deploying/using/resource-mapping.md) table on publish.

To get started:

1. On publish instance, sign in with administrator privileges.
1. Browse to [http://localhost:4503/crx/de](http://localhost:4503/crx/de).
1. In the project browser, expand `/etc/map.`
1. Select the `http` node:

    * Select **Create Node:**

        * **Name **localhost.4503  
          (do *not *use ':')
        
        * **Type ** [sling:Mapping](http://sling.apache.org/documentation/the-sling-engine/mappings-for-resource-resolution.html)

1. With newly created `localhost.4503` node selected:

    * Add property:

        * **Name** sling:match
        * **Type** String
        * **Value** localhost.4503/$  
          (must end with '$' char)

    * Add property:

        * **Name** sling:internalRedirect
        * **Type** String
        * **Value** /content/sites/engage/en.html

1. Select **Save All.**
1. (optional) Delete the browsing history.
1. Browse to http://localhost:4503/.

    * arrive at http://localhost:4503/content/sites/engage/en.html

>[!NOTE]
>
>To disable, simply prefix the `sling:match` property value with an 'x' - `xlocalhost.4503/$` - and **Save All**.

![](assets/chlimage_1-69.png) 

#### Troubleshooting: Error Saving Map {#troubleshooting-error-saving-map}

If unable to save changes, be sure that the node name is `localhost.4503`, with a 'dot' separator, and not `localhost:4503` with a 'colon' separator, as `localhost`is not a valid namespace prefix.

![](assets/chlimage_1-70.png) 

#### Troubleshooting: Fail to Redirect {#troubleshooting-fail-to-redirect}

The '**$**' at the end of the regular expression `sling:match`string is crucial, so that only exactly `http://localhost:4503/` is mapped, else the redirect value is prefixed to any path that might exist after the server:port in the URL. Thus, when AEM tries to redirect to the login page, it fails.

### Modify the Site {#modify-the-site}

After the site has been initially created, authors may use the [Open Site icon](../../communities/using/sites-console.md#authoring-site-content) to perform standard AEM authoring activities.

In addition, administrators may use the [Edit Site icon](../../communities/using/sites-console.md#modifying-site-properties) to modify properties of the site, such as the title.

After any modification, remember to **Save** and re-**Publish** the site.

>[!NOTE]
>
>If not familiar with AEM, view the documentation on [basic handling](../../sites/authoring/using/basic-handling.md) and a [quick guide to authoring pages](../../sites/authoring/using/qg-page-authoring.md).

| ** [⇐ Initial Setup](/communities/using/setup.md)** |** [Experience the Published Site ⇒](../../communities/using/published-site.md)** |
|---|---|

