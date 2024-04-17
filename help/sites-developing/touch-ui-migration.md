---
title: Migration to the Touch UI
description: Learn about Adobe Experience Manager's migration to the Touch UI and how it affects you.
contentOwner: AEM Docs
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: introduction
docset: aem65
exl-id: 33dc1ee7-1e34-43d8-9265-c66535f5e002
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Migration to the Touch UI{#migration-to-the-touch-ui}

Starting with version 6.0, Adobe Experience Manager (AEM) introduced a new user interface referred to as the *touch-enabled UI* (also known simply as the *touch UI*). It is aligned to the Adobe Experience Cloud and to the overall Adobe user interface guidelines. This has become the standard UI in AEM with the legacy, desktop-oriented interface referred to as the *classic UI*.

If you have been using AEM with classic UI, take action to migrate your instance. This page is intended to act as a springboard by providing links to individual resources.

>[!NOTE]
>
>Such a migration project may have significant impact on your instance. See [Managing Projects - Best Practices](/help/managing/best-practices.md) for recommended guidelines.

## The Basics {#the-basics}

When migrating, be aware of the following major differences between the classic and touch UI:

<table>
 <tbody>
  <tr>
   <td>Classic UI</td>
   <td>Touch-Enabled UI</td>
  </tr>
  <tr>
   <td>Is described in the JCR repository as a structure of nodes. Every node that represents an element of the UI is called an <em>ExtJS widget</em> and rendered on the client-side by <code>ExtJS</code>.</td>
   <td>Also described in the JCR repository as a structure of nodes. However, in this case, every node refers to a Sling resource type (Sling component), that is in charge of its rendering. So the UI is (basically) rendered server-side.</td>
  </tr>
  <tr>
   <td><p><code>sling:resourceType</code></p>
    <ul>
     <li>not used</li>
    </ul> </td>
   <td><code>sling:resourceType</code>
    <ul>
     <li>used</li>
     <li>for example<br /> <code>cq/gui/components/authoring/dialog</code><br /> </li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Dialog nodes:</p>
    <ul>
     <li>Name: <code>dialog</code></li>
     <li><code>jcr:primaryType</code>: <code>cq:Dialog</code></li>
    </ul> </td>
   <td><p>Dialog nodes:</p>
    <ul>
     <li>Name: <code>cq:dialog</code></li>
     <li><code>jcr:primaryType</code>: <code>nt:unstructured</code></li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>JavaScript location:</p>
    <ul>
     <li>Imperative parts are directly embedded using listeners or managed in clientlibs.</li>
    </ul> </td>
   <td><p>JavaScript location:</p>
    <ul>
     <li>Imperative parts cannot be embedded in dialog definition; separation of responsibilities.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Event handling:</p>
    <ul>
     <li>Dialog widgets directly reference JavaScript code.</li>
    </ul> </td>
   <td><p>Event handling:</p>
    <ul>
     <li>JavaScript observes dialog events.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>Rendering done by the client:
    <ul>
     <li>Client dynamically creates the UI components.</li>
     <li>Client requests (Pull) component definition (as JSON) from server.</li>
    </ul> </td>
   <td>Rendering done by the server:
    <ul>
     <li>Client requests pages together with the related UI.</li>
     <li>The server sends (Push) the UI as HTML documents; using Coral UI components.<br /> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

In other words, migrating a section of your UI from the classic UI to the touch UI means to port an *ExtJS widget* to a *Sling component*. To ease this, the touch UI is based on the Granite UI framework, which already provides some Sling components for the UI (referred to as Granite UI components).

Before you start, check the status and related recommendations:

* [Touch UI Features Status](/help/release-notes/touch-ui-features-status.md)
* [User Interface Recommendations for Customers](/help/sites-deploying/ui-recommendations.md)

The basics of developing the touch UI provides a solid basis:

* [Concepts of the AEM Touch-Enabled UI](/help/sites-developing/touch-ui-concepts.md)
* [Structure of the AEM Touch-Enabled UI](/help/sites-developing/touch-ui-structure.md)

## Migrating Page Authoring {#migrating-page-authoring}

Dialogs are a major factor when migrating your components:

* [Developing AEM Components](/help/sites-developing/developing-components.md) (with the touch-enabled UI)
* [Migrating from a Classic Component](/help/sites-developing/developing-components.md#migrating-from-a-classic-component)
* [AEM Modernization Tools](/help/sites-developing/modernization-tools.md) - to help you convert the dialogs of your classic UI components to touch UI

    * There is a compatibility layer in touch UI to open a classic UI dialog within a "Touch UI wrapper", but this has limited functionality and is not recommended for the long term.

* [Customizing Dialog Fields in Touch UI](https://helpx.adobe.com/experience-manager/kt/eseminars/gems/aem-customizing-dialog-fields-in-touch-ui.html)
* [Creating a New Granite UI Field Component](/help/sites-developing/granite-ui-component.md)
* [Customizing Page Authoring](/help/sites-developing/customizing-page-authoring-touch.md) (with the touch-enabled UI)

## Migrating Consoles {#migrating-consoles}

You can also customize the consoles:

* [Customizing the Consoles](/help/sites-developing/customizing-consoles-touch.md) (for the touch-enabled UI)

## Related Considerations {#related-considerations}

Although not directly related to a migration to the touch UI, there are related issues that are worth considering at the same time, as they are also recommended practice:

* [Templates](/help/sites-developing/templates.md) - [Editable templates](/help/sites-developing/page-templates-editable.md)
* [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html)
* [HTL](https://experienceleague.adobe.com/docs/experience-manager-htl/content/overview.html)

>[!NOTE]
>
>See also [Developing - Best Practices](/help/sites-developing/best-practices.md).

## Further Resources {#further-resources}

For full information on developing AEM see the collection of resources under:

* [Developing User Guide](/help/sites-developing/getting-started.md)
* [Granite UI Documentation](https://developer.adobe.com/experience-manager/reference-materials/6-5/granite-ui/api/jcr_root/libs/granite/ui/index.html)
* [AEM 6.5 Sites Tutorials and Videos](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/overview.html)
* [Getting Started Developing AEM Sites - WKND Tutorial](/help/sites-developing/getting-started.md)
* [AEM Gems](https://experienceleague.adobe.com/docs/events/experience-manager-gems-recordings/overview.html)
* [AEM Modernization Tools](https://opensource.adobe.com/aem-modernize-tools/)

>[!CAUTION]
>
>AEM Modernization Tools are a community effort and are not supported or warranted by Adobe.
