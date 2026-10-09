---
title: Changing default styles of HTML5 forms
description: HTML5 forms styling is based on CSS. You can change the default styles of the form.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
docset: aem65
feature: HTML5 Forms,Mobile Forms
exl-id: 4c84cfd1-50a4-416f-b4a5-7f2f4c7f10af
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Changing default styles of HTML5 forms{#changing-default-styles-of-html-forms}

HTML5 forms are rendered using HTML5 capabilities and the styling of the rendered form is done using CSS. Default appearance of a HTML5 forms is similar to its PDF rendition. Developers can use custom CSS to change default appearance of HTML5 forms.

This article provides step-by-step information to change style of an HTML5 form and [Introduction to Styles](/help/forms/using/css-styles.md) article contains detailed information about various styling aspects of HTML5 forms. Ensure that you read Introduction to styles article before performing steps mentioned in this article.

The following two images show the difference between the default and customized styles.

![pictures-002-small](assets/pictures-002-small.png)

## Style your forms {#style-your-forms}

1. **Choose a profile to add custom styles**

   Access the CRX DE interface at the URL: **https://&lt;server&gt;:&lt;port&gt;/crx/de** and create a profile or choose an existing profile. To know how to create a profile, see [Creating a Profile](/help/forms/using/custom-profile.md)

1. **Create a CSS style sheet for styling the HTML5 forms**

   Navigate to the folder in which you have created the profile renderer and create a CSS style sheet file. The steps to follow are

    1. Right-click the folder and select **create** &gt; **create File** from the menu

    1. In the create file dialog, enter the name of the style sheet. Make sure that you use the extension .css (for example, stylesheet.css)
    1. From the navigation pane, open the CSS file that you have created.
    1. Define the CSS classes of the components that you want to style and add styles in those classes.

   To know which CSS classes to create for a particular component in your HTML5 forms, see [Introduction to Styles](/help/forms/using/css-styles.md).

1. **Include the style sheet in Profile Renderer**

   Open the Profile Renderer page (jsp file) in CRX DE, and include the CSS file in the page just below the XFA client library. Perform these steps to include the CSS file in profile.

    1. Search in the renderer page for the following line:

       &lt;cq:includeClientLib categories="xfaforms.profile" /&gt;

    1. Insert the following below the line above to include the style sheet:

       &lt;link href="/path/to/stylesheet" rel="stylesheet" type="text/css"/&gt;

    1. Save the file.
