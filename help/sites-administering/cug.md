---
title: Creating a Closed User Group
seo-title: Creating a Closed User Group
description: Learn how to create a Closed User Group.
seo-description: Learn how to create a Closed User Group.
uuid: dc3c7dbd-2e86-43f9-9377-3b75053203b3
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
discoiquuid: 6ae57874-a9a1-4208-9001-7f44a1f57cbe
docset: aem65
exl-id: 9efba91d-45e8-42e1-9db6-490d21bf7412
---
# Creating a Closed User Group{#creating-a-closed-user-group}

Closed User Groups (CUGs) are used to limit access to specific pages that reside within a published internet site. Such pages require the assigned members to login and provide security credentials.

To configure such a area within your website you:

* [create the actual closed user group and assign members](#creating-the-user-group-to-be-used).

* [apply this group to the required pages](#applying-your-closed-user-group-to-content-pages) and select (or create) the login page for use by the members of the CUG; also specified when applying a CUG to a content page.

* [create a link, of some form, to at least one page within the protected area](#linking-to-the-realm), otherwise it will not be visible.
* [configure the Dispatcher](#configure-dispatcher-for-cugs) if in use.

>[!CAUTION]
>
>Closed user groups (CUGs) should always be created with performance in mind.
>
>Although the number of users and groups in a CUG is not limited, a high number of CUGs on a page may slow down rendering performance.
>
>The impact of CUGs should always be considered when doing performance testing.

## Creating The User Group To Be Used {#creating-the-user-group-to-be-used}

To create a closed user group:

1. Go to **Tools - Security** from the AEM homescreen.

   >[!NOTE]
   >
   >See [Managing Users and Groups](/help/sites-administering/security.md#managing-users-and-groups) for full information on creating and configuring users and groups.

1. Select the **Groups** card from the next screen.

   ![screenshot_2018-10-30at145502](assets/screenshot_2018-10-30at145502.png)

1. Press the **Create** button in the top right corner, in order to create a new group.
1. Name your new group; for example, `cug_access`.

   ![screenshot_2018-10-30at151459](assets/screenshot_2018-10-30at151459.png)

1. Go to the **Members** tab and assign the required users to this group.

   ![screenshot_2018-10-30at151808](assets/screenshot_2018-10-30at151808.png)

1. Activate any users that you have assigned to your CUG; in this case, all members of `cug_access`.
1. Activate the closed user group so that it is available in the publish environment; in this example, `cug_access`.

## Applying Your Closed User Group To Content Pages {#applying-your-closed-user-group-to-content-pages}

To apply the CUG to a page:

1. Navigate to the root page of the restricted section you want to assign to your CUG.
1. Select the page by clicking on its thumbnail and then clicking **Properties** in the top panel.

   ![screenshot_2018-10-30at162632](assets/screenshot_2018-10-30at162632.png)

1. In the following window, go to the **Advanced** tab.
1. Scroll down and enable the tickbox in the **Authentication Requirement** section.

1. Add your configuration path below, then press Save.
1. Next, go to the **Permissions** tab and press the **Edit Closed User Group** button.

   ![screenshot_2018-10-30at163003](assets/screenshot_2018-10-30at163003.png)

   >[NOTE!]
   >
   > Note that CUGs in the Permissions tab cannot be rolled back from Blueprints to Live Copies. Please plan around this when configuring Live Copy.
   >
   > For more information, see [this page](closed-user-groups.md#aem-livecopy).

1. Look for and add your CUG in the following window - in this case add the group named **cug_access**. Finally, press **Save**.
1. Click **Enabled** to define that this page (and any child pages) belong to a CUG.
1. Specify the **Login Page** that members of the group will use; for example:

   `/content/geometrixx/en/toolbar/login.html`

   This is optional, if left blank the standard login page will be used.

1. Add the **Admitted Groups**. Use + to add groups or - to remove. Only members of these groups will be allowed to log in and access the pages.
1. Assign a **Realm** (a name for the groups of pages) if required. Leave empty to use the page title.
1. Click **OK** to save the specification.

See [Identity Management](/help/sites-administering/identity-management.md) for information about profiles in the publish environment and providing forms for logging in and out.

## Linking To The Realm {#linking-to-the-realm}

Since the target of any links to the CUG Realm are not visible to the anonymous user, the linkchecker will remove such links.

To avoid this, it is advisable to create non-protected redirect pages that point to pages within the CUG Realm. The navigation entries are then rendered without causing the linkchecker any problems. Only when actually accessing the redirect page will the user be redirected inside the CUG Realm - after successfully providing their login credentials.

## Configure Dispatcher for CUGs {#configure-dispatcher-for-cugs}

If you are using Dispatcher, you need to define a Dispatcher farm with the following properties:

* [virtualhosts](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#identifying-virtual-hosts-virtualhosts): Matches the path to the pages that the CUG applies to.
* \sessionmanagement: see below.
* [cache](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#configuring-the-dispatcher-cache-cache): A cache directory that is dedicated to the files that the CUG applies to.

### Configuring Dispatcher Session Management for CUGs {#configuring-dispatcher-session-management-for-cugs}

Configure [session management in the dispatcher.any file](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#enabling-secure-sessions-sessionmanagement) for the CUG. The authentication handler that is used when access is requested for CUG pages determines how you configure session management.

```xml
/sessionmanagement
    ...
    /header "Cookie:login-token"
    ...
```

>[!NOTE]
>
>When a Dispatcher farm has session-management enabled, all pages that the farm handles are not cached. To cache pages that are outside of CUG, create a second farm in dispatcher.any
>that handles the non-CUG pages.

1. Configure [/sessionmanagement](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#enabling-secure-sessions-sessionmanagement) by defining `/directory`; for example:

   ```xml
   /sessionmanagement
     {
     /directory "/usr/local/apache/.sessions"
     ...
     }
   ```

1. Set [/allowAuthorized](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#caching-when-authentication-is-used) to `0`.
