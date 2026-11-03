---
title: Interactive Communications configuration properties
description: Edit default configuration properties for Interactive Communications
contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-type: reference
topic-tags: interactive-communications
docset: aem65
feature: Interactive Communication
exl-id: 09eeade6-e16d-4159-b26a-803c7201097a
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: aa28c6c8-3ede-445b-a351-eeb0c9f9aec4
    internal-label: Interactive Communication
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Interactive Communications configuration properties{#interactive-communications-configuration-properties}

Interactive Communications includes properties that are configured automatically after installing the [AEM Forms add-on](../../forms/using/installing-configuring-aem-forms-osgi.md) package. Interactive Communication authors can edit these default configuration properties using the **Adobe Experience Manager Web Console Configuration** page.

Open the **Adobe Experience Manager Web Console Configuration** page using the following URL:

`https:/[server]:[port]/<contextPath>/system/console/configMgr`

The configuration properties include:

* [Document Fragments Configuration](#document-fragments-configuration)
* [Create Correspondence Configuration](#create-correspondence-configuration)
* [Adaptive Form and Interactive Communication Web Channel Configuration](#adaptive-form-and-interactive-communication-web-channel-configuration)
* [Adaptive Form and Interactive Communication Web Channel Theme Configuration](#adaptive-form-and-interactive-communication-web-channel-theme-configuration)

## Document Fragments Configuration {#document-fragments-configuration}

Select **Document Fragments configuration** on the **Adobe Experience Manager Web Console Configuration** page to view the configuration properties for document fragments.

<table>
 <tbody> 
  <tr> 
   <td>Property</td> 
   <td>Description</td> 
   <td>Default</td> 
   <td>Acceptable values</td> 
  </tr> 
  <tr> 
   <td>Data Display Formats</td> 
   <td>Locale-specific display format for fields, variables, and form data model elements available while creating an Interactive Communication for Print and Web channels.</td> 
   <td> 
    <ul> 
     <li>locale = en_US, de_DE, fr_FR, and ja_JP</li> 
     <li>dateFormat = dd-MM-yyyy</li> 
     <li>numberDecimalSeparator = .</li> 
     <li>numberGroupSeparator = ,</li> 
     <li>numberUseGroupSeparator = true</li> 
    </ul> </td> 
   <td><p>--</p> </td> 
  </tr> 
  <tr> 
   <td>Indentation</td> 
   <td>The width of single unit of indentation applied to text in list document fragments.</td> 
   <td>12.7mm</td> 
   <td>Number</td> 
  </tr> 
  <tr> 
   <td>Roman Numbers Minimum Width</td> 
   <td>Minimum width to be applied to the bullet or number field, when using roman numbers in list document fragments. </td> 
   <td>12.7mm</td> 
   <td>Number</td> 
  </tr> 
  <tr> 
   <td>Number Minimum Width</td> 
   <td>Minimum width to be applied to the bullet or number field, when using numbered lists apart from roman numbers in list document fragments.</td> 
   <td>8.0mm</td> 
   <td>Number</td> 
  </tr> 
 </tbody> 
</table>

## Create Correspondence Configuration {#create-correspondence-configuration}

Select **Create Correspondence Configuration** on the **Adobe Experience Manager Web Console Configuration** page to view the configuration properties for Agent UI.

<table>
 <tbody> 
  <tr> 
   <td>Property</td> 
   <td>Description</td> 
   <td>Default</td> 
   <td>Acceptable values</td> 
  </tr> 
  <tr> 
   <td>Show Resolved Content for editing</td> 
   <td>Select the checkbox to show resolved content (actual values instead of placeholders) while editing text module on the Agent UI.</td> 
   <td>Not selected</td> 
   <td>Not applicable</td> 
  </tr> 
  <tr> 
   <td>Apply Watermark during preview</td> 
   <td>Select the checkbox to apply watermark to Print channel of Interactive Communication in Preview mode.</td> 
   <td>Not selected</td> 
   <td>Not applicable</td> 
  </tr> 
  <tr> 
   <td>Enable Font Embedding in PDF</td> 
   <td><p>Select the checkbox to enable embedding fonts in the PDF documents. After selecting this option, you can embed new fonts after generating or previewing the PDF documents using Agent UI. Use the Print channel of Interactive Communication to generate and preview PDF documents.</p> <p>Embedding fonts in a PDF document is useful if a font is available on a machine that is used to generate the PDF and is not available on the client machine that accesses the PDF.</p> <p>For more information on embedding fonts, see <a href="../../forms/using/customize-text-editor.md" target="_blank">Customize text editor</a>.</p> </td> 
   <td>Not selected</td> 
   <td>Not applicable</td> 
  </tr> 
 </tbody> 
</table>

## Adaptive Form and Interactive Communication Web Channel Configuration {#adaptive-form-and-interactive-communication-web-channel-configuration}

Select **Adaptive Form and Interactive Communication Web Channel Configuration** on the **Adobe Experience Manager Web Console Configuration** page to view the configuration properties for Adaptive Forms and Interactive Communications Web channel. The following table describes the properties related to Interactive Communications:

| Property |Description |Default |Acceptable values |
|---|---|---|---|
| Show placeholder |Select the checkbox to enable the display of placeholders for fields included in adaptive forms and Interactive Communications. |Selected |Not applicable |
| Maximum cache entries |Set the maximum number of adaptive forms and Interactive Communications that can be retrieved using the cache memory.  |100 |Number |
| Make file name unique |Select the checkbox to have unique names for files included as attachments in Adaptive Forms and Interactive Communications. |Not selected |Not applicable |

## Adaptive Form and Interactive Communication Web Channel Theme Configuration {#adaptive-form-and-interactive-communication-web-channel-theme-configuration}

Select **Adaptive Form and Interactive Communication Web Channel Theme Configuration** on the **Adobe Experience Manager Web Console Configuration** page to view the configuration properties for Adaptive Forms and Interactive Communications Web channel themes.

<table>
 <tbody> 
  <tr> 
   <td>Property</td> 
   <td>Description</td> 
   <td>Default</td> 
   <td>Acceptable values</td> 
  </tr> 
  <tr> 
   <td>Font List Name</td> 
   <td>List of fonts that are available to use while creating Adaptive Forms and Interactive Communications.</td> 
   <td><p>Georgia</p> <p>Book Antiqua</p> <p>Times New Roman</p> <p>Arial</p> <p>Arial Black</p> <p>Impact</p> <p>Palatino Linotype</p> </td> 
   <td>All valid Adobe server fonts</td> 
  </tr> 
 </tbody> 
</table>
