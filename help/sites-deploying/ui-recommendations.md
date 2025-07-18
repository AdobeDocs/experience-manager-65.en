---
title: User Interface Recommendations for Customers

description: A list of recommendations related to the classic and touch-optimized user interfaces.


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices

docset: aem65
exl-id: 7b71119a-ff58-47c0-aeef-a705ed8c40e0
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# User Interface Recommendations for Customers{#user-interface-recommendations-for-customers}

Adobe Experience Manager comes with two UIs - the unified Experience Cloud UI (also known as the touch-enabled UI) and the Classic UI.

This document is intended to guide customers to make a choice on what UI to use depending their situation.

Terms of interest:

* **UI (or standard UI)**
  Modern user interface that was introduced in 5.6.0 as a technology preview and extended in subsequent releases. It is based on the unified user experience for the Adobe Experience Cloud, formerly known as touch-enabled UI or touch UI.

* **Classic UI**
  User interface based on ExtJS technology that was introduced with CQ 5.1 in 2008.

* **Site Admin**
  Capabilities to manage the site hierarchy (move, activate, managed references) and create new pages.

* **Page Authoring**
  Capabilities to add/edit the content of a page.

* **DAM/Assets Admin**
  Capabilities to manage digital assets (including images, video, documents, downloads).

* **ContextHub**
  Capabilities to aggregate information about the visitor and use it for various purposes. Provides an user interface to simulate persons visiting the site. Starting AEM 6.2, ContextHub replaced the previous technology, Client Context.

## General {#general}

Over the last few years Adobe has updated all the Adobe Experience Cloud solutions with an unified user interface. Users across the Experience Cloud solutions enjoy a consistant experience with common patterns on how to use and operate the applications. With every release, Adobe has refined its user interface based on feedback from customers working across the various solutions.

The original user interface for Adobe Experience Manager (previously known as CQ5), introduced in 2008 and used by customers running versions 5.0-5.6.1, is present in AEM 6.5. This guarantees that customers can update to 6.5, and benefit from an updated platform with new capabilities while keep using the same user interface.

Adobe recommends customers to plan to switch to the new UI in 2018/19. This can either be done during the update to 6.5 - or in a separate projects after the update, that would include the necessary adjustments to the customizations and component dialogs.

The Classic UI was deprecated with AEM 6.4 and Adobe does not plan to make further enhancements to the Classic UI. Note that Classic UI remains fully supported while being deprecated.

### Rules and Recommendations {#rules-and-recommendations}

The following is a list of recommendations from Product Management for Adobe Experience Manager 6.5:

<table>
 <tbody>
  <tr>
   <th>My project...</th>
   <th>Recommendations</th>
  </tr>
  <tr>
   <td>Is just starting to use Adobe Experience Manager.</td>
   <td>Use the default UI.</td>
  </tr>
  <tr>
   <td><p>Has used AEM for a while.</p> <p>Has used the product UI out-of-the-box and developed custom components for the sites.<br /> </p> </td>
   <td>
    <ol>
     <li>Update to 6.5</li>
     <li>Use the default UI for site administration, assets, .. etc.<br /> </li>
     <li>Configure the "Edit Page" action to open the classic UI Page Editor. See <a href="#selecting-your-ui">Selecting Your UI</a>.</li>
    </ol> <p>Then, in a second phase:</p>
    <ol>
     <li>Update your components dialogs to use the Coral 3 dialog format. Adobe recommends using the <a href="/help/sites-developing/modernization-tools.md">AEM Modernization Tools</a> to update the components.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Has built a site that uses the ClientContext with integrations.<br /> </td>
   <td>
    <ol>
     <li>Update to 6.5</li>
     <li>Use the default UI for site administration, assets, .. etc.</li>
     <li>Configure the "Edit Page" action to open the classic UI Page Editor. See <a href="#selecting-your-ui">Selecting Your UI</a>.</li>
    </ol> <p>Then, in a second phase:</p>
    <ol>
     <li>Update your components dialogs to use the Coral 3 dialog format. Adobe recommends using the <a href="/help/sites-developing/modernization-tools.md">AEM Modernization Tools</a> to update the components.</li>
     <li>Configure the ContextHub (the replacement for the ClientContext) and update the page templates to use the ContextHub. The ContextHub has a compatibility mode that allows loading custom ClientContext stores.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><p>Has used CQ/AEM for many years.</p> <p>Has extended the product UI (for example, Site Admin) and built components with extensive edit dialogs.</p> </td>
   <td><p>Update to 6.5 and configure the classic UI as the default for page authoring for all users. See <a href="#selecting-your-ui">Selecting Your UI</a>.</p> <p>Then start a project to apply customization and optimize component dialogs in Coral 3 format. See <a href="#resources-to-help">Resources to Help</a>.<br /> </p> </td>
  </tr>
 </tbody>
</table>

### Selecting Your UI {#selecting-your-ui}

See [Selecting Your UI](/help/sites-authoring/select-ui.md) for information about configuring your system as required.

### Touch-Enabled UI Status {#touch-enabled-ui-status}

For details of the enhancements made to the touch-enabled UI in the AEM 6.5 see [What's New](/help/release-notes/release-notes.md#what-s-new) in the Release Notes.

A complete overview see the [Touch UI Feature Status](/help/release-notes/touch-ui-features-status.md) page

### Resources to Help {#resources-to-help}

For background information on basic handling:

* [Authoring Pages](/help/sites-authoring/page-authoring.md).

For detailed development information:

* [Touch-enabled UI architecture](/help/sites-developing/touch-ui-concepts.md).
* Use the [AEM Modernization Tools](/help/sites-developing/modernization-tools.md) to convert component Edit dialogs from the classic UI to the touch-enabled UI.

* [Structure of the touch-enabled UI](/help/sites-developing/touch-ui-structure.md).

* [Customizing the consoles in the touch-enabled UI](/help/sites-developing/customizing-consoles-touch.md) (includes sample code).

* [Customizing page authoring in the touch-enabled UI](/help/sites-developing/customizing-page-authoring-touch.md) (includes sample code).

* [Granite UI documentation](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/granite-ui/api/index.html).
