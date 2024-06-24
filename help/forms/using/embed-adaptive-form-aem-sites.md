---
title: Embed an adaptive form or interactive communication in AEM sites page
description: You can embed adaptive forms in AEM sites pages. Users can fill and submit forms without leaving the site pages.
contentOwner: vishgupt
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author, interactive-communications
feature: Adaptive Forms,Foundation Components
exl-id: 00ee7929-649f-4cbb-be79-ba13ac73a16d
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Embed an adaptive form or interactive communication in AEM sites page {#embed-an-adaptive-form-or-interactive-communication-in-aem-sites-page}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/integrate/services/embed-adaptive-form-aem-sites.html)                  |
| AEM 6.5     | This article         |


## Overview {#overview}

AEM Forms allows form developers to seamlessly embed adaptive forms and interactive communications in an AEM Sites page or a web page hosted outside AEM. The embedded adaptive form and interactive communication is fully functional and users can fill and submit the form without leaving the page. It helps user remain in context of other elements on the web page and simultaneously interact with the form or interactive communication.

For information about embedding an adaptive form in an external web page, see [Embed adaptive form in external web page](/help/forms/using/embed-adaptive-form-external-web-page.md).

In AEM Sites page, you can add an adaptive form or interactive communication using:

* **[AEM Forms Container component](/help/forms/using/embed-adaptive-form-aem-sites.md#af-component)**
  AEM Forms provides a component that you can add to your site pages. The AEM Forms Container component lets you embed an adaptive form and interactive communication.

* **[Asset browser](/help/forms/using/embed-adaptive-form-aem-sites.md#asset-browser)**
  All the forms and interactive communications you create are available under Assets. You can drag-drop the form as an asset on your page.

## Prerequisites {#prerequisites}

To embed an adaptive form or interactive communication in an AEM sites page that uses an editable template, ensure that the AEM Form component is configured as an allowed component in the associated template. For more information, see **Policy & Properties (Layout Container)** section in [Creating Page Templates](/help/sites-authoring/templates.md).

If there is a Sites page using a static template, you need to configure it in the paragraph system of the site page. See [Configuring Components in Design Mode](/help/sites-authoring/default-components-designmode.md) for more information.

## Embedding an adaptive form or interactive communication {#af-component}

To embed an adaptive form or interactive communication using AEM Forms Container component:

1. Open the AEM sites page, in edit mode, in which you want to embed an adaptive form or interactive communication.
1. From the Component browser panel, drag-drop the AEM Forms Container component on the page.

   Alternatively, you can search for an adaptive form or interactive communication in the Assets browser and drag-drop it onto the Sites page. It embeds the form in an AEM Forms Container.

   >[!NOTE]
   >
   >Multiple AEM Forms Container components on a page are not supported.

1. Select the embedded AEM Forms Container component in the sites page, and then select ![settings_icon](assets/settings_icon.png) on the action bar. The **[!UICONTROL Edit AEM Forms Container]** dialog opens.
1. In the Edit AEM Forms Container dialog, specify the following.

    * **Asset Type:** Select the type of asset to embed. The options are adaptive form and interactive communication
    * **Asset Path**: Browse and select the adaptive form or interactive communication to embed. It is auto-populated if you dropped it from the Assets browser.
    * (Adaptive form only) **Post Submission**: Select the action to trigger on form submission. You can choose to show a thank you message or a thank you page.

        * **Thank You Message**: Write a message using the rich text editor to show on form submission. This option is available only when you choose to show a thank you message.
        * **Thank You Page**: Browse and select the page to display on form submission. This option is available only when you choose to show a thank you page.
        * **Refresh Page on Submission**: Enable so you can refresh the page containing the embedded adaptive form to show the thank you page. Otherwise, the thank you page replaces the adaptive form in the AEM Forms container, without refreshing the page. This option is available only when you choose to show a thank you page.

    * **Theme**: Select a theme that defines styling for components of your adaptive form or interactive communication. Styling includes appearance properties such as font style, background color, dimensions, and alignment.
    * **Height**: Specify the height of the container. Leave it blank to automatically resize the container.
    * **CSS Client library**: Specify path to a CSS client library.

1. Save the settings. The adaptive form or interactive communication is now embedded in the page.

## Publishing embedded adaptive form and interactive communication {#publishing-embedded-adaptive-form-and-interactive-communication}

Let's consider the following scenarios for publishing an embedded asset (adaptive form or interactive communication) in AEM sites page:

* If you are publishing the AEM sites page for the first time and it includes an embedded adaptive form or interactive communication, publish the sites page and the embedded asset.
* If you modified only the embedded adaptive form or interactive communication in a published site page, publish the original asset and the changes reflect in the published site page. The published site page includes a reference to the asset and does not require republishing the page.
* If you modified the sites page and the embedded adaptive form or interactive communication, republish the sites page and the embedded asset.

## Modifying embedded adaptive form and interactive communication {#modifying-embedded-adaptive-form-and-interactive-communication}

AEM sites page maintains a reference to the adaptive form and interactive communication in the AEM Forms Container. Therefore, all configurations and properties, such as the theme, styles, and submit action, configured in the original adaptive form and interactive communication are retained in the embedded adaptive form and interactive communication.

To modify any configuration or property of the embedded adaptive form and interactive communication, do one of the following.

* Open the original form in adaptive forms or interactive communication in respective editors and modify them.
* Select the adaptive form or interactive communication from within the site page in edit mode and then select **[!UICONTROL Edit in a new window]**. The original form opens in edit mode that you can modify.

>[!NOTE]
>
>The changes made in the original adaptive form or interactive communication automatically reflect in the embedded form. However, republish the adaptive form, interactive communication, or the site page to reflect the changes in the published page.

## Considerations and best practices {#considerations-and-best-practices}

Do keep the following points in mind when embedding adaptive forms in AEM sites pages:

* Header and footer in the original form are not included in the embedded form.
* User drafts and submissions of embedded forms are supported and visible in Drafts and Submitted Forms tabs on the forms portal.
* The submit action configured on the original form is retained in the embedded form.
* Experience targeting and A/B tests configured on the original form do not work in the embedded form. However, you can use experience targeting on the sites page to present different forms based on user profiles.
* If you have Adobe Analytics configured for the original form, the analytics data of the embedded form is captured in Adobe Analytics. However, it is not available in the forms analytics report.
