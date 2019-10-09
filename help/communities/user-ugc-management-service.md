---
title: User and UGC Management Service in AEM Communities
seo-title: User and UGC Management Service in AEM Communities
description: Use APIs to bulk delete and bulk export user generated content, and disable user account. 
seo-description: Use APIs to bulk delete and bulk export user generated content, and disable user account. 
uuid: f4663825-eac8-4ef5-8253-46875e0cd71d
contentOwner: mgulati
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: administering
discoiquuid: f564759f-fb56-4f70-a7b1-286a223755c6
---

# User and UGC Management Service in AEM Communities {#user-and-ugc-management-service-in-aem-communities}

AEM Communities exposes APIs out-of-the-box to manage user profiles and bulk manage user generated content (UGC). Once enabled, the **UserUgcManagement** service allows the privileged users (community administrators and moderators) to disable user profiles, and bulk delete or bulk export UGC for specific users. These APIs also enable controllers and processors of customer data to comply with the European Union's General Data Protection Regulations (GDPR) and other GDPR inspired privacy mandates.

For further information see the [GDPR page at the Adobe Privacy Center](https://www.adobe.com/privacy/general-data-protection-regulation.html).

>[!NOTE]
>
>If you configured [Adobe Analytics in AEM Communities](analytics.md) site, the captured user data is sent to Adobe Analytics server. Adobe Analytics provides APIs that allow you to access, export, and delete user data and comply with GDPR. For more information, see [Submit Access and Delete Requests](https://marketing.adobe.com/resources/help/en_US/analytics/gdpr/gdpr_submit_access_delete.html).

To put these APIs to use, you need to enable the `/services/social/ugcmanagement` endpoint by activating the UserUgcManagement service. To activate this service, install the [sample servlet](https://github.com/Adobe-Marketing-Cloud/aem-communities-ugc-migration/tree/master/bundles/communities-ugc-management-servlet) available on [GitHub.com](https://github.com/Adobe-Marketing-Cloud/aem-communities-ugc-migration/tree/master/bundles/communities-ugc-management-servlet). Then, hit the endpoint on publish instance of your communities site with appropriate parameters using an http request, similar to the following:

`http://localhost:port/services/social/ugcmanagement?user=<authorizable ID>&operation<getUgc>`

However, you can also build a UI (user interface) to manage user profiles and user generated content in system.

These APIs enable perform the following functions.

## Retrieve the UGC of a user {#retrieve-the-ugc-of-a-user}

`getUserUgc(ResourceResolver resourceResolver, String user, OutputStream outputStream)` helps export all the UGC of a user from the system.

* **user**: authorizable ID of a user.
* **outputStream**: result is returned as output stream, which is a zip file including the user generated content (as json file) and attachments (which include images or videos uploaded by the user).

For example, to export the UGC of a user named Weston McCall, who uses weston.mccall@dodgit.com as authorizable ID to log in to communities site, you can send an http GET request similar to the following:

`http://localhost:port/services/social/ugcmanagement?user=weston.mccall@dodgit.com&operation=getUgc`

## Delete the UGC of a user {#delete-the-ugc-of-a-user}

**deleteUserUgc(ResourceResolver resourceResolver, String user)** helps delete all the UGC for a user from the system.

* **user**: authorizable ID of the user.

For example, to delete the UGC of a user having authorizable ID weston.mccall@dodgit.com through http-POST request, use the following parameters:

* user= weston.mccall@dodgit.com
* operation= deleteUgc

### Delete UGC from Adobe Analytics {#delete-ugc-from-analytics}

To delete user data from the Adobe Analytics, follow the GDPR Analytics workflow; as the API does not delete user data from Adobe Analytics.

For Adobe Analytics variables mappings used by AEM Communities, refer the following image:

![AEM communities variable mapping for Adobe Analytics](assets/Analytics-Communities-Mapping.png)

## Disable a User Account {#disable-a-user-account}

**deleteUserAccount(ResourceResolver resourceResolver, String user)** helps disable a user account.

* **user**: authorizable ID of the user.

>[!NOTE]
>
>Disabling a user deletes all the user generated content that the user has on the server.

For example, to delete the profile of a user having authorizable ID weston.mccall@dodgit.com through http-POST request, use the following parameters:

* user= weston.mccall@dodgit.com
* operation= deleteUser

>[!NOTE]
>
>deleteUserAccount() API only disables a user profile in the system and removes the UGC. However, to delete a user profile from the system, navigate to **CRXDE Lite**: [https://&lt;server&gt;/crx/de](http://localhost:4502/crx/de), locate the user node and delete it.
