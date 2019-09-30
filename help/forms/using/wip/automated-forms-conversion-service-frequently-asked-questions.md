---
title: "Automated Forms Conversion service: frequently asked questions"
seo-title: "Automated Forms Conversion service: frequently asked questions"
description: null
seo-description: null
page-status-flag: de-activated
uuid: bcde28ae-3be0-41da-8eb3-c936c92bc7ab
discoiquuid: 1c0fb52b-c6a7-4fe3-8493-a028f4803cbc
docset: aem65

---

# Automated Forms Conversion service: frequently asked questions{#automated-forms-conversion-service-frequently-asked-questions}

<details> 
 <summary>Does the service support all formats of PDF forms? What all languages are supported?</summary> 
 <ul> 
  <li>The service can convert non-interactive PDF forms into adaptive forms. It has limited support for AcroForms and XFA-based PDF forms. The service does not support scanned forms.<br /> </li> 
  <li>The service converts only English-languag forms to adaptive forms. You can translate converted adaptive forms to another language using <a href="https://chl-author-preview.corp.adobe.com/content/help/en/experience-manager/6-5/forms/using/using-aem-translation-workflow-to-localize-adaptive-forms.html">AEM translation workflow</a>.</li> 
 </ul> 
 <p>We are regularly adding support for other source types. Keep the <a href="https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/aem-forms-automated-forms-conversion-service-beta.html">What’s supported</a> section on your watchlist for a regular update on newly added features and capabilities.</p> 
</details>

<details> 
 <summary>Can the service produce an XDP instead of an adaptive form? </summary> 
 <p>The service does not produce an XDP output for the time being. We are regularly adding features and to the service. Keep the <a href="https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/aem-forms-automated-forms-conversion-service-beta.html">What’s supported</a> section on your watchlist for a regular update on newly added features and capabilities.</p> 
</details>

<details> 
 <summary>What is the type of generated schema?</summary> 
 <p>The service generates JSON schema.</p> 
</details>

<details> 
 <summary>Can the service convert Microsoft Word forms to adaptive forms? </summary> 
 <p>No, the service does not convert Microsoft Word forms to adaptive forms. You can save a Microsoft Word forms as PDF and convert the PDF to an adaptive form.</p> 
</details>

<details> 
 <summary>Can the service convert scanned paper forms and colored forms to adaptive forms?</summary> 
 <p>The service can convert non-interactive PDF forms to adaptive forms. It has limited support for AcroForms and XFA-based PDF forms. Scanned forms and colored forms are not supported for the time being. We are regularly adding features and to the service. Keep the <a href="https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/aem-forms-automated-forms-conversion-service-beta.html">What’s supported</a> section on your watchlist for a regular update on newly added features and capabilities.</p> 
</details>

<details> 
 <summary>The service has failed to convert forms. What is the reason and how to resolve the issue?</summary> 
 <p>The most common reasons for the service to fail are:</p> 
 <ul> 
  <li>Secured PDF forms are provided for the conversion. Do not use password protected, Document Security protected, or any other protected PDF forms for conversion.</li> 
  <li>Internet connection is interrupted. Ensure that you are connected to the internet during the conversion.</li> 
  <li>Service URL is not provided or provided service URL is incorrect. Specify correct service URL in the cloud configuration.</li> 
 </ul> 
</details>

<details> 
 <summary>Does using custom fonts impact conversion?</summary> 
 <p>When a non-interactive PDF form is converted to an adaptive form, to improve the quality of conversion, the fonts are embedded in the PDF form. The support for embedding fonts is restricted to non-interactive PDF forms. To optimize the conversion of AcroForm and XFA-based PDF forms, fallback fonts are used.</p> 
 <p>Only forms available in the custom fonts directory listed in the <strong><span class="uicontrol">Customer fonts directory</span></strong> field of the <strong><span class="uicontrol">CQ-DAM-Handler-Gibson Font Manager Service</span></strong> configuration are embedded in non-interactive PDF form.</p> 
 <p> </p> 
</details>

<details> 
 <summary>Does the service identify and use fonts of source PDF in output adaptive forms?</summary> 
 <p>Adaptive forms use <a href="../../../forms/using/themes.md">themes to style a form</a>. The service uses the fonts and font styles specified in the theme applied during the conversion. You can change fonts and font styles of the theme to provide a distinct look and feel to the fonts of an adaptive form.</p> 
</details>

<details> 
 <summary>Some form objects are not converted to adaptive form components. How to resolve the issue?</summary> 
 <p>Automated Forms Conversion service is trained on a large set of forms. However, there are some fields and styles in PDF forms which are easily visible to the human eye but difficult to understand for the service. The service can fail to identify such fields. You can use the <a href="https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/review-correct-ui-edited.html" target="_blank">Review and Correct</a> editor to help identify missing or incorrectly identified fields. For example, if a choice group is identified as a panel or a text box is not identified. You can use the Review and Correct editor make improvements and regenerate the adaptive form to get an output closer to the desired experience.</p> 
</details>

<details> 
 <summary>Some corrections are repeated across forms. Can the service identify and fix all such instances in future conversions? </summary> 
 <ul> 
  <li>You can share such patterns with Adobe and opt in to the program where you share your forms with Adobe to improve the accuracy of the service. Once you provide the permission, the service is trained on your forms and patterns. It helps improve the accuracy and fix patterns in future conversions.</li> 
  <li>You can also use meta-model to map the form objects to adaptive form component of your choice and pre-configure validations, rules, data patterns, help text, and accessibility properties for the components. All the specified properties are applied during the conversion. For example, one set of your forms provide combo box to select a hospital and other set provides radio buttons to select a hospital. You can use meta-model to decide, after the conversion, all hospital fields are represented as drop-down list component in the adaptive form.</li> 
 </ul> 
</details>

<details> 
 <summary>What are the options for forms with sensitive data like personally identifiable information (PII) information?</summary> 
 <p>The service supports only blank or unfilled forms. Do not upload filled forms or forms with personally identifiable information (PII) .<br /> </p> 
</details>

<details> 
 <summary>Where should the header and footers be placed?</summary> 
 <p>Place header and footer in adaptive forms template. If your form has header and footer, the service detects and replaces these header and footer during the conversion with header and footer available in adaptive form template. If any extra header or footer is included in the adaptive form, you can use the <a href="https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/review-correct-ui-edited.html">Review and Correct</a> editor to fix or remove such header or footer.</p> 
</details>

<details> 
 <summary>How much time does the service save in comparison to the manual process of planning, creating assets (themes, templates), creating, and publishing an adaptive form? </summary> 
 <p>The amount of time depends on the size, complexity, and various other factors. In general, in comparison to the manual process of planning, creating assets (themes, templates), and creating an adaptive form, the conversion service has forms ready for deployment in a production environment in almost half time. The service saves approximately 50% of your time in comparison to manual process. </p> 
</details>

<details> 
 <summary>How to request a new feature or report an issue?</summary> 
 <p>Contact Adobe Support to request a feature or to report a bug.</p> 
 <p>During the beta phase, Adobe support can log a JIRA issue on with the following details to report an issue:</p> 
 <table>
  <tbody> 
   <tr> 
    <td>JIRA field</td> 
    <td>Options and Description</td> 
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
    <td>AFF 1.0.0 L&amp;lt;xx&amp;gt;, where &amp;lt;xx&amp;gt; is the version number of the <a href="https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=lc&amp;title=Automated+Forms+Conversion+Service+Beta+-+Latest+Builds">release</a>. </td> 
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
</details>

