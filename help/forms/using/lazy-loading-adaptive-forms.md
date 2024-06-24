---
title: Improve performance of large forms with lazy loading
description: Lazy loading significantly improves the performance of large and complex adaptive forms by deferring initialization and loading of form fragments until they are visible.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
docset: aem65
feature: Adaptive Forms,Foundation Components
exl-id: f7e3e2cd-0cbe-4b26-9e55-7afc6dc3af63
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Improve performance of large forms with lazy loading{#improve-performance-of-large-forms-with-lazy-loading}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/create-an-adaptive-form-on-forms-cs/lazy-loading-adaptive-forms.html)                  |
| AEM 6.5     | This article         |

## Introduction to lazy loading {#introduction-to-lazy-loading}

When form become large and complex with hundreds and thousands of fields, end users experience long response time when rendering forms at runtime. To minimize the response time, adaptive forms lets you break forms into logical fragments and configure to defer initialization or loading of fragments until the fragment needs to be visible. It is referred to as lazy loading. In addition, the fragments configured for lazy loading are unloaded once user navigates to other sections in the form and the fragments are no longer visible.

Let's first understand the requirements and preparatory steps before you configure lazy loading.

## Preparing to configure lazy loading {#preparing-to-configure-lazy-loading}

Before you configure lazy loading of fragments in your adaptive form, it is important you define strategies to create fragments, identify values that are used in scripts or referred in other fragments, and define rules to control visibility of fields in lazily loaded fragments.

* **Identify and create fragments** 
  You can configure only adaptive form fragments for lazy loading. A fragment is a stand-alone segment that resides outside an adaptive form and can be reused across forms. So, the first step toward implementing lazy loading is to identify logical sections in a form and convert them into fragments. You can create a fragment from scratch or save an existing form panel as fragment.  
  
  For more information about creating fragments, see [Adaptive form fragments](../../forms/using/adaptive-form-fragments.md).

* **Identify and mark global values** 
  Forms-based transactions involve dynamic elements to capture relevant data from users and process it to simplify form filling experience. For example, your form has field A in fragment X whose value determines the validity of field B in another fragment. In this case, if fragment X is marked for lazy loading, the value of field A must be available to validate field B even when fragment X is not loaded. To achieve this, you can mark field A as global, which ensures that its value is available for validating field B when fragment X is not loaded.  
  
  For information about how to make a field value global, see [Configuring lazy loading](../../forms/using/lazy-loading-adaptive-forms.md#p-configuring-lazy-loading-p).

* **Write rules to control visibility of fields** 
  Forms include some fields and sections that are not applicable to all users and in all conditions. Forms authors and developers use visibility or show-hide rules to control their visibility based on user inputs. For example, the Office Address field is not shown to the users who choose Unemployed in the Employment Status field in a form. For more information about writing rules, see [Using rule editor](../../forms/using/rule-editor.md).  
  
  You can use visibility rules in the lazily loaded fragments so that conditional fields are shown only when they are required. Also, mark the conditional field global to refer to it in the visibility expression of the lazily loaded fragment.

## Configuring lazy loading {#configuring-lazy-loading}

Perform the following steps to enable lazy loading on an adaptive form fragment:

1. Open the adaptive form in authoring mode that contains the fragment you want to enable for lazy loading.
1. Select the adaptive form fragment and select ![cmppr](assets/cmppr.png).
1. In the sidebar, enable **[!UICONTROL Load fragment lazily]** and select **Done**.

   ![Enable lazy loading for the adaptive form fragment](assets/lazy-loading-fragment.png)

   The fragment is now enabled for lazy loading.

You can mark the values of objects in the lazily loaded fragment as global so that they are available for use in scripts when the containing fragment is not loaded. Do the following:

1. Open the adaptive form fragment in authoring mode.
1. Select the field whose value you want to mark as global, and then select ![cmppr](assets/cmppr.png).
1. In the sidebar, enable **Use value during lazy loading**.

   ![Lazy loading field in sidebar](assets/enable-lazy-loading.png)

   The value is now marked as global and will be available for use in scripts even when the containing fragment is unloaded.

## Considerations and best practices for configuring lazy loading {#considerations-and-best-practices-for-configuring-lazy-loading}

Some limitations, recommendations, and important points to keep in mind when working with lazy loading are as follows:

* Use XSD schema-based adaptive forms over XFA-based adaptive forms for configuring lazy loading on large forms. The performance gain due to lazy loading implementation in XFA-based adaptive forms is relatively less than gain in XSD-based adaptive forms.
* Do not configure lazy loading on fragments in an adaptive form that use **[!UICONTROL Responsive -everything on one page without navigation]** layout for the root panel. As a result of the Responsive layout configuration, all fragments load simultaneously in an adaptive form. It can also result in degraded performance.
* It is recommended not to configure lazy loading on the first fragment in an adaptive form.
* It is recommended not to configure lazy loading on fragments in the first panel that renders on loading the adaptive form.
* Lazy loading is supported up to two levels in the fragment hierarchy.
* Ensure that fields marked as global are unique across an adaptive form.
* Consider writing visibility rules for fragments that should show or hide based on a condition. For example, you can show or hide the Spouse Details fragment based on the marital status specified by a user. 
* File attachment and Terms and conditions components are not supported in lazily loaded fragments.

### Scripting best practices for configuring lazy loading {#scripting-best-practices-for-configuring-lazy-loading}

Important points to keep in mind while developing scripts for lazy loading panels are as follows:

* Ensure that initialize and calculate scripts used on the fields of a lazy loaded fragment are idempotent in nature. Idempotent scripts are those which have same effect even after multiple executions.
* Use the globally available property of fields to make value of fields in a lazy loading panel available to all other panels of a form.
* Do not forward reference value of a field inside a lazy panel irrespective of field being marked globally across fragments or not.
* Use panel reset feature to reset everything visible on the panel by using the following click expression.  
  guideBridge.resolveNode(guideBridge.getFocus({"focusOption": "navigablePanel"})).resetData()
