---
title: Adding custom action on form lister items
description: Form developers can add more actions to the listing of forms on the forms portal page. By default, the form listing lets you access the form, fill it, and submit it.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 7c2a91c8-9b68-4491-88e2-f7ea68f5a79f
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms,Foundation Components
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 7da902b6-fe94-5180-8e7c-f6d1e38d01d5
    internal-label: Foundation Components
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Adding custom action on form lister items{#adding-custom-action-on-form-lister-items}

In AEM Forms, you can create a portal page listing the available forms. By default, you can search and list forms on a portal page. You can open forms for filling and submit your information. Only rendering actions are provided out of the box for forms listed on a portal page. To know more about the available actions on a portal page, see [Creating a forms portal page](../../forms/using/creating-form-portal-page.md).

You can add other options to the portal page. These options or actions can be customized by customizing the template of forms portal.

This article showcases how to create a button to send the link of a form, directly from a forms portal page. This customization requires updating the template for Search & Lister component.

The required code to add the action to the template is available below. The `onclick` attribute in the code snippet has a script to send a link of a form via email.

```html
<div class="__FP_boxes-container __FP_single-color">
    <div class="boxes __FP_boxes __FP_single-color" data-repeatable="true">
  <div class="__FP_boxes-thumbnail">
            <img src ="${contextPath}${path}/jcr:content/renditions/cq5dam.thumbnail.319.319.png">
        </div>
        <h3 class="__FP_single-color" title="${name}" tabindex="0">${name}</h3>
        <p>${description}</p>
        <div class="boxes-icon-cont __FP_boxes-icon-cont">
            <div class="op-dow">
                <a href="${formUrl}" target="_blank" class="__FP_button ${htmlStyle}" title="${config-htmlLinkText}">Apply</a>
                <a class="__FP_button" title="Email a friend" href="#" onclick="javascript:window.location=&apos;mailto:?subject=Interesting information&body=I thought you might find {name} form helpful :  &apos;+window.location.protocol+window.location.host+&apos;${formUrl}&apos; ;">Email</a>
                <a href="${pdfUrl}" class="__FP_button ${pdfStyle}" title="${config-pdfLinkText}">Download</a>
            </div>
        </div>
    </div>
</div>
```

You can add similar actions in your custom template. To define a JavaScript function, add the function on a page-level script and link it with the requisite HTML element. In the above example, the `onclick` expression is the linked function.

After making the edits to the template, the sample portal page contains a button to send the link of the form via email, as shown below.

![email](assets/email.png)
