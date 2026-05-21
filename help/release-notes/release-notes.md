---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
role: User,Admin,Developer
exl-id: 811fccbc-6f63-4309-93c8-13b7ace07925
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!--
DO NOT DELETE THIS HIDDEN NOTE!      DO NOT DELETE THIS HIDDEN NOTE!
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section.
-->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.25.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | May 21, 2026 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

<!--
OLD DOWNLOAD URL
(https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip)
-->

## What is included in [!DNL Experience Manager] 6.5.25.0 {#what-is-included-in-aem-6525}

[!DNL Experience Manager] 6.5.25.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5.

<!-- UPDATE FOR EACH NEW RELEASE -->

<!-- ## Key features and enhancements -->


## Fixed issues in Service Pack 25 {#fixed-issues}

<!-- 6.5.25.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 


### [!DNL Sites]{#sites-6525}

#### Accessibility {#sites-accessibility-6525}

* Table row drag-and-drop controls in Sites list view now work with keyboard navigation. Screen reader and keyboard users can reorder rows and receive feedback during the action. (SITES-24946) 

* The Edit Layout toolbar now presents smaller screen and tablet labels in a meaningful screen reader sequence. Users hear the labels with the related ruler measurements instead of hearing them out of order. (SITES-25291)
* The Swatches popover modal now manages focus correctly when it opens from the Annotation Modal. Focus starts at the modal heading instead of moving directly to the selected swatch button. (SITES-25275)
* The Teaser Modal now provides an accessible way to move the dialog box with a keyboard. Users no longer need a mouse to reposition the modal on the page. (SITES-25226)
* Card View improves accessibility by removing unnecessary ARIA grid behavior. Screen reader users receive clearer card information without grid navigation controls that do not match the visual layout. (SITES-24933)
* Tooltips in the Delete modal now display consistently after repeated hover actions. Users can move the pointer away and return to the icon to read the tooltip again. (SITES-24778)
* The Left Rail now receives focus in the expected order after users open it from the Sites home page. Keyboard and screen reader users can move from the configuration button to the rail content without skipping the expanded area. (SITES-24754)
* Focus management now works consistently in the Carousel modal dialog box. Keyboard and screen reader users can start at the modal heading and return to the original control after closing the dialog box. (SITES-24716)
* The Link selection dialog box now returns focus to the control that opened it after users close the dialog box. Keyboard and screen reader users no longer lose their place after closing the dialog box. (SITES-24707)
* The Image modal no longer moves focus to the first tab or main page landmark when authors open or close the dialog box. Focus moves to the dialog box heading first, then returns to the control that opened the dialog box. (SITES-24693)
* The References Rail now manages focus correctly when a modal dialog box opens. Keyboard and screen reader users remain inside the dialog box until they close it, then continue navigation without losing context. (SITES-24683)
* The Hyperlink path selection modal no longer moves focus to the wrong field or control when authors open or close it. Focus starts at the modal heading and returns to the button that opened the modal. (SITES-24672)
* The Teaser modal no longer moves focus to the first tab or top of the page when authors open or close it. Focus now follows the expected dialog box flow and reduces unnecessary screen reader announcements. (SITES-24522)

* The Page Editor lock button now provides more precise screen reader feedback. Screen readers use the title attribute when available, which reduces verbose announcements for authors who use assistive technology. (SITES-41431)
* Keyboard navigation now skips hidden content. Users can move through visible interface elements without focus shifting to content that they cannot see. (SITES-41430)
* Keyboard focus now returns to the triggering element after users close an overlay. The Page Editor no longer sends focus back to the overlay, which improves navigation for keyboard users. (SITES-40819)
* The Page Editor toolbar now displays labels, such as tooltips, when users navigate toolbar items with a keyboard. Users can understand each toolbar action as focus moves from item to item. (SITES-40751)
* Hovering over Component Browser items no longer removes focus from an active Text component. Authors can edit text without interruption, and keyboard focus remains predictable. (SITES-35370)
* Screen readers now announce the Search Modal sort direction button more clearly. The button label no longer repeats the same direction, and it better describes the toggle behavior. (SITES-25534)
* The Search Modal now shows a visual indicator for the selected option in the Change File or Folder list box. Users can identify the current breadcrumb option without relying on focus alone. (SITES-25532)
* The Search Modal now increases contrast for the Sort By label. The text meets accessibility requirements and improves readability for users with low vision. (SITES-25531)
* Device selection buttons now expose the correct current-state information in the Edit Layout toolbar. Screen reader users can identify the active device without hearing misleading toggle status. (SITES-25524)
* Keyboard and screen reader navigation now closes the Inbox menu when focus leaves it. Users avoid the confusing state where the menu stays open while focus moves elsewhere. (SITES-25518)
* Keyboard and screen reader navigation now closes the Help menu when focus leaves it. Focus no longer moves to content outside the menu while the menu remains open. (SITES-25517)
* The Content Fragments Home Page now provides a consistent accessible label for sidebar tabs. NVDA announces the tab label correctly when users navigate the tab controls. (SITES-25509)
* Focused options in the Page Information menu now meet minimum contrast requirements. The improved contrast helps users with low vision identify the active menu item. (SITES-25321)
* Keyboard navigation now skips hidden controls in the collapsed Demographic toolbar. Focus stays on visible interactive elements, which improves navigation order in Layout Preview. (SITES-25304)
* The Rotate Device button now provides clearer screen reader feedback in the Edit Layout toolbar. Screen readers announce the current orientation and the action that changes it. (SITES-25292)
* The Edit Layout toolbar now displays a clear selected state for the Desktop button. The Desktop option matches the other device buttons and makes the active view easier to identify. (SITES-25290)
* The Edit Layout toolbar now labels the ruler region for assistive technologies. Screen reader users no longer encounter unlabeled measurement values during layout editing. (SITES-25287)
* The Edit Layout toolbar now displays the full iPhone 8 Plus button label in the unchecked state. The label no longer truncates when enough space exists around the button. (SITES-25284)
* The reported issue described a focus indicator in the Edit Layout toolbar that appeared to cover multiple device controls. The concern focused on keyboard users who might lose track of the active control when the focus outline included adjacent buttons. The issue was working as designed. (SITES-25283)
* The reported issue described Annotation Modal buttons that announced Annotation before each button label. The concern focused on unclear screen reader output for actions such as Annotate, Swatches, and Delete. (SITES-25277)
* Annotation button text now uses sufficient contrast in the Annotation Modal. This update improves readability for users with low vision and supports WCAG contrast requirements. (SITES-25267)
* Screen readers now receive status updates when users filter the Insert New Component list. The modal announces result changes so users understand that the list changed while they typed. (SITES-25251)
* The logged issue described missing heading semantics for the Annotation Modal title. The concern focused on screen reader navigation and the ability to understand modal structure. (SITES-25248)
* Heading levels in the Page Editor side rail now follow a clearer content hierarchy. The Left Rail section no longer appears as the main page heading for assistive technologies. (SITES-25222)
* The Edit button in the Assets Left Rail now has a larger touch target. Users with mobility needs can activate the button more easily and avoid nearby controls. (SITES-25221)
* The Assets Left Rail now identifies when the Edit button opens a new browser tab. Users can anticipate the navigation change instead of losing context unexpectedly. (SITES-25220)
* Component titles now display correctly when users apply increased text spacing. The side rail preserves readable labels and supports WCAG text-spacing requirements. (SITES-25219)
* The filter field in Side Rail Components now exposes a proper accessible name. This update helps screen reader users identify the field without relying on placeholder text. (SITES-25212)
* The reported issue described an illogical focus sequence in Annotation Mode. Keyboard users reportedly missed the annotation toolbar unless they used Shift+Tab after activating the mode. (SITES-24996)
* The Editor Canvas exposes its top-bar title as a heading. Screen readers can announce the title with the correct structure, which improves navigation and page comprehension. (SITES-24993)
* The accessibility report noted insufficient contrast for the loading status message that appears while users switch views. The concern focused on readability for users with low vision or color blindness. (SITES-24991)
* The accessibility report noted that card links included non-descriptive text. The concern focused on helping screen reader users understand each link destination without extra context. (SITES-24975)
* The Sites list view now displays Live Copy text with stronger contrast. The update improves readability for authors with low vision and for users working under bright screen conditions. (SITES-24956)
* Keyboard navigation now moves focus into the Emulator menu after users expand it. This behavior helps screen reader and keyboard users access the menu options in the expected order. (SITES-24954)
* Sites list view now improves the visibility of drag-and-drop buttons in table rows. Authors can identify the control more easily when they reorder content. (SITES-24951)
* A card no longer exposes both the image link and the heading link as separate links when they share the same destination. The update reduces screen reader verbosity and improves navigation efficiency. (SITES-24947)
* Header menu buttons now use more accurate accessibility attributes. Screen readers announce the buttons as expandable controls instead of dialog box-opening controls. (SITES-24742)
* The Inbox now marks related links with semantic list markup. Screen reader users can understand the number and grouping of Inbox links more easily. (SITES-24730)
* Header button labels now avoid verbose accessible names. Screen reader users receive clearer announcements without duplicate role information from icon text. (SITES-24715)
* The CSV Report button now provides clearer feedback about new-tab behavior. Users can understand that selecting the button opens a new browser tab before they activate it. (SITES-24704)
* Modal dialog boxes now use more accurate accessibility markup for header controls. Help and Toggle fullscreen buttons remain interactive controls and no longer appear as headings to screen readers. (SITES-24696)
* The Filter Rail landmark now uses a distinct label that identifies its purpose. Screen reader users can navigate pages with multiple similar landmarks more confidently. (SITES-24686)
* References Rail messages now provide better readability for users who rely on sufficient text contrast. The reported issue involved selection and multi-selection messages that appeared too light against their background. (SITES-24666)
* The Search modal now provides larger touch targets for the Remove Location and Close buttons. This change helps users with hand tremors, spasms, or low vision activate the intended control. (SITES-24530)
* The Adobe Experience Manager header link was reported as using an incorrect ARIA attribute. Testing confirmed that the link controls expandable content, so the existing accessible state remains appropriate. (SITES-24528)
* The focus indicator for the Byline button no longer appears cut off in the Components list. The visible outline helps keyboard users track their position in the editor. (SITES-24503)
* A reported issue described a missing text alternative for the information tooltip icon in the Components panel. The issue did not reproduce, but the review confirmed that informative icons must expose a clear accessible name. (SITES-24500)
* Page Editor no longer exposes multiple region landmarks with the same label. Each landmark now has a unique accessible name, so screen reader users can identify the current region. (SITES-24497)
* The Change file or folder control now separates the control label from its state information. Screen reader users hear a shorter, clearer name when they navigate the header control. (SITES-24496)
* Interactive controls in the Content Fragment Admin table now support standard keyboard navigation. Keyboard users can tab to buttons and links instead of discovering them only through arrow-key navigation. (SITES-24285)
* The Sites Admin UI now treats decorative Globe icons correctly for screen readers. The icons use empty alternative text so users hear only meaningful interface content. (SITES-3057)

#### Admin User Interface{#sites-adminui-6525}

The Sites console now shows saved **List View** column settings correctly. Selected columns remain checked when authors reopen the settings dialog box, and the active column count stays accurate. (SITES-38576)

#### Classic UI{#sites-classicui-6525}

Classic UI Text component dialog boxes now display Rich Text Editor content as formatted text instead of raw HTML. Authors can edit existing text without switching to Source mode or manually removing markup. (SITES-38709)

#### Component Console{#sites-component-console-6525}

* Users can now search the Components console with localized or multibyte characters. The console also shows a localized **Remove** label instead of the untranslated English string. (SITES-39747)
* The Component Properties page now localizes strings in Tools > Components > Component Properties. Users no longer see untranslated English labels in localized authoring interfaces. (SITES-39745)

#### [!DNL Content Fragments]{#sites-contentfragments-6525}

Assets Search now responds correctly when users select or change filters. The filtered result set updates as expected, which restores reliable search refinement in the Assets console. (SITES-38686)

#### [!DNL Content Fragments] - Admin{#sites-admin-6525}

* The Assets list view now shows a localized Checked Out By tooltip for locked Content Fragments. This fix improves localization consistency when authors review workflow rows. (SITES-42531)

* AEM now localizes the Main label in the Content Fragment download dialog box. The fix keeps the download workflow consistent across non-English locales. (SITES-42534)
* AEM now translates the `Later` status label when authors schedule Content Fragment publication from Assets. This fix keeps the Published column consistent across localized interfaces. (SITES-42532)
* Content Fragment creation now displays a localized validation message when authors enter invalid characters in the Title field. The dialog box no longer shows the unlocalized "Invalid name provided" string. (SITES-19796)
* The edit Content Fragment page now uses localized labels for Tags and Collections. Authors see translated field names instead of unlocalized English strings. (SITES-977)

#### [!DNL Content Fragments] - Fragments Editor{#sites-fragments-editor-6525}

* Associated Content in the Content Fragment Editor now shows the correct localized string when authors remove content from a collection. The dialog box no longer replaces the content name with undefined. (SITES-33675)
* The Content Fragment Editor now displays a translated General label for tabs without a configured placeholder. Localized interfaces no longer show the untranslated English string in that editor area. (SITES-30715)
* The Content Reference picker in the Content Fragment Editor now shows localized labels for allowed asset types. Localized interfaces no longer display English type names for supported asset categories. (SITES-29699)

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6525}

* GraphQL JSON responses now include embedded image references from Content Fragment Rich Text fields when DAM filenames contain spaces or non-ASCII characters. This fix helps applications render referenced images without requiring authors to rename assets. (SITES-42191)
* GraphQL responses for Content Fragments now handle persisted queries more reliably. The updates correct duplicate cache headers, improve encoded variable handling, and return clearer responses for missing content or failed queries. (SITES-40159)
* GraphQL persisted queries now run without unnecessary ERROR and WARN messages in the logs. AEM handles encoded variables correctly, so successful queries no longer create misleading `PersistedQueryServlet` entries. (SITES-39354)

* The Edit GraphQL endpoint dialog box now localizes its interface strings. Users no longer see the untranslated GraphQL schema is taken from configuration message in localized interfaces. (SITES-34018)

#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6525}

Users can now open GraphQL Query Editor when the selected configuration browser name contains CJK or Cyrillic characters. The editor displays persisted queries for the endpoint instead of showing an error. (SITES-31616)

#### [!DNL Content Fragments] - Models & Model Editor{#sites-models-model-editor-6525}

* Users now see a localized validation message in the Content Fragment Model Editor when a selected value needs a valid model type. The editor no longer displays the untranslated English message in localized interfaces. (SITES-41117)
* The Content Fragment Model filter panel now localizes its status and title strings. Users no longer see untranslated labels such as Model Title, Status, Draft, Enabled, and Disabled. (SITES-30863)

<!-- #### [!DNL Content Fragments] - REST API{#sites-restapi-6525} -->

#### ContextHub{#sites-contexthub-6525}

ContextHub now loads without a JavaScript error that interrupted personalization. Teasers and other personalized experiences can render correctly on affected pages. (SITES-38430)

<!-- #### Core Backend{#sites-core-backend-6525} -->

#### Core Components{#sites-core-components-6525}

* AEM no longer generates repeated ThumbnailServlet errors when a request targets a missing DAM resource. The servlet stops processing after the redirect, which prevents NullPointerException entries from flooding the error log. (SITES-41238)
* AEM no longer flags optional dialog box fields as required when authors reopen component dialog boxes. The dialog box keeps validation focused on fields that actually require input, which prevents misleading tab-level errors. (SITES-40449)

* AEM includes several backported security fixes that strengthen Sites and related Cloud Services components. These fixes reduce cross-site scripting risk and improve request handling across affected authoring paths. (SITES-38314)
* The Image v3 component configuration dialog box now localizes strings in the Page Editor. Authors no longer see untranslated labels when they configure Image components in localized interfaces. (SITES-38726)

<!-- #### Campaign integration{#sites-campaign-integration-6525} -->

<!-- #### ContentHub {#sites-contenthub-6525} -->

#### Crosswalk {#sites-crosswalk-6525}

* Crosswalk no longer requires separate package and configuration setup after installation. AEM includes the required bundles, content packages, system users, service user mappings, and feature toggles in the out-of-the-box package. (SITES-41417)
* Crosswalk workflows now work with the required cq-wcm-core support in AEM 6.5. Authors can use Create Template and Open Universal Editor actions without separate core bundle updates. (SITES-37666)

#### Experience Fragments{#sites-experiencefragments-6525}

AEM now loads the correct templates when authors create Experience Fragment variations and scroll past the first 40 results. The Template Picker keeps the selected Experience Fragment path during pagination. (SITES-41531)

<!-- #### Foundation Components (Legacy){#sites-foundation-components-legacy-6525} -->

#### Launches{#sites-launches-6525}

* The Sites Timeline now localizes the message that appears when AEM creates a version before promoting a launch. Users no longer see the untranslated English string in localized interfaces. (SITES-39157)
* The Launches list now displays the correct description for launches created without template or live copy inheritance. Users no longer see the misleading Overridden template label. (SITES-34229)

<!-- #### Link Checker{#sites-link-checker-6525} -->

#### Localization{#sites-localization-6525}

* Text component properties in Experience Fragments now use localized labels. The format menu no longer shows unlocalized strings for paragraph, heading, quote, or preformatted text choices. (SITES-15091)

* Template status text now aligns correctly in **Tools** > **General** > **Templates**. The updated, enabled, and published status labels appear on one horizontal line. (SITES-36797)
* The Move Page dialog box now shows the full Select Date & Time label. The label no longer truncates in localized interfaces such as French. (SITES-36795)
* The Assets section in the Template Editor now shows a translated Tags label. Localized authoring interfaces present consistent labels during template configuration. (SITES-33770)
* Page Policy descriptions now render correctly in the Template Editor. Users can read the full Default CSS Classes guidance without truncated text in the Styles tab. (SITES-29724)
* The Template Editor now displays a localized error when an author tries to drag a component onto a deleted template. The message no longer appears as an untranslated "while processing" string. (SITES-19313)
* The "Target" label in the Teaser Configure window now appears with localized text. The Hyperlink section no longer shows the English string in non-English locales. (SITES-18622)
* The Start Workflow dialog box in the Page Editor now displays localized workflow action labels. Authors no longer see English strings for workflow options such as approval, publish, request, and unpublish actions. (SITES-18103)
* The Parent drop-down menu in the Separator edit panel now displays localized strings without truncation. Authors can review the full label when they configure the component. (SITES-17480)
* The Page Editor now displays localized labels for "Full Width" and "Fixed Width" in the Container component Styles menu. Authors who use supported locales no longer see those strings in English. (SITES-17478)
* Authors can now read the full tooltip in the Navigation properties area of the Templates console. The UI keeps the tooltip aligned and prevents text truncation during template editing. (SITES-15480)
* Authors can now read the full "Forms & Documents Using Template" label in the References side panel. The Templates console no longer cuts off the string for supported locales. (SITES-13167)
* The References view now uses localized text for the refresh error message. Authors see translated messaging when AEM cannot update the references list. (SITES-13102)
* Form validation now identifies the field that contains an invalid time value. The Time Warp modal displays clearer error messaging so authors can correct the affected Hours or Minutes field. (SITES-10980)
* The Templates console now displays a localized Assets label in the Select Image dialog box. The label appears correctly when authors browse assets from template properties. (SITES-8113)

#### MSM - Live Copies{#sites-msm-live-copies-6525}

* The Live Copy Overview now localizes date formats in the Relationship Status view. The L**ive Copy Source Last Modified**, **Live Copy Last Modified**, and **Last rolled out** fields show dates that match the user's locale. (SITES-40756)
* MSM now logs more details for push-on-modify events. The added event information helps teams trace rollout activity and identify the source of unexpected page changes. (SITES-38029)

#### Page Editor{#sites-pageeditor-6525}

* Authors can now create tags that include capital letters or spaces and apply them during the first Page Properties save. AEM creates the tag and writes the correct value to the page metadata during the same operation. (SITES-42550)

* Authors can now create Content Fragments in DAM folders whose names contain an apostrophe. AEM handles the encoded folder path correctly and no longer triggers a NullPointerException during creation. (SITES-38653)

* AEM now supports copy-and-paste actions for configured Content Fragment components in the Page Editor. The component retains its Content Fragment reference, so authors can duplicate content without manual reauthoring. (SITES-41586)
* The Page Editor now displays first-field description tooltips correctly in component dialog boxes. Long descriptions remain visible, so authors can review field instructions without losing text at the top of the tooltip. (SITES-39937)
* Authors can now open the Rich Text Editor Link dialog box when they use AEM over HTTP. The fix restores link editing for on-premise environments that do not use HTTPS. (SITES-39467)

<!-- #### Replication{#sites-replication-6525} -->

<!-- #### Rich Text Editor{#sites-rte-6525} -->

#### Universal editor {#sites-universal-editor-6525}

* Universal Editor no longer opens in Preview mode by default. AEM sends users to the production Universal Editor environment unless they explicitly request preview behavior. (SITES-37193)
* Universal Editor now opens in Preview mode for AEM development, rapid development, and stage environments. The Open command uses the correct preview behavior for non-production instances. (SITES-33839)

### [!DNL Assets] {#assets-6525}

* The My Shares client library now handles shared asset title data safely before adding it to page markup. Generated share pages no longer expose users to script injection through manipulated asset metadata. (ASSETS-60898)

* Adobe Stock licensing now works correctly in the Assets user interface. The License button no longer stays disabled after AEM loads the stock asset profile and entitlement data. (ASSETS-62610)
* The out-of-the-box asset expiry notification now handles near-expiry dates correctly. Reminder emails run when the remaining time reaches the configured threshold instead of skipping assets with an eight-day expiry. (ASSETS-57857)

* AEM Assets now restores keyboard navigation after users choose a saved search. The interface lets users move away from the dropdown without refreshing or restarting the Assets view. (ASSETS-52061)

* The Admin View download workflow now preserves ZIP file names correctly. Downloading a ZIP asset no longer produces a file name with a double .zip extension. (ASSETS-62207)
* The Assets reference workflow now handles spaces in file names correctly. Related asset updates no longer fail when a selected file name includes one or more spaces. (ASSETS-56418)

#### [!DNL Dynamic Media]{#assets-dm-6525}

The Subtitles and Audio Tracks dropdown now shows Arabic as a supported language in Dynamic Media. This update lets users add Arabic subtitle tracks without custom workarounds. (ASSETS-61771)

### [!DNL Forms]{#forms-6525}

>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on package is planned for release on Thursday, May 28, 2026. In addition, a list of Forms fixes and enhancements is added to this section.



<!-- ALL THE FORMS BUG FIXES LISTED BELOW GO WITH AEM 6.5.25 FORMS MAY 28 2026 RELEASE!! UNHIDE THEM!! -->




<!-- #### Forms Designer {#forms-designer-6525} -->

<!-- 
* The Output API now handles dynamic form content consistently when PDF generation uses client rendering. Generated PDFs retain scripted description text across affected sections instead of leaving some fields blank. (LC-3928858)
* Document of Record generation now handles repeated panel pagination correctly when parent and child panels use the same "Place Top of Next Page" configuration. Authors no longer lose child panel data during the first repeated panel instance in generated output documents. (LC-3923274)
* Long multiline text fields in PDF preview now flow correctly across pages. The generated PDF no longer duplicates page content or drops hidden text during printing. (LC-3924324)
* Fillable PDFs now reset accessibility data when users clear form fields. Screen readers announce the cleared state correctly instead of reading old field values that no longer appear in the form. (LC-3923872)
* The Accessibility Checker now handles Nepali text correctly during PDF validation. Users can check Nepali-language documents without false accessibility errors tied to character encoding. (LC-3922988) 
-->

<!-- #### XMLFM {#forms-xmlfm-6525} -->

<!-- 
* Generated PDFs now include proper tags for supported form fields that use borders in the template. Screen readers can identify numeric fields, date fields, text fields, and checkboxes more reliably. (LC-3923534)
* Document of Record output now applies the correct tag structure to supported fields that include borders in the template. Numeric, date, text, and checkbox fields remain accessible in the generated PDF. (LC-3923265)
-->

<!-- #### XTG {#forms-xtg-6525} -->

<!-- 
* Forms output now merges XML data correctly when generatePDFOutputBatch generates PDFs in batch mode. The batch process no longer creates documents with blank or missing merged fields. (LC-3924192) 
* Document of Record output now includes nested child panels in the first occurrence of a repeatable panel. Forms that use Top of Next Page pagination no longer drop child panel data from the generated output. (LC-3923923)
* Custom bullet characters in XDP templates now map correctly for accessible PDF output. PAC validation no longer reports that text object characters cannot map to Unicode. (LC-3923079) 
-->


### Foundation {#foundation-6525}

#### Apache Felix {#foundation-apachefelix-6525}

Startup now wires the CredentialsSupport service correctly for Felix-based authentication. This prevents dependency errors that can affect token authentication during AEM startup. (GRANITE-63186)

<!-- #### Campaign{#foundation-campaign-6525} --> 

<!-- #### Cloud Services{#foundation-cloudservices-6525} -->

<!-- #### Communities {#foundation-communities-6525} -->

<!-- #### Content distribution{#foundation-content-distribution-6525} -->

#### CRX {#foundation-crx-6525}

JSP file editing now works as expected in CRXDE Lite after AEM 6.5 upgrades. The CodeMirror editor loads the file content instead of leaving the JSP tab blank. (GRANITE-64333)

<!-- #### Granite{#foundation-granite-6525} -->

<!-- #### Integrations{#foundation-integrations-6525} -->

<!-- #### Jetty{#foundation-jetty-6525} -->

#### Localization{#foundation-localization-6525}

* The certificate upload dialog box in Security > Trust Store now shows localized data format labels. Users no longer see unlocalized English labels when they add a certificate. (NPR-43412)

* The Create KeyStore dialog box now aligns the Cancel button with the other dialog box buttons. The button layout remains consistent and no longer shifts out of alignment. (NPR-43291)
* The Check dialog box in **Security** > A**dobe IMS Configurations** now displays localized confirmation text. The check and delete messages no longer appear as unlocalized English strings. (NPR-43289)
* Localized UI labels now appear correctly in affected dialog boxes and the Keystore tab. Aria-label values use translated strings, and password field labels display without truncation. (NPR-43285)
* The Create New User workflow now shows localized validation errors for invalid characters. Users receive a clear, translated message instead of an unlocalized IllegalArgumentException string. (GRANITE-52920)

<!-- #### Oak {#foundation-oak-6525} -->

#### Platform{#foundation-platform-6525}

* The Show Tag References button now displays the number of references for the selected tag. This update helps users understand tag usage without extra navigation. (CQ-4355509)
* The Move dialog box in Tagging now positions validation messages correctly. Error text no longer covers the search path icon when users submit the dialog box with an empty required field. (CQ-4353009)

#### Security{#foundation-security-6525}

AEM now allowlists additional keywords that contain client-secret. Configuration creation no longer fails when supported integrations use those client-secret naming patterns. (GRANITE-66495)

<!-- #### Sling{#foundation-sling-6525} -->

<!-- #### SPA editor {#foundation-spa-editor-6525} -->

#### Translation{#foundation-translation-6525}

Translation project status counts now update correctly after upgrade. Authors can review draft, in-progress, and complete values without relying on outdated metadata from earlier service pack behavior. (NPR-43418)

#### User interface{#foundation-ui-6525}

* Manually entered Sites console URLs now resolve to the intended page or folder path. The content hierarchy remains consistent after refresh and no longer falls back to the base URL. (NPR-43688)
* The CRX Package Manager test suite no longer fails after an AEM 6.5 LTS SP1 instance upgrades to LTS SP2. The thumbnail list servlet test now completes as expected. (NPR-43534)

* The Sites console content tree now loads consistently after each browser refresh. Authors no longer see a blank left rail or a "There is no item" message when content exists. (NPR-43442)

<!-- #### WCM{#foundation-wcm-6525} -->

#### Workflow{#foundation-workflow-6525}

* The workflow model editor now validates tenant-specific workflow model paths correctly. Customers who store workflow models under tenant-level /conf paths can edit those models without moving them to global configuration paths. (GRANITE-65376)

* The workflow model editor now normalizes Windows file paths during path validation. Authors can edit workflow models on Windows servers without access errors that block model updates. (GRANITE-63692)
* Task creation now includes server-side validation for due dates. Users cannot create tasks with a due date that occurs before the start date, which keeps inbox task data consistent. (CQ-4362253)
* Namespace creation now handles localized text correctly. Users can enter non-Latin characters in the Title field and create the namespace without a validation error. (CQ-4355587)

## Install [!DNL Experience Manager] 6.5.25.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.25.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.25.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.25.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.25.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.25.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.25.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.25.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.20 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE. CHECK WITH SAMEER DHAWAN -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the Service Pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/deploying/deploy), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.25.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.25/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.25</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.



## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md) for a detailed list of all features deprecated or removed for AEM 6.5.

### Content Fragment support in the AEM Assets REST API {#cf-support-assets-rest-api}

AEM 6.5 LTS SP2 provides modern OpenAPIs for Content Fragment and Model Management, so the older Content Fragment Support endpoints in the AEM Assets REST API are now deprecated.

Adobe intends to keep these older endpoints available until an end-of-life announcement. Adobe does not plan further enhancements for the deprecated endpoints.

### SPA Editor {#spa-editor}

[The SPA Editor](/help/sites-developing/spa-overview.md) has been deprecated for new projects starting with release 6.5.25 of AEM 6.5. The SPA Editor remains supported for existing projects, but should not be used for new projects.

The preferred editors for managing headless content in AEM are now:

* [The Universal Editor](/help/sites-developing/universal-editor/introduction.md) for visual editing.
* [The Content Fragment Editor](/help/sites-developing/universal-editor/introduction.md) for form-based editing.

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST. -->

* **Related to Oak**
  From Service Pack 13 and above, the following error log has begun to appear which affects the persistence cache:

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.0.202/5]
  at org.h2.mvstore.DataUtils.newMVStoreException(DataUtils.java:1004)
      at org.h2.mvstore.MVStore.getUnsupportedWriteFormatException(MVStore.java:1059)
      at org.h2.mvstore.MVStore.readStoreHeader(MVStore.java:878)
      at org.h2.mvstore.MVStore.<init>(MVStore.java:455)
      at org.h2.mvstore.MVStore$Builder.open(MVStore.java:4052)
      at org.h2.mvstore.db.Store.<init>(Store.java:129)
  ```

  Or

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.1.214/5].
  ```

  To resolve this exception, do the following:

    1. Delete the following two folders from `crx-quickstart/repository/`

        * `cache`
        * `diff-cache`

    1. Install the Service Pack, or restart Experience Manager as a Cloud Service. 
      New folders of `cache` and `diff-cache` are automatically created and you no longer experience an exception related to `mvstore` in the `error.log`.

* Update your GraphQL queries that may have used a custom API name for your content model to use the default name of the content model instead.

* A GraphQL query may use the `damAssetLucene` index instead of the `fragments` index. This action might result in GraphQL queries that fail, or take a long time to run.

  To correct the problem, `damAssetLucene` has to be configured to include the following two properties under `/indexRules/dam:Asset/properties`:

  * `contentFragment`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/contentFragment"`
    * `propertyIndex="{Boolean}true"`
    * `type="Boolean"`
  * `model`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/data/cq:model"`
    * `ordered="{Boolean}true"`
    * `propertyIndex="{Boolean}true"`
    * `type="String"`

  After the index definition is changed, a reindexing is required (`reindex` = `true`).

  After these steps, the GraphQL queries should perform faster.

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails; the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest Service Pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages may be displayed during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at `granite/operations/maintenance`.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` : No maintenance windows found at `granite/operations/maintenance`.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to declare their correct variables. Otherwise, they do not get run, and end up throwing a runtime error.
 
* Installing tagging related out-of-the-box content by way of an official update package resets the languages property of the `/content/cq:tags` node to default. This action is true for Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches, and so on. Therefore, it is necessary to add it from the properties before installation.

### Known issue for AEM Sites {#known-issues-aem-sites-6525}

Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)

### Known issues for AEM Forms {#known-issues-aem-forms-6525}

* **FORMS-14521** If a user tries to preview a draft letter with saved XML data, it gets stuck in `Loading` state for some specific letters.
* **FORMS-16603** In the Print Preview of the Interactive Communications Agent UI, some calculated values are not displayed correctly. 
* **FORMS-15681** When the letter is viewed in Print Preview, the content is changed; some spaces disappear, and certain letters are replaced with `x`.
* **FORMS-15428** After updating to AEM Forms Service Pack 20 (6.5.20.0) with the Forms Add-On, configurations relying on the legacy Adobe Analytics Cloud Service using credential-based authentication stop working. This issue prevented analytics rules from executing correctly.
* **FORMS-16557** In the Print Preview of the Interactive Communications Agent UI, the currency symbol (such as the dollar sign $) is inconsistently displayed for all field values. It appears for values up to 999 but is missing for values of 1000 and above.
* **FORMS-16575** Any modifications to nested layout fragments' XDP in an Interactive Communication are not reflected in the IC editor. 
* **FORMS-21378** When server-side validation (SSV) is enabled, form submissions may fail. If you encounter this issue, please contact Adobe Support for assistance.
* **FORMS-23722** When a form containing a **File Attachment** field that uses `bindref` is submitted to an AEM Workflow with an **Assign Task** step, the attachments are not displayed. As a result, they do not appear when the task is opened from the Inbox. The files are saved correctly to the repository but the Assign Task step UI fails to display the attachments.
* **FORMS-23802** Custom functions fail to load in preview or publish when an Adaptive Form is embedded in a Sites page. This issue occurs when the **aem-forms-core-component** library version is earlier than 1.1.76. You may see an error such as `InvalidFormContainerException: No form container found` in the logs. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Forms SP24 (AddOn 6.0.1454). 

#### Known issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

<!--
>[!NOTE]
>
>Avoid upgrading to Service Pack 6.5.25.0 for issues without an available hotfix. It may lead to unexpected errors. Upgrade to Service Pack 6.5.25.0 only after the required hotfixes are released.
-->

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

* **FORMS-23881** On AEM Forms JEE deployments set up using the 6.5.23.0 full installer, Output Service fails to process requests when a custom XCI file is supplied in the invocation. To resolve this issue, install the latest AEM 6.5.25.0 Forms Service Pack from the [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html) portal.
* **FORMS-23789** (AEM Forms on JEE only): Users experienced issues with Log4j in AEM Forms on JEE SP24, causing disruptions in logging and monitoring for enterprise customers. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Forms on JEE Service Pack 6.5.25.0.
* **FORMS-23802** Custom functions do not load in preview or publish when the form is in a Sites page with an older aem-forms-core-component version (&lt;1.1.76). To resolve this issue, install the [AEM Forms AddOn hotfix 6.0.1454](/help/release-notes/aem-forms-hotfix.md) for SP24.
* **FORMS-23789** (AEM Forms on JEE only): Users experienced issues with Log4j in AEM Forms on JEE SP24, causing disruptions in logging and monitoring for enterprise customers. To resolve this issue, [download and install the hotfix](/help/release-notes/aem-forms-hotfix.md) for AEM Forms on JEE Service Pack 6.5.25.0.
* **FORMS-23802** Custom functions do not load in preview or publish when the form is in a Sites page with an older aem-forms-core-component version (&lt;1.1.76). To resolve this issue, install the [AEM Forms AddOn hotfix 6.0.1454](/help/release-notes/aem-forms-hotfix.md) for SP24.
* AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x for the forms component. This upgrade delivers previously missed Struts changes that were not included in SP24. The support was added via a [Hotfix](/help/release-notes/aem-forms-hotfix.md) that you can download and install to add support for the latest version of Struts.
* **FORMS-14926** After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder, perform the following steps to resolve the issue:

  1. Stop the locators, if they are running.
  2. Stop the AEM Server. 
  3. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  4. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  5. Open the command prompt in administrator mode.  
  6. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

* **FORMS-15256** When users upgraded from AEM 6.5 Forms Service Pack 18 or 19 to Service Pack 20 or 21, they encountered a JSP compilation error. This error prevented them from opening or creating adaptive forms. It also caused issues with other AEM interfaces. Those interfaces included the Page Editor, AEM Forms UI, Workflow editor, and System Overview UI.

  If you face such an issue, perform the following steps to resolve it:
    1. Navigate to the directory `/libs/fd/aemforms/install/` in CRXDE.
    2. Delete the bundle with the name `com.adobe.granite.ui.commons-5.10.26.jar`.
    3. Restart your AEM Server. 

* **FORMS-23703** When the `contains` rule is configured without a default value, the Server Side validation for an Adaptive Form fails. You can install the latest version of [AEM Forms 6.5.25.0 Service Pack](https://experienceleague.adobe.com/en/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases#aem-65-forms-releases) to fix the issue.
* **GRANITE-63681** Form Data Model connectors may fail to authenticate because the required keywords and regex pattern are not allowed by default. To resolve the issue, download and install the hotfix from the [link](/help/release-notes/aem-forms-hotfix.md).

  <!--
  To resolve the issue, add the following via the Configuration Manager (`/system/console/configmgr`):

  * **Keywords:** `fdm-client-secret`, `oauth-client-secret`
  * **Regex:** `^\[/conf/[^/]+(/[^/]+)?/settings/dam/cfm/models/[^,\]]+(?:,/conf/[^/]+(/[^/]+)?/settings/dam/cfm/models/[^,\]]+)*\]$`

    >[!VIDEO](https://video.tv.adobe.com/v/3479697)
  -->

* **FORMS-23979**  HTML-to-PDF conversion (PDFG) may experience intermittent timeouts. A newer version of the Forms add-on for SP24 was subsequently released that includes the fix. If you encounter this issue, update your environment to the [latest released Forms add-on for 6.5.25.0](https://experienceleague.adobe.com/en/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases#aem-65-forms-releases).
* **FORMS-23717** After upgrading to **AEM Forms 6.5.25.0**, `server.log` and `error.log` can be flooded with repeated WARN messages such as *Secure parser factory creation failed* or *Security attribute ... is not supported*. Logs may grow by about **5–10 lines per second** (hundreds of MB per hour), which can fill disk and block production rollout. 

To reduce log volume, set the logging level for `com.adobe.util.XMLSecurityUtil` to `ERROR` in your application server config or by way of the JVM argument `-Dlogging.level.com.adobe.util.XMLSecurityUtil=ERROR`. This functionality only hides the messages and does not fix the underlying cause.

* **FORMS-23875** In Form Data Model search, an HTML tag is displayed in the UI even when a relevant entity is not present. To resolve the issue, download and install the hotfix from [the link](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/bb-expressionmanager-pkg-10.0.48.zip).

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.25.0](/help/release-notes/assets/65250-bundles.txt)
<!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.25.0](/help/release-notes/assets/65250-packages.txt)
<!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are available to customers only. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-customer-support-experience#).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)

