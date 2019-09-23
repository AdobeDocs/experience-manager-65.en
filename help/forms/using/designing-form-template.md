---
title: Designing form templates for HTML5 forms
seo-title: Designing form templates for HTML5 forms
description: AEM Forms offers rendering XFA form template to HTML5 format. Form designers can design form templates using Designer and use the HTML5 rendition capability. 
seo-description: AEM Forms offers rendering XFA form template to HTML5 format. Form designers can design form templates using Designer and use the HTML5 rendition capability. 
uuid: 01644057-325d-4b51-9587-cd9eb2717800
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: a686d89a-d7fe-4331-bd6d-c798f6a8d42a
index: y
internal: n
snippet: y
---

# Designing form templates for HTML5 forms{#designing-form-templates-for-html-forms}

The HTML5 forms component in AEM offers rendering XFA form template to HTML5 format. Form designers can design form templates using [Forms Designer](http://www.adobe.com/go/learn_aemforms_designer_63) and use the HTML5 rendition capability. These form templates, along with their assets, can reside in AEM repository, file system, or exposed via http. However, if you plan to manage your forms using Forms Manager, the templates and assets should reside in the AEM repository.

Although HTML5 forms match the behavior of the PDF forms to a great extent, there are some features in both formats that are not be applicable to the other format. For example, how barcodes get applied on a PDF form in Adobe Reader varies from a Mobile form or how a form is digitally signed also varies between the formats. For more information on such variations, see [Feature differentiation between HTML5 forms and PDF Forms](../../forms/using/feature-differentiation-html5-forms-pdf-forms.md).

For common XFA features, see the following best practices and guidelines to design a form that works in both formats.

### Best practices {#best-practices}

Most steps around designing a form template, such as schema bindings or writing form logic are same. However, due to inherent differences between rendering and scripting engine of a thick client like Adobe Reader and browser-based forms, there are some recommendations described in the [best practices](/forms/using/best-practices-design-html5-forms.md) article. These best practices help you design form templates to work as expected in both formats.

### Capabilities in AEM Forms Designer for HTML5 Forms {#capabilities-in-aem-forms-designer-for-html-forms}

#### Preview HTML {#preview-html}

The Preview HTML tab is added in the Design mode for Form Designers to preview forms in HTML5 format during the design process. For more information on how to enable and configure this capability in AEM Forms Designer, see [Preview HTML](../../forms/using/preview-xdp-forms-html.md).

#### Scribble signature {#scribble-signature}

The key target for HTML5 forms is touch devices. Therefore, a new scribble signature control is added in AEM Forms Designer. You can click or drag-and-drop the scribble signature control on your form template and configure it. It is rendered as a scribble field in HTML5 rendition and can be used to scribble signature on touch devices. On desktop machines, it can be used as a scribble field using mouse control. For more information on how to use this feature, see [XFA Scribble Field](../../forms/using/scribble-signature.md).

![](assets/4.png)

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="/forms/using/best-practices-design-html5-forms.md">Best practices to design a Mobile form</a>
<a href="../../forms/using/preview-xdp-forms-html.md">Previewing your XDP form in HTML</a>
<a href="../../forms/using/scribble-signature.md">Using Scribble Signature </a>
<a href="/forms/using/rendering-form-template.md">Rendering Form Template</a>
<a href="../../forms/using/designing-form-template.md">Designing form templates</a>
</related-links>
-->

