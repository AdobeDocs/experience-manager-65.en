---
title: Accessible features and interfaces of [!DNL Experience Manager Assets]
description: Know how accessibility features in [!DNL Adobe Experience Manager] 6.5 [!DNL Assets] help users with disabilities.
contentOwner: AG
feature: Asset Management
role: User, Developer, Leader
exl-id: 15555941-99a2-4586-8d7b-b22f3ec17805
solution: Experience Manager, Experience Manager Assets
---
<!--
Possible topics to cover in this article are below.

* Compile a list of enhancements done in the last ~1 year.
* Showcase a few prominent use cases (search?) in a screencast.
* Top-level actions supported, such as clickable UI elements, keyboard shortcuts, popup dialogs, and so on.
* List all UIs that are keyboard navigable.
* Unified list of the product tasks supported, such as, search assets, download assets, add or editing metadata, use DM Viewers, and so on.
* Do we need to add support matrix of user tasks with browser and screen reader combinations. Everything may not work in all browsers and/or using all screen readers.
* Any exceptions that users should be aware of. It may help to call out (it may be done in ACR) what tasks are NOT supported.
* CTAs – what's next and more info from AEM team:
  * Link to ACRs on a.com.
  * Generic a11y info by Adobe to begin with.
  * Link to a11y-specific online methods to report issues, seek support, or request enhancements, if any. Asked the a11y team on Slack.
-->

# Accessibility features in [!DNL Adobe Experience Manager Assets] {#accessibility-in-aem-assets}

[!DNL Adobe Experience Manager] allows content creators and publishers to serve amazing experiences on the web. Adobe strives to include the creators with disabilities by improving the accessibility of [!DNL Experience Manager]. The software is continuously enhanced to meet the needs of all types of users and adhere to the worldwide standards that include individuals with visual, auditory, mobility, or other impairments.

[!DNL Experience Manager] publishes conformance information that describes the standards it adheres to, outlines the accessibility features in the product, and describes the level of compliance. The accessibility conformance reports help [!DNL Experience Manager] users understand the level of adherence to various standards. The enhancements done in [!DNL Assets] let all users use the interfaces easily via keyboard, screen reader, magnifiers, and other assistive technology.

[!DNL Experience Manager] provides varying levels of support for the following standards:

* [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG/).
* [Revised Section 508 of the Rehabilitation Act](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines).
* [Accessibility Initiative – Accessible Rich Internet Applications (WAI-ARIA) by W3C](https://www.w3.org/WAI/standards-guidelines/aria/).
* [EN 301 549](https://en.wikipedia.org/wiki/EN_301_549).

To read a report with details of the level of compliance, see [Accessibility conformance report](https://www.adobe.com/accessibility/compliance.html) (ACR) page.

To know how [!DNL Dynamic Media] is accessible, see [accessibility in [!DNL Dynamic Media]](/help/assets/accessibility-dm.md).

## Assistive technologies {#at-support}

Users with disabilities frequently rely on hardware and software to access web content and use software products. These tools are known as assistive technologies. [!DNL Experience Manager Assets] can work with the following types of assistive technologies (AT) when using the software's core functionalities:

* Screen readers and screen magnifier.
* Speech recognition software.
* Keyboard usage – navigation and shortcuts.
* Assistive hardware, including switch controls, refreshable Braille displays, and other computer input devices.
* UI magnifying tools.

## [!DNL Experience Manager Assets] use cases that are accessible {#accessible-assets-use-cases}

In [!DNL Experience Manager], the accessibility features address two key requirements of [!DNL Experience Manager] users and their customers.

* For content designers and creators, there are features to create and publish accessible content that is used in turn by their customers and website visitors. The individuals with disabilities use the content with the help of assistive technologies. For details, see [web accessibility guidelines](/help/managing/web-accessibility.md).
* [!DNL Experience Manager] also lets its users and administrators with disabilities access user interface and controls to create and manage content. The individual with disabilities can use assistive technologies to navigate, use, and manage the [!DNL Assets] capability.

The core features in [!DNL Assets] are more accessible than before and are regularly updated to improve compliance with global standards. The CRUD operations in [!DNL Assets] have some degree of accessibility built into those. DAM workflows like adding, managing, searching, and distributing assets are accessible with the help of keyboard shortcuts, screen reader text, color contrast, and so on.

## Support for use of keyboard {#keyboard-use}

Many user interface elements that are clickable or actionable with a pointer can also be engaged with using keyboard. Using a keyboard, users can focus upon UI elements and take an appropriate action. Users can directly use keyboard shortcuts to trigger a command or an action without having to focus on UI elements and trigger it using keyboard. For example, users can open the timeline of an asset in the left side of user interface by browsing to the user interface control using a keyboard and selecting `Return`, and selecting `Alt + 2` keyboard shortcut.

<!-- TBD items:

* The option to toggle between list view and card view exposes relevant info to the screen readers. What about column view option? This info can go into 'basic handling' info aka article to 'understand and use the workspace'.
* How to open and browse through the profile popup dialog in [!DNL Experience Manager] UI using a keyboard? The navigation does not match the order of visual display of options on the UI. This info can go into 'basic handling' info aka article to 'understand and use the workspace'. What about setting preferences and impersonating a user?
* Using the [!DNL Experience Manager] tag browser and operating the options like delete tag? This info can go into 'basic handling' info aka article to 'understand and use the workspace'.
* Read-only form fields can be focused with the keyboard. Can users tab to these fields to understand the contents and are they able to copy text from the fields?
-->

### Keyboard shortcuts in [!DNL Assets] {#keyboard-shortcuts}

The following actions in [!DNL Assets] work with the listed keyboard shortcuts. Most keyboard shortcuts that apply to [!DNL Experience Manager] Consoles also apply to [!DNL Assets]. See [keyboard shortcuts for Consoles](/help/sites-authoring/keyboard-shortcuts.md#keyboard-shortcuts). See how to [enable or disable the keyboard shortcuts](/help/sites-authoring/keyboard-shortcuts.md#deactivating-keyboard-shortcuts).

| User interface or scenario|Keyboard shortcut|Action|
|---|---|---|
| Column view in [!DNL Assets] user interface|Up and Down Arrow keys|Navigate to files and folders within the same hierarchy.|
| Column view in [!DNL Assets] user interface|Left and Right Arrow keys|Navigate to files and folders above or below the current folder.|
| Browsing folders in [!DNL Assets]|`/`|Invoke search by opening Omnisearch box.|
| [!DNL Assets] Console|&grave;|Toggle side rails|
| [!DNL Assets] Console|`Alt + 1`|Open the content tree.|
| [!DNL Assets] Console|`Alt + 2`|Open [!UICONTROL Navigation] left rail.|
| [!DNL Assets] Console|`Alt + 3`|Display [!UICONTROL Timeline] of a selected asset.|
| [!DNL Assets] Console|`Alt + 4`|Open Live Copy references of the selected asset.|
| [!DNL Assets] Console|`Alt + 5`|Start search and search within the selected folder.|
| Asset or folder is selected|Backspace|Delete the selected asset or folder.|
| Asset or folder is selected|`p`|Open Properties page of the selected asset.|
| Asset or folder is selected|`e`|Edit the selected asset.|
| Asset or folder is selected|`m`|Move the selected asset.|
| Asset or folder is selected|`Ctrl + c`|Copy the selected asset.|
| Asset or folder is selected|`Esc`|Cancel the selection.|
| Dialog box opens and is in the focus|`Esc`|Close dialog box.|
| Inside a folder in DAM|`Ctrl + v`|Paste the copied asset.|
| [!DNL Assets] Console|`Ctrl + A`|Select all assets.|
| Asset property pages|`Ctrl + S`|Save changes.|
| [!DNL Assets] Console|`?`|See a list of keyboard shortcuts.|

## Sign in and navigate [!DNL Assets] user interface {#login}

Users can use keyboard to navigate to and fill in the sign-in field to log in. The error messages due to incorrect user name and password combinations on login page are announced by screen readers each time the error occurs.

After logging in, DAM users can navigate within [!DNL Assets] user interface using keyboard. The user interface elements, like left rail, menus, user profile, search bar, files and folders, and administration and configuration settings are navigable using keyboard. The keyboard navigation order is left-to-right and top-to-bottom. When navigating using a keyboard, an actionable option when focused is highlighted with better color contrast and is narrated by a screen reader. Where appropriate, the state -- for example, expanded, collapsed, and mixed-state -- of the focused options in the menu is announced by a screen reader. Also, screen reader announces the purpose of the actionable option, instead of, say the appearance or interface placement.

If a user expands the help or user profile option from the menu, screen reader announces the appropriate option or status. If a user expands the user profile option, the available options can be selected using a keyboard. For example, an administrator can impersonate a different user. If a user searches for a string from the [!UICONTROL Help] option, a narrator announces "Searching Help" to indicate that a search is in progress.

<!-- TBD: Removing for now. Add a more informative video later. Host it on tv.adobe

![Keyboard navigation of top options in [!DNL Experience Manager] user interface](assets/keyboard-navigation-in-aem.gif)

*Figure: Navigating through the options at the top of [!DNL Experience Manager] user interface using `Tab` key.*
-->

## Browse assets and view the related information {#browse}

In the [!DNL Assets] user interface, users can use keyboard to browse through the list of existing digital assets in DAM repository, preview or download an asset, see generated renditions, switch views, see the generated renditions, see timeline and version history, see comments and references, and view and manage metadata.

<!-- TBD: Not sure about the following list items mean:

In [!DNL Experience Manager] header section, when navigating in browse mode, screen reader now announces,
  
  * Suggestions to search in Omnisearch.
  * The state as expanded or collapsed for Solutions, Help, Inbox and User options.
  * The Searching Help status message that is displayed when user enters a search string in Search for Help field under Help option
  * The error message if incorrect value is entered in Impersonate as field under User option and focus correctly moves to the text field (NPR-33804).

Review CQ-4282133 before adding - Close option in a coral-dialog was not accessible through keyboard, due to which user cannot trigger close option through keyboard press in version preview dialog. After fix, user can close dialog through close option using keyboard.

* CQ-4273122 - Assets of video/audio type will have aria-label in format "Multimedia player: <Title>" so users relying on screen-reader will get to know that they are video/audio assets.
-->

When browsing the assets repository, the following functionality improves accessibility:

* Screen reader announces text alternatives that depict the purpose or functionality of the icons instead of their names.
* Users can access and focus the interactive user interface options in References list of assets using keyboard keys.
* The elements in each row in list view are announced as the elements of the same row by screen readers.
* When navigating using `Tab` key, the focus can move to the close option in the version preview.
* When using keyboard to browse, the highlighted actionable user interface options have more prominent visual focus with enhanced contrast. It makes the focused area more identifiable to the user.
* Use of the `Esc` key to remove the quick action icons from thumbnail view does not remove the keyboard focus from the last focused item.
* With an asset selected, selecting `Alt + 4` keyboard shortcut opens the [!UICONTROL References] list in the left rail. Using `Tab` key, users can navigate through the non-zero reference entries. Browsing through only the non-zero reference entries saves effort and keystrokes as well.
* Comments on an asset are available in the asset timeline. It is accessible if left rail is accessed using a keyboard or a keyboard shortcut.
* [!UICONTROL View Settings] in [!DNL Experience Manager] are accessible using a keyboard. Users can navigate through the available card sizes using the arrow keys and select and tab through to navigate through and set other elements in the existing View Settings view.

<!-- TBD: Gradually, as more enhancements are done in these categories, add more content.

## Add and upload digital assets {#upload}

## Configure and administer [!DNL Assets] {#config-admin}

* List the a11y fixes in workflows to configure and administer [!DNL Experience Manager Assets]?
* Some enhancements in Processing profiles creation or application to a folder?
* Some enhancements to metadata properties UI?
-->

## Manage digital assets {#manage-assets}

Many asset management tasks such as CRUD operations, downloading an asset, adding metadata are accessible to various degrees. [!DNL Assets] lets you accomplish the tasks using various assistive technologies such as a screen reader and a keyboard.

See a video demonstration of how to use a keyboard to [browse the repository and download an asset](https://youtu.be/K3dgqMRQJys).

For metadata operations that are typically done by roles such as marketers and administrators the following features improve accessibility:

* [!UICONTROL Save & Close] option on asset [!UICONTROL Properties] page can now be accessed using the keyboard.
* Screen readers announce the options to delete the selected tags in [!UICONTROL Basic] tab of asset [!UICONTROL Properties].
* Users can use the Datepicker popup dialog with a keyboard. The Datepicker user interface element is used to set on-times and off-times, and select date.
* The drag functionality using keyboard correctly functions in [!UICONTROL Metadata Schema Editor] in browse mode of screen reader.
* A user can move the focus using keyboard to the Add User or Group field under [!UICONTROL Closed User Group] in the [!UICONTROL Permissions] tab of folder [!UICONTROL Properties].

## Search digital assets {#search-assets}

A quick and seamless asset search experience boosts content velocity. The content velocity use cases are part of core [!DNL Assets] functionality. To start a search from the Omnisearch bar, users can use keyboard shortcut `/` or use `Tab` along with screen readers to quickly locate the search option. The screen reader narrates the name of the option as "Search Button" when the focus is on the search option ![search option](assets/do-not-localize/search_icon.png). Users can select `Return` to open the Omnisearch box. The screen reader not only narrates the keyword typed in search box but also narrates the suggestions offered by [!DNL Experience Manager Assets]. Users can use a combination of arrow keys, `Return`, and `Tab` to access the various options to trigger a search.

Search functionality is made accessible by the following functionality:

* Page title, as available to a screen reader, helps to identify the page as assets' search page.
* Users search for assets from within the Omnisearch field. Users can open it using either the keyboard navigation or the keyboard shortcut `/`.
* Users can start typing the search keyword and then select the auto-suggestions using arrow keys. Highlighted suggestion can be selected using the `Return` key and assets are searched for the selected suggestion.
* Screen readers can identify and announce the mixed-state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel when filtering search results.
* User focus moves to the search options after Omnisearch box is closed.

When filtering search results:

* Search result page has an informative title for better understanding of screen reader users.
* A screen reader announces the options in search filter as expandable accordions.
* Predicates that have mixed-state options are announced by screen readers.

## Share assets {#share-assets}

<!-- TBD: Anything about accessibility in DA, BP? AAL team confirmed that there's no content for AAL a11y on helpx.
-->

When sharing assets, the following functionalities improve the accessibility:

* A user can move the focus using keyboard within Search and Add Email Address field in the link sharing dialog.

* In the link sharing dialog, when navigating in browse mode, the screen readers,

  * Do not narrate the table information when the dialog is loaded.
  * Can navigate to all the listed suggestions.
  * Narrate the displayed suggestions for Add Email Address and Search fields.

## Accessible documentation {#accessible-docs}

[!DNL Experience Manager] provides accessible documentation for use by people with disabilities. The following helps make the content offering accessible for now, while Adobe continues to improve the template and the content:

* Screen readers can read the text.
* Images and illustrations have alt text available.
* Keyboard navigation is possible.
* Contrast ratios help highlight some parts of the documentation website.

## Provide feedback {#a11y-feedback}

To provide feedback, ask questions, and request product enhancements, related to accessibility, use the following methods:

* Fill the form at [www.adobe.com/accessibility/feedback.html](https://www.adobe.com/accessibility/feedback.html).
* Email us at access@adobe.com.

>[!MORELIKETHIS]
>
>* [Accessibility features in [!DNL Dynamic Media]](/help/assets/accessibility-dm.md).
>* [Release notes of enhancements done in each Service Pack release](/help/release-notes/release-notes.md).
>* [[!DNL Adobe Experience Manager] accessibility guidance](/help/managing/web-accessibility.md).
>* [Conformance reports (ACR) and VPAT listing for Adobe solutions](https://www.adobe.com/accessibility/compliance.html).
