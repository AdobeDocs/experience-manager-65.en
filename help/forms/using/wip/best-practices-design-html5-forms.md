---
title: DO NOT PUBLISH - Best practices for designing HTML5 forms
seo-title: DO NOT PUBLISH - Best practices for designing HTML5 forms
description: Guidelines for form developers to ensure that the behavior and appearance of HTML5 forms and XFA-based PDF is consistent.
seo-description: Guidelines for form developers to ensure that the behavior and appearance of HTML5 forms and XFA-based PDF is consistent.
page-status-flag: never-activated
uuid: 77e82730-8d93-434b-ace3-12b75c839a8a
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 80c2efed-4383-405d-90c2-82c0d450c139
---

# DO NOT PUBLISH - Best practices for designing HTML5 forms {#do-not-publish-best-practices-for-designing-html-forms}

This article lists some of the best practices for enabling a form template for HTML5 renditions. By following these guidelines, form developers can ensure that the behavior and appearance of HTML5 forms and XFA-based PDF is consistent.

## Layout {#layout}

1. In new forms, add the non-interactive (Draw) elements before the interactive (Fields) elements. Add the elements in Hierarchy (Dom Order) if there is an overlap between them. Similarly, between overlapping Draw Text and other Draw elements (like Rectangle, Circle), put in Text after Rectangle so that it is visible. Avoid any overlap between Draw and Field.
1. HTML5 rendition of Form Template does not embed any fonts. Avoid using fonts that you do not expect on your client computers or you risk a not so optimum rendition on the client devices.
1. For Repeatable Subforms, mark the **initial count** as 1 or more. If you require zero initial instances, remove or hide the initial instance in form ready or initialize the script based on data.
1. If you are targeting the same form for both PDF and HTML, make sure that you protect the Acrobat-specific JavaScript by checking the environment type. Also ensure that you write equivalent scripts for the browser environment.
1. If you have a **hidden** subform with a complex hierarchy that is split across pages, make the form visible at design time. Hide the form in the initialize script based on your logic.

## Scripting {#scripting}

HTML5 forms contain a client-side XFA scripting library that supports form logic execution in both the scripting languages that the Adobe XFA Implementation supports: JavaScript and FormCalc. This library includes implementation for most of the commonly used APIs on the **client side**. The list of supported APIs and Events can be found [here](/help/forms/using/scripting-support.md). If you need APIs that are not implemented yet, you can mark your script to run at server. **HTML5 forms also support Web Service** invocation from the client. The service runs on the server.

HTML5 forms and PDF forms support different set of features. For the complete list of features, see [Feature differentiation between HTML5 forms and PDF Forms.](/help/forms/using/feature-differentiation-html5-forms-pdf-forms.md)

[Contact Support](https://www.adobe.com/account/sign-in.supportportal.html)
