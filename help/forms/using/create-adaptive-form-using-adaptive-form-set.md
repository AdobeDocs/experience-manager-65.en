---
title: Create an adaptive form using a set of adaptive forms

description: With AEM Forms, bring adaptive forms together to author a single large adaptive form, and understand its features. 


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop

docset: aem65
feature: Adaptive Forms,Foundation Components
exl-id: 4254c2cb-66cc-4a46-b447-bc5e32def7a0
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Create an adaptive form using a set of adaptive forms{#create-an-adaptive-form-using-a-set-of-adaptive-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Overview {#overview}

In a workflow, such as an application for opening a bank account, your users fill multiple forms. Instead of asking them to fill a set of forms, you can stack the forms together and build a large form (parent form). When you add an adaptive form to the larger form, it is added as a panel (child form). You add a set of child forms to create a parent form. You can show or hide panels based on user input. Buttons of the parent form, such as submit and reset, overwrite the buttons of the child form. To add an adaptive form in the parent form, you can drag-drop the adaptive form from the asset browser (like adaptive form fragments).

Features available are:

* Independent authoring  
* Showing/hiding appropriate forms
* Lazy loading

Features like independent authoring and lazy loading provide performance improvements over using individual components to create the parent form.

>[!NOTE]
>
>You cannot use XFA-based adaptive forms/fragments as child or parent forms.

## Behind the scenes {#behind-the-scenes}

You can add XSD-based adaptive forms and fragments in the parent form. The structure of the parent form is same as [any adaptive form](../../forms/using/prepopulate-adaptive-form-fields.md). When you add an adaptive form as a child form, it is added as a panel in the parent form. Data of a bound child form is stored under the `data`root of the `afBoundData` section of the parent form's XML schema.

For example, your customers fill an application form. First two fields of the form are name and identity. Its XML is:

```xml
<afData>
    <afUnboundData>
        <data />
    </afUnboundData>
    <afBoundData>
        <data xmlns:xfa="https://www.xfa.org/schema/xfa-data/1.0/">
            <applicantName>Sarah Rose</applicantName>
            <applicantId>1234</applicantId>
        </data>
    </afBoundData>
</afData>

```

You add another form in the application that lets your customers fill their office address. The schema root of the child form is `officeAddress`. Apply `bindref` `/application/officeAddress` or `/officeAddress`. If `bindref`is not provided, the child form is added as the `officeAddress` subtree. See the XML of the form below:

```xml
<afData>
    <afUnboundData>
        <data />
    </afUnboundData>
    <afBoundData>
        <data xmlns:xfa="https://www.xfa.org/schema/xfa-data/1.0/">
            <applicantName>Sarah Rose</applicantName>
            <applicantId>1234</applicantId>
            <officeAddress>
                <addressLine>1, Geometrixx City</addressLine>
                <zip>11111</zip>
            </officeAddress>
        </data>
    </afBoundData>
</afData>

```

If you insert another form that lets your customers provide house address, apply `bindref` `/application/houseAddress or /houseAddress.`The XML looks like:

```xml
<afData>
    <afUnboundData>
        <data />
    </afUnboundData>
    <afBoundData>
        <data xmlns:xfa="https://www.xfa.org/schema/xfa-data/1.0/">
            <applicantName>Sarah Rose</applicantName>
            <applicantId>1234</applicantId>
            <officeAddress>
                <addressLine>1, Geometrixx City</addressLine>
                <zip>11111</zip>
            </officeAddress>
            <houseAddress>
                <addressLine>2, Geometrixx City</addressLine>
                <zip>11111</zip>
            </houseAddress>
        </data>
    </afBoundData>
</afData>

```

If you want to keep the same subroot name as the schema root ( `Address`in this example), use indexed bindrefs.

For example, apply bindrefs `/application/address[1]` or `/address[1]` and `/application/address[2]` or `/address[2]`. The XML of the form is:

```xml
<afData>
    <afUnboundData>
        <data />
    </afUnboundData>
    <afBoundData>
        <data xmlns:xfa="https://www.xfa.org/schema/xfa-data/1.0/">
            <applicantName>Sarah Rose</applicantName>
            <applicantId>1234</applicantId>
            <address>
                <addressLine>1, Geometrixx City</addressLine>
                <zip>11111</zip>
            </address>
            <address>
                <addressLine>2, Geometrixx City</addressLine>
                <zip>11111</zip>
            </address>
        </data>
    </afBoundData>
</afData>

```

You can change the default subtree of the adaptive form/fragment using the `bindRef` property. The `bindRef` property lets you specify the path that points to a location in the tree structure of the XML schema.

If the child form is unbound, its data is stored under the `data`root of the `afUnboundData` section of the parent form's XML schema.

You can add an adaptive form as a child form multiple times. Ensure that the `bindRef` is modified properly so that each used instance of the adaptive form points to a different subroot under the data root.

>[!NOTE]
>
>If different forms/fragments are mapped to same subroot, data gets overwritten.

## Adding an adaptive form as a child form using asset browser {#adding-an-adaptive-form-as-a-child-form-using-asset-browser}

Perform the following steps to add an adaptive form as a child form using asset browser.

1. Open the parent form in edit mode.
1. In the sidebar, click **Assets** ![assets-browser](assets/assets-browser.png). Under Assets, select **Adaptive Form** from the drop-down.
   [ ![Selecting adaptive form under Assets](assets/asset.png)](assets/asset-1.png)

1. Drag-drop the adaptive form you want to add as a child form. 
   [ ![Drag-drop the adaptive form in your site](assets/drag-drop.png)](assets/drag-drop-1.png)The adaptive form you drop is added as a child form.
