---
title: Implementing Windows 10 Player
seo-title: Implementing Windows 10 Player
description: Follow this page to learn about configuring AEM Screens Windows 10 player.
seo-description: Follow this page to learn about configuring AEM Screens Windows 10 player.
uuid: da7e88bf-c251-481e-9029-f8fc4768b309
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
topic-tags: administering
content-type: reference
discoiquuid: 4228e8a1-9749-49a6-a1bb-365492bc2a3d
docset: aem65

---

# Implementing Windows 10 Player{#implementing-windows-player}

This section describes configuring AEM Screens Windows 10 player. It provides information of the configuration file and the options available and recommendations as to which settings to use for development and testing.

## Installing Windows Player {#installing-windows-player}

To implement Windows Player for AEM Screens, please install Windows Player for AEM Screens.

Visit the [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

### Ad-Hoc method {#ad-hoc-method}

The Ad-Hoc method allows you to install the latest Windows Player (*.exe*). Visit [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

Once you download the application, follow the steps on the player to complete the ad-hoc installation:

1. Long-press on the top left corner to open the admin panel.
1. Navigate to **Configuration** from the left action menu and enter the location (address) of the AEM instance you wish to connect to and click **Save**.
1. Navigate to the **Device** **Registration** link from the left action menu to check the status ofthedevice registration process.

>[!NOTE]
>
>If the **State** is **REGISTERED**, you will notice the **Device id** field will be populated.
>
>If the **State** is **UNREGISTERED**, you can use the **Token** to register the device.

### Bulk Server Configuration: Registering multiple Windows 10 Players with one Configuration {#bulk-server-configuration-registering-multiple-windows-players-with-one-configuration}

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
    "server": "https://localhost:4502",
    "resolution": "auto",
    "rebootSchedule": "at 4:00 am",
    "enableAdminUI": false,
    "enableOSD": false,
    "enableActivityUI": false
}
```

## Enabling Kiosk Mode {#enabling-kiosk-mode}

When you are deploying the Windows player, it is important to enable a Kiosk mode so that other applications or the taskbar does not appear on the Windows desktop.

>[!CAUTION]
>
>Adobe recommends a device management solution to enable Kiosk for Windows. Follow the steps below, if you do not have a device management solution to enable Kiosk mode. This method uses the Shell Launcher feature available in Windows 10 enterprise and Edu. Any other Microsoft recommended means for non-UWP apps can also be applied to enable Kiosk especially on other editions of Windows.

Follow the steps below to enable Kiosk mode:

>[!NOTE]
>
>Before you follow the steps below, ensure that you use Windows 10 Enterprise or Education.

1. Enable Shell Launcher.

   Refer to section ***Configure Shell Launcher*** in **[Shell Launcher](https://docs.microsoft.com/en-us/windows-hardware/customize/enterprise/shell-launcher)** page by Microsoft Windows support for additional information.

1. Create a non-administrative user (if you already do not have one) to be used for Kiosk. This can be a local or domain user.
1. Install the windows player for that Kiosk user from [AEM Screens Player Downloads](https://download.macromedia.com/screens/) page.
1. Refer to [Use Shell Launcher to create a Windows 10 kiosk](https://docs.microsoft.com/en-us/windows/configuration/kiosk-shelllauncher) to modify your PowerShell script for more information.

   Modify the PowerShell script to replace the username with the one you created. Ensure the path to the application executable is correct. This will set the custom shell as the windows player application for the kiosk user and set the default as explorer.exe for other users.

1. Run the PowerShell script as an administrator.
1. Reboot and login as the Kiosk user and the player application should start right up.

### Troubleshooting {#troubleshooting}

If you get a black screen when you login as the Kiosk user it means that you may have incorrectly specified the path to the windows player executable. Log back in as the administrator and verify and re-run the script.

The default installation path for Windows player is:

***C:\Users\&lt;your user&gt;\AppData\Local\Programs\@aem-screensscreens-player-electron\AEM Screens Player.exe***

The sample script in the links will enable and disable the custom shell. Hence you may need to split the script into two and enable/disable the below applicable lines:

>[!NOTE]
>
>In some windows environments the PowerShell scripts maybe restricted by policy (especially unsigned scripts). To run your script you may need to temporarily disable and re-enable this restriction to run the script. Open a PowerShell window and use these commands.
>
>*set-executionpolicy unrestricted* - to temporarily remove restrictions
>
>*set-executionpolicy restricted* - to re-enable restriction after running the script

```
# Remove the new custom shells.

$ShellLauncherClass.RemoveCustomShell($Admins_SID)

$ShellLauncherClass.RemoveCustomShell($Cashier_SID)
```

