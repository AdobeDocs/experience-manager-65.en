---
title: Using Scribble Signature in HTML5 forms

description: HTML5 forms are increasingly used on touch devices, and one common requirement is to support signatures. Signing documents on mobile devices is becoming an accepted way of signing forms on mobile devices.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: designer

docset: aem65

feature: Forms Designer
exl-id: 2025182f-195b-40d0-aee7-67669f55b964
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Using Scribble Signature in HTML5 forms{#using-scribble-signature-in-html-forms}

HTML5 forms are increasingly being used on touch devices, and one common requirement is to support signatures. Scribing (Writing with a stylus or finger) is becoming an accepted way of signing forms on mobile devices. HTML5 forms and Forms Designer now enable the option of having a scribble signature field on the form. When the form is rendered in the browser, one can sign on these fields using a stylus, mouse, or touch.

## How to design a form using Scribble Signature field {#how-to-design-a-form-using-scribble-signature-field}

1. Open a form in Forms Designer.
1. Drag and drop the Signature Scribble field on the page.

   ![designer_scribble](assets/designer_scribble.png)

   >[!NOTE]
   >
   >Dimensions of the field selected in Forms Designer are reflected when the field is rendered. However, the dimension of the rendered signature box is calculated based on the aspect ratio of the field, and not on the dimension specified in Forms Designer.

1. Configure the Signature Scribble field.

   The Signature Scribble field, by default, marks geolocation information as mandatory during the signing process on iPad (and is optional for other devices). This default behavior can be overridden by changing the value of the `geoLocMandatoryOnIpad` property. This property is exposed as extras in the Signature Scribble Field. The steps to modify it are:

    1. On the form, select the Signature Scribble field.
    1. Select the **XML Source** tab.

       >[!NOTE]
       >
       >To open the XML Source tab, click **View** &gt; **XML Source**.

    1. Locate the `<ui>` tag in the `<field>` tag and modify the source code to look like the following:

       ```xml
       <extras name="x-scribble-add-on">
       <boolean name="geoLocMandatoryOnIpad">0</boolean>
       </extras>
       ```

    1. Select the **Design View** tab. On the confirmation box, click **Yes**.
    1. Save the form.

1. Render the form on a supported device/desktop browser.

## Interfacing with the Scribble Signatures {#interfacing-with-the-scribble-signatures}

### Signing {#signing}

Once a Signature Scribble field has been added to the form and rendered, clicking or tapping on the field opens a dialog box. The user can scribble a signature in the draw area designated by a dotted rectangle, using a mouse, finger or stylus.

![geolocation](assets/geolocation.png)

**A.** Brush **B.** Eraser **C.** Geolocation **D.** Geolocation information

### Geo-tagging {#geo-tagging}

Clicking the geolocation icon while creating the scribble causes geographic location and time information to be embedded into the field.

>[!NOTE]
>
>On the iPad, by default, embedding geolocation information is mandatory.

On the iPad, the geolocation icon is not shown by default, and the geolocation information is automatically embedded, when you click **OK**.

For iPads, this setting can be altered by modifying the value of `geoLocManadatoryOnIpad` parameter to `0`, in the init parameters of the field.

* When geolocation information is mandatory, the user is presented with a reduced draw area. Geolocation text is added when the user clicks **OK** icon on the remaining area.
* In other cases, the user is presented with a full drawable area. If the user chooses to embed geolocation information, this area is resized to accommodate geolocation text.

### Clearing a signature {#clearing-a-signature}

While using this feature, a user can click the **Eraser** icon to clear the field, and start over. If geolocation information was added it is cleared, too.

### Saving a signature {#saving-a-signature}

Clicking the **OK** icon saves the scribble as an image in the field. The image and values can be submitted to server for further processing. Once a user has clicked **OK**, the scribble filed is locked. The signature cannot be edited again using the scribble widget.

Tapping or clicking the Scribble field opens the dialog box in read-only mode.

![3](assets/3.png)

### Selecting Pen size {#selecting-pen-size}

Click the **Brushes** icon to display a list of available pen sizes. Click a pen size to use the corresponding pen.

### Delete Signatures from the form {#delete-signatures-from-the-form}

To delete the signatures from the form:

* (Mobile devices) Long press the signature field, and on the confirmation dialog, select **Yes**.
* (Desktop) Hover over the signature field, click the **Cancel** icon, and on the confirmation dialog, click **Yes**.
