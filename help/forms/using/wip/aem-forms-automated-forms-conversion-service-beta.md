---
title: AEM Forms Automated Forms Conversion service prerelease notes
seo-title: AEM Forms Automated Forms Conversion service prerelease notes
description: null
seo-description: null
uuid: 746249b0-8198-42b7-9654-f2d6b7e1acc7
contentOwner: vishgupt
discoiquuid: 78ad3714-e0de-4c12-aea2-6f0ec5a83002
---

# AEM Forms Automated Forms Conversion service prerelease notes {#aem-forms-automated-forms-conversion-service-prerelease-notes}

Welcome to the AEM Automated Forms Conversion prerelease program. Read on for resources and instructions to get started and make the best of the prerelease program.

Automated Forms Conversion service by AEM Forms helps accelerate digitization and modernization of data capture experience through automated conversion of legacy print forms to adaptive forms. The service, powered by Adobe Sensei, automatically converts your PDF forms to device-friendly and responsive adaptive forms. While leveraging the existing investments in PDF Forms, the service can automatically apply appropriate validations to adaptive form fields during conversion.

## What's new and improved {#what-s-new-and-improved}

**What's new and improved in February 2019 build:**

* Added support to convert an XFA-based form to an adaptive form. For example, XFA-based PDF forms or XDP forms. Consider below before initiating the conversion:

    * XDP files with spaces in filename are not supported. Remove space from the XDP file name before using the file for Document of Record.
    * Extracting fragments from an XFA-based form is not supported.
    * XFA scripts are not supported. For example, scripts for automatically generating values for a drop-down component. 
    * When an XFA form is submitted, submit data of the form can be saved as an XML element or an attribute. For example, &lt;id order-number="13445"&gt;. All such attributes are treated as elements in a converted adaptive form.

* Added support to Review and Correct editor to detect and edit tables.

>[!NOTE]
>
>You can experience all of the above improvements and additions the service, except support for Adobe Analytics, without installing latest software builds on your local machine.

**What's new and improved in Jan 19, 2019 build:**

* Added support for dynamic XFA.
* Added support to enable Adobe Analytics during conversion. 
* Added support to identify and convert [hidden fields for XFA](assets/hidden-fields.gif).
* Improved identification of tables, Acro Forms fields, and choice group fields.

**What's new and improved in Jan 04, 2019 build:**

* Improvements in Review and Correct editor:

    * Added support to move components of a form within the content browser (tree view) of the form. When a component is moved, the JSON data is also moved and updated in the data XML accordingly.
    * Added ability to provide name and title for each page of the adaptive form.
    * Added the ability to provide multiline text for field components of type text. The **Allow Multiline** option is added to properties browser to enable the functionality.
    * Review and Correct editor was slowing down while working on large forms. Now the editor works smoothly with large forms.

* Improved performance of service and detection accuracy for choice fields and choice groups.
* Improved strings of configuration dialog UI.

## What's supported in the current prerelease build {#what-s-supported-in-the-current-prerelease-build}

The current prerelease build of Automated Forms Conversion service **supports non-interactive PDF forms** for conversion to adaptive forms. The service also offers limited support for XFA-based PDF forms and Acroforms.

## Download the latest prerelease software builds {#download-the-latest-prerelease-software-builds}

Download the following software packages for the prerelease program to set up Automated Forms Conversion service.

| Software |Build location |
|---|---|
| AEM 6.5 Quickstart | [cq-quickstart-6.5.0-load18](https://artifactory.corp.adobe.com/artifactory/maven-aem-dev/com/day/cq/cq-quickstart/6.5.0-load19/) |
| AEM 6.5 Forms add-on package  | 
Windows: [AEMFD-Win-6.0.52](https://artifactory.corp.adobe.com/artifactory/maven-aemforms-release-local/com/adobe/aemds/adobe-aemfd-win-pkg/6.0.52/)  
Linux: [AEMFD-linux-6.0.52](https://artifactory.corp.adobe.com/artifactory/maven-aemforms-release-local/com/adobe/aemds/adobe-aemfd-linux-pkg/6.0.52/)   |
| AEM Forms Automated Forms Conversion service package | [Flamingo-connector-1.0.18](https://artifactory.corp.adobe.com/artifactory/maven-aemforms-release-local/com/flamingo/flamingo-connector-content/1.0.18/flamingo-connector-content-1.0.18.zip) |

## Documentation resources {#documentation-resources}

See the following documentation resources for detailed information about using AEM Forms Automated Forms Conversion service.

| Document |Coverage |
|---|---|
| [Automated Forms Conversion service](/help/forms/using/wip/introduction-to-automated-form-conversion-service.md) | 
Introduction to the Automated Forms Conversion service and conversion workflow   |
| [Best practices and considerations](/help/forms/using/wip/styles-and-pattern--considerations-and-best-practices-.md) |Patterns and styles of form fields to consider before starting the conversion |
| [Configure the Automated Forms Conversion service](/help/forms/using/wip/configure-the-automated-forms-conversion-service.md) |Prerequisites and steps to install and configure the Automated Forms Conversion service |
| [Use Automated Forms Conversion service](/help/forms/using/wip/convert-existing-forms-to-adaptive-forms.md) |Steps to run the Automated Forms Conversion service  |
| [Review and correct converted adaptive forms](/help/forms/using/wip/review-correct-ui-edited.md) |Use Review and Correct editor to review and make corrections to converted adaptive forms  |
| [Frequently asked questions](/help/forms/using/wip/automated-forms-conversion-service-frequently-asked-questions.md) |List of frequently asked questions |

## Known issues and workarounds {#known-issues-and-workarounds}

Before you begin using AEM Forms Automated Forms Conversion service, review the following known issues and available workarounds.

* [Source folder](/help/forms/using/wip/convert-existing-forms-to-adaptive-forms.md#upload-pdf-forms-to-your-aem-forms-server) should not have more than 15 forms and 50 pages in total. The size of the source folder should not exceed 10 MB. Do not create sub-folders in the source folder. 
* PDF Forms with the dynamic layout, dotted outline, and filled or colored fields are not supported.
* Images and text inside the images are not identified. Manually add images to converted forms.  
* Only simple tables, with empty fields, proper headers, and clear boundaries are supported. Complex tables like borderless tables, nested tables, table with colored rows, and tables with placeholder values are not supported. Use [adaptive form editor](https://chl-author-preview.corp.adobe.com/content/help/en/experience-manager/6-4/forms/using/wip/review-correct-ui-edited.html#main-pars_header_1182718738) to add or modify complex tables, after the conversion.

<!--fix above link-->

* Review and Correct editor does not support form fragments and tables. Use [adaptive form editor](https://chl-author-preview.corp.adobe.com/content/help/en/experience-manager/6-4/forms/using/wip/review-correct-ui-edited.html#main-pars_header_1182718738) to fix conversions that had the **Extract Fragment** or **Existing Fragments** option enabled during conversions and fix table-related issues.  

* Review and Correct editor does not have undo action. The Save button saves the changes permanently.
* Some form objects are easily visible to the human eye but are [difficult to identify for the service](/help/forms/using/wip/styles-and-pattern--considerations-and-best-practices-.md). Use [Review and correct editor](/help/forms/using/wip/review-correct-ui-edited.md) to identify and convert such form objects.

* When a choice group is deleted and manually recognized/drawn in Review and Correct editor, the text of the choice group are not extracted. Draw the field or text component to extract the text.
* When the source document is a dynamic XFA (.XDP) and it [defines behavior of XFA properties in an adaptive form](/help/forms/using/xfa-api-supported-in-adaptive-form.md#supportedxfaelementsandtheirmappinginadaptiveformsbr), then the following are not supported:

    * XFA-based scripts of source documents are ported to output adaptive forms.
    * Presence property of source document is not honored. For example, a field in source document is marked hidden and a script makes the field visible, then the field remains visible in the output adaptive form.

## Share feedback {#share-feedback}

Your feedback is important as it helps us improve our offerings. To share your experiences and report feedback on the conversion service and related documentation, log a JIRA issue with the details listed in table below.

### Before you start {#before-you-start}

* Add the source PDF form and produced adaptive form to an archive. Create and add these to a collateral zip/archive.
* Take screen-shots or create video recordings of any issue encountered in Review and Correct editor. Add the screen-shot or video to collateral zip/archive.
* Identify and report the visual patterns with proper screenshots or videos. For example, fields with a caption at the bottom are not be extracted in many forms, choice groups with circular widget are not working in many forms, and similar reoccurring issues. Do not report each and every issue related to missed fields.

### Log JIRA issue {#log-jira-issue}

<table> 
 <tbody> 
  <tr> 
   <td>JIRA field</td> 
   <td>Options description</td> 
  </tr> 
  <tr> 
   <td>Project</td> 
   <td> 
    <ul> 
     <li>CQ: Use the CQ<strong> </strong>project to report bug or improvements in the conversion service.</li> 
     <li>CQDOC: Use the CQDOC<strong> </strong>project to report bug or improvements in the documentation.</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Issue Type</td> 
   <td> 
    <ul> 
     <li>Bug: Use the Bug issue type when the behavior is not as expected or documented instructions are incorrect.</li> 
     <li>Improvement: Use the Improvement issue type when a key aspect of the feature is missing and should be provided or documented instructions are insufficient to understand or use the feature. </li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Component<br /> </td> 
   <td>Forms - Sensei</td> 
  </tr> 
  <tr> 
   <td>FixVersion<br /> </td> 
   <td>AFF 1.0.0 L&lt;xx&gt;, where &lt;xx&gt; is the version number of the <a href="https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=lc&amp;title=Automated+Forms+Conversion+Service+Beta+-+Latest+Builds" target="_blank">release</a>. </td> 
  </tr> 
  <tr> 
   <td>Label<br /> </td> 
   <td>Flamingo-BETA</td> 
  </tr> 
  <tr> 
   <td>Description</td> 
   <td>Provide the following information in the description field:<br /> 
    <ul> 
     <li>Problem statement</li> 
     <li>Steps to reproduce the issue<br /> </li> 
     <li>Actual result of the conversion<br /> </li> 
     <li>Expected result of the conversion<br /> </li> 
     <li>Attach collaterals or provide links to download</li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

**Guidelines to use a label other than Flamingo-BETA**

* Prefix Flamingo-BETA to your custom label. For example, Flamingo-BETA-XXXXXX
* Use hyphen (-). Do not add a space between label text.  
* Do not change the Flamingo-BETA section of any label.
* Custom section of the label (XXXXXX) should not exceed 6 letters.   
* Use only capital letters for custom section of the label.

