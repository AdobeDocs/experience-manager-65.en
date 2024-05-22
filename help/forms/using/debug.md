---
title: Debugging HTML5 forms
description: The document list steps to troubleshoot various known issues.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 5260d981-da40-40ab-834e-88e091840813
feature: HTML5 Forms
exl-id: 7330c03f-7102-43c0-aac6-825cce8a113d
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Debugging HTML5 forms {#debugging-html-forms}

This document includes several troubleshooting scenarios. For each scenario, some steps are provided to troubleshoot the problem. Follow these steps and, if the problem persists, configure the Logger to get and review logs for errors/warnings. For more details about HTML5 forms logging, see [Generating Logs for HTML5 forms](/help/forms/using/enable-logs.md).

## Problem: When rendering the form, I see org.apache.sling.api.SlingException exception page {#problem-when-rendering-the-form-i-see-org-apache-sling-api-slingexception-exception-page}

In the exception details, search for word **caused by**.

The probable reason is that one or more parameters in the URL are incorrect.

Check the following parameters:

<table>
 <tbody>
  <tr>
   <td><strong>Parameter</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>template</td>
   <td>The filename of the template</td>
  </tr>
  <tr>
   <td>contentRoot</td>
   <td>The path where template and associated resources reside</td>
  </tr>
  <tr>
   <td>dataRef</td>
   <td>Absolute path of the data file that is merged with the template.<br /> Note: Path defines the absolute path of the data file.</td>
  </tr>
  <tr>
   <td>data</td>
   <td>UTF-8 encoded data bytes that are merged with the template.</td>
  </tr>
 </tbody>
</table>

## Problem: Unable to render a form (an error message is displayed) {#problem-unable-to-render-form}

1. Ensure that the specified parameters are correct. For detailed information on parameters, see [Render Parameters](#problem-when-rendering-the-form-i-see-org-apache-sling-api-slingexception-exception-page).
1. Log in to CRX Package Manager(at https://&lt;server&gt;:&lt;port&gt;/crx/packmgr/index.jsp) and check whether the following packages are correctly installed:

    * adobe-lc-forms-content-pkg-&lt;version&gt;.zip
    * adobe-lc-forms-runtime-pkg-&lt;version&gt;.zip

1. Log in to CQ Web Console (Felix Console) at https://&lt;server&gt;:&lt;port&gt;/system/console/bundles.

   Ensure that the status of the following bundles is "active":

    * scala-lang.bundle [osgi]

    (com.adobe.livecyclescala-lang.bundle)

    * Adobe XFA Forms Renderer

    (com.adobe.livecycle.adobe-lc-forms-core)

    * Adobe XFA Forms LC Connector

    (com.adobe.livecycle.adobe-lc-forms-lc-connector)

## Problem: Form renders without styles {#problem-form-renders-without-styles}

1. In your browser, open **Developer Tools**. Ensure that profile.css is available.
1. If the profile.css file is not available, login to CRX DE at https://&lt;server&gt;:&lt;port&gt;/crx/de.
1. In the folder hierarchy on the left, navigate to /etc/clientlibs/fd/xfaforms/. Open css.txt files listed in the folders.

    * profile
    * runtime
    * scrollnav
    * toolbar
    * xfalib

1. Verify that the files mentioned inside the css.txt are present in CRX DE lite at /libs/fd/xfaforms/clientlibs/xfalib/css.

   ```css
   #base=css
   application.css
   dialog.css
   datepicker.css
   scribble.css
   listboxwidget.css
   ```

1. If the mentioned files are not available, install the adobe-lc-forms-runtime-pkg-&lt;version&gt;.zip package again.

### Problem: Unexpected error encountered {#problem-unexpected-error-encountered}

1. In the form URL, add a query parameter debugClientLibs and set its value to true (For example: https://&lt;server&gt;:&lt;port&gt;/content/xfaforms/profiles/test.html?contentRoot=&lt;some path&gt;&template=&lt;name of xdp file&gt;&log=1-a9-b9-c9&debugClientLibs=true)
1. In the desktop browser like chrome, go to Developer Tools > Console.
1. Open the logs to identify the type of error. For detailed information on logs, see [logs for HTML5 forms](/help/forms/using/enable-logs.md).
1. Go to Developer Tools > Console. Use stack trace to locate the code which is causing the error. Debug the error to resolve the issue.

   >[!NOTE]
   >
   >If it is scripting failure, check if the same problem occurs during the PDF rendition of the form as well. If yes, then there is a problem in the form scripting logic.

## Problem: Unable to submit the form {#problem-unable-to-submit-the-form}

1. Ensure that you have rights to access the AEM server and you are connected to the server.
1. Check that the parameter submitUrl is correct.
1. Enable the client side logs as mentioned at [Logs for the HTML5 forms](/help/forms/using/enable-logs.md) using debug option as **1-a5-b5-c5**. Then render the form and click submit. Open browser debug console and check if there is an error.
1. Locate the server logs as mentioned at [Logs for the HTML5 forms](/help/forms/using/enable-logs.md). Check if there was any error in server logs during submission.

## Problem: Localized error messages do not display {#problem-localized-error-messages-do-not-display}

1. Render the form with additional query parameter **debugClientLibs=true** in the desktop browser, and then go to Developer Tools > Resources and check for the file I18N.css.
1. If the file is not available, login into CRX DE at https://&lt;server&gt;:&lt;port&gt;/crx/de.
1. In the folder hierarchy on the left, navigate to /libs/fd/xfaforms/clientlibs/I18N and ensure that the following files and folders exist:

    * Namespace.js
    * LogMessages.js
    * Folders for languages

1. If any of the above files or folders do not exist, install the **adobe-lc-forms-runtime-pkg-&lt;version&gt;.zip** package again.
1. Navigate to the folder which has the same name as the name of the locale and check its content. The folder must contain the following files:

    * I18N.js
    * js.txt

1. Check the content of js.txt and make sure that it has the following entries.

   ```javascript
   ../Namespace.js
   I18N.js
   ../LogMessages.js
   ```

## Problem: Image not showing up {#problem-image-not-showing-up}

1. Ensure that the image URL is correct.
1. Check if your browser supports this type of image.
1. In the exception details, search for word **caused by**.

   The probable reason is that one or more parameters in the URL are incorrect.

   Check the following parameters:
   Step text

<table>
 <tbody>
  <tr>
   <td><strong>Parameter</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>template</td>
   <td>The filename of the template</td>
  </tr>
  <tr>
   <td>contentRoot</td>
   <td>The path where template and associated resources reside</td>
  </tr>
  <tr>
   <td>dataRef</td>
   <td>Absolute path of the data file that is merged with the template.<br /> Note: Path defines the absolute path of the data file.</td>
  </tr>
  <tr>
   <td>data</td>
   <td>UTF-8 encoded data bytes that are merged with the template.</td>
  </tr>
 </tbody>
</table>

1. In the desktop browser, go to Developer Tools > Resources.

   Check on the left side in Frames if that image displays.
