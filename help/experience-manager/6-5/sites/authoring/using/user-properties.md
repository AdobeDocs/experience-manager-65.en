---
title: Configuring Your Account Environment
seo-title: Configuring Your Account Environment
description: AEM provides you with the capability to configure your account and certain aspects of the author environment
seo-description: AEM provides you with the capability to configure your account and certain aspects of the author environment
uuid: 99474a8a-3cb2-434b-9f85-e6b34d6b7f92
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
discoiquuid: 4ce69272-a601-493c-aa3c-b5c748f856be
index: y
internal: n
snippet: y
---

# Configuring Your Account Environment{#configuring-your-account-environment}

AEM provides you with the capability to configure your account and certain aspects of the author environment.

Using the [User](../../../../6-5/sites/authoring/using/user-properties.md#user-settings) option in the [header](../../../../6-5/sites/authoring/using/basic-handling.md#the-header) and the associated [My Preferences](#userpreferences) dialog, you can modify your user options such as.

Begin by acessing the [User](../../../../6-5/sites/authoring/using/user-properties.md#user-settings) option in the header.

### User Settings {#user-settings}

The **User** settings dialog gives you access to:

* Impersonate as

    * With the [Impersonate as](../../../../6-5/sites/administering/using/security.md#impersonating-another-user) functionality a user can work on behalf of another user.

* Profile

    * Offers a convenient link to your [user settings](../../../../6-5/sites/administering/using/security.md))

* [My Preferences](../../../../6-5/sites/authoring/using/user-properties.md#my-preferences)

    * Specify various preference settings unique to your user

![](assets/screen_shot_2018-03-20at103808.png)

### My Preferences {#my-preferences}

The **My Preferences** dialog is access via the [User](../../../../6-5/sites/authoring/using/user-properties.md#user-settings) option in the header.

Each user can set certain properties for himself or herself.

![](assets/screen-shot_2019-03-05at100322.png)

* **Language**

  This defines the language to use for the UI of the authoring environment. Select the required language from the available list.

  This configuration is also used for the classic UI.

* **Window Management**

  This defines the behavior or opening windows. Select either:

    * **Multiple Windows** (Default)

        * Pages will be opened in a new window.

    * **Single Window**

        * Pages will be opened in the current window.

* **Show desktop actions for Assets  
  **

  This option requires AEM desktop app to use.

* **Annotation Color**

  This defines the default color used when making annotations.

    * Click the color block to open the swatch selector to select a color.
    * Alternatively, enter the hex code for the desire color in the field.

* **Relative Date Presentation  
  **

  To improve readability, AEM will render dates within the last seven days as relative dates (e.g. Three days ago) and older dates as exact dates (e.g. 20 March 2017).

  This option defines how dates in the system are displayed. The following options are available:

    * **Always show exact date**: The exact date is always displayed (never a relative date).
    * **1 Day**: The relative date is shown for dates within one day, otherwise an exact date is shown.  
    
    * **7 Days (default)**: The relative date is shown for dates within seven days, otherwise an exact date is shown.  
    
    * **1 Month**: The relative date is shown for dates within one month, otherwise an exact date is shown.  
    
    * **1 Year**: The relative date is shown for dates within one year, otherwise an exact date is shown.  
    
    * **Always show relative date**: Exact dates are never shown and only relative dates are shown.

* **Enable Shortcuts**

  AEM supports a number of keyboard shortcuts that make authoring more efficient.

    * [Keyboard shortcuts for editing pages](/6-5/sites/authoring/using/page-authoring-keyboard-shortcuts.md)
    * [Keyboard shortcuts for consoles](/6-5/sites/authoring/using/keyboard-shortcuts.md)

  This option enables keyboard shortcuts. By default they are enabled, but can be disabled for example if a user has certain accessibility requirements.

* **Use Classic Authoring Experience  
  **

  This option enables [classic UI](/6-5/sites/classic-ui-authoring/user-guide.md)-based page authoring. By default the standard UI is used.

* **Enable Assets Home Page  
  **

  This option will only be available if your system administrator has enabled Assets Home Page experience for the entire organization.

* **Stock Configuration**

  This option allows to specify the preferred Adobe Stock configuration and is only be available if your system administrator has enabled [Adobe Stock integration](../../../../6-5/assets/using/aem-assets-adobe-stock.md).

