---
title: Document details for renderer
description: Conceptual information on how renders work in the AEM Forms workspace to render the various supported form and file types.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: 946f0f6d-86af-41c1-98ef-98c8f5566e95
solution: Experience Manager, Experience Manager Forms
feature: "HTML5 Forms,Adaptive Forms,Mobile Forms"
role: Admin, User, Developer
---
# Document details for renderer {#document-details-for-renderer}

## Introduction {#introduction}

In the AEM Forms workspace, multiple form types are supported seamlessly. These include:

* PDF forms (XDP / Acroform / Flat PDFs)
* New HTML forms
* Images
* Third-party applications (for example, Correspondence Management)

This document explains the working of these renderers from the perspective of semantic customization / component reuse, so that customer requirements are met without breaking any rendition. While AEM Forms workspace allows for any user interface / semantic changes, it is recommended that the rendering logic of different form types not be changed, otherwise the results can be unpredictable. This document is for guidance / knowledge to support rendering the same form, using the same workspace components in different portals, and not for modifying the rendering logic itself.

## PDF Forms {#pdf-forms}

PDF forms are rendered by `PdfTaskForm View`.

When an XDP form is rendered as PDF, a `FormBridge` JavaScript&trade; is added by FormsAugmenter service. This JavaScript&trade; (inside the PDF form) helps in performing actions like form submit, form save, or taking form offline.

In AEM Forms workspace, PDFTaskForm view communicates with the `FormBridge`JavaScript, by way of an intermediary HTML present at `/lc/libs/ws/libs/ws/pdf.html`. The flow is:

**PDFTaskForm view - pdf.html**

Communicates using `window.postMessage` / `window.attachEvent('message')`

This method is the standard way of communication between a parent frame and an iframe. The existing event listeners from previously opened PDF forms are removed before adding a new one. This purging also considers the switching between form tab and history tab in the task details view.

**pdf.html - `FormBridge`JavaScript inside the rendered PDF**

Communicates using `pdfObject.postMessage` / `pdfObject.messageHandler`

This method is the standard way of communication with a PDFJavaScript from an HTML. PdfTaskForm view also takes care of a flat PDF and renders it plain.

>[!NOTE]
>
>It is not recommended to edit the pdf.html / contents of the PdfTaskForm view.

## New HTML Forms {#new-html-forms}

New HTML forms are rendered by NewHTMLTaskForm View.

When an XDP Form is rendered as HTML using the mobile forms package deployed on CRX, it also adds additional `FormBridge`JavaScript to the form, which exposes different methods for saving and submitting form data.

This JavaScript is different from the one referred to in PDF Forms above, but serves a similar purpose.

>[!NOTE]
>
>Adobe does not recommend editing the contents of the NewHTMLTaskForm view.

## Flex Forms and Guides {#flex-forms-and-guides}

Flex Forms are rendered by SwfTaskForm and guides are rendered by HtmlTaskForm Views respectively.

In AEM Forms workspace, these views communicate with the actual SWF which makes up the Flex&reg; form/guide using an intermediary SWF present at `/lc/libs/ws/libs/ws/WSNextAdapter.swf`

The communication happens using `swfObject.postMessage` / `window.flexMessageHandler`.

This protocol is defined by the `WsNextAdapter.swf`. The existing `flexMessageHandlers`on window object, from previously opened SWF forms are removed before adding a new one. The logic also considers the switching between form tab and history tab in the task details view. The `WsNextAdapter.swf` is used to perform various form actions like save or submit.

>[!NOTE]
>
>It is not recommended to modify `WSNextAdapter.swf` or the contents of SwfTaskForm / HtmlTaskForm view.

## Third-party applications (for example, Correspondence Management) {#third-party-applications-for-example-correspondence-management}

Third-party applications are rendered using the ExtAppTaskForm view.

**Third-party application to AEM Forms workspace communication**

AEM Forms workspace listens on `window.global.postMessage([Message],[Payload])`

[Message] can be a string specified as `SubmitMessage`| `CancelMessage`| `ErrorMessage`| `actionEnabledMessage`in the `runtimeMap`. Third-party applications must use this interface to notify the AEM Forms workspace as needed. Using this interface is mandatory, because the AEM Forms workspace must know that when the task is submitted so that it can clean up the task window.

**AEM Forms workspace to third-party application communication**

If AEM Forms workspace's direct action buttons are visible, it calls `window.[External-App-Name].getMessage([Action])`, where `[Action]` is read from the `routeActionMap`. The third-party application must listen on this interface, and then notify AEM Forms workspace via the `postMessage ()` API.

For example, a Flex application can define `ExternalInterface.addCallback('getMessage', listener)` to support this communication. If the third-party application wants to handle form submission via its own buttons, then you should specify `hideDirectActions = true() in the runtimeMap` and you may skip this listener. Hence, this construct is optional.

You can read more about third-party application integration regarding Correspondence Management at [Integrating Correspondence Management in the AEM Forms workspace](/help/forms/using/integrating-correspondence-management-html-workspace.md).
