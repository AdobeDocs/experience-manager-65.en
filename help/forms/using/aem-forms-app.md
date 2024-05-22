---
title: AEM Forms app

description: AEM Forms app enables your field workers to use adaptive forms on their mobile devices.


contentOwner: sashanka
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: 171754a2-1ba5-42dc-b6d2-3d730807cc31
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "Admin, User, Developer"
---
# Introduction to AEM Forms app {#aem-forms-app}

## Overview {#overview}

AEM Forms app enables syncing of adaptive forms, mobile forms, and formsets on mobile devices, based on your server. You can define workflows that are [Forms centric workflows on OSGi](/help/forms/using/aem-forms-workflow.md) or Forms workflows on JEE. For example, you run a banking firm, and use AEM Forms to manage customer applications and communications. Your customers fill a form and submit it for verification. If you enable the form on mobile devices, your customers can fill the form in the AEM Forms app. You can also manage the verification workflow by enabling the verification form on mobile devices. Your field worker can carry a mobile device to the customer, verify the details, and submit the form. The AEM Forms app syncs with AEM Forms server and fetches the forms enabled for mobile devices. If the app is offline, it stores data locally.

The source code of the AEM Forms app is available to customers via Software Distribution. The source code package in Software Distribution is available as: `adobe-aemfd-forms-app-src-pkg-<version>.zip`.

AEM Forms app is supported on iOS, Android, Windows devices. You can install AEM Forms app for Android from Google Play, iOS from the App Store, and Windows from Windows store.

    [ ![google_play](assets/google_play.png)](https://play.google.com/store/apps/details?id=com.adobe.aem.forms)

    [ ![app_store](assets/app_store.png)](https://itunes.apple.com/us/app/adobe-experience-manager-forms/id1129625976?ls=1&mt=8)

    [ ![microsoft-badge-icon](assets/microsoft-badge-icon.png)](https://www.microsoft.com/en-us/store/p/adobe-experience-manager-forms/9nd12rlxtgtt)

To install, customize, and distribute the app on iOS, Android, or Windows devices, see [Customize, build, and distribute the AEM Forms app](#customize-build-distribute).

## Prerequisites {#prerequisites}

AEM Forms app requires an AEM Forms server. Users can render forms you create in the AEM Forms
server, fill them, save as drafts, and submit them. The app connects to the server and fetches enabled forms from it. AEM Forms app syncs with the server and as soon as forms are loaded in the app, users can work offline. If the app is offline, data is saved on the device, and the data is synced with the server when the app is online.

### AEM Forms app with servers using AEM Forms Workflow {#aem-forms-app-with-servers-using-aem-forms-workflow}

If you have an AEM Forms Workflow server, you can render forms as tasks in AEM Forms app. For example, you run a banking firm, and customer fills an application to use your services. The application is an adaptive form that accepts information from your customers, and stores it as a submission for review. The administrator reviews an application and forwards a verification request to the field worker. The forwarded application enables a verification form in your field worker's app as a task. Your field worker carries the mobile device to your customer and verifies the details.

### AEM Forms app with servers using Forms-centric workflow on OSGi {#aem-forms-app-with-servers-using-forms-centric-workflow-on-osgi}

If you have an AEM Forms server, you can render adaptive forms as AEM Inbox application, and tasks in AEM Forms app. For example, you run a banking firm, and customer fills an application to use your services. The application is associated with an adaptive form that accepts information from your customers, and stores it as a submission for review. The administrator reviews the task and approves the verification request to the field worker. Your field worker carries the mobile device to your customer and verifies the details.

### Standalone forms or AEM Forms app with servers without AEM Forms Workflow {#standalone-forms-or-aem-forms-app-with-servers-without-aem-forms-workflow}

An AEM Forms server not using AEM Forms Workflow is AEM Forms on OSGi or a standalone mobile form or adaptive form. AEM Forms app works with your AEM Forms implementation on [OSGi](/help/sites-deploying/configuring-osgi.md). Forms you enable and publish for AEM Forms app are available in your app.

The forms are downloaded on your app, and are available offline. For example, you are running a banking firm, and a customer fills an application on your site. The application is an adaptive form that accepts information from your customers, and stores it for review. The administrator reviews the form, and creates a verification form in AEM author instance. The admin enables syncing of the form with AEM Forms app, and publishes it. If the verification form is available in AEM Forms app, your field agent can use a mobile device to verify your customer's details. The mobile device syncs with the server, and the verification form is loaded in the app. Your field agent can visit your customer, verify the details, save data as draft, or submit the verification form. The form is synced with the server whenever the app is online.

To sync your form in AEM Forms app:

1. In author instance, select a form, and click **[!UICONTROL View Properties]**.

1. In the properties page, click **[!UICONTROL Advanced]**.
1. Under Advanced, enable option: **[!UICONTROL Sync with AEM Forms App]** and select **[!UICONTROL Save]**.

When the form is published, the app syncs with the server and fetches the form. To sync multiple forms, in the author instance, select multiple forms in forms manager and select **[!UICONTROL Sync with AEM Forms App]**.

## Mobile device support {#mobile-device-support}

See [AEM Forms app (previously known as Mobile Workspace)](/help/forms/using/aem-forms-jee-supported-platforms.md#aem-forms-workspace-app)

## Key features of AEM Forms app {#key-features-of-aem-forms-app}

### AEM Forms app with AEM Forms servers {#aem-forms-app-with-aem-forms-servers}

You can synchronize your app with the AEM Forms server and can work with forms on your mobile device.

With AEM Forms Workflow server, a form can be associated with a startpoint in a workbench process and AEM Inbox application. An AEM Inbox application can have an adaptive form associated with it. A startpoint can have an adaptive form, HTML5 form, or a formset associated with it. A startpoint can be submitted as a task or the task can be saved as a draft. For more information on differences between an AEM Inbox application and a startpoint see [Actions and capabilities of Form-centric AEM Workflows on OSGi and AEM Forms JEE workflows](capabilities-osgi-jee-workflows.md).

With AEM Forms server without AEM Forms workflow, a form enabled for syncing in the app is rendered in the AEM Forms app. Forms are available in the Forms tab of the app, can be submitted or saved as a draft. Adaptive forms and mobile forms are supported in the app.

1. **Saving a task or form as a draft**

   The save as draft option saves a snapshot of a task or form along with the data filled and files attached in the associated form. The drafts are saved to the mobile device and synced with AEM Forms server for a later retrieval.

   See [Saving a task or form as a draft](/help/forms/using/save-as-draft.md).

1. **Save form as template**

   At times, when users fill a form, inputs to a few fields remain the same. For such instances, you can fill the fields that require identical values in every instance, and save the form or draft as a template. Now, every time you create an instance of the template, the specified fields are already filled with values specified in the template. It helps you save time and effort required to fill the form.

   See [Save forms as templates](/help/forms/using/save-forms-and-start-points-as-templates.md).

### Working with tasks and forms {#working-with-tasks-and-forms}

You can synchronize your app with the AEM Forms Workflow server and can work on tasks and forms on your mobile device.

A task on the mobile device contains an adaptive form, HTML5 form, or a form set and can also contain attachments and [summary URL](/help/forms/using/getting-task-variables-summary-url.md). By default, tasks assigned to you are placed in the **[!UICONTROL Tasks]** folder. When working on a task, you can change the task and save a draft copy of task on the AEM Forms server.

A form on the mobile device can be an adaptive form or a mobile form. Forms enabled for syncing in the forms app are available in the Forms folder. You can sync forms enabled in AEM Forms server without AEM Forms workflow (AEM Forms on OSGi).

See:

* [Opening a task](/help/forms/using/open-task.md)
* [Working with a form](/help/forms/using/working-with-form.md)

### Working offline {#working-offline}

You can work on your mobile device in the offline mode. You can log in to the application even if there is no network connectivity and can work on all the forms that were synchronized with the device when you were last online. For details on how to synchronize your forms, see [Synchronizing the app](/help/forms/using/sync-app.md). If you choose to synchronize the attachments associated with a form, you can open the attachments in the offline mode as well. You can edit the form, add annotations, and submit or save a form in the offline mode. The form is synchronized with the AEM Forms server the next time you are online.

For details, see [Working in the offline mode](/help/forms/using/work-offline-mode.md).

### Adding annotations {#adding-annotations}

You can add the following attachments to a form on your mobile device

* **Notes**- You can use the Notes feature to add a freehand scribble or a text note in your form. For details, see [Adding a note](/help/forms/using/add-attachments.md#adding-a-note).

* **Picture**- The AEM Forms app includes a feature that uses the camera functionality or the gallery of your mobile device. Using the photograph attachment, you can add a photograph with the associated form. For details, see [Adding a photograph](/help/forms/using/add-attachments.md#adding-a-photograph).

### Autosave {#autosave}

When a user enters data in the AEM Forms app, the autosave feature saves it at regular intervals. The autosave feature in the AEM Forms app helps you avoid data loss if the app closes due to conditions like low battery.

See [Using autosave in AEM Forms app](/help/forms/using/autosave-data-app.md).

## Differences between AEM Inbox and AEM Forms app features {#differences-between-aem-inbox-and-aem-forms-app-features}

Two of the prominent ways to launch a Forms-centric workflow are using [AEM Inbox](/help/forms/using/manage-applications-inbox.md) and AEM Forms app. The capabilities of AEM Inbox and AEM Forms app, however, differ. AEM Inbox works only with [Forms-centric workflows](/help/forms/using/aem-forms-workflow.md) while the AEM Forms app works with both Forms-centric workflows and process management. For more information on differences between AEM Inbox and AEM Forms app capabilities, see [Actions and capabilities of Form-centric AEM Workflows on OSGi and AEM Forms JEE workflows](capabilities-osgi-jee-workflows.md).

## Supported forms {#supported-forms}

Supported form types in the AEM Forms app:

### Adaptive form {#adaptive-form}

An adaptive form that dynamically adapts to user inputs is supported in AEM Forms app. Lazy loaded adaptive forms are also supported.

### Mobile form {#mobile-form}

You can create forms for mobile devices in AEM Forms. Mobile forms are rendered as HTML forms in mobile devices that adapt according to display devices.

### Formset {#formset}

With formsets, multiple forms related to a service or process can be grouped to automate a business process and presented to the end users. In such a scenario, the users can fill the whole set as one and there is no need to file, submit, and track individual forms or processes.

>[!NOTE]
>
>Requires AEM Forms Workflow (AEM Forms on JEE).

## How AEM Forms app works {#how-aem-forms-app-works}

AEM Forms app provides a mobile solution for field workers to work on forms assigned to them. The application caches the complete data from the server and provides an efficient user experience by saving all the work locally. The data from the disk is sent to the server via timely synchronization updates.

AEM Forms app is a PhoneGap 5.0 based application in which the Backbone model is efficiently used to present data stored in the models through views. All native operations are performed through PhoneGap plug-ins.

## Customize, build, and distribute the AEM Forms app {#customize-build-distribute}

>[!NOTE]
>
>Applicable only if you are using AEM Forms app source code to build the app.

AEM Forms app is easy to customize for organization-specific needs. The source code for the application is provided along with AEM Forms. You can change the source code and build your own mobile workforce solution. You can also sign the app with your own enterprise key.

### Customize {#customize}

You can customize your app for:

**Branding**: Change the app icon, app name, launch images, and pages in AEM Forms app. You can also change text to localize the app for a specific region. For more information on branding the AEM Forms app, see [Branding customization](/help/forms/using/branding-customization.md).

**Theme**: Change styles such as colors, fonts, and spacing in the AEM Forms app user interface. For more information, see [Theme customization](/help/forms/using/theme-customization.md).

**Gesture**: Change gestures such as swipe right and swipe left in the AEM Forms app user interface. For more information, see [Gesture customization](/help/forms/using/gesture-customization.md).

For more information on setting up a AEM Forms app project for customization, see:

* [Set up environment for AEM Forms app](/help/forms/using/setup-environment-mobile-workspace.md)
* [Set up Visual Studio project and build Windows app](/help/forms/using/setup-visual-studio-project-build-installer.md)
* [Set up Xcode project and build iOS app](/help/forms/using/setup-xcode-project-build-installer.md)
* [Set up Eclipse project and build Android app](/help/forms/using/setup-eclipse-project-build-installer.md)

### Build and distribute {#build-and-distribute}

The source code for the AEM Forms app can be extracted from the `adobe-lc-mobileworkspace-src.zip` that is available as part of the AEM Forms app source package on Software Distribution.

To get the AEM Forms app source, perform the following steps:

1. Open [Software Distribution](https://experience.adobe.com/downloads). You require an Adobe ID to log in to the Software Distribution.
1. Select **[!UICONTROL Adobe Experience Manager]** available in the header menu.
1. In the **[!UICONTROL Filters]** section:
   1. Select **[!UICONTROL Forms]** from the **[!UICONTROL Solution]** drop-down list.
   2. Select the version and type for the package. You can also use the **[!UICONTROL Search Downloads]** option to filter the results.
1. Select the package name applicable to your operating system, select **[!UICONTROL Accept EULA Terms]**, and select **[!UICONTROL Download]**.
1. Open [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html)  and click **[!UICONTROL Upload Package]** to upload the package.
1. Select the package and click **[!UICONTROL Install]**.

**For iOS**:

For details on how to create an iOS app (.ipa), refer [Set up the Xcode project and build the iOS app](/help/forms/using/setup-xcode-project-build-installer.md).

For details on how to sign the AEM Forms app with your provisioning profile, see [iOS Code Signing Setup, Process, and Troubleshooting](https://developer.apple.com/support/code-signing/).

**For Android**:

For details on how to create an Android app (.apk), refer [Set up the Eclipse project and build the Android app](/help/forms/using/setup-eclipse-project-build-installer.md).

For details on how to sign the AEM Forms app, see [Signing Your Applications](https://developer.android.com/tools/publishing/app-signing.html).

**For Windows**:

For details on how to create a Windows app (.appx), refer [Set up the Visual Studio project and build the Windows app](/help/forms/using/setup-visual-studio-project-build-installer.md).

For details on how to distribute the app via MDM, see [Distribute AEM Forms app](/help/forms/using/distribute-mobile-workspace-app.md). App distribution via MDM is applicable only for iOS and Android.

## Recommendations to upgrade Mobile Workspace to AEM Forms app {#recommendations-to-upgrade-mobile-workspace-to-aem-forms-app}

If you are upgrading to the latest version of AEM Forms app, ensure that you read through the following points:

* **If you installed an earlier version of the app from the play store on Android**
  You can upgrade the app directly from the play store.

* **If earlier version of the app is built and installed using the source code (applicable for iOS and Android)**:

  Before you install the new app, sync all your data with the AEM Forms server. After the data is synced, uninstall the earlier version of the app, and install the new app.
