---
title: Configuring Business Calendars
description: Business calendars define business and non-business days for your organization. Learn how to configure the business calendars.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 4282718a-41f1-411a-9cd7-8c470005107d
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring Business Calendars {#configuring-business-calendars}

*Business calendars* define business and non-business days (for example, statutory holidays, weekends, and company shutdown days) for your organization. When using business calendars, AEM forms skips non-business days when performing certain date calculations. In Workbench, you can specify whether to use business calendars for user-associated events such as task reminders, deadlines, and escalations or for actions not associated with users, such as Timer Events and the Wait Service.

For example, a task reminder is configured to occur three business days after the task is assigned to a user. The task is assigned on Thursday. However, the following three days are not business days because the Friday is a national holiday and the next two days are weekend days. The reminder is therefore sent on Wednesday of the next week.

>[!NOTE]
>
>When calculating dates and times using business calendars, AEM forms uses the date and time of the server where it is running and does not adjust for the difference between time zones. For example, if a task reminder is scheduled to occur at 10:00 am on a server running in London, but the user receiving the reminder is in New York City, the user would receive the reminder at 5:00 am local time.

## Using the default business calendar {#using-the-default-business-calendar}

AEM forms provides a default business calendar (named *Built-in Calendar*) that designates Saturdays and Sundays as non-working days. If all the users in your organization have the same non-business days, you can update the default business calendar to suit your organization. When using only the default business calendar, you do not need to enable business calendars in User Management or provide any mappings. When no other business calendars are defined, AEM forms uses the default business calendar.

## Setting up multiple business calendars {#setting-up-multiple-business-calendars}

If some of the users in your organization have different non-business days, you can define multiple business calendars and configure mappings that permit a runtime resolution of a business calendar for a user.

### Define multiple business calendars {#define-multiple-business-calendars}

1. Decide how you will associate the appropriate business calendar with a user. There are two ways to associate a business calendar with a user:

   **Group membership:** You can assign a business calendar to a user based on the user's group membership. In this case, each user in the group will use the same business calendar.

   If a user is a member of two different groups, and those groups are mapped to two different business calendars, AEM forms will use the first calendar that it finds in its search results. In this case, consider using business calendar keys to associate users with business calendars.

   **Business calendar keys:** You can assign a business calendar to a user based on a business calendar key, which is a setting specified in User Management. You then map the business calendar key to a business calendar in forms workflow.

   The way that you assign business calendar keys to users depends on whether you are using an enterprise, local, or hybrid domain. For details on setting up domains, see [Adding domains](/help/forms/using/admin-help/adding-domains.md#adding-domains).

   If you are using a local or hybrid domain, information about users is stored only in the User Management database. To set the business calendar key for these users, enter a string in the Business Calendar Key field when adding or editing a user in User Management. (See [Adding and configuring users](/help/forms/using/admin-help/adding-configuring-users.md#adding-and-configuring-users).) You then map the business calendar keys (the strings) to business calendars in forms workflow. (See [Mapping users and groups to a business calendar](configuring-business-calendars.md#mapping-users-and-groups-to-a-business-calendar).)

   If you are using an enterprise domain, information about users resides in a third-party storage system, such as an LDAP directory, which User Management synchronizes with the User Management database. This lets you map a business calendar key to a field in the LDAP directory. For example, if each user record in your directory contains a "country" field, and you want to assign business calendars based on the country where the user is located, specify the "country" field name in the Business Calendar Key field when specifying the user settings for the directory. (See [Configuring directories](/help/forms/using/admin-help/configuring-directories.md#configuring-directories).) You can then map the business calendar keys (the values defined for the "country" field in the LDAP directory) to business calendars in forms workflow. (See [Mapping users and groups to a business calendar](configuring-business-calendars.md#mapping-users-and-groups-to-a-business-calendar).)

1. In forms workflow, define a calendar for each set of users who share the same non-business days. (See [Create or update a business calendar](configuring-business-calendars.md#create-or-update-a-business-calendar).)
1. In forms workflow, map the business calendar keys or group memberships for each calendar. (See [Mapping users and groups to a business calendar](configuring-business-calendars.md#mapping-users-and-groups-to-a-business-calendar).)
1. In Workbench, the process developer chooses whether to use business calendars for reminders, deadlines, and escalations. (See [Workbench Help](https://www.adobe.com/go/learn_aemforms_workbench_63).)

   If the process developer chooses to use business calendars, AEM forms will dynamically select the appropriate business calendar based on the User Management setting and the business calendar mappings defined in Administration Console, or, if no mappings exists, will use the default calendar.

   If the process developer does not use business calendars, the date calculation for the event treats every day as a business day. For example, a task deadline is configured to occur three days after the task is assigned to a user. The task is assigned on Thursday. The task deadline occurs on Sunday, even though it is a weekend.

## Create or update a business calendar {#create-or-update-a-business-calendar}

If your organization contains different sets of users who have different non-business days, you can define multiple business calendars. You can also change existing calendars, including the default built-in calendar that is provided with AEM forms.

>[!NOTE]
>
>If you do not create a business calendar, then the default calendar is used.

1. In administration console, click Services &gt; Forms workflow &gt; Business Calendars.
1. To add a new business calendar, click ![bus_cal_plus](assets/bus_cal_plus.png). The text *New Calendar* appears in the drop-down list. Select the text and type another name for your calendar.

   To edit an existing business calendar, select it from the drop-down list.

1. Under Default non-business days, select any weekly non-business days, such as weekends.
1. [Optional] Select Use Business Hours and specify the start and end times for the business days.

   If you select this option, an event that occurs before the specified time range is moved to the beginning of the time range, and an event that occurs after the time range is moved to the start time of the next business day.

   For example, consider a situation where a user is assigned a task at 2:00 am on a Tuesday, and the reminder for that task is set to two business days. Without business hours, the reminder would occur at 2:00 am on Thursday. If business hours are set to 8:00 am to 5:00 pm, the reminder would be pushed to 8:00 am on Thursday. Without business hours, if a reminder event was created at 6:00 pm on Tuesday, the reminder would occur after business hours on Thursday. With business hours set to 8:00 am to 5:00 pm, the reminder would occur at 8:00 am on Friday.

1. In the calendar on the left, double-click any other non-business days, such as holidays. You cannot select days in the past. The non-business days that you select appear in a list on the right, with the date appearing twice on one line. Select the date on the left to type name or description for the non-business day.

   To remove a non-business day from the list, click ![bus_cal_trash](assets/bus_cal_trash.png) beside the day.

1. [Optional] If this calendar is to be the default calendar, select Default Calendar. The default calendar is used when no other calendar mapping exists for user-associated events or no business calendar is specified for the Timer Event or the Wait Service. You cannot delete the default calendar.
1. When you have finished defining the non-business days, select Calendar Enabled to make it active, and then click Save.

   If you are updating an existing calendar, the new version takes effect immediately and is used for all business calendar calculations, including for tasks that are already running.

   >[!NOTE]
   >
   >If you do not enable the calendar, the default calendar is used.

## Mapping users and groups to a business calendar {#mapping-users-and-groups-to-a-business-calendar}

There are two methods that you can use to associate a business calendar with a user. You can assign business calendars to users based on a business calendar key or based on the directory group that the user belongs to. You use the Mapping tab to specify the method that AEM forms will use, and also to map the business calendar keys and groups to business calendars. For details on associating business calendar keys with users, see [Setting up multiple business calendars](configuring-business-calendars.md#setting-up-multiple-business-calendars).

### Associate business calendars with users based on business calendar keys {#associate-business-calendars-with-users-based-on-business-calendar-keys}

1. In administration console, click Services &gt; forms workflow &gt; Business Calendars, and then click the Mapping tab.
1. IntheSystem Will Use list, select User Manager Business Calendar Key Resolution.
1. Select Display User Manager Business Calendar Key. A list displays, containing a unique set of business calendar keys that have been defined in User Management.

   For local and hybrid domains, the list displays the values entered into the Business Calendar Key field in User Management. For enterprise (LDAP) domains, the list displays the unique set that is returned from the LDAP field (for example, "country") that was configured in the LDAP domain settings.

   If the User Management administrator has not defined any business calendar keys, the list will be empty.

1. For each item in the UM Business Calendar Key list, select a Calendar.
1. Click Save.

### Associate business calendars with users and groups based on directory service groups {#associate-business-calendars-with-users-and-groups-based-on-directory-service-groups}

1. In administration console, click Services &gt; forms workflow &gt; Business Calendars, and then click the Mapping tab.
1. IntheSystem Will Use list, select Groups Defined By The Directory Server.
1. On the Mapping tab, select Display Directory Service Groups. A list displays, containing the groups that have been defined in User Management. (See [Directory settings](/help/forms/using/admin-help/configuring-directories.md#directory-settings).)

   >[!NOTE]
   >
   >In Workbench, if you have configured a User service to use business calendars and the service is assigned to a group, AEM forms uses the group mappings specified here to resolve the calendar for the group. AEM forms always uses groups mappings to resolve the calendar for groups, even when you use business calendar keys to resolve the calendar for users. If no group mapping is found, the default business calendar is used.

1. For each item in the Directory Service Group list, select a Calendar.
1. Click Save.

## Exporting and importing business calendars {#exporting-and-importing-business-calendars}

AEM forms enables you to export and import your business calendars as XML files. You can use this feature to move calendars from a staging system to a production system.

>[!NOTE]
>
>This feature exports and imports all the defined business calendars, including the default business calendar provided by AEM forms. An imported business calendar with the same name as an existing calendar overwrites the existing calendar.

### Export business calendars {#export-business-calendars}

1. In administration console, click Services &gt; forms workflow &gt; Business Calendars.
1. Click Export and save the XML file.

### Import business calendars {#import-business-calendars}

1. In administration console, click Services &gt; forms workflow &gt; Business Calendars.
1. Click Import.
1. Select the XML file that contains the exported business calendars and click Open.

## Delete a business calendar {#delete-a-business-calendar}

You can remove any business calendars that your organization no longer requires. If you delete a business calendar that is still mapped to users and groups, the default calendar is used.

1. In administration console, click Services &gt; Forms workflow &gt; Business Calendars.
1. Select the calendar.
1. Click Delete.
