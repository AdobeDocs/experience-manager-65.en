---
title: Community Group Essentials
description: Learn how authorized users can use the Community Groups feature to dynamically create a subcommunity within a community site.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: f45ae7be-a500-463a-ab3e-81f281651a9d
solution: Experience Manager
feature: Communities
role: Admin
---
# Community Group Essentials  {#community-group-essentials}

The community groups feature is the ability for a subcommunity to be dynamically created within a community site by authorized users from the publish and author environments.

As of Communities [feature pack 1](deploy-communities.md#latestfeaturepack), it is possible for groups to be nested within other groups.

## Essentials for Client-Side {#essentials-for-client-side}

### Community Groups Member List {#community-groups-member-list}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/group/components/hbs/communitygroupmemberlist</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.communitygroups</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/group/components/hbs/communitygroupmemberlist/communitygroupmemberlist.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/group/components/hbs/communitygroupmemberlist/clientlibs/memberList.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td>See <a href="creating-groups.md">Community Group</a></td>
  </tr>
 </tbody>
</table>

### Community Groups {#community-groups}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/group/components/hbs/communitygroups</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.communitygroups</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/group/components/hbs/communitygroups/communitygroups.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/group/components/hbs/communitygroupmemberlist/clientlibs/communitygroups.css</td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Community Group API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/group/client/api/package-summary.html)

* [Community Group Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/group/client/endpoints/package-summary.html)

* [Server-side Customizations](server-customize.md)

### Groups Function {#groups-function}

A community site structure that includes a [Groups function](functions.md#groups-function) supports the creation of new `community groups` from the publish and author environments. The community group created includes a `community groups member list` component that lists the members of the group.

One or more [community group templates](tools-groups.md), which provide the design of the community group pages, can be configured for the Groups function. This is true when the function is being added to a [community site template](sites.md) or nested within a community group template.

The inclusion of multiple community group templates results in a choice. That is, the choice of design being presented to the authorized user at the time that a community group is created for the community site. See the section on [community groups](creating-groups.md) for authors.

### Nested Groups {#nested-groups}

As of Communities [FP1](deploy-communities.md#latestfeaturepack), it is possible for a Groups function to be included within a group template, thus allowing for nested groups (subcommunities).

When a community site or group template includes the Groups function, it is possible to:

* Create a subcommunity in the author environment.

* Create a group in the publish environment, when configured to allow it.

When creating a group in the author environment, it is necessary to first publish the community site, and then to publish the group. Publishing the community site publishes the pages of the group, without creating the subcommunity's member groups to which ACLs are set. Thus, a restricted (secret) group may be visible until the group is explicitly published.

## Links and Related Information {#links-and-related-information}

* [Managing Users and User Groups](users.md)
* [Communities Groups Console](groups.md)
* [Groups Function](functions.md#groups-function)
* [Group Templates](tools-groups.md)
