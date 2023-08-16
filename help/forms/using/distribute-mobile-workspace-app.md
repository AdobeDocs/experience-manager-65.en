---
title: Distribute AEM Forms app
seo-title: Distribute AEM Forms app
description: Use Mobile Device Management (MDM) for the large-scale deployment of apps on mobile devices.
seo-description: Use Mobile Device Management (MDM) for the large-scale deployment of apps on mobile devices.
uuid: 8a2ce42b-5e9b-42c1-a945-c069f6152f6e
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
discoiquuid: 5756cb52-dd47-4277-981c-fd0af9a20638
exl-id: 375cfa95-ac6f-44c4-a736-f5dd55d24195
---
# Distribute AEM Forms app {#distribute-aem-forms-app}

Mobile Device Management (MDM) enables the large-scale deployment of apps on mobile devices.

>[!NOTE]
>
>This distribution is applicable for iOS and Android devices only.

## Main features generally provided by MDM solutions: {#main-features-generally-provided-by-mdm-solutions}

* Enable device enrollment in your enterprise environment
* Allow the configuring and updating device settings
* Enforce security compliance.
* Secure mobile access to corporate resources

An MDM solution along with Mobile Application Management, lets you manage internal, public, and purchased apps across the mobile devices in your enterprise.

The MDM administrator can upload both ipa and apk files to the MDM server and control the users who can access the ipa or apk files. The administrator can also control the profile setting corresponding to each application.

## Profile settings affecting the AEM Forms app {#profile-settings-affecting-the-aem-forms-app-br}

The following Profile settings on your device will affect the functioning of the AEM Forms app on you device:

* **Allow use of camera** in the **Device functionality** section

If you disable **Allow use of camera**, the camera feature of the [Photograph annotation](/help/forms/using/add-attachments.md) will not function. You need to enable this option to use the camera in the app.

* **Require passcode on device** in the Passcode policies section

To enable **encryption of application data**, you are recommended to enable the **passcode** on your device. If passcode is not set on device, application data stored on the device is not encrypted.
