---
title: Distribute AEM Forms app
description: Use Mobile Device Management (MDM) for the large-scale deployment of apps on mobile devices.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
exl-id: 375cfa95-ac6f-44c4-a736-f5dd55d24195
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Distribute AEM Forms app {#distribute-aem-forms-app}

Mobile Device Management (MDM) enables the large-scale deployment of apps on mobile devices.

>[!NOTE]
>
>This distribution is applicable for iOS and Android&trade; devices only.

## Main features provided by MDM solutions: {#main-features-generally-provided-by-mdm-solutions}

* Enable device enrollment in your enterprise environment
* Allow the configuring and updating device settings
* Enforce security compliance.
* Secure mobile access to corporate resources

An MDM solution along with Mobile Application Management, lets you manage internal, public, and purchased apps across the mobile devices in your enterprise.

The MDM administrator can upload both ipa and apk files to the MDM server and control the users who can access the ipa or apk files. The administrator can also control the profile settings that correspond to each application.

## Profile settings affecting the AEM Forms app {#profile-settings-affecting-the-aem-forms-app-br}

The following Profile settings on your device affect the functioning of the AEM Forms app on your device:

* **Allow use of camera** in the **Device functionality** section

If you disable **Allow use of camera**, the camera feature of the [Photograph annotation](/help/forms/using/add-attachments.md) does not function. Enable this option to use the camera in the app.

* **Require passcode on device** in the Passcode policies section

To enable **encryption of application data**, you are recommended to enable the **passcode** on your device. If the passcode is not set on the device, the application data that is stored on the device is not encrypted.
