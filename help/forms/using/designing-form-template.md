---
title: Designing form templates for HTML5 forms
seo-title: Designing form templates for HTML5 forms
description: AEM Forms offers rendering XFA form template to HTML5 format. Form designers can design form templates using Designer and use the HTML5 rendition capability. 
seo-description: AEM Forms offers rendering XFA form template to HTML5 format. Form designers can design form templates using Designer and use the HTML5 rendition capability. 
uuid: 41a00ec5-d7f9-4717-a961-00d20d8e7b2a
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: hTML5_forms
discoiquuid: e135fa01-fede-4285-b4dd-2d23acbb4d26
---

# Designing form templates for HTML5 forms {#designing-form-templates-for-html-forms}

The HTML5 forms component in AEM offers rendering XFA form template to HTML5 format. Form designers can design form templates using [Forms Designer](https://www.adobe.com/go/learn_aemforms_designer_63) and use the HTML5 rendition capability. These form templates, along with their assets, can reside in AEM repository, file system, or exposed via http. However, if you plan to manage your forms using Forms Manager, the templates and assets should reside in the AEM repository.

Although HTML5 forms match the behavior of the PDF forms to a great extent, there are some features in both formats that are not be applicable to the other format. For example, how barcodes get applied on a PDF form in Adobe Reader varies from a Mobile form or how a form is digitally signed also varies between the formats. For more information on such variations, see [Feature differentiation between HTML5 forms and PDF Forms](/help/forms/using/feature-differentiation-html5-forms-pdf-forms.md).

For common XFA features, see the following best practices and guidelines to design a form that works in both formats.

## Capabilities in AEM Forms Designer for HTML5 Forms {#capabilities-in-aem-forms-designer-for-html-forms}

### Preview HTML {#preview-html}

The Preview HTML tab is added in the Design mode for Form Designers to preview forms in HTML5 format during the design process. For more information on how to enable and configure this capability in AEM Forms Designer, see [Preview HTML](/help/forms/using/preview-xdp-forms-html.md).

### Scribble signature {#scribble-signature}

The key target for HTML5 forms is touch devices. Therefore, a new scribble signature control is added in AEM Forms Designer. You can click or drag-and-drop the scribble signature control on your form template and configure it. It is rendered as a scribble field in HTML5 rendition and can be used to scribble signature on touch devices. On desktop machines, it can be used as a scribble field using mouse control. For more information on how to use this feature, see [XFA Scribble Field](/help/forms/using/scribble-signature.md).

![4](assets/4.png)

[Contact Support](https://www.adobe.com/account/sign-in.supportportal.html)
