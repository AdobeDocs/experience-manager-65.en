---
title: Correspondence Management Configuration Properties
description: This topic explains how you can modify Asset Composer with solution-specific configurations. This topic details the properties you can edit, with their description, default values, and acceptable values.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management
feature: Correspondence Management
exl-id: c9c007d0-c545-4738-b11b-4c50986342ee
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Correspondence Management Configuration Properties {#correspondence-management-configuration-properties}

To configure these properties, open the following URL in a browser: `https://<server>:<port>/<contextPath>/system/console/configMgr` and select **Correspondence Management Configurations**.

Correspondence Management has the following configuration properties:

<table>
 <tbody>
  <tr>
   <th><p><strong>Property</strong></p> </th>
   <th><p><strong>Description</strong></p> </th>
   <th><p><strong>Default</strong></p> </th>
   <th><p><strong>Acceptable values</strong></p> </th>
  </tr>
  <tr>
   <td><p>Indentation</p> </td>
   <td>Indentation on modules<p> </p> </td>
   <td><p>12.7mm</p> </td>
   <td><p>Any number</p> </td>
  </tr>
  <tr>
   <td>Number Minimum Width</td>
   <td>Minimum width to be applied on the bullet/number field, when using numbered Lists apart from Roman numbers</td>
   <td>8.0mm</td>
   <td>Any number</td>
  </tr>
  <tr>
   <td><p>Roman Numbers Minimum Width</p> </td>
   <td><p>Minimum width to be applied on the bullet/number field, when using Roman numbers</p> </td>
   <td><p>12.7mm</p> </td>
   <td><p>Any number</p> </td>
  </tr>
  <tr>
   <td>Rendition Type</td>
   <td>The type of rendition the Create Correspondence application uses to render the letter preview. </td>
   <td>HTML Rendition</td>
   <td>HTML Rendition / PDF Rendition</td>
  </tr>
  <tr>
   <td><p>Enable CCR PDF highlight</p> </td>
   <td><p>Enables highlighting on PDF in Create Correspondence application</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Target Highlight Type</p> </td>
   <td><p>Target Highlight Type in the Create Correspondence application</p> </td>
   <td><p>border</p> </td>
   <td><p>border / fill / none</p> </td>
  </tr>
  <tr>
   <td><p>Target Highlight Color</p> </td>
   <td><p>Target Highlight Color in the Create Correspondence application</p> </td>
   <td><p>90;155;245</p> </td>
   <td><p>Any RGB color in format R;G;B</p> </td>
  </tr>
  <tr>
   <td><p>Content Highlight Type</p> </td>
   <td><p>Content Highlight Type in the Create Correspondence application</p> </td>
   <td><p>Fill</p> </td>
   <td><p>border / fill / none</p> </td>
  </tr>
  <tr>
   <td><p>Content Highlight Color</p> </td>
   <td><p>Content Highlight Color in the Create Correspondence application</p> </td>
   <td><p>210;225;245</p> </td>
   <td><p>Any RGB color in format R;G;B</p> </td>
  </tr>
  <tr>
   <td><p>Field Highlight Type</p> </td>
   <td><p>Field Highlight Type in the Create Correspondence application</p> </td>
   <td><p>fill</p> </td>
   <td><p>border / fill / none</p> </td>
  </tr>
  <tr>
   <td><p>Field Highlight Color</p> </td>
   <td><p>Field Highlight Color in the Create Correspondence application</p> </td>
   <td><p>210;225;245</p> </td>
   <td><p>Any RGB color in format R;G;B</p> </td>
  </tr>
  <tr>
   <td><p>Application Time Out</p> </td>
   <td><p>Application Time Out in seconds</p> </td>
   <td><p>1200</p> </td>
   <td><p>Any number</p> </td>
  </tr>
  <tr>
   <td><p>PDF document parameter name</p> </td>
   <td><p>Parameter name for PDF document in post process</p> </td>
   <td><p>inPDFDoc</p> </td>
   <td><p>Any string variable name</p> </td>
  </tr>
  <tr>
   <td><p>XML data parameter name</p> </td>
   <td><p>Parameter name for XML document (data) in post process</p> </td>
   <td><p>inXMLDoc</p> </td>
   <td><p>Any string variable name</p> </td>
  </tr>
  <tr>
   <td><p>XDP document parameter name</p> </td>
   <td><p>Parameter name for XDP document sent to the post process</p> </td>
   <td><p>inXDPDoc</p> </td>
   <td><p>Any string variable name</p> </td>
  </tr>
  <tr>
   <td><p>Redirect URL parameter name</p> </td>
   <td><p>Parameter name for the redirect URL sent from the post process This value can be any string variable name</p> </td>
   <td><p>redirectURL</p> </td>
   <td><p>Any string variable name</p> </td>
  </tr>
  <tr>
   <td><p>PDF Submit Type</p> </td>
   <td><p>PDF Submit Type (type of PDF generated on submitting from the Create Correspondence application)</p> </td>
   <td><p>nonInteractive</p> </td>
   <td><p>interactive / non-interactive</p> </td>
  </tr>
  <tr>
   <td><p>Optimize Data Dictionary Instance</p> </td>
   <td><p>Enables optimized transfer of Data Dictionary Instance b/w server and client</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Auto Correct Inconsistencies </p> </td>
   <td><p>When enabled, it automatically handles the possible inconsistencies in Letter Assignments</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Use Configured Data Formats</p> </td>
   <td><p>Controls whether to Use Configured Data Edit Formats and Data Display Format</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Data Display Formats</p> </td>
   <td><p>Specifies locale specific display format for data</p> </td>
   <td><p>locale=en_US; dateFormat=dd-MM-yyyy; numberDecimalSeparator=.; numberGroupSeparator=,; numberUseGroupSeparator=truelocale=de_DE; dateFormat=dd-MM-yyyy; numberDecimalSeparator=,; numberGroupSeparator=.; numberUseGroupSeparator=truelocale=fr_FR; dateFormat=dd-MM-yyyy; numberDecimalSeparator=,; numberGroupSeparator= ; numberUseGroupSeparator=truelocale=ja_JP; dateFormat=dd-MM-yyyy; numberDecimalSeparator=.; numberGroupSeparator=,; numberUseGroupSeparator=true</p> </td>
   <td><p>--</p> </td>
  </tr>
  <tr>
   <td><p>Data Edit Format</p> </td>
   <td><p>Edit format for data. This is used when writing data as String or parsing data from String</p> </td>
   <td><p>locale=en_US; dateFormat=dd-MM-yyyy; numberDecimalSeparator=.; numberGroupSeparator=,; numberUseGroupSeparator=true</p> </td>
   <td>--<p> </p> </td>
  </tr>
  <tr>
   <td><p>Manage Letter Instances on Publish</p> </td>
   <td><p>Enable/Disable the Manage Letter functionality (applicable only for Publish Server)</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Audit</p> </td>
   <td><p>Enable/Disable audit functionality. When false, audit logs for all actions will be disabled</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Read Audit</p> </td>
   <td><p>Enable/Disable audit functionality for asset reads</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Create Audit</p> </td>
   <td><p>Enable/Disable audit functionality for asset create</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Update Audit</p> </td>
   <td><p>Enable/Disable audit functionality for asset update</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Revert Audit</p> </td>
   <td><p>Enable/Disable audit functionality for asset revert</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Publish Audit</p> </td>
   <td><p>Enable/Disable audit functionality for asset publish</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable SaveAsDraft Audit</p> </td>
   <td><p>Enable/Disable audit functionality for saving letter drafts</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Submit Audit</p> </td>
   <td><p>Enable/Disable audit functionality for letter submit</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Email Audit</p> </td>
   <td><p>Enable/Disable audit functionality for emailing letters</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Print Audit</p> </td>
   <td><p>Enable/Disable audit functionality for printing letters</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Enable Custom Delivery Audit</p> </td>
   <td><p>Enable/Disable audit functionality for custom delivery of letters</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Attachment documents parameter name</p> </td>
   <td><p>Parameter name for Attachment documents sent to the post process</p> </td>
   <td><p>inAttachmentDocs</p> </td>
   <td><p>Any string variable name</p> </td>
  </tr>
  <tr>
   <td><p>CM User Root</p> </td>
   <td><p>URL of the folder containing all Correspondence Management user assets</p> </td>
   <td><p>--</p> </td>
   <td><p>Valid folder location</p> </td>
  </tr>
  <tr>
   <td><p>Letter Cache Size</p> </td>
   <td><p>Specify the Maximum number of letters to be kept in cache.</p> <p>Changing this value will result in clean-up of <code>in-memory</code> cache.</p> </td>
   <td><p>100</p> </td>
   <td><p>Any numeric value</p> </td>
  </tr>
  <tr>
   <td><p>Enable Letter Cache</p> </td>
   <td><p>Enable/Disable the letter cache.</p> <p>Changing this value will result in clean-up of <code>in-memory </code> cache.</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Data Elements Ordering</p> </td>
   <td><p>Keeps data elements ordering in create correspondence interface as per their sequence in Letter</p> </td>
   <td><p>true</p> </td>
   <td><p>true / false</p> </td>
  </tr>
  <tr>
   <td><p>Support Reload</p> </td>
   <td><p>Enable/Disable reload support in letters rendered on server-side.</p> <p>Disabling this will improve letter render performance.</p> </td>
   <td><p>false</p> </td>
   <td><p>true / false</p> <p> </p> </td>
  </tr>
  <tr>
   <td>Temp Folder</td>
   <td>Location of the temp folder.</td>
   <td>acm.tpmFolder</td>
   <td> </td>
  </tr>
  <tr>
   <td>Remote Save</td>
   <td>Saves the Letter Instances on the specified processing author.</td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Compatibility Options</td>
   <td>Compatibility options of the format configname:configvalue separated by comma.</td>
   <td>acm.compatibilityOptions</td>
   <td> </td>
  </tr>
  <tr>
   <td><p>Debug Directory </p> <p> </p> </td>
   <td>File system folder location for debugging. If the directory does not <code>exists</code>, no debug dumps will be generated.</td>
   <td>acm.debugDirectory</td>
   <td> </td>
  </tr>
 </tbody>
</table>
