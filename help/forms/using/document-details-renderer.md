---
title: Document details for renderer
seo-title: Document details for renderer
description: Conceptual information on how renders work in AEM Forms workspace to render the various supported form and file types.
seo-description: Conceptual information on how renders work in AEM Forms workspace to render the various supported form and file types.
uuid: ae3f0585-9105-4ca7-a490-ffdefd3ac8cd
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: forms-workspace
discoiquuid: b6e88080-6ffc-4796-98c7-d7462bca454e
---

# Document details for renderer {#document-details-for-renderer}

## Introduction {#introduction}

In AEM Forms workspace, multiple form types are supported seamlessly. These include:

* PDF forms (XDP / Acroform / Flat PDFs)
* New HTML forms
* Images
* Third-party applications (for example, Correspondence Management)

This document explains the working of these renderers from the perspective of semantic customization / component reuse, so that customer requirements are met without breaking any rendition. While AEM Forms workspace allows for any user interface / semantic changes, it is recommended that the rendering logic of different form types not be changed, otherwise the results can be unpredictable. This document is for guidance / knowledge to support rendering the same form, using same workspace components in different portals, and not for modifying the rendering logic itself. 

## PDF Forms {#pdf-forms}

PDF forms are rendered by `PdfTaskForm View`.

When an XDP form is rendered as PDF, a `FormBridge` JavaScript™ is added by FormsAugmenter service. This JavaScript™ (inside the PDF form) helps in performing actions like form submit, form save, or taking form offline.

In AEM Forms workspace, PDFTaskForm view communicates with the `FormBridge`javascript, via an intermediary HTML present at `/lc/libs/ws/libs/ws/pdf.html`. The flow is:

**PDFTaskForm view - pdf.html**

Communicates using `window.postMessage` / `window.attachEvent('message')`

This method is the standard way of communication between a parent frame and an iframe. The existing event listeners from previously opened PDF forms are removed before adding a new one. This purging also considers the switching between form tab and history tab in task details view.

**pdf.html - `FormBridge`javascript inside the rendered PDF**

Communicates using `pdfObject.postMessage` / `pdfObject.messageHandler`

This method is the standard way of communication with a PDF javascript from an HTML. PdfTaskForm view also takes care of flat PDF and renders it plainly.

>[!NOTE]
>
>It is not recommended to modify the pdf.html / contents of PdfTaskForm view.

## New HTML Forms {#new-html-forms}

New HTML forms are rendered by NewHTMLTaskForm View.

When an XDP Form is rendered as HTML using the mobile forms package deployed on CRX, it also adds additional `FormBridge` javascript to the form, which exposes different methods for saving and submitting form data.

This javascript is different from the one referred in PDF Forms above, but serves a similar purpose.

>[!NOTE]
>
>It is not recommended to modify the contents of NewHTMLTaskForm view.

## Flex Forms and Guides {#flex-forms-and-guides}

Flex Forms are rendered by SwfTaskForm and guides are rendered by HtmlTaskForm Views respectively.

In AEM Forms workspace, these views communicate with the actual SWF which makes up the flex form/guide using an intermediary SWF present at `/lc/libs/ws/libs/ws/WSNextAdapter.swf`

The communication happens using `swfObject.postMessage` / `window.flexMessageHandler`.

This protocol is defined by the `WsNextAdapter.swf`. The existing `flexMessageHandlers`on window object, from previously opened SWF forms are removed before adding a new one. The logic also considers the switching between form tab and history tab in task details view. `WsNextAdapter.swf` is used for performing various form actions like save or submit.

>[!NOTE]
>
>It is not recommended to modify `WSNextAdapter.swf` or the contents of SwfTaskForm / HtmlTaskForm view.

## Third-party applications (for example, Correspondence Management) {#third-party-applications-for-example-correspondence-management}

Third-party applications are rendered using ExtAppTaskForm view.

**Third-party application to AEM Forms workspace communication**

AEM Forms workspace listens on `window.global.postMessage([Message],[Payload])`

[Message] can be a string specified as `SubmitMessage`| `CancelMessage`| `ErrorMessage`| `actionEnabledMessage`in the `runtimeMap`. Third-party applications must use this interface to notify AEM Forms workspace as needed. Using this interface is mandatory, because the AEM Forms workspace must know that when the task is submitted so that it can clean up the task window.

**AEM Forms workspace to third-party application communication**

If AEM Forms workspace's direct action buttons are visible, it calls `window.[External-App-Name].getMessage([Action])`, where [ `Action]` is read from the `routeActionMap`. The third-party application must listen on this interface, and then notify AEM Forms workspace via the `postMessage ()` API.

For example, a Flex application can define `ExternalInterface.addCallback('getMessage', listener)` to support this communication. If the third-party application wants to handle form submission via its own buttons, then you should specify `hideDirectActions = true() in the runtimeMap` and you may skip this listener. Hence, this construct is optional.

You can read more on third-party application integration with respect to Correspondence Management at [Integrating Correspondence Management in AEM Forms workspace](/help/forms/using/integrating-correspondence-management-html-workspace.md).


[Contact Support](https://www.adobe.com/account/sign-in.supportportal.html)
