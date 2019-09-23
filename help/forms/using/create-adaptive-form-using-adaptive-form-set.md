---
title: Create an adaptive form using a set of adaptive forms
seo-title: Create an adaptive form using a set of adaptive forms
description: With AEM Forms, bring adaptive forms together to author a single large adaptive form, and understand its features. 
seo-description: With AEM Forms, bring adaptive forms together to author a single large adaptive form, and understand its features. 
uuid: a0d4b3a8-87d4-4bb2-a820-6047ddd01fb3
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
discoiquuid: 6ee0703a-408a-4874-a2fe-fe977c9fbd55
index: y
internal: n
snippet: y
---

# Create an adaptive form using a set of adaptive forms{#create-an-adaptive-form-using-a-set-of-adaptive-forms}

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
        <data xmlns:xfa="http://www.xfa.org/schema/xfa-data/1.0/">
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
        <data xmlns:xfa="http://www.xfa.org/schema/xfa-data/1.0/">
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
        <data xmlns:xfa="http://www.xfa.org/schema/xfa-data/1.0/">
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
        <data xmlns:xfa="http://www.xfa.org/schema/xfa-data/1.0/">
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
1. In the sidebar, click **Assets** ![](assets/assets-browser.png). Under Assets, select **Adaptive Form** from the drop-down.
   [ ![Selecting adaptive form under Assets](assets/asset.png)](assets/asset-1.png)

1. Drag-drop the adaptive form you want to add as a child form. 
   [ ![Drag-drop the adaptive form in your site](assets/drag-drop.png)](assets/drag-drop-1.png)The adaptive form you drop is added as a child form.

<!--
Comment Type: draft

<h2>Adding an adaptive form as a child form using AEM Form component</h2>
-->

<!--
Comment Type: draft

<p>Perform the following steps to add an adaptive form as a child form using AEM Form component.</p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Open the parent form in Edit mode. </p> </li>
<li><p>From the side panel, drag-drop the AEM Form component on the parent form where you want to add the child form.</p> <p>If your parent form has panels, you can drop the component above or below a panel only. </p>
<note type="note">
<p>If the AEM Form component is not available in the component browser of the side panel, enable it in design mode. For more information, see <a href="/sites/authoring/using/default-components-designmode.md">Configuring Components in Design Mode</a>. Enable the AEM Form component under the General section Edit dialog. Switch to Edit mode after you enable the component in Design mode.</p>
</note></li>
<li><p>Tap the AEM Form component, and then tap <img src="assets/settings_icon.png" /> in the overlay. You see the properties of the component in the side panel.</p> <p>Your options are:</p> <p><strong>AEM Form Path</strong> Browse and select the adaptive form you want to add as a child form.</p><p><strong>Post Submit Action</strong> Specify the action to trigger on form submission. You can choose to show a thank you message or a thank you page.</p><p><strong>Page Refresh on Submit</strong> Enable to refresh the page containing the embedded adaptive form to show the thank you page. Otherwise, the thank you page replaces the adaptive form in the AEM Form container, without refreshing the page. This option is available only when you choose to show a thank you page.</p><p><strong>Thank You Page</strong> Browse and select the page to display on form submission. This option is available only when you choose to show a thank you page.</p><p><strong>Thank You Message</strong> Write a message using the rich text editor to show on form submission. This option is available only when you choose to show a thank you message.</p><p><strong>Adaptive Form Theme</strong> Browse and select a theme that defines styling for components of your adaptive form. Styling includes appearance properties such as font style, background color, dimensions, and alignment.</p></li>
<li><p>Tap <strong>Done</strong> <img height="21" src="assets/check-button.png" />. The selected adaptive form is added as a child form.</p> </li>
</ol>
-->

