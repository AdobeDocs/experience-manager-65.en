---
title: Working with AEM Forms workspace
description: Get started with AEM Forms workspace with this quick overview of the process workflows.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
docset: aem65
exl-id: 0bedcbd9-2cf8-47da-9440-c773982e550c
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms,Adaptive Forms,Mobile Forms
role: User, Developer
---
# Working with AEM Forms workspace{#working-with-aem-forms-workspace}

## Introduction {#introduction}

AEM Forms workspace is a part of AEM Forms. Workspace facilitates rendition of HTML Forms in addition to PDF forms. Now you can engage in business processes from mobile interfaces and web applications.

Also, AEM Forms workspace is highly customizable using the standard HTML and JavaScript&trade; development methodologies. It is a component-based software that easily integrates with your other web applications.

For more information, see [Introduction to AEM Forms workspace](/help/forms/using/introduction-html-workspace.md).

## Getting Familiar {#getting-familiar}

To be familiar with the end-to-end process of creating a forms application to automate a business process, follow the walkthrough. You can create, manage, and test an application using Workbench, Designer, and AEM Forms workspace after following the walkthrough. For implementation details, see [Creating Your First AEM Forms Application](https://help.adobe.com/en_US/livecycle/11.0/CreateFirstApp/index.html).

## Functional Overview {#functional-overview}

You can use AEM Forms workspace to perform the following tasks:

**Start a business process:** AEM Forms workspace categories your processes as designed and set up by your organization. You can favorite the frequently used categories to access the categories quickly. When you start a process, you typically fill a form to start a business process that forms workflow controls. For more information, see [Starting Processes](/help/forms/using/starting-processes.md).

**View and act upon tasks:** When you view your To-do lists, you see tasks from a business process that are assigned to you, or to any groups that you belong to, or are the shared tasks of other users. You can open, work on, and complete the tasks as required. Typically, completing a task involves providing information, approving a form, or rejecting a form. For more information, see [Working with To-do lists](/help/forms/using/todo-lists.md).

**Track tasks**: To track your tasks, you use the Tracking tab of AEM Forms workspace. You can search for active or completed processes that you started or participated in. You can view the tasks, assignments, and forms that were part of the process. You can also start new processes using form data from a process that you previously initiated. For more information, see [Tracking processes](/help/forms/using/tracking-processes.md).

## New offering of AEM Forms workspace {#new-offering-of-aem-forms-workspace}

**Support for bulk approval of tasks**:

You can approve multiple tasks of the same type. Once you select one task for approval, only the tasks with the same process, with the same task names, and the same route options remain enabled. See [Working with To-Do lists](/help/forms/using/todo-lists.md) for implementation details.

## Migrating from Flex Workspace to AEM Forms workspace {#migrating-from-flex-workspace-to-aem-forms-workspace}

Flex Workspace is not supported for AEM Forms customers. All the customers using the Flex Workspace should move to AEM Forms Workspace.

In AEM Forms workspace, the default render and submit services, in the default action profile, associated with XDP forms have changed and new services have been introduced. For details, see [New render and submit service](/help/forms/using/new-render-submit-service.md). To migrate your existing processes, that work with XDP forms, to use these services, you can follow [these steps](new-render-submit-service.md).

**Mapping Flex Workspace customizations with AEM Forms workspace**

The mapping between various types of customizations in both the workspaces is as follows.

<table>
 <tbody>
  <tr>
   <td><strong>Type of customization </strong></td>
   <td><strong>Customizations covered </strong></td>
   <td><strong>Corresponding AEM Forms workspace customization scenario</strong></td>
  </tr>
  <tr>
   <td>Localization customization</td>
   <td>
    <ol>
     <li>Changing locale of Workspace</li>
    </ol> </td>
   <td>
    <ol>
     <li><a href="/help/forms/using/changing-locale-user-interface.md">Changing AEM Forms workspace Locale</a></li>
    </ol> </td>
  </tr>
  <tr>
   <td>Theme customization</td>
   <td>
    <ol>
     <li>Replacing images</li>
     <li>Modifying colors</li>
    </ol> </td>
   <td>
    <ol>
     <li><a href="/help/forms/using/changing-organization-logo-branding.md">Changing Organization Logo</a> </li>
     <li><a href="/help/forms/using/changing-color-scheme-interface.md">Changing Color Scheme</a></li>
    </ol> </td>
  </tr>
  <tr>
   <td>Layout customization</td>
   <td>
    <ol>
     <li>Simplifying the Workspace user interface<br /> </li>
     <li>Creating a New Login Screen</li>
     <li>Creating a custom Approval Container</li>
    </ol> </td>
   <td>
    <ol>
     <li><a href="/help/forms/using/description-reusable-components.md">Working with Reusable components</a></li>
     <li><a href="/help/forms/using/creating-new-login-screen.md">Creating a Login screen</a></li>
     <li>Approval Container is deprecated.</li>
    </ol> </td>
  </tr>
 </tbody>
</table>

Some of the features of Flex Workspace that are not available in AEM Forms workspace include: messages and notification, welcome page, approval container, and option to manage column headings. For a complete list, see [Features of Flex Workspace not available in AEM Forms workspace](/help/forms/using/features-flex-workspace-available-html.md).

## Developing with AEM Forms workspace {#developing-with-aem-forms-workspace}

### Architecture {#architecture}

AEM Forms workspace is an HTML and JavaScript&trade; based web application hosted on CRX&trade;. When Workspace URL is opened in a browser, a CRX&trade; resource is accessed, and the application is rendered as an HTML page in the browser. The JavaScript libraries and the custom JavaScript code manages the internal and external behavior of the application, such as user interface, user interaction, and communication with AEM Forms server. For more details, see AEM Forms workspace [architecture](/help/forms/using/html-workspace-architecture.md).

### AEM Forms workspace customization {#aem-forms-workspace-customization}

AEM Forms workspace supports a wide variety of customizations to update the layout of the user interface, its appearance, functionality, and much more. The customizations involve updating one or more of the following:

* Appearances of the user interface
* Functionality using semantic customizations
* Reusing HTML components in other web applications

The [customization](introduction-customizing-html-workspace.md#types-of-customizations) article explains the types of such customizations.

### Set up the developer environment {#set-up-the-developer-environment}

AEM Forms workspace deliverables include a CRX package deployed on CRX, an SDK archive that contains the complete source code, third-party JavaScript libraries, and build scripts of AEM Forms workspace. Use these to set up the developer environment to perform the customizations mentioned above. For more details, see [Building AEM Forms workspace code](introduction-customizing-html-workspace.md#building-html-workspace-code).

You can customize a major part of the interface and core functionality such as, fonts, color scheme, logo, login screen, error dialogs, integration with third-party applications, and reuse of components in third-party application. You can also enhance the contents displayed on the Task Summary page, show images for task route actions, and even modify the low-level Backbone Models and Views that create the AEM Forms workspace application.

### HTML rendering of XDP Forms {#html-rendering-of-xdp-forms}

By default, for a new process, an XDP form is rendered in PDF format on a desktop and in HTML format on a tablet. It is possible to render an XDP form in HTML format always. For details, see [New Render and Submit Services](/help/forms/using/new-render-submit-service.md).

[Mobile Forms](https://helpx.adobe.com/livecycle/help/mobile-forms/introduction.html) feature, that works with [profiles](https://helpx.adobe.com/livecycle/help/mobile-forms/creating-profile.html), enables HTML rendition of XDP forms. By default, the 'Render New HTML Form' uses `default.html` profile, that you can change. You can also add custom changes that happen before rendering an XDP form in HTML format.

## AEM Forms workspace app {#aem-forms-workspace-app}

To work on your business processes on a mobile device, you can use the AEM Forms workspace app offering of AEM Forms. For more information, see the [AEM Forms workspace app overview](https://helpx.adobe.com/livecycle/help/mobile-workspace/mobile-workspace-overview.html).
