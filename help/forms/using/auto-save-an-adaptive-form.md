---
title: Auto-save an adaptive form
description: You can configure an adaptive form to automatically start saving the content based on an event or a pre-defined time-interval
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
feature: Adaptive Forms, Foundation Components
exl-id: ff9bf466-228d-40e6-9389-15c1f2ed1d2e
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Auto-save an adaptive form {#auto-save-an-adaptive-form}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

You can configure an adaptive form to automatically start saving the content based on an event or a pre-defined time-interval. By default, contents of an adaptive form are saved on a user action, such as on pressing the save button. The auto save option is helpful in:

* Automatically saving the content for anonymous and logged-in users
* Saving the content of a form without or minimal user intervention
* Start saving content of a form based on a user event
* Saving the content of a form repeatedly after a specified time interval

## Enable autosave for an adaptive form {#enable-autosave-for-an-adaptive-form}

For an adaptive form, the auto save option is not enabled out of the box. You can enable the auto save option from the **Auto Save** section in the properties of an adaptive form. The **Auto Save** section also provides several other configuration options. Perform the following steps to enable and configure the auto save option for an adaptive form:

1. To access the auto-save section in the properties, select a component, then select ![field-level](assets/field-level.png) &gt; **[!UICONTROL Adaptive Form Container]**, and then select ![cmppr](assets/cmppr.png).
1. In the **[!UICONTROL Auto Save]** section, **[!UICONTROL Enable]** the auto-save option.
1. In the **[!UICONTROL Adaptive Form Event]** box, specify 1 or TRUE to automatically start saving the form when the form is loaded in the browser. You can also specify a conditional expression for an event, which when triggered and returns true, starts saving the content of the form.
1. Specify the Trigger. Auto-save is triggered based on your configuration. Your options are:

    * **[!UICONTROL Time based:]** Select the option to start saving the content based on a specific time interval.
    * **[!UICONTROL Event based:]** Select the option to start saving the content based when an event is triggered.

   When you select a trigger, Strategy Configuration box is enabled. Strategy Configuration box lets you:

    * Specify a time interval if you select **[!UICONTROL Time based]** trigger.
    * Specify an event name if you select **[!UICONTROL Event based]** trigger.

   You can also create and add your own custom strategy to the list. For details, see [Implement a custom strategy to autosave the forms](/help/forms/using/auto-save-an-adaptive-form.md#p-implement-a-custom-strategy-to-enable-autosave-for-adaptive-forms-p).

1. (Time-based autosave only) Perform the following steps to configure options for the Time-based autosave.

    1. In the **[!UICONTROL Auto save on this interval]** box, specify the time interval in seconds. The form is saved repeatedly after the number of seconds specified in the interval box elapse.

1. (Event-based auto save only) Perform the following steps to configure options for Event-based auto save.

    1. In th **Auto save after this event** box, specify a [GuideBridge](https://helpx.adobe.com/aem-forms/6/javascript-api/GuideBridge.html) event. The form is saved every time the expression evaluates to TRUE.

1. (Optional) To automatically save the content for anonymous users, select the **Enable Autosave for anonymous users** option, and click **[!UICONTROL OK]**.

   >[!NOTE]
   >
   >For auto save option to work for anonymous users, ensure that you configure the Forms Common Configuration Service to allow all users to preview, verify, and sign forms.
   >
   >To configure the service, go to AEM Web Console configuration at `https://server:port/system/console/configMgr` and edit the **[!UICONTROL Forms Common Configuration Service]** to choose the **[!UICONTROL All Users]** option in the **[!UICONTROL Allow]** field, and save the configuration.

## Implement a custom strategy to enable autosave for adaptive forms {#implement-a-custom-strategy-to-enable-autosave-for-adaptive-forms}

You can implement a custom event to trigger the autosave functionality. Perform the following steps to create and implement the custom event:

1. Create client library and client library folders. For detailed steps, see the [Using Client-Side Libraries document](/help/sites-developing/clientlibs.md).

   For example, the following script uses the custom `emailFocusChange`event to trigger the autosave functionality:

   ```javascript
   window.addEventListener("bridgeInitializeStart", function (){
       guideBridge.connect(function () { guideBridge.on("elementFocusChanged", function (event,data) {
           if(data.target.name === 'Email') {
               guideBridge.trigger("emailFocusChange");
           }
       });
      });
   });

   ```

   >[!NOTE]
   >
   >A category property is defined while creating the client library folders. Keep the value assigned to category property handy.

1. Open the adaptive form in author mode.

1. In the edit mode, select a component, then select ![field-level](assets/field-level.png) &gt; **[!UICONTROL Adaptive Form Container]**, and then select ![cmppr](assets/cmppr.png).
1. In th properties, open the **[!UICONTROL Basic]** section. In the **[!UICONTROL Client Library Category]** box, enter the value of the category property defined while creating the client library folders.
1. Open the Auto Save section. In the **[!UICONTROL Auto save after this event]** box, specify a custom event already defined in the client library. Click **[!UICONTROL OK]**.
