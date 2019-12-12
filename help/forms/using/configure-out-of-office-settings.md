---
title: Configure Out of Office settings
seo-title: Configure Out of Office settings
description: RConfigure Out of Office settings
seo-description: Configure Out of Office settings
---

# Configure Out of Office setting {#configure-out-of-office-settings}

You can use the Out of Office setting to delegate your AEM Inbox items to other users while you are away or not available to work on items. You can delegate items for a specific or indefinite time period. If the user that you delegate your Inbox Items to also goes away and uses the Out of Office setting to delegate his Inbox Items to a third user, your Inbox Items are also delegated to the third assignee. You can delegate items to one or multiple users during the Out of Office period. You can also delegate all the items to a single user. Once you are back, you can claim the items back. The Out of Office setting automatically assigns the item to first assignee in case of race condition. 

>[!NOTE]
>
> * When you enable the Out of Office setting, all the items available in your Inbox, prior to enabling the setting remain in your inbox. Only items received after enabling the setting are delegated.
> * When you turn the Out of Office setting off, the delegated items are not automatically assigned back to you. You can use the claim functionality to assign items to you.  


# Enable the Out of Office setting for your account {#enable-out-of-office}

Perform the following steps to Enable the Out of Office setting for your account and delegate your Inbox Items to another user:

1. Log in to your AEM instance. Tap the ![Inbox](assets/bell.svg) icon and tap **[!UICONTROL View All]**. A list of your inbox items appear.
1. Tap the ![View Selector](assets/viewlist.svg) or ![View Selector](assets/calendar.svg) icon next to the **[!UICONTROL Create]** button and tap **[!UICONTROL Settings]**. The settings dialog appears.
1. Open the **[!UICONTROL Out of Office]** tab on the settings dialog.
1. Tap the **[!UICONTROL Enable/Disable]** button to enable the Out of Office setting.
1. Specify the **[!UICONTROL Start Time]**  and **[!UICONTROL End Time]** for the setting. The items are delegated only during the specified period. Leave the **[!UICONTROL End Time]** field empty to delegate items for an indefinite time period.
1. Select the **[!UICONTROL Forward my items during this period]** checkbox.
1. Tap **[!UICONTROL Add Assignee]**. Specify a user in the **[!UICONTROL Assignee]** field to delegate the items to. Specify the **[!UICONTROL Workflow Model]** to delegate to the specified user. You can select more than one workflow model. 

    In addition, to assign all the items, irrespective of the workflow model, to a particular user, select **[!UICONTROL All Workflows]** from the Workflow Model drop-down list. <br>

    To assign items to a particular user for all workflow models except a few, select **[!UICONTROL All Workflows]** from the Workflow Model drop-down list, tap **[!UICONTROL + Add Exceptions]**, and specify the workflow models to be left out.
1. Tap **[!UICONTROL Save]**.

Now, items assigned to you during the Out of Office time period are automatically assigned to the specified assignee.  
![Out-of-office](assets/out-of-office.png)

[!NOTE]
>
> (For Forms-centric workflow items only) Enable the **Allow assignee to delegate using 'Out of Office' settings** option of the **Assign task** step in the workflow. Only items which have the aforementioned option enabled are delegated to other users.



## Limitations {#limitations}

* Assigning items to a group is not supported.
