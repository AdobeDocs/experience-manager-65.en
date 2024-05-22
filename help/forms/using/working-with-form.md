---
title: Working with a Form

description: View and update the form associated with a task or Startpoint in the AEM Forms app


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: adff5339-e026-4924-a401-f249f37fc6e6
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Working with a Form {#working-with-a-form}

If a form is enabled for syncing in the forms app, the form is downloaded and you can work with it directly.

The forms are downloaded on your app, and are available offline. For example, you are running a banking firm, and a customer fills an application on your site. The application is an adaptive form that accepts information from your customers, and stores it for review. The administrator reviews the form, and creates a verification form in AEM author instance. The admin enables syncing of the form with AEM Forms app. If the verification form is available in AEM Forms app, your field agent can use a mobile device to verify your customer's details. The mobile device syncs with the server, and the verification form is loaded in the app. Your field agent can visit your customer, verify the details, save data as draft, or submit the verification form. The form is synced with the server every time your app is online.

To sync your form in AEM Forms app:

1. In author instance, select a form, and click **View Properties**.
1. In the properties page, click **Advanced.**
1. Under Advanced, enable option: **Sync with AEM Forms App**, and select **Save**.

To sync multiple forms, in the author instance, select multiple forms in forms manager and select **Sync with AEM Forms App**. When the form is published, the AEM Forms app can connect to the publish server and fetch the forms.

If your AFA (AEM Form Application) Android app fails to sync, perform the following steps to fix the sync issue:

1. Go to the **https://[server]:[port]/system/console/configMgr**.
1. Search for the **[!UICONTROL Adobe Granite Token Authentication Handler]** and click **[!UICONTROL Edit]**.
1. Select the **[!UICONTROL None]** option from the dropdown menu for the **[!UICONTROL SameSite attribute for the login-token cookie]** attribute. 
1. Click **[!UICONTROL Save]**.

![Sync Image with AFA Android app](/help/forms/using/assets/afaandroid.png)

>[!NOTE]
>
>Supported forms:
>
>* Adaptive forms (without lazy loading)
>* Mobile forms
>
>Form level attachments are not supported in the adaptive forms fetched in the AEM Forms app synced with AEM Forms OSGi server. Users can attach files in a field, if the author has enabled field level attachments at the time of authoring the form.


**To open and update a form**

1. To open a form, select the **[!UICONTROL Form]** in the home screen.
1. You can update the fields of the form, add attachments, save as draft, and submit it.
