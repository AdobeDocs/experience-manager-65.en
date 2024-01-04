---
title: SRP and UGC Essentials
description: Storage resource provider and user-generated content overview
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 8279684f-23dd-4234-bf01-fd2ce74bcb4e
---
# SRP and UGC Essentials {#srp-and-ugc-essentials}

## Introduction {#introduction}

If unfamiliar with the storage resource provider (SRP) and its relationship to user-generated content (UGC), visit [Community Content Storage](working-with-srp.md) and [Storage Resource Provider Overview](srp.md).

This section of the documentation provides some essential information about SRP and UGC.

## StorageResourceProvider API {#storageresourceprovider-api}

The SocialResourceProvider API (SRP API) is an extension of various Sling Resource Provider APIs. It includes support for pagination and atomic increment (useful for tally and scoring).

Queries are necessary for SCF components as there is the need to sort by date, helpfulness, number of votes, and so on. All SRP options have flexible query mechanisms which do not rely on bucketing.

The SRP storage location incorporates the component path. The SRP API should always be used to access UGC as the root path depends on the SRP option selected, such as ASRP, MSRP, or JSRP.

The SRP API is not an abstract class, it is an interface. A custom implementation should not be undertaken lightly, as the benefits of future improvements to internal implementations would be missed when upgrading to a new release.

The means for using the SRP API are through provided utilities, such as those found in the SocialResourceUtilities package.

When upgrading from AEM 6.0 or earlier, it will be necessary to migrate UGC for all SRPs, for which an Open Source tool is available. See [Upgrading to AEM Communities 6.3](upgrade.md).

>[!NOTE]
>
>Historically, utilities for accessing UGC were found in the SocialUtils package, which no longer exists.
>
>For replacement utilities, see [SocialUtils Refactoring](socialutils.md).

## Utility Method to Access UGC {#utility-method-to-access-ugc}

To access UGC, use a method from the SocialResourceUtilities package that returns a path suitable for accessing UGC from SRP and replaces the deprecated method found in the SocialUtils package.

Following is a minimal example of using the resourceToUGCStoragePath() method in a servlet:

```java
import com.adobe.cq.social.srp.utilities.api.SocialResourceUtilities;

@Reference
private SocialResourceUtilities socialResourceUtilities;

@Override
protected void doGet(final SlingHttpServletRequest request, final SlingHttpServletResponse response) throws ServletException, IOException {
  String ugcPath = socialResourceUtilities.resourceToUGCStoragePath(request.getResource());
  // rest of servlet
}
```

For other SocialUtils replacements, see [SocialUtils Refactoring](socialutils.md).

For coding guidelines, visit [Accessing UGC with SRP](accessing-ugc-with-srp.md).

>[!CAUTION]
>
>The path resourceToUGCStoragePath() returns is *not* suitable for [ACL checking](srp.md#for-access-control-acls).

## Utility Method to Access ACLs {#utility-method-to-access-acls}

Some SRP implementations, such as ASRP and MSRP, store community content in databases which provide no ACL verification. Shadow nodes provide a location in the local repository to which ACLs can be applied.

Using the SRP API, all SRP options perform the same check of the shadow location prior to all CRUD operations.

To check ACLs, use a method that returns a path suitable for checking the permissions applied to the resource's UGC.

Following is a simple example of using the resourceToACLPath() method in a servlet:

```java
import com.adobe.cq.social.srp.utilities.api.SocialResourceUtilities;

@Reference
private SocialResourceUtilities socialResourceUtilities;

@Override
protected void doGet(final SlingHttpServletRequest request, final SlingHttpServletResponse response) throws ServletException, IOException {
  String aclPath = socialResourceUtilities.resourceToACLPath(request.getResource());
  // rest of servlet
}
```

>[!CAUTION]
>
>The path returned by resourceToACLPath() is *not* suitable for [accessing the UGC](#utility-method-to-access-acls) itself.

## UGC-Related Storage Locations {#ugc-related-storage-locations}

The following descriptions of storage location may be of help when developing with JSRP or perhaps MSRP. There is currently no UI to access UGC stored in ASRP, as there is for JSRP ([CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md)) and MSRP (MongoDB tools).

**Component location**

When a member enters UGC in the publish environment, they are interacting with a component as part of an AEM site.

An example of such a component is the [comments component](http://localhost:4502/content/community-components/en/comments.html) that exists in the [Community Components Guide](components-guide.md) site. The path to the comment node in the local repository is:

* Component path = `/content/community-components/en/comments/jcr:content/content/includable/comments`

**Shadow node location**

The creation of UGC also creates a [shadow node](srp.md#about-shadow-nodes-in-jcr) to which the necessary ACLs are applied. The path to the corresponding shadow node in the local repository is the result of prepending the shadow node root path to the component path:

* Root path = `/content/usergenerated`
* Comment shadow node = `/content/usergenerated/content/community-components/en/comments/jcr:content/content/includable/comments`

**UGC location**

The UGC is created in neither of those locations, and should only be accessed using an [utility method](#utility-method-to-access-ugc) which invokes the SRP API.

* Root path = `/content/usergenerated/asi/srp-choice`
* UGC node for JSRP = `/content/usergenerated/asi/jcr/content/community-components/en/comments/jcr:content/content/includable/comments/srzd-let_it_be_`

*Be aware*, for JSRP, the UGC node will *only* be present on the AEM instance (either author or publish) on which it was entered. If entered on a publish instance, moderation will not be possible from the moderation console on author.

## Related Information {#related-information}

* [Storage Resource Provider Overview](srp.md) - Introduction and repository usage overview.
* [Accessing UGC with SRP](accessing-ugc-with-srp.md) - Coding guidelines.
* [SocialUtils Refactoring](socialutils.md) - Mapping deprecated utility methods to current SRP utility methods.
