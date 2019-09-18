---
title: Designing accessible HTML5 forms
seo-title: Designing accessible HTML5 forms
description: HTML5 forms use the ARIA HTML5 accessibility standard. These forms support tabbed navigation and are certified to be compatible with common screen readers.
seo-description: HTML5 forms use the ARIA HTML5 accessibility standard. These forms support tabbed navigation and are certified to be compatible with common screen readers.
uuid: 21320a6d-cc4a-497b-87f2-5a58c0c1b00c
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 0054b94d-ec5e-44a2-8050-8e78d6980bed
index: y
internal: n
snippet: y
---

# Designing accessible HTML5 forms{#designing-accessible-html-forms}

HTML5 forms use the ARIA HTML5 accessibility standard to generate accessible HTML forms. These forms support tabbed navigation (except Mozilla FireFox) and are certified to be compatible with common screen readers. To generate an HTML5 form with good accessibility features, design the XFA form template based on some [basic designing guidelines](/6-5/forms/using/best-practices-design-html5-forms.md). The design guidelines include configuring the correct tab order and providing the Speak Text content for each form control. AEM Forms Designer supports the setting of these form control attributes to generate an Accessible PDF and HTML5 form.

*Note:Tabbed navigation does not cover protected fields such as calculation fields displaying sum of values. For the screen reader to read the value of a protected field, place an empty Read Only field either on top of, or next to, the protected field. Assign the value of the protected field to the new Read Only field. The screen reader or tabbed navigation can pick this read only field and speak it out as the value of the protected field.*

AEM Forms Designer includes a number of Speak Text options that can be passed to screen readers. For each object in a form, the user can specify one of several settings for the screen reader text:

* Custom screen reader text, which can be set using the Accessibility palette. Authors can annotate the names of buttons and fields, as well as their purpose.
* Tool tips, which can be set in the Accessibility palette.
* Captions for fields on the form.
* Names of objects, as specified in the Name option of the Binding tab.

![](assets/accessibility.png)

When multiple options like tool tip, Screen Reader Text, and Caption are available on a Form control, the Screen Reader uses only one of these properties. The default order is Custom Screen Reader Text, tool tip, Caption, and Name. You can override the default order using the Screen Reader **Precedence **option in the Accessibility palette.

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)
