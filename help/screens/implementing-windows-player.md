---
title: Implementing Windows 10 Player
seo-title: Implementing Windows 10 Player
description: Follow this page to learn about configuring AEM Screens Windows 10 player. 
seo-description: Follow this page to learn about configuring AEM Screens Windows 10 player. 
uuid: cdd7e9f1-f836-4d52-8026-80537a6623ca
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.4/SCREENS
topic-tags: administering
content-type: reference
discoiquuid: 9b66225a-a893-491b-b47c-ae7b3048ed80
---

# Implementing Windows 10 Player{#implementing-windows-player}

This section describes about configuring AEM Screens Windows 10 player. It provides information of the configuration file and the options available and recommendations as to which settings to use for development and testing.

## Installing Windows Player {#installing-windows-player}

To implement Windows Player for AEM Screens, please install Windows Player for AEM Screens.

Visit the [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

### Ad-Hoc method {#ad-hoc-method}

The Ad-Hoc method to install the latest Windows Player (*.exe*), visit [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

Once you download the application, follow the steps on the player to complete the ad-hoc installation:

1. Long-press on the top left corner to open the admin panel.
1. Navigate to **Configuration** from the left action menu and enter the location (address) of the AEM instance you wish to connect to and click **Save**.

1. Click on the **Registration** link from the left action menu to complete the device registation process.

### Registering multiple Windows 10 Players with one Configuration {#registering-multiple-windows-players-with-one-configuration}

Once you have installed the Windows player, you can register multiple players with one configuration.

>[!NOTE]
>
>**Bulk Registration of Windows Player**
>
>When implementing the windows player you need not manually configure every single player. Instead, you can update the configuration JSON file after it is tested and is ready for deployment.
>
>The configuration will make sure that all players ping the same server provided in the configuration file. You still must manually register each player.

Follow the steps below to configure the Windows 10 Player:

1. Install Windows Player.
1. Find the configuration file under ***%appdata%\com.adobe.aem.screens.player\config.json***.
1. Update the configuration JSON using the information below and then copy the same folder to all the systems where the player resides.

### Policy Attributes {#policy-attributes}

The following table summarizes the policy attributes with an example policy JSON for reference:

| **Policy Name** |**Purpose** |
|---|---|
| server |The URL to the Adobe Experience Manager (AEM) server. |
| resolution |The resolution of the device. |
| rebootSchedule |The schedule to reboot the player. |
| enableAdminUI |Enable the Admin UI to configure the device on site. Set to false once it is fully configured and in production. |
| enableOSD |Enable the channel switcher UI for users to switch channels on device. Consider setting to false once it is fully configured and in production. |
| enableActivityUI |Enable to show progress of activities such as download and sync. Enable for troubleshooting and disable once it is fully configured and in production. |

#### Example policy JSON file {#example-policy-json-file}

```
{
    "server": "http://localhost:4502",
    "resolution": "auto",
    "rebootSchedule": "at 4:00 am",
    "enableAdminUI": false,
    "enableOSD": false,
    "enableActivityUI": false
}
```

