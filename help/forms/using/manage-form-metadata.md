---
title: Manage form metadata

description: Metadata allows for easier categorization and organization of assets and helps users who are looking for a specific asset.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager

docset: aem65

role: "Admin,User"
exl-id: f82bbd39-b655-47a9-bca9-21d7cd30c082
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Manage form metadata{#manage-form-metadata}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/manage-metadata/manage-form-metadata.html)                  |
| AEM 6.5     | This article         |

## Overview&nbsp; {#overview-nbsp}

Metadata allows for easier categorization and organization of assets and helps users who are looking for a specific asset.

AEM Forms, by default, provides a defined set of metadata for each asset type. Beyond the default metadata, you can add custom metadata to each of the asset types. AEM Forms also provides you with the right means of creating, managing, and exchanging all this metadata efficiently for your forms.

If you're a developer or a site owner, you can customize Forms Portal, the end-user interface for AEM Forms to reflect the metadata you're using in your organization. For more information abouts Forms Portal, see [Introduction to publishing forms on a portal](../../forms/using/introduction-publishing-forms.md).

## Metadata in AEM Forms {#metadata-in-aem-forms}

In AEM Forms, the list of metadata properties associated with an asset depends on its type. Also, if you add any custom metadata property, it is added across all the assets of the type on which the custom metadata was added.

### Asset types {#asset-types}

The following asset types are supported in AEM Forms:

* Form templates (XFA forms)
* PDF forms
* Document (flat PDFs)
* Adaptive forms
* Resources
* XFS

#### Extensive list of metadata {#extensive-list-of-metadata}

The following is an extensive list of metadata properties supported in AEM Forms:

<table>
 <tbody> 
  <tr> 
   <td><strong>Property name</strong></td> 
   <td><strong>Asset type</strong></td> 
   <td><strong>Description</strong><br /> </td> 
  </tr> 
  <tr> 
   <td>Title</td> 
   <td>All but resource</td> 
   <td>Display name of the form.<br /> </td> 
  </tr> 
  <tr> 
   <td>Description</td> 
   <td>All but resource</td> 
   <td>Description of the form. The user can specify this value.<br /> </td> 
  </tr> 
  <tr> 
   <td>Type</td> 
   <td>All</td> 
   <td><p>A read-only value specifying the type of asset. It can have one of the following values:</p> 
    <ul> 
     <li>Form template</li> 
     <li>PDF form, PDF form (Acroform), or PDF form (Signed)</li> 
     <li>Document, Document (Signed)</li> 
     <li>Adaptive form</li> 
     <li>Resource</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Created</td> 
   <td>All</td> 
   <td>A read-only value specifying the time of asset creation.</td> 
  </tr> 
  <tr> 
   <td>Last modification date</td> 
   <td>All</td> 
   <td>A read-only value specifying the time when the asset was last modified.</td> 
  </tr> 
  <tr> 
   <td>Author</td> 
   <td>All but resource</td> 
   <td><p>A read-only value that is automatically computed based on the form type.</p> 
    <ul> 
     <li>PDF/Form template/Document - fetched from the uploaded binary file.</li> 
     <li>Adaptive form - Logged in user at the time of form creation.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Status</td> 
   <td>All but resource</td> 
   <td><p> A read-only value that defines one of the following states of a form:</p> 
    <ul> 
     <li>No value: If a form has never been published.</li> 
     <li>Published: When a form is published.</li> 
     <li>Modified: When a form was modified after having been published once.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Last publish date</td> 
   <td>All but resource</td> 
   <td>A read-only value specifying the time when form was last published.</td> 
  </tr> 
  <tr> 
   <td>Publish on/off time</td> 
   <td>All but resource</td> 
   <td><p>Time at which the form is scheduled to be automatically published/unpublished. The user sets this value on editing metadata.</p> 
    <ul> 
     <li>Both Publish On and Off time should be beyond current date. </li> 
     <li>Publish Off time should be beyond the publish On time. </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Submit URL</td> 
   <td><p>Form template</p> <p>PDF form</p> </td> 
   <td><p>To configure a user-specified URL for submitting form data to a servlet.</p> <p>Submit URL can be configured using any of the following methods, listed in order of precedence:</p> 
    <ul> 
     <li>Specify a submit URL directly in a Form Template by using the HTTP Submit button while creating an XFA form in AEM Forms Designer.</li> 
     <li>In AEM Forms UI, select a form and specify a submit URL on editing the metadata properties.</li> 
     <li>In Forms Portal, edit the Search &amp; Lister component and specify a submit URL under the Form Link tab.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>HTML render profile</td> 
   <td>Form template</td> 
   <td>The HTML render profile used while rendering a Form Template in HTML format.</td> 
  </tr> 
  <tr> 
   <td>Render format</td> 
   <td><p>Form template</p> <p>Adaptive form</p> </td> 
   <td><p>This option allows the user to specify the rendering format of the form when the forms are published:</p> 
    <ul> 
     <li>HTML</li> 
     <li>PDF</li> 
     <li>Both</li> 
    </ul> <p>This option is used for restricting the rendering format of the forms only on forms portal where they are visible to the end user.</p> </td> 
  </tr> 
  <tr> 
   <td>Tags</td> 
   <td>All but resource</td> 
   <td>Labels associated to the form to facilitate quick and easy search.</td> 
  </tr> 
  <tr> 
   <td>References</td> 
   <td><p>Adaptive form</p> <p>Form template</p> <p>Resource</p> </td> 
   <td><p>List of assets (other forms or resources) that this form is related to. These assets can fall in following two categories:</p> 
    <ul> 
     <li>Refers: Assets that the current form refers to.</li> 
     <li>Referred by: Assets that refer to the current asset.</li> 
    </ul> <p>These assets are displayed as links and their metadata can be accessed directly by clicking them.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td>Form model (XDP/XSD) selection</td> 
   <td>Adaptive form</td> 
   <td><p>Specifies which form model is used while authoring the adaptive form. This property can have following values:</p> 
    <ul> 
     <li>Form template: A form template is selected from the ones existing in the repository. This value can be updated.</li> 
     <li>XML schema: An XSD file is uploaded. This value can be updated.</li> 
     <li>None</li> 
    </ul> 
    <div>
      A form model once selected can be updated but not removed. 
    </div> </td> 
  </tr> 
 </tbody> 
</table>

## View form metadata {#view-form-metadata}

Assets have existing property values, which can be viewed in read-only mode. This metadata is originated at the time of form upload or form creation.

1. Navigate to the location of the asset for which you want to view metadata.  

1. Open the properties page using one of the following ways:

    1. Click the View Properties ![e_reviewmode_properties_n](assets/e_reviewmode_properties_n.png) icon from Quick Actions.

       >[!NOTE]
       >
       >Quick Actions are the action items that get displayed over a thumbnail on mouse hover.

    1. Select the form and click the View Properties ![e_reviewmode_properties_n](assets/e_reviewmode_properties_n.png) icon that appears in the toolbar.
    1. Navigate to the form details page by clicking the form thumbnail when not in the selection mode. Now, click the ![aem6forms_eye_viewon](assets/aem6forms_eye_viewon.png) eye icon on the upper right, and then click Properties in the list beneath it.

1. The property page that opens displays a schema containing only those metadata properties that hold some value.

   The properties page has a toolbar containing two action icons:

    * Edit: ![aem6forms_edit](assets/aem6forms_edit.png) Edit the metadata property values
    * View: ![aem6forms_eye_viewon](assets/aem6forms_eye_viewon.png) Navigate to the form details page, which opens the form in the preview mode.

   The content portion is divided in two parts:

    * Left panel contains thumbnail of the form
    * Right panel contains metadata properties in the read-only mode, distributed across various tabs.

## Add/update form metadata values {#add-update-form-metadata-values}

You can edit the value of existing metadata properties or add new values to an existing metadata property field (for example, when a metadata field is blank).

### Update metadata property values {#update-metadata-property-values}

1. Follow the steps mentioned in the previous section to open the properties page where existing metadata of the selected form can be viewed.  

1. From the toolbar, click the edit icon ![aem6forms_edit](assets/aem6forms_edit.png) to change the mode of the page from read-only to read/write.  

1. The properties page that opens holds a schema that contains a mix of editable input fields and static text.  

1. The properties displayed in static text are the ones that you cannot edit.  

1. You can navigate to other tabs to find input fields for metadata properties placed under them.

   This page has a toolbar containing two action icons different from those in view mode:

    * Cancel: ![aem6forms_close](assets/aem6forms_close.svg_w24.png) Cancel any changes made to metadata property values so far
    * Done: ![aem6forms_check](assets/aem6forms_check.png) Save all the changes made to metadata property values so far

   Both these actions direct the user back to read-only mode of the properties page containing the updated values.

### Update the form thumbnail {#update-the-form-thumbnail}

The left panel in the properties page displays the thumbnail of the form. By default, the thumbnail displayed is the one generated at the time of form creation (adaptive form) or at the time of form upload.

For all form types, you have the option to upload an image by clicking **[!UICONTROL Upload Image]** and browsing for an image file from the local directory. The selected image is used as a thumbnail instead of the default one.

For adaptive forms, additional functionality is provided, which allows the user to generate a thumbnail as a snapshot of the current adaptive form preview. Since AEM Forms also supports authoring of adaptive forms, the preview of the adaptive form may change every time you change the adaptive form. This functionality to generate a thumbnail helps you obtain a fresh thumbnail for the adaptive form based on the current preview status. Click **[!UICONTROL Generate Preview]** to carry out this action.

>[!NOTE]
>
>* Use a square image for the thumbnail. When you use a non-square image and view the thumbnail in list view, the thumbnail appears clipped.   
>* Once a new image is uploaded or generated, the thumbnail is replaced by this image and cannot be reset to the previous image. 
>

## Add custom metadata {#add-custom-metadata}

Apart from the metadata provided out of the box, AEM Forms supports new custom metadata.

A tool (Metadata Schema Editor) is provided to define the schema for the metadata layout; that is, the layout of what appears in the **[!UICONTROL Properties]** page of a form. The Metadata Schema Editor lets you add or modify a custom schema for your assets.

AEM Forms exposes the metadata schemas of the supported forms types in this tool. This way, you can access these schemas and use the functionality provided in metadata schema editor to add custom properties.

### Navigate the metadata schema editor {#navigate-the-metadata-schema-editor}

1. Navigate to **[!UICONTROL Tools > Assets > Metadata Schemas]**. 

1. Click **[!UICONTROL forms]** from the listed schema forms.  

1. From the list that opens, click the asset type for which you want to add custom metadata.

   >[!NOTE]
   >
   >These schemas contain metadata properties that are provided out of box and must not be altered/edited (selecting check box and clicking edit from toolbar) to avoid functional issues.

1. Any asset type clicked opens a list containing the `extendedmetadata` option. Edit this schema.  

1. Select the checkbox beside `extendedmetadata` and then click the edit ![aem6forms_edit](assets/aem6forms_edit.png) icon that appears in the toolbar.  

1. AEM Forms opens the metadata schema editor/form builder of the selected asset type (in this case adaptive form).

   ![Metadata schema editor for Adaptive Form type](assets/metadata-schema-editor-for-adaptive-form-type.png)

   Metadata editor

    1. The left panel contains tabbed sections where the fields are placed and the right panel displays all the available UI components and the properties of the field selected from the left panel.  

    1. The locked section is not editable and contains fields for all the metadata properties that are provided out of the box.  

    1. You can add additional tabs by clicking the + symbol.  

    1. You can add a custom field of desired type by dragging the field component from the **[!UICONTROL Build Form]** section on to the schema page.
    1. The specifications for this field can be provided under the **[!UICONTROL Settings]** section after clicking the field.

### Add custom metadata property in schema editor {#add-custom-metadata-property-in-schema-editor}

1. Navigate to the tab (existing or new) where you want to add the custom property.  

1. Drag a component of desired type from the **[!UICONTROL Build Form]** section to left panel and place at a convenient location.

   >[!NOTE]
   >
   >You cannot move the locked sections, but you can place your component in any of the empty spaces.

1. Click a component that you just dragged. In the Settings tab that opens in the right panel, fill in information for the following fields:

    1. Specify a Field Label which is used as a display name above the field placed in schema (For example: Department)
    1. Under Map to property field, you can see a prefilled value **'./jcr:content/metadata/default'**. Change the ‘**default**’ to a desired property name, which is used to store the property in crx repository (For example: './jcr:content/metadata/department')

       >[!NOTE]
       >
       >Do not change the prefix ‘./jcr:content/metadata/’ as it defines the path where the property is stored.
       >
       >Also, the property name must be unique to avoid writing values for two or more properties at the same location in repository. So, it is recommended that you change the value 'default'.

    1. Fill other settings based on requirement. For example: select the Required option if you want to make the field mandatory.
    1. To delete a field you added, select the field and then click the delete ![delete-1](assets/delete-1.png) icon.

1. If necessary, follow steps 1-3 to add another property.
1. Click **Done** after making all the changes.

   You have successfully added a custom metadata property.

All the adaptive forms in AEM Forms now contain this additional metadata property. You can edit it from the properties page.
