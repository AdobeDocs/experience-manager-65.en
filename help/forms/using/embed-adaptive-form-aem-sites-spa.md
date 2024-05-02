---
title: Embed an adaptive form or Interactive Communication in AEM Sites Single Page Application

description: Embed adaptive forms or Interactive Communication in AEM Sites pages. Users can fill and submit forms without leaving the Sites page.


topic-tags: author, interactive-communications
products: SG_EXPERIENCEMANAGER/6.5/FORMS

docset: aem65

feature: Adaptive Forms
exl-id: b549f176-409a-4d81-8c2b-73d0dd0c6649
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Embed an adaptive form or Interactive Communication in AEM Sites Single Page Application{#embed-an-adaptive-form-or-interactive-communication-in-aem-sites-single-page-application}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Overview {#overview}

AEM Forms allows form developers to seamlessly embed adaptive forms and Interactive Communications in an AEM Sites Single Page Application (SPA). The embedded adaptive form and Interactive Communication is fully functional and users can fill and submit the form without leaving the page. It helps user remain in context of other elements on the web page and simultaneously interact with the adaptive form or Interactive Communication.

In AEM Sites Single Page Application, you can add an adaptive form or Interactive Communication using the [AEM Forms SPA Container component](../../forms/using/embed-adaptive-form-aem-sites-spa.md#af-component)[.](../../forms/using/embed-adaptive-form-aem-sites-spa.md#af-component) It is an AEM Forms component for AEM Sites SPAs that you can add to your Sites page.

For information about embedding an adaptive form in a non-SPA AEM Sites, see [Embed an adaptive form or interactive communication in AEM Sites page](/help/forms/using/embed-adaptive-form-aem-sites.md).

## Prerequisites {#prerequisites}

To embed an adaptive form or Interactive Communication in an AEM sites SPA using the AEM Forms SPA Container component, ensure that you have installed:

* Java SE Development Kit 8 or newer
* Apache Maven 3.3.1 or newer
* AEM author instance
* [AEM Forms 6.4.2 add-on package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) on author instance

## Install AEM Forms SPA Container component {#install-aem-forms-spa-container-component}

Execute the following steps install the AEM Forms SPA Container component:

1. [Clone or download the AEM Forms component for SPA](https://github.com/Adobe-Marketing-Cloud/aem-forms/tree/master/forms-spa).
1. Install the AEM Forms component for SPA. The instructions to install the component are available in the [README.md](https://github.com/Adobe-Marketing-Cloud/aem-forms/tree/master/forms-spa#aem-form-component) file.

   The component includes a [sample React component](https://github.com/Adobe-Marketing-Cloud/aem-forms/tree/master/forms-spa/react-component) that can be used to integrate SPA container component with a React-based SPA project.

1. [Clone or download a React-based SPA project](https://github.com/adobe/aem-sample-we-retail-journal).
1. Integrate SPA container component with a React-based SPA project using the instructions available in the [README.md](https://github.com/Adobe-Marketing-Cloud/aem-forms/tree/master/forms-spa/react-component#aem-form-react-component-for-spa---editor) file.

   After installing the AEM Forms SPA Container component and integrating the component with a React-based SPA project, you can embed an adaptive forms and Interactive Communications in the AEM Sites page.

## Embed an adaptive form or Interactive Communication {#af-component}

To embed an adaptive form or Interactive Communication using AEM Forms for SPA Container component:

1. Open the AEM sites page, in edit mode, in which you want to embed an adaptive form or Interactive Communication.
1. Insert the **AEM Form for SPA** component on the page using any of the following options:

    * Select the layout container on the Sites page, select **+** and select the **AEM Form for SPA** component.
    
    * From the Component browser panel, drag-drop the **AEM Form for SPA** component on the page.
    * Search for an adaptive form or Interactive Communication in the Assets browser and drag-drop it onto the Sites page. It embeds the form in an AEM Forms for SPA component container.

   >[!NOTE]
   >
   >Rendering multiple AEM Forms SPA Container components on a page are not supported. You can have multiple AEM Forms SPA Container on a page but only one component is rendered at a time. Ensure that only one component is visible on a page to avoid discrepancies.

1. Select the embedded AEM Forms SPA Container component in the sites page, and then select ![settings_icon](assets/settings_icon.png) on the action bar. The **Edit AEM Forms SPA Container** dialog opens.
1. In the **Edit AEM Forms Container** dialog, specify the following:

    * **Asset Type:** Select the type of asset to embed. The options are **Adaptive Form** and **Interactive Communication** 
    
    * **Asset Path**: Browse and select the adaptive form or Interactive Communication to embed. The field is auto-populated if an adaptive form or Interactive Communication is inserted using the Assets browser.
    * **Channel** (Interactive Communication Only): Select the type of interactive channel to embed. The options are **Web Channel** and **Print Channel**.  
    
    * **Theme**: Select a theme that defines styling for components of your adaptive form or Interactive Communication. Styling includes appearance properties such as font style, background color, dimensions, and alignment.

1. Select ![done_icon](assets/done_icon.png) to save the settings. The adaptive form or Interactive Communication is now embedded in the page.

## Publish embedded adaptive form and Interactive Communication {#publish-embedded-adaptive-form-and-interactive-communication}

Consider the following scenarios for publishing an embedded asset (adaptive form or Interactive Communication) on AEM Sites page:

* If you are publishing the AEM Sites page for the first time and it includes an embedded adaptive form or Interactive Communication, publish the Sites page and the embedded asset.
* If you modified only the embedded adaptive form or Interactive Communication in a published Sites page, publish the original asset and the changes reflect in the published Sites page. The published Sites page includes a reference to the asset and does not require republishing the page.
* If you modified the Sites page and the embedded adaptive form or Interactive Communication, republish the Sites page and the embedded asset.

## Modify embedded adaptive form and Interactive Communication {#modify-embedded-adaptive-form-and-interactive-communication}

AEM sites page maintains a reference to the adaptive form and Interactive Communication in the AEM Forms Container. Therefore, all configurations and properties, such as the theme, styles, and submit action, configured in the original adaptive form and Interactive Communication are retained in the embedded adaptive form and Interactive Communication.

To modify any configuration or property of the embedded adaptive form and Interactive Communication, do one of the following.

* Open the original form in adaptive forms or Interactive Communication in respective editors and modify them.
* Select the adaptive form or Interactive Communication from within the Sites page in edit mode and then select **Edit in a new window**. The original form opens in edit mode.

## Considerations and best practices {#considerations-and-best-practices}

Do keep the following points in mind when embedding adaptive forms in AEM sites pages:

* Header and footer in the original form are not included in the embedded form.
* User drafts and submissions of embedded forms are supported and visible in Drafts and Submitted Forms tabs on the forms portal.
* The submit action configured on the original form is retained in the embedded form.
* Experience targeting and A/B tests configured on the original form do not work in the embedded form. However, you can use experience targeting on the Sites page to present different forms based on user profiles.
* If you have Adobe Analytics configured for the original form, the analytics data of the embedded form is captured in Adobe Analytics. However, it is not available in the forms analytics report.
