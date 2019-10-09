---
title: Experience the Published Site
seo-title: Experience the Published Site
description: Browse to a published site
seo-description: Browse to a published site
uuid: f510224c-d991-4528-864d-44672138740c
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: introduction
content-type: reference
discoiquuid: 4dc54701-68b9-49dd-a212-b0b53330c1c0
---

# Experience the Published Site {#experience-the-published-site}

## Browse to New Site on Publish {#browse-to-new-site-on-publish}

Now that the newly created communities site has been published, browse to the URL displayed when creating the site, but on the publish server, e.g.

* Author URL = http://localhost:4502/content/sites/engage/en.html
* Publish URL = http://localhost:4503/content/sites/engage/en.html

To minimize confusion as to which member is signed in on author and publish, it is suggested to use different browsers for each instance.

When first arriving at the published site, the site visitor would typically not already be signed in and would be anonymous.

## http://localhost:4503/content/sites/engage/en.html {#http-localhost-content-sites-engage-en-html}

![chlimage_1-311](assets/chlimage_1-311.png) 

## Anonymous Site Visitor {#anonymous-site-visitor}

An anonymous site visitor sees the following in the UI:

* Title of the site. Which is Getting Started Tutorial
* No profile link
* No messages link
* No notifications link
* Sarch field
* Log in link
* The brand banner
* Menu links for the components included in the Reference Site Template

If you select various links, you will find they are in read-only mode.

## Prevent anonymous access on JCR {#prevent-anonymous-access-on-jcr}

A known limitation exposes the community site content to anonymous visitors through  jcr  content and  json , though **allow anonymous access** is disabled for the site's content. However, this behavior can be controlled using Sling Restrictions as a workaround.

To protect your community site's content from access by anonymous users through  jcr  content and  json , follow these steps:

1. On AEM Author instance, go to https://&lt;host&gt;:&lt;port&gt;/editor.html/content/site/&lt;sitename&gt;.html.

   >[!NOTE]
   >
   >Do not go to the localized site.

1. Go to **[!UICONTROL Page Properties]**.

   ![site-authentication](assets/site-authentication.png)

1. Go to **[!UICONTROL Advanced]** tab.

   ![page-properties](assets/page-properties.png)

1. Enable **[!UICONTROL Authentication Requirement]**.
1. Add the path of the login page. For example, `/content/......./GetStarted`.
1. Publish the page.

## Trusted Community Member {#trusted-community-member}

This experience assumes [Aaron McDonald](tutorials.md#demo-users) was assigned the roles of [community manager and moderator](create-site.md#roles). If not, return to the author environment to [modify the site settings](sites-console.md#modifying-site-properties) and select Aaron McDonald as both community manager and moderator.

In the upper right corner, select `Log in`, and sign with username "aaron.mcdonald@mailinator.com" and password "password". Notice the ability to sign in with Twitter or Facebook credentials.

![chlimage_1-312](assets/chlimage_1-312.png)

Once signed in, notice there is a new menu item, `Administration`, which appears because the member was given the role of Moderator. Now selecting various links is more interesting.

![chlimage_1-313](assets/chlimage_1-313.png)

Notice the Calendar page is the home page because the chosen Reference Site Template included the Calendar function first, followed by Activity Stream function, Forum function, and so on. This structure is visible from the [Site Template](sites.md#edit-site-template) console or when modifying site properties in the author environment:

![chlimage_1-314](assets/chlimage_1-314.png)

>[!NOTE]
>
>For more information on Communities components and functions, visit
>
>* [Communities Components](author-communities.md) (for authors)
>* [Component, Function, and Feature Essentials](essentials.md) (for developers)
>

## Forum link {#forum-link}

View the basic forum feature by selecting the Forum link.

Members are able to post a new topic or follow a topic.

Site visitors are able to view posts and sort them in various ways.

![chlimage_1-315](assets/chlimage_1-315.png) 

## Groups link {#groups-link}

Since Aaron is a group administrator, selecting the Groups link will allow Aaron to create a new community group by selecting a group template, image, whether the group is open or secret, and inviting members.

This is an example where a group is created in the publish environment.

Groups may also be created in the author environment and managed within the community site in the author environment (the [Community Groups console](groups.md)). The experience of [creating groups on author](nested-groups.md) is next in this tutorial.

![chlimage_1-316](assets/chlimage_1-316.png)

Create a Reference Group:

1. Select **[!UICONTROL New Group]**
1. **[!UICONTROL Settings tab]**
    * Group Name: `Sports`
    * Description: `A parent group for various sporting groups`
    * Group URL Name: `sports`
    * select `Open Group` (allow any community member to participate by joining)
1. **[!UICONTROL Template tab]**
    * Select `Reference Group` (contains a groups function in its structure to allow nested groups)
1. Select **[!UICONTROL Create Group]**

![chlimage_1-317](assets/chlimage_1-317.png)

After new group is created, **select the new Sports group** in order to create two groups (nested) within it. As a site structure can not begin with the groups function, after opening the Sports group, it is necessary to select the Groups link:

![chlimage_1-318](assets/chlimage_1-318.png)

The second set of links, beginning with `Blog`, belong to the currently selected group, the `Sports`group. By selecting the Sports' `Groups` link, it is possible to nest two groups within the Sports group.

As an example, add two n `ew groups.`

* One named `Baseball`
    * Leave it set as an `Open Group` (required membership)
    * On Templates tab, select `Conversational Group`
* One named `Gymnastics`
    * Change its setting to `Member Only Group` (restricted membership)
    * On Templates tab, select `Conversational Group`

**Notice**:

* A refresh of the page may be necessary before both groups are displayed
* This template does *not *include the groups function, so no further nesting of groups will be possible
* On author, the [Groups console](groups.md) provides a third choice - a `Public Group` (optional membership)

Once both groups are created, select the Baseball group, an open group, and notice its links: `Discussions` `What's New` `Members`
The group's links are displayed below the main site's links and results in the following display:

![chlimage_1-319](assets/chlimage_1-319.png)

On author - with administrative privileges, navigate to the [Communities Groups console](members.md) and add Weston McCall to the `Community Engage Gymnastics <uid> Members` group.

Continuing on publish, log out as Aaron McDonald, and view the groups in the Sports Group as an anonymous site visitor:

* From home page 
* Select `Groups`link
* Select `Sports`link
* Select the Sports' `Groups`link

Only the Baseball group will be visible.

Log in as Weston McCall (weston.mccall@dodgit.com / password), and navigate to the same location. Notice that Weston is able to `Join` the open `Baseball` group and either `enter or Leave` the private `Gymnastics`group.

![chlimage_1-320](assets/chlimage_1-320.png) 

## Web Page link {#web-page-link}

View the basic web page included in the site by selecting the Web Page link. The standard AEM authoring tools may be used to add content to this page in the author environment.

For example, go to **author** instance, open the `engage` folder in the [Communities Sites console](sites-console.md), select the **Open Site** icon to enter author edit mode. Then select preview mode to select the `Web Page`link, then select edit mode to add Title and Text components. Last, re-publish either just the page or the entire site.

![chlimage_1-321](assets/chlimage_1-321.png) 

## Administration Link {#administration-link}

When the community member has moderation privileges, then the Administration link will be visible and selecting it will display the community content posted and allow it to be [moderated](moderate-ugc.md) in a manner similar to the [moderation console](moderation.md) in the author environment.

Use the browser's back button to return to the published site. Most consoles are not accessible from global navigation in the publish environment.

![chlimage_1-322](assets/chlimage_1-322.png) 

## Self-Registration {#self-registration}

After logging out, it is possible to create a new user registration.

* Select `Log In`
* Select `Sign up for a new account`

![chlimage_1-323](assets/chlimage_1-323.png) ![chlimage_1-324](assets/chlimage_1-324.png)

By default, the email address is the login id. If unchecked, the visitor is able to enter their own login id (user name). The user name must be unique in the publish environment.

After specifying the user's name, email, and password, selecting `Sign Up`will create the user and enable them to sign.

Once signed in, the first page presented is their `Profile`page, which they can personalize.

![chlimage_1-325](assets/chlimage_1-325.png)

If the member forgets their login id, it is possible to recover is using their email address.

![chlimage_1-326](assets/chlimage_1-326.png)
