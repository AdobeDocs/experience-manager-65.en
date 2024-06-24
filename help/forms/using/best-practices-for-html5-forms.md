---
title: Best practices for HTML5 forms

description: Tune your XFA-based HTML5 Forms for best performance.


contentOwner: khsingh
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
content-type: reference

docset: aem65

feature: "HTML5 Forms,Mobile Forms"
exl-id: 62ff6306-9989-43b0-abaf-b0a811f0a6a4
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Best practices for HTML5 forms{#best-practices-for-html-forms}

## Overview {#overview}

AEM Forms has a component called HTML5 forms. It helps render existing XFA-based PDF forms (XDP files) in HTML5 format. This document provides guidelines and recommendations to reduce the load time and improve the performance of HTML5 forms on mobile devices.

Most mobile devices have a limited processing power and memory capabilities. It helps in improving the standby time of mobile devices. The web browsers running on a mobile device have access to limited resources (limited memory and processing capabilities). After the limit is reached, the browser behavior turns sluggish. This document provides recommendations to keep the size of an HTML5 form in check. A smaller form does not breach memory and processing power limits of a device and provides a smooth experience.

Although, the recommendations discussed in this article are targeted at HTML5 forms, yet these are equally applicable to XFA-based PDF Forms. These best practices collectively contribute to the overall performance of HTML5 forms. It requires a careful planning to develop efficient and productive forms. Let’s get started:

## Nodes are currency of HTML5 forms, spend them wisely {#nodes-are-currency-of-html-forms-spend-them-wisely}

Generally, an XFA form has multiple elements. For example, table, text field, and images. Every element has several properties to control the behavior and appearance of the element. When an XFA form is rendered in HTML5 format, all XFA elements, and the corresponding properties are converted to Model or HTML DOM nodes. These nodes add to the size and complexity of a DOM. Making the HTML5 form slow to render.

It is easier for the browsers to render a leaner DOM. So, you can perform the following optimizations on an XFA form to reduce the number of nodes. Therefore, generate a lean DOM structure:

* Use the caption property to add a label to a field. Do not use a separate Text element to add a label. It helps in shedding extra weight, leading to performance gains. It also helps in avoiding layout issues.
* Keep the number of Draw text elements on a form to a bare minimum. Draw elements are helpful in improving readability and appearance but do not have any information storing capabilities. It is advised to merge multiple Draw text elements into a single Draw text element. Leave no stone unturned to make a form leaner.

## Lite forms perform better, keep the resources compressed {#lite-forms-perform-better-keep-the-resources-compressed}

An HTML5 form can contain multiple external resources, such as image, JavaScript, and CSS files. Every time a browser requests a form, the external resources are sent over the network. The time required to travel over the network is directly proportional to the size of the files.

Hence, reducing the size of the external resources and using only absolutely required resources is the preferred method of improving the performance of the forms. You can perform the following optimizations on an XFA form to reduce the size of external resources of a form:

* Use [compressed images](/help/assets/best-practices-for-optimizing-the-quality-of-your-images.md). It reduces the network activity and amount of memory required to render a form. Therefore, the form load time decreases substantially.
* Use the minify option in AEM Configuration Manager (Day CQ HTML Library Manager) to compress JavaScript and CSS files. For details, see [OSGi Configuration Settings](/help/sites-deploying/osgi-configuration-settings.md).
* Enable web compression. It reduces the size of the requests and responses originated from a form. For details, see [Performance tuning of AEM Forms Server](https://helpx.adobe.com/aem-forms/6-3/performance-tuning-aem-forms.html).

## Keep the interest alive, show only required fields  {#keep-the-interest-alive-show-only-required-fields}

An HTML5 form can run into hundreds of pages. A form with a large number of fields is slow to load in the browser. You can perform the following optimizations on an XFA form to optimize the forms with a large number of fields and pages:

* Evaluate splitting the large forms into multiple forms. You can also use a form set to group all the smaller forms together and present them as a single unit. A form set loads only required forms. Moreover, in a form set, you can configure common fields in different forms to share data bindings. Data bindings help users fill common information only once; the information gets auto-filled in subsequent forms, leading to substantial performance improvements. For more details about form sets, see [Form set in AEM forms](https://helpx.adobe.com/aem-forms/6-3/formset-in-aem-forms.html).
* Consider splitting sections and moving each section to a different page. HTML5 forms dynamically load each page on page scroll request. Only scrolled page (the page being displayed and the pages preceding it) are stored in the memory; the rest of the pages are loaded on demand. So, splitting and moving a section on a page of its own reduces the time required to load a form. You can also use the first page of the form as a landing page. It is similar to the table of contents (TOC) of a book. A landing page of the form contains only links to the other sections of the form. It significantly improves the load time of the first page of the form and results in improved user experience.
* Keep conditional sections hidden, by default. Make these sections visible only when a certain condition is met. It helps keep the size of DOM to a minimum. You can also use tabbed navigation to display only one section at a time.

## Less is more, reduce the number of pages {#less-is-more-reduce-the-number-of-pages}

HTML5 forms can contain data-driven fields (tables and sub-forms). These fields expand the size of the form on the run-time. For example, a data-driven table in an HTML5 form can span to thousands of rows. Such tables can cause layout and performance degradation. The optimizations suggested below can help you reduce the load time of HTML5 forms with data-driven fields:

* Use XFA-scripting to achieve paged navigation to display data-driven fields (tables and sub-forms). In paged navigation, only a specific data is displayed on a page. It limits the browser  paint  operation to the fields being displayed at a time and makes it easier to navigate a form. Moreover, users on the mobile devices are interested only in a subset of data. It helps you deliver great user experience and reduces the time required to load the required data. You get two solutions for the price of one.  Also  note that paged navigation is not available out of the box. You can use XFA scripting to develop paged navigation.

* Evaluate merging multiple read-only columns into a single column. It reduces the memory required to display the form. Also, avoid displaying the columns which do not require any inputs from users.
* Evaluate splitting the data-driven form into a [form set](https://helpx.adobe.com/aem-forms/6-3/formset-in-aem-forms.html), if the above suggestions do not yield many improvements. For example, if a table has more than 1000 rows, then move every 100 rows to a different form. It would help improve the load time and performance of the forms.  Also  note that a Form set produces a consolidated submit XML for all the forms. To differentiate data of every form, use different data roots. For more information, see [Form set in AEM Forms](https://helpx.adobe.com/aem-forms/6-3/formset-in-aem-forms.html).

## Power of two for Document of Record (DOR) {#power-of-two-for-document-of-record-dor}

An XFA form can have a large number of sections dedicated only for Document of Record (DOR). To reduce the number of nodes and improve the performance of such a form, you can maintain different copies of the form - one copy to fill the form, and another one to generate Document of Record on the server. In the copy to fill the XFA form show fields required only to capture data. In the generate Document of Record XFA from, keep fields required only in the printed output of the form. Before choosing the suggested approach, evaluate the performance gain and the maintenance overhead.

## Recommended reads  {#recommended-reads}

Adobe Experience Manager (AEM) forms can help you transform complex transactions into simple, delightful digital experiences. However, it requires concerted effort to develop efficient and productive forms. In addition to HTML5 Forms, here are some recommended reads for general AEM best practices:

* [Best practices for Deploying and maintaining AEM](/help/sites-deploying/best-practices.md)
* [Best practices for Authoring content](/help/sites-authoring/best-practices.md)
* [Best practices for Administering AEM](/help/sites-administering/administer-best-practices.md)
* [Best practices for Developing solutions](/help/sites-developing/best-practices.md)
* [Best practices for working with adaptive forms](/help/forms/using/adaptive-forms-best-practices.md)
* [AEM Forms server does not embed fonts to a Dynamic PDF form](https://helpx.adobe.com/aem-forms/kb/aem-forms-server-does-not-embed-fonts-to-dynamic-pdf-form.html)

## Quick reference card {#quick-reference-card}

You can print following card (Click card to download a high-resolution version) and keep it on your desk for a quick reference:
[ ![HTML5 Forms best practices quick reference card](do-not-localize/best-practices_reference_card.png)](assets/html5_forms_best_practices_reference_card.pdf)
