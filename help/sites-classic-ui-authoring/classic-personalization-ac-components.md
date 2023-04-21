---
title: Adobe Campaign Components
description: When you integrate with Adobe Campaign, you have components available for when working with newsletters and with forms.
uuid: cc9417c9-4cc1-4554-858e-2ecd682dc92f
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
discoiquuid: 5afe864d-5794-4ffa-99e7-a3233f982aff
docset: aem65
exl-id: eeff89c1-41b3-403d-b4bf-c79b09b24d4a
---
# Adobe Campaign Components{#adobe-campaign-components}

When you integrate with Adobe Campaign, you have components available for when working with newsletters and with forms. Both are described in this document.

>[!CAUTION]
>
>The AEM email components have been deprecated. Due to the nature of email, which merges content and style, the email components provided out-of-the-box by AEM become of limited reuse for customers because of the need to implement custom styles into whatever components are required for projects.
>
>Email components can be implemented on project level, and the deprecated AEM email components illustrate how that can be achieved. However these deprecated components should not be used on projects.

## Adobe Campaign Newsletter Components {#adobe-campaign-newsletter-components}

All the Campaign components follow the best practices outlined in [Best Practices for Email Templates](/help/sites-administering/best-practices-for-email-templates.md) and are based on the Adobe markup language [HTL](https://helpx.adobe.com/experience-manager/htl/using/overview.html).

When you open a newsletter/email that is configured to integrate with Adobe Campaign, you should see the following components in the **Adobe Campaign Newsletter** section:

* Heading (Campaign)
* Image (Campaign)
* Link (Campaign)
* Scene7 Image Template (Campaign)
* Targeted reference (Campaign)
* Text & Image (Campaign)
* Text & Personalization (Campaign)

A description of these components is in the following section.

![chlimage_1-81](assets/chlimage_1-81.png)

### Heading (Campaign) {#heading-campaign}

The heading component can either:

* Display the name of the current page by leaving the **Title** field blank.
* Display a text that you specify in the **Title** field.

You edit the **Heading (Campaign)** component directly. Leave empty to use the page title.

![chlimage_1-82](assets/chlimage_1-82.png)

You can configure the following:

* **Title**
  If you want to use a name other than the page title, enter it here.

* **Heading level (1, 2, 3, 4)**
  The heading level based on the HTML heading sizes 1-4.

The following example shows a Heading (Campaign) component being displayed.

![chlimage_1-83](assets/chlimage_1-83.png)

### Image (Campaign) {#image-campaign}

The image (campaign) component displays an image and accompanying text according to the specified parameters.

You can upload an image, then edit and manipulate it (for example, crop, rotate, add link/title/text).

You can upload an image, then edit and manipulate it (for example crop, rotate, add link/title/text). You can either drag and drop an image from the [Content Finder](/help/sites-authoring/author-environment-tools.md#thecontentfinderclassicui) directly onto the component or its Edit dialog. You can also double-click in the central area of the Edit dialog to browse your local file system and upload an image. The two tabs of the Edit dialog also control all definitions and manipulation of the image:

![chlimage_1-84](assets/chlimage_1-84.png)

When an image is loaded, you can configure the following:

* **Map**
  To map an image, select Map. You can specify how you want to create the image map (rectangle, polygon, and so on) and where the area should point to.

* **Crop**
  Select Crop to crop an image. Use your mouse to crop the image.

* **Rotate**
  To rotate an image, select Rotate. Use repeatedly until the image is rotated the way you want it.

* **Clear**
  Remove the current image.

* Zoom bar (classic only)
  To zoom in and out of the image, use the slide bar beneath the image (above the OK and Cancel buttons)
* **Title**
  The title of the image.

* **Alt Text**
  An alternative text for use when creating accessible content.

* **Link To**
  Create a link to assets or other pages within your website.

* **Description**
  A description of the image.

* **Size**
  Sets the height and the width of the image.

>[!NOTE]
>
>You must enter information in the **Alt Text** field in the **Advanced** tab, or the image cannot save and you see the following error message:
>
>`Validation failed. Verify the values of the marked fields.`
>

The following example shows an Image (Campaign) component being displayed.

![chlimage_1-85](assets/chlimage_1-85.png)

### Link (Campaign) {#link-campaign}

The Link (Campaign) component lets you add a link to your newsletter. This component is only available in the classic user interface although you can add one in the touch-optimized user interface and open it in compatibility mode.

![chlimage_1-86](assets/chlimage_1-86.png)

You can configure the following in the **Display**, **URL Info**, or **Advanced** tabs:

* **Link Caption**
  The caption for the link. This is the text that users see.

* **Link ToolTip**
  Adds additional information on how to use the link.

* **LinkType**
  In the drop-down list, select between a **Custom URL** and an **Adaptive Document**. This field is required. If you select Custom URL, you can provide the Link URL. If you select Adaptive Document, you can provide the document path.

* **Additional URL Parameter**
  Add any additional URL parameters. Click Add Item to add multiple items.

>[!NOTE]
>
>You must enter information in the **Link Type** field in the **URL Info** tab, or the component cannot save and you see the following error message:
>
>`Validation failed. Verify the values of the marked fields.`
>

The following example shows a Link (Campaign) component being displayed.

![chlimage_1-87](assets/chlimage_1-87.png)

### Targeted reference (Campaign) {#targeted-reference-campaign}

The Targeted Reference (Campaign) component lets you create a reference to a targeted paragraph.

In this component, you navigate to the targeted paragraph to select it.

Click the drop-down menu to navigate to the paragraph that you want to reference. When finished, click **OK**.

### Text & Image (Campaign) {#text-image-campaign}

The Text & Image (Campaign) component adds a text block and an image.

![chlimage_1-88](assets/chlimage_1-88.png)

As with the Text & Personalization (Campaign) and Image (Campaign) components, you can configure:

* **Text**
  Enter text. Use the toolbar to modify formatting, create lists, and add links.

* **Image**
  Drag an image from the content finder, or click to browse to an image. Crop or rotate as required.

* **Image Properties** (**Advanced Image Properties**)
  Allows you to specify the following:

    * **Title**
      The title for the block; will be shown by mouseover.

    * **Alt Text**
      Alternative text to be shown if the image cannot be displayed.

    * **Link to**
      Create a link to assets or other pages within your website.

    * **Description**
      A description of the image.

    * **Size**
      Sets the height and width of the image.

>[!NOTE]
>
>The **Alt Text** field in the **Advanced** tab is required or the component cannot save and you see the following error message:
>
>`Validation failed. Verify the values of the marked fields.`
>

The following example shows a Text & Image (Campaign) component being displayed.

![chlimage_1-89](assets/chlimage_1-89.png)

### Text & Personalization (Campaign) {#text-personalization-campaign}

The Text & Personalization (Campaign) component lets you enter a text block using a WYSIWYG editor, with functionality provided by the [Rich Text editor](/help/sites-authoring/rich-text-editor.md). In addition, this component lets you use context fields and personalization blocks available from Adobe Campaign; also see [Inserting Personalization](/help/sites-classic-ui-authoring/classic-personalization-ac-campaign.md#inserting-personalization).

The selection of icons allow you to format your text, including font characteristics, alignment, links, lists and indentation.

Add text as you normally would in the rich text editor. Add personalization by selecting the Adobe Campaign dropdown and selecting the fields as appropriate.

![chlimage_1-90](assets/chlimage_1-90.png)

You add the text and context fields or personalization blocks to create the content. Next, select the Client Context to test the data in the persona profiles. After you select a persona the personalization fields are automatically replaced by data from the selected profile.

>[!NOTE]
>
>Only the fields defined in the **nms:seedMember** schema or one of its extensions are taken into account. The attributes of the tables linked to `nms:seedMember` are not available.

## Adobe Campaign Form Components {#adobe-campaign-form-components}

You use Adobe Campaign components to create a form that users fill out to either subscribe to a newsletter, unsubscribe from a newsletter, or update their user profiles. See [Creating Adobe Campaign Forms](/help/sites-classic-ui-authoring/classic-personalization-ac-forms.md) for more information.

Each component field can be linked to an Adobe Campaign database field. The available fields differ according to the type of data they contain as described in the section [Components and Data Type](#components-and-data-type). If you extend your recipient schema in Adobe Campaign, the new fields will be available in the components whose data types match.

When you open a form that is configured to integrate with Adobe Campaign, you see the following components in the **Adobe Campaign** section:

* Checkbox (Campaign)
* Date Field (Campaign) and Date Field/HTML5 (Campaign)
* Encrypted Primary Key (Campaign)
* Error Display (Campaign)
* Hidden Reconciliation Key (Campaign)
* Numeric Field (Campaign)
* Option Field (Campaign)
* Subscriptions Checklist (Campaign)
* Text Field (Campaign)

This section describes each component in detail.

### Components and Data Type {#components-and-data-type}

The following table describes the components that are available to display and modify Adobe Campaign profile data. Each component can be mapped to an Adobe Campaign profile field to display its value and update the field when the form is submitted. The different components can only be matched to fields of an appropriate data type.

<table>
 <tbody>
  <tr>
   <td><p><strong>Component</strong></p> </td>
   <td><p><strong>Data type of Adobe Campaign field</strong></p> </td>
   <td><p><strong>Example field</strong></p> </td>
  </tr>
  <tr>
   <td><p>Checkbox (Campaign)</p> </td>
   <td><p>boolean</p> </td>
   <td><p>No longer contact (by any channel)</p> </td>
  </tr>
  <tr>
   <td><p>Date Field (Campaign)</p> <p>Date Field/HTML 5 (Campaign)</p> </td>
   <td><p>date</p> </td>
   <td><p>Birth date</p> </td>
  </tr>
  <tr>
   <td><p>Numeric Field (Campaign)</p> </td>
   <td><p>numeric (byte, short, long, double)</p> </td>
   <td><p>Age</p> </td>
  </tr>
  <tr>
   <td><p>Option Field (Campaign)</p> </td>
   <td><p>byte with associated values</p> </td>
   <td><p>Gender</p> </td>
  </tr>
  <tr>
   <td><p>Text Field (Campaign)</p> </td>
   <td><p>string</p> </td>
   <td><p>Email</p> </td>
  </tr>
 </tbody>
</table>

### Settings Common to Most Components {#settings-common-to-most-components}

The Adobe Campaign components have settings that are common in all of the components (except Encrypted Primary Key and Hidden Reconcilation Key components).

In most components, you can configure the following:

#### Title and Text {#title-and-text}

* **Title**
  If you want to use a name other than the element name, enter it here.

* **Hide Title**
  Select this check box if you do not want the title visble.

* **Description**
  Add a description to the field to provide more information for users.

* **Only show value**
  Only shows the value, if there is one

#### Adobe Campaign {#adobe-campaign}

You can configure the following:

* **Mapping**
  Select an Adobe Campaign personalization field, if appropriate.

* **Reconciliation Key**
  Select this check box if this field is part of the reconciliation key.

#### Constraints {#constraints}

* **Required** - Select this check box to make this component required; that is, users must enter a value.
* **Required Message** - Optionally, add a message stating that the field is required.

#### Styling {#styling}

* **CSS**
  Enter the CSS classes you want to use for this component.

### Checkbox (Campaign) {#checkbox-campaign}

The Checkbox (Campaign) component lets the user modify Adobe Campaign profile fields that are of boolean data type. For example, you could have a Checkbox (Campaign) component that lets the recipient specify that he or she does not want to be contacted via any channel.

You can [configure settings common to most Adobe Campaign components](#settings-common-to-most-components) in the Checkbox (Campaign) component.

The following example shows a Checkbox (Campaign) component being displayed.

![chlimage_1-91](assets/chlimage_1-91.png)

### Date Field (Campaign) and Date Field/HTML 5 (Campaign) {#date-field-campaign-and-date-field-html-campaign}

Use the date field to allow recipients to a date; for example you may want the recipients to specify their birth dates. The date format matches the format used in your Adobe Campaign instance.

In addition to [settings common to most Adobe Campaign components](#settings-common-to-most-components), you can configure the following:

* **Constraints - Constraint** - You can select - **None** or **Date** to add the constraint of a date or no constraint. If you select date, the answer users enter into the field must be in a date format.

* **Constraint Message** - In addition, you can add a constraint message so users know how to properly format their answers.
* **Styling - Width** - Adjust the width of the field by clicking or tapping the **+** and **-** icons or entering a number.

The following example shows a Date Field (Campaign) component with the width adjusted being displayed.

![chlimage_1-92](assets/chlimage_1-92.png)

### Encrypted Primary Key (Campaign) {#encrypted-primary-key-campaign}

This component defines the name of the URL parameter that will contain the identifier of an Adobe Campaign profile (**Main Resource Identifier** or **Encrypted primary key** in Adobe Campaign Standard and 6.1, respectively).

Each form displaying and modifying Adobe Campaign profile data **must** include an Encrypted Primary Key component.

You can configure the following in the Encrypted Primary Key (Campaign) component:

* **Title and Text - Element Name** - Defaults to encryptedPK. You only need to change the element name when it conflicts with the name of another element on the form. No two form fields can have the same element name.
* **Adobe Campaign - URL parameter** - Add the URL parameter for the EPK. For example, you can use the value **epk**.

The following example shows an Encrypted Primary Key (Campaign) component being displayed.

![chlimage_1-93](assets/chlimage_1-93.png)

### Error Display (Campaign) {#error-display-campaign}

This component lets you display backend errors. The form's error handling needs to be set to Forward to make the component work properly.

The following example shows an Error Display (Campaign) component being displayed.

![chlimage_1-94](assets/chlimage_1-94.png)

### Hidden Reconciliation Key (Campaign) {#hidden-reconciliation-key-campaign}

The Hidden Reconciliation Key (Campaign) component allows you to add hidden fields as part of the reconciliation key to a form.

You can configure the following in the Hidden Reconciliation Key (Campaign) component:

* **Title and Text - Element Name** - Defaults to reconcilKey. You only need to change the element name when it conflicts with the name of another element on the form. No two form fields can have the same element name.
* **Adobe Campaign - Mapping** - Map to an Adobe Campaign personalization field.

The following example shows an Hidden Reconciliation Key (Campaign) component being displayed.

![chlimage_1-95](assets/chlimage_1-95.png)

### Numeric Field (Campaign) {#numeric-field-campaign}

Use the numeric field to allow recipients to enter numbers, for example their age.

In addition to [settings common to most Adobe Campaign components](#settings-common-to-most-components), you can configure the following:

* **Constraints - Constraint** drop-down
  You can select - **None** or **Numeric -** to add the constraint of either a number or no constraint. If you select number, the answer users enter into the field must be numeric.

* **Constraint Message** - In addition, you can add a constraint message so users know how to properly format their answers.
* **Styling - Width** - Adjust the width of the field by clicking or tapping the **+** and **-** icons or entering a number.

The following example shows a Numeric Field (Campaign) component with the width configured being displayed.

![chlimage_1-96](assets/chlimage_1-96.png)

### Option Field (Campaign) {#option-field-campaign}

This drop-down list lets you select an option; for example, the gender or status of a recipient.

You can [configure settings common to most Adobe Campaign components](#settings-common-to-most-components) in the Option Field (Campaign) component. To populate the drop-down list, select the appropriate field in the Adobe Campaign personalization fields by clicking or tapping the Adobe Campaign symbol and navigating to the field.

The following example shows an Option Field (Campaign) component being displayed.

![chlimage_1-97](assets/chlimage_1-97.png)

### Subscriptions Checklist (Campaign) {#subscriptions-checklist-campaign}

Use the **Subscriptions Checklist (Campaign)** component to modify the subscriptions associated with an Adobe Campaign profile.

When added to a form, this component displays all available subscriptions as check boxes and lets the user select the desired subscriptions. When users submit the form, this component subscribes the user to or unsubscribes the user from the selected services depending on the form action type (**Adobe Campaign: Subscribe to Services** or **Adobe Campaign: Unsubscribe from Services**).

>[!NOTE]
>
>The component does not check what services the user is already subscribed to/unsubscribed from.

You can [configure settings common to most Adobe Campaign components](#settings-common-to-most-components) in the Subscriptions Checklist (Campaign) component. (There are no Adobe Campaign configurations available for this component.)

The following example shows a Subscriptions Checklist (Campaign) component being displayed.

![chlimage_1-98](assets/chlimage_1-98.png)

### Text Field (Campaign) {#text-field-campaign}

The Text Field (Campaign) component that lets you enter string type data, such as a first name, last name, address, email address, and so on.

In addition to [settings common to most Adobe Campaign components](#settings-common-to-most-components), you can configure the following:

* **Constraints - Constraint** - drop-down - You can select - **None**, **Email**, **Name** (no umlauts) to add the constraint of either an email address, name, or no constraint. If you select email, the answer users enter into the field must be an email address. If you select name, it must be a name (umlauts are not allowed).

* **Constraint Message** - In addition, you can add a constraint message so users know how to properly format their answers.
* **Styling - Width** - Adjust the width of the field by clicking or tapping the **+** and **-** icons or entering a number.

The following example shows a Text Field (Campaign) component being displayed.

![chlimage_1-99](assets/chlimage_1-99.png)
