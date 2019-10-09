---
title: Creating accessible adaptive forms
seo-title: Creating accessible adaptive forms
description: AEM Forms provides you tools and to create accessible adaptive forms and helps comply with accessibility standards.
seo-description: AEM Forms provides you tools and to create accessible adaptive forms and helps comply with accessibility standards.
uuid: eceb3282-0b90-4e0a-8b89-137d27029747
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: author
discoiquuid: 96d9ad52-074b-4084-b818-abce79282776
---

# Creating accessible adaptive forms {#creating-accessible-adaptive-forms}

## Introduction {#introduction}

An accessible form is a form that everyone can use, including users with special needs. Adobe Experience Manager (AEM) includes a number of features and capabilities that enhance the usability of adaptive forms for users with different abilities. The solution also assists form authors in creating accessible adaptive forms.

Building accessibility into adaptive forms not only allows the widest possible audience for content, but also it is a requirement when supplying documents in geographies where compliance with accessibility standards is mandated. AEM Forms help form developers comply with the accessibility standards.

While authoring an adaptive form, author should consider the following points to create accessible adaptive form:

* Provide proper labels for form controls
* Provide text equivalents for images
* Provide sufficient color contrast
* Ensure that form controls are keyboard accessible

## Provide proper labels for form controls {#provide-proper-labels-for-form-controls}

The label or title of a component identifies what the form component represents. For example, the text “First name” tells users that they have to enter their first name in a text field. To be accessible by screen readers, the label is programmatically associated with a form component. Alternatively, the form control is configured with additional accessibility information.

The label that is perceived by screen readers need not necessarily be the same as the visual caption. In some cases, you may want to be more specific about the control’s purpose. For each field object in a form, the accessibility options can be used to specify what the screen reader announces to identify the specific form field.

To use the Accessibility option, follow these steps:

1. Select a component and tap ![cmppr](assets/cmppr.png).
1. Click **Accessibility **in the sidebar to choose the desired accessibility option.

### Accessibility options in form components {#accessibility-options-in-form-components}

![Accessibility options in form components](assets/accessibility-options.png)

**Custom Text** Form authors provide the content in the accessibility option Custom text field. The assistive technology, such as screen readers, uses this custom text. Using the Title setting is the best option in a majority of the scenarios. Consider creating Custom Screen Reader Text only when using the Title or a short description is not possible.

**Short description** For a majority of the components, the short description appears at runtime when the user hovers the pointer over the component. You can set this option in the short description field, under help content option.

**Title** Use this option to let AEM Forms use the visual label associated with the form field as the screen reader text.

**Name** You can specify a value in the Name field of the Binding tab. The name cannot contain any spaces.

**None** Selecting None causes the form object to not have a name in the published form. None is not a recommended setting for form controls.

>[!NOTE]
>
>Radio Button and Check-box can have only two options for accessibility namely, Custom Text and Title.

>[!NOTE]
>
>For XFA-based adaptive forms, the accessibility option is inherited from the accessibility options set in the XDP. Tool tips from XDP are mapped to the Short Description and Caption are mapped to Title. The other options work as is.

## Provide text equivalents for images {#provide-text-equivalents-for-images}

Images can help improve comprehension for some users. However, for users using screen readers, images decrease the accessibility of your form. If you choose to use images, provide text descriptions for all images.

Ensure that the text describes the object and its purpose in the form. A screen reader reads this alternative text when it encounters an image. An image must always have an alternative text specified.

Select an image component and tap ![cmppr](assets/cmppr.png). In the sidebar, under Properties, specify alternate text for an image. 

![Alternate text for an image](assets/image-properties.png) 

## Provide sufficient color contrast {#provide-sufficient-color-contrast}

Accessibility design involves considering additional guidelines for color usage. Form authors can use colors to improve the appearance of forms, by highlighting various form components. However, an improper use of color may make a form difficult or impossible to read by people with different abilities.

Users with vision impairment rely on a high contrast between text and the background to read digital content. Without sufficient contrast, a form can become difficult, if not impossible, to read for some users.

It is recommended that you use the default font and background colors--content in black color on a white background. If you change the default colors, choose either a dark foreground color on a light background color, or vice versa.

See [Creating custom themes for adaptive forms](/help/forms/using/creating-custom-adaptive-form-themes.md), for more information about changing the color contrast and theme for the adaptive forms.

## Ensure that form controls are keyboard accessible {#ensure-that-form-controls-are-keyboard-accessible}

An accessible form can be filled completely using only the keyboard or an equivalent input device. Users with reduced mobility or impaired vision may have no choice but to use the keyboard and many users who can use a mouse, prefer keyboard input. By allowing for the various input methods, you not only create accessible forms, you also create forms that are better suited to the preferences of all users.

The following keyboard shortcuts are available in AEM Forms.

| Action |Keyboard shortcut |
|---|---|
| Move the cursor forward through a form |Tab |
| Move the cursor backward through a form |Shift+Tab |
| Move to the next panel |Alt+Right Arrow |
| Move to the previous panel |Alt+Left Arrow |
| Reset the filled data in a form |Alt+R |
| Submit a form |Alt+S |configuring-watched-folder-endpoints.md |