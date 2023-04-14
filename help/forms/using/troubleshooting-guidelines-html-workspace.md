---
title: Troubleshooting guidelines for AEM Forms workspace
seo-title: Troubleshooting guidelines for AEM Forms workspace
description: Enable logs and use debugger in browser to troubleshoot AEM Forms workspace.
seo-description: Enable logs and use debugger in browser to troubleshoot AEM Forms workspace.
uuid: 07b8c8ed-f1ff-4be5-8005-251ff7b2ac85
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 5dae9ed9-77a3-44f5-a94d-ca5c355c8730
exl-id: a054b60a-5e89-4c98-87bc-35669988d160
---
# Troubleshooting guidelines for AEM Forms workspace {#troubleshooting-guidelines-for-aem-forms-workspace}

This article discusses how to debug AEM Forms workspace by enabling logging and by using debugger in a browser. It also explains some common issues that you can encounter when using AEM Forms workspace and their workarounds.

## Unable to install AEM Forms workspace package {#unable-to-install-aem-forms-workspace-package}

Ater installing the patch, open the AEM Forms workspace. If you encounter the No Resource Found error, open the CRX Package Manager, and reinstalling the `adobe-lc-workspace-pkg-<version>.zip` package.

While installling the package, if you encounter an error `javax.jcr.nodetype.ConstraintViolationException: OakConstraint0025: Authorizable property rep:authorizableId may not be removed`, perform the following steps:

1. Log in to CRXDE Lite. The default url is `https://[localhost]:'port'/lc/crx/de/index.jsp`
1. Delete the following node:

   `/home/groups/P/PERM_WORKSPACE_USER`

1. Go to the Package Manager. The default URL is `https://[localhost]:'port'/lc/crx/packmgr/index.jsp.`
1. Search and install the `adobe-lc-workspace-pkg-[version].zip` package.
1. Restart the application server.

## AEM Forms workspace&nbsp;logging {#aem-forms-workspace-nbsp-logging}

You can generate logs at various levels to enable optimal troubleshooting of errors. For example, in a complex application, logging at the component level helps in debugging and troubleshooting specific components.

In AEM Forms workspace:

* To get the logging information about a specific component file, append `/log/<ComponentFile>/<LogLevel>` in the URL, and press `Enter`. All logging information for the component file at the specified log level is printed on the console.

* To get logging information of all component files, append `/log/all/trace` in the URL, and press `Enter`.

* Log format: `<Component file> <Date>:<Time>: <Log Level> : <Log Message>`

>[!NOTE]
>
>By default log level of all components is set to INFO.

* The log level set by user is maintained only for that browser session. When the user refreshes the page, the log level is set to its initial value for all components.

### List of component files in&nbsp;AEM Forms workspace {#list-of-component-files-in-nbsp-aem-forms-workspace}

<table>
 <tbody>
  <tr>
   <td><p>allcategoryModel</p> </td>
   <td><p>processinstanceModel</p> </td>
   <td><p>tasklistModel</p> </td>
  </tr>
  <tr>
   <td><p>appnavigationModel</p> </td>
   <td><p>processInstanceView</p> </td>
   <td><p>tasklistView</p> </td>
  </tr>
  <tr>
   <td><p>appnavigationView</p> </td>
   <td><p>processnamelistModel</p> </td>
   <td><p>taskModel</p> </td>
  </tr>
  <tr>
   <td><p>categorylistModel</p> </td>
   <td><p>processnamelistView</p> </td>
   <td><p>taskView</p> </td>
  </tr>
  <tr>
   <td><p>categorylistView</p> </td>
   <td><p>processnameModel</p> </td>
   <td><p>teamqueuesView</p> </td>
  </tr>
  <tr>
   <td><p>categoryModel</p> </td>
   <td><p>processnameView</p> </td>
   <td><p>todoView</p> </td>
  </tr>
  <tr>
   <td><p>categoryView</p> </td>
   <td><p>searchtemplatedetailsView</p> </td>
   <td><p>trackingView</p> </td>
  </tr>
  <tr>
   <td><p>favoritecategoryModel</p> </td>
   <td><p>sharequeueModel</p> </td>
   <td><p>uisettingsModel</p> </td>
  </tr>
  <tr>
   <td><p>filterlistView</p> </td>
   <td><p>sharequeueView</p> </td>
   <td><p>uisettingsView</p> </td>
  </tr>
  <tr>
   <td><p>filterView</p> </td>
   <td><p>startpointlistModel</p> </td>
   <td><p>userinfoModel</p> </td>
  </tr>
  <tr>
   <td><p>outofofficeModel</p> </td>
   <td><p>startpointlistView</p> </td>
   <td><p>userinfoView</p> </td>
  </tr>
  <tr>
   <td><p>outofofficeView</p> </td>
   <td><p>startpointModel</p> </td>
   <td><p>usersearchModel</p> </td>
  </tr>
  <tr>
   <td><p>preferencesView</p> </td>
   <td><p>startpointView</p> </td>
   <td><p>usersearchView</p> </td>
  </tr>
  <tr>
   <td><p>processinstancehistoryView</p> </td>
   <td><p>startProcessView</p> </td>
   <td><p>wserrorModel</p> </td>
  </tr>
  <tr>
   <td><p>processinstancelistModel</p> </td>
   <td><p>startprocessView</p> </td>
   <td><p>wserrorView</p> </td>
  </tr>
  <tr>
   <td><p>processinstancelistView</p> </td>
   <td><p>taskdetailsView</p> </td>
   <td><p>wsmessageView</p> </td>
  </tr>
 </tbody>
</table>

### Log levels available in&nbsp;AEM Forms workspace {#log-levels-available-in-nbsp-aem-forms-workspace}

* FATAL
* ERROR
* WARN
* INFO
* DEBUG
* TRACE
* OFF

## Debugging information for browsers {#debugging-information-for-browsers}

Scripts and styles can be debugged in different browsers.

* **Debugging in IE**: To debug AEM Forms workspace in IE, see: [https://learn.microsoft.com/en-us/office/dev/add-ins/testing/debug-add-ins-using-f12-tools-ie](https://learn.microsoft.com/en-us/office/dev/add-ins/testing/debug-add-ins-using-f12-tools-ie).

* **Debugging in Chrome**: To open debugger in Chrome, use the shortcut: Ctrl+Shift+I. For more information, see: [https://developer.chrome.com/docs/extensions/mv3/tut_debugging/](https://developer.chrome.com/docs/extensions/mv3/tut_debugging/).

* **Debugging in Firefox**: Several Add-ons are available to debug scripts and styles in Firefox. For example, Firebug is one such debugging utility ([https://getfirebug.com](https://getfirebug.com)).

## FAQs {#faqs}

1. PDF form is not getting rendered or submitted in Google Chrome.

    1. Install the Adobe&reg; Reader&reg; plug-in.
    1. In Chrome, open chrome://plugins, to view available plug-ins.
    1. Disable the Chrome PDF Viewer plug-in, and enable the Adobe Reader plug-in.

1. SWF form or Guide is not rendering in Google Chrome.

    1. In Chrome, open chrome://plugins, to view available plug-ins.
    1. See details for Adobe Flash&reg; Player plug-in.
    1. Disable PepperFlash under Adobe Flash Player plug-in.

1. I have customized AEM Forms workspace but I am unable to see the changes.

   Clear your browser's cache, and then access AEM Forms workspace.

1. What needs to be done by the user to enable the form to be rendered in HTML when opened in desktop?

   Select the HTML radio button for default profile in the assign task step while using Workbench.

1. Attachment does not show up when clicked.

   To view attachments, enable popups in your browser.

1. A user is logged in to a forms application. If the user tries to log in to workspace, it may not load, if the user does not have workspace permissions.

   Logout from the other forms application, and then log in to workspace.

1. HTML forms, using Process Properties in their design, when rendered in AEM Forms workspace, display Submit button inside the form.

   When designing forms, when you use Process Properties, it adds a Submit button inside the form. When rendered as a PDF in AEM Forms workspace, the Submit button is not visible to the end user. However, when rendering as an HTML form in AEM Forms workspace, the Submit button is visible to the end user. Clicking on this Submit button inside the form does not initiate any action. Clicking on the Submit button at the bottom of the AEM Forms workspace, outside the form, completes the task.
