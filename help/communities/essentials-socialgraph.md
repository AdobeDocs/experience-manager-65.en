---
title: Social Graph Essentials
description: Learn about the fundamentals of Social Graph by using the Following and Follow components on a community site.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: c037a788-c943-4f95-a028-1fcb0ef48f86
solution: Experience Manager
feature: Communities
role: Admin
---
# Social Graph Essentials  {#social-graph-essentials}

The ability for a Community member to follow [activities](essentials-activities.md) and be followed is established through two components:

The `following` component must be associated with another resource, and this association is already established for existing Communities members and features in a [community site](overview.md#communitiessites).

The `following` component lists the members that are either following the current member or are being followed by the current member. This social graph of the relationships between members is included in the user profile established for a community site.

## Essentials for Client-Side {#essentials-for-client-side}

### Following {#following}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/socialgraph/components/hbs/relationships</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.hbs.socialgraph</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/socialgraph/components/hbs/relationships/relationships.hbs</td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/socialgraph/components/hbs/relationships/clientlibs/relationships.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td>See <a href="socialgraph.md">Using Social Graph</a></td>
  </tr>
  <tr>
   <td><strong> optional<br /> property</strong></td>
   <td>
    <ul>
     <li>Name: <strong><code>outgoing</code></strong></li>
     <li>Type: Boolean</li>
     <li>Value:<br />
      <ul>
       <li><i>True </i>- The <code>following</code> component lists the members who the signed-in member <code>follows</code></li>
       <li><i>False </i>- The <code>following</code> component lists the members who <code>follow </code>the signed-in member</li>
      </ul> </li>
    </ul> <p>Defaults to <i>true</i> if the property is missing. It is not possible to set this property using the edit dialog in Author mode. The property must be added to an instance of the <code>following</code> node by using <a href="../../help/sites-developing/developing-with-crxde-lite.md">CRXDE|Lite</a>.</p> </td>
  </tr>
 </tbody>
</table>

### Follow {#follow}

|  **resourceType** | `social/socialgraph/components/hbs/following` |
|---|---|
|  [**includable**](scf.md#add-or-include-a-communities-component) |No |
|  **templates** | `/libs/social/socialgraph/components/hbs/following/following.hbs` |
|  **css** | `/libs/social/socialgraph/components/hbs/following/clientlibs/following.css` |

* [Client-side Customizations](client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Social Graph API](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/graph/client/api/package-frame.html)

* [Social Graph Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/graph/client/endpoint/package-frame.html)

* [Server-side Customizations](server-customize.md)
