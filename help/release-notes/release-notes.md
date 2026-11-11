---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
contentOwner: Rick Brough
role: User,Admin,Developer
exl-id: 811fccbc-6f63-4309-93c8-13b7ace07925
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
feature_v2:
  - id: ed762d86-a04b-452b-a08f-86359bb8ff27
    internal-label: Configuration and operations
subfeature_v2:
  - id: c21ccc2b-e0c8-4853-bf41-f12259ed93f8
    internal-label: Release information
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!--
DO NOT DELETE THIS HIDDEN NOTE!      DO NOT DELETE THIS HIDDEN NOTE!
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section.
-->

## Release summary {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.26.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | November 12, 2026 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.26.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|


<!-- REWRITE AI GENERATED SUMMARY OF NOTES BELOW FOR EACH NEW SERVICE PACK RELEASE -->

Experience Manager 6.5.26.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes accessibility, localization, performance, stability, and security improvements built on the 6.5 foundation available since April 2019. 

Key highlights of Service Pack 26 include the following:

* Security. Two critical fixes close a server-side template injection vulnerability in the Metadata Editor and cross-site scripting (XSS) violations in Coral UI servlets.
* C2PA compliance. Assets now detects C2PA credentials and signs renditions that the Update Asset workflow generates. Signing runs locally in each instance, and dedicated or customer-owned signing infrastructure isn't supported.
* Accessibility. More than 25 fixes help the Page Editor and Sites console meet WCAG contrast, keyboard, and screen reader requirements.
* Localization. Dozens of fixes translate strings and correct layout problems across Sites, Assets, Security, and Operations.
* Reliability. Fixes address GraphQL lock contention on publish instances, MSM rollouts, Rich Text Editor toolbar actions, and page activation in the Classic UI.
* Analytics. The Launch integration uses the Adobe Analytics 2.0 API ahead of the Analytics 1.4 end of life on August 31, 2026.


<!-- UPDATE FOR EACH NEW RELEASE -->

## Fixed issues, enhancements, and improvements in Service Pack 26 {#fixed-issues}

<!-- 6.5.25.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 


### [!DNL Sites]{#sites-6526}

#### Accessibility {#sites-accessibility-6526}

* Authors can add, move, and remove components using only the keyboard. The drag-and-drop interaction required a pointer, so it failed the WCAG 2.1.1 Keyboard criterion. The editor now provides the Insert component pop-up, Cut and Paste, and Delete as keyboard-operable equivalents. (SITES-25359) 

* Authors can now see the active Format ("T") button in the Text component inline menu. After authors applied bold or italic formatting, the button icon stayed dark against a dark-grey background and missed the WCAG 2.1 AA minimum contrast ratio of 4.5:1. The updated CSS lightens the icon, which restores the contrast that earlier service packs provided. (SITES-51864) 

* The Assets tab in the Page Editor now displays a translated string in the Select Components drop-down after you choose Paragraphs from the Images dropdown. Previously, the string "OTHER" appeared in English because the localization resources lacked it. The updated dictionary supplies the translation in all locales. (SITES-24525)




* The ContextHub iframe in the Page Editor now has a descriptive title attribute. Previously, the `contexthub-ui-iframe` element had no title, so screen reader users failed to identify it when focus moved to it. The title now appears on every Editor page and view, including Canvas, Side Rail, and Layout Preview. (SITES-24650)
* The Filters button in the Sites console Filter Rail doesn't add visible labels above the Saved Searches and Select Search Directory fields. An audit reported that labels appeared when focus left the button, when a key was pressed, or when the button was clicked. Testing failed to reproduce the behavior, so no change was necessary. (SITES-24706)
* Links in the Sites console App Navigation now stand out more clearly. The link text met the 4.5:1 contrast ratio, but the thin font weight and small size made the links hard to see. A greater font weight and larger size make the text easier to read for users with visual impairments. (SITES-24723)
* Screen readers no longer announce "blank" before the tooltip content in the User Preferences modal. Previously, the info icon used `role="tooltip"` with an `aria-labelledby` reference, so NVDA read an empty label first. The icon now uses `role="button"` and an `aria-label` of "information," and the change applies to the Coral form components that share the pattern. (SITES-24732)
* The Delete button in the Delete modal now meets the WCAG 1.4.3 contrast requirement of 4.5:1. Previously, white text on a red background gave a ratio of 3.9:1 after authors selected an item and clicked Delete in the Action Toolbar. The darker button color makes the label readable for authors with visual impairments. (SITES-24772)
* The References heading in the Sites console References rail now uses a heading element instead of a `div`. Previously, screen readers failed to announce the text as a heading, so users failed to navigate by headings. The heading also appears at the top of the initial References view. (SITES-24967)
* The focus indicator for accordion buttons in the Sites console Filter Rail now meets the WCAG 1.4.11 contrast requirement of 3:1. Previously, the blue indicator showed a ratio of 2.3:1 against the background, which made the Tags accordion button hard to find for keyboard users. The updated color gives keyboard users a clear focus cue. (SITES-24986)
* The focus indicator for radio buttons in the Sites console Filter Rail now meets the WCAG 1.4.11 contrast requirement of 3:1. Previously, the light blue indicator showed a ratio of 1.7:1 against the background. Keyboard users can now track their position in the Modified date accordion. (SITES-24987)
* The Select button beside the Path and Tags fields in the Page Editor side rail no longer uses a checkbox icon. Previously, the icon suggested a toggle, but activating the button opened a modal that contains the Tree Directory. The Select button now communicates its function correctly, and the same applies to the Image and Teaser modals. (SITES-25210)
* Screen readers now skip the thumbnail images of assets in the Page Editor side rail. Previously, each image carried alt text that duplicated the visible asset name, so users heard the same text twice. An empty `alt` attribute marks the image as decorative and keeps the name in the card title. (SITES-25213)
* Screen readers recognize the side rail Components list as a list. An audit reported the items as unrelated elements, but testing confirmed the markup uses a list element and list items. No code change was necessary. (SITES-25214)
* The info icons for components in the Page Editor side rail are larger and easier to see. Previously, the icons used the extra small size of about 12 px, which users with visual impairments found hard to see. The icons now use the medium size.(SITES-25217)
* The focus indicator on the Swatch button in the Annotation modal now stands out from the button. Previously, the indicator matched the swatch color. This made it hard for keyboard users to see which button had focus. An offset gives the indicator enough contrast against the background and keeps it clearly visible. (SITES-25253)
* The Date field in the Timewarp modal no longer carries `aria-haspopup="dialog"`. Previously, screen readers announced that the field opens a dialog box, even though it doesn't. Removing the attribute gives screen reader users accurate information. (SITES-25263)
* Text labels in the Demographics toolbar, such as "Recommended," now meet the WCAG 1.4.3 contrast requirement of 4.5:1. Previously, grey text on a dark grey background gave a ratio of 2.8:1 in Preview mode. Darker or lighter text, depending on the background, makes every label readable. (SITES-25307)
* The focus indicator on the Commerce, Persona, and Device buttons in the Demographics toolbar now meets the WCAG 1.4.11 contrast requirement of 3:1. Previously, the indicator showed a ratio of 1.9:1 against the toolbar background. Keyboard users can now track their position. (SITES-25308)
* Text that authors type in the Demographics toolbar text fields now meets the WCAG 1.4.3 contrast requirement of 4.5:1. Previously, white text on a grey background produced a ratio of 2.9:1 in fields, such as the Profile drop-down `displayName` field in Preview mode. The updated colors make typed values readable for authors with visual impairments. (SITES-25318)
* Screen readers now read the description tooltip when focus reaches checkboxes in the Teaser, Image, and Carousel dialog boxes. Previously, the text lacked programmatic association with the checkbox, so users failed to hear the instruction. An `aria-describedby` attribute now links each checkbox to its description. (SITES-25364)
* Screen readers now announce which Paragraph formats button is active in the Rich Text Editor. Previously, selecting an option from the list gave assistive technology no indication of the current choice. The active button now carries `aria-current="true"`, and the active Hyperlink Target option carries `aria-selected="true"`. (SITES-25367)
* The Sort buttons in the table header of the Sites console List View now meet the WCAG 1.4.11 contrast requirement of 3:1. Previously, the light grey icons showed a ratio of 1.5:1 against the header background. The darker icon color makes the buttons visible to authors with visual impairments. (SITES-25372)
* The Assets tab in the Page Editor side rail no longer reloads when focus moves to the Filter field. Previously, tabbing into the empty field triggered a reload, and screen readers announced a loading message each time. The tab now reloads only after you change the filter value and press Enter. (SITES-25377)
* The selected swatch icon in the Annotation modal now meets the WCAG 1.4.11 contrast requirement of 3:1. Previously, the white check mark showed a ratio as low as 1.58:1 against yellow, orange, and green swatches. The updated icon gives authors with visual impairments a clear indicator. (SITES-25523)
* The Components list in the Page Editor side panel no longer takes keyboard focus. Keyboard users select and move components with the controls in the content window, so the side panel list repeated the function. A note under the component filter informs keyboard users where to find the controls. (SITES-40752)


#### Admin User Interface{#sites-adminui-6526}


#### Classic UI{#sites-classicui-6526}

* Authors can activate pages again in the Classic UI Sites console (`siteadmin.html`). Previously, the Activate Page button displayed a "Loading" spinner indefinitely and never triggered replication, because a failed tracking script halted the click handler. The click handler now runs without error and completes the activation. (SITES-52165)
* The Indonesian language code now displays as ID in the Language Copy properties. Previously, the References rail showed the legacy code IN for pages under the Indonesian language root. The cq-wcm-core bundle update corrects the value, so the code matches the ISO standard. (SITES-4491)

<!--
#### Component Console{#sites-component-console-6526}



#### [!DNL Content Fragments]{#sites-contentfragments-6526}



#### [!DNL Content Fragments] - Admin{#sites-admin-6526}
-->


#### [!DNL Content Fragments] - Fragment Editor{#sites-fragments-editor-6526}

* The Edit Content Fragment button appears immediately for each multifield reference in the Content Fragment editor. Previously, the button stayed hidden until authors saved the parent fragment, and it did nothing after they opened the Path Browser. The editor now builds the action list on first render, so authors open referenced fragments without extra steps. (SITES-43733) 

* Chinese, Japanese, and Korean characters no longer display in italics in the Create Content Fragment dialog box placeholder. Previously, the italic style applied to CJK characters under **Assets** > **Files**, which made the text hard to read. The updated styles skip italics for CJK languages. (SITES-43548)
* The Content Fragment editor validates fields correctly after the Granite UI update. A recent Granite UI change caused a regression, so the editor client libraries no longer matched the new validation behavior. The adapted libraries and tests resolve the mismatch. (SITES-46650)


#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6526}

* GraphQL queries on content fragments now recognize RemoteRef references to Dynamic Media with OpenAPI Assets. Previously, queries failed with a "Persisted Query Validation Error" and returned no asset data when AEM 6.5 Sites consumed AEM as a Cloud Service Assets. Responses now include the repository ID and asset ID, so clients can build delivery URLs. (SITES-48507) 

* Publish instances remain responsive during heavy GraphQL traffic. Lock contention in `GraphQLServiceImpl` delayed request-processing threads at the schema methods, which slowed requests and required restarts. Improved synchronization resolves the performance constraint and maintains the availability of sites and mobile apps. (SITES-48699) 

* The message on the GraphQL Endpoints page remains localized after you reload the page. Previously, the "No endpoints were found" message appeared in your language when you created and deleted endpoints, but it reverted to English after a reload. The page now loads the translated string on every visit. (SITES-43586)


<!--
#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6526}
-->


#### [!DNL Content Fragments] - Models & Model Editor{#sites-models-model-editor-6526}

* Thumbnails for content fragment models display in **Tools** > **General** > **Content Fragment Models** when the configuration name contains localized characters, such as "español テスト." Previously, the uploaded thumbnail didn't appear because the characters caused an error in the path. The updated handling encodes the name correctly. (SITES-39242) 

* The Field Label string on the Content Fragment Model Editor canvas now appears in the user's language. Previously, the label stayed in English after authors dragged a component onto the canvas, and it translated only after they saved and reopened the model. The label now translates immediately, matching the Properties panel. (SITES-45383)


<!--
#### [!DNL Content Fragments] - REST API{#sites-restapi-6526}

#### ContextHub{#sites-contexthub-6526}
-->


#### Core Backend{#sites-core-backend-6526}

* Scheduled page activation through On-Off-Time now runs only when needed. `OnOffTriggerProcessor` previously triggered replication and cache invalidation too often, which forced authors to republish content manually. The backported fix eliminates the unnecessary processing and restores reliable scheduled publishing. (SITES-48483) 

* File upload works for remote assets from Next-gen Asset Management in a multifield. Previously, the upload failed when authors picked a remote asset for a field inside a multifield. The Core Components update restores the upload flow, so the field accepts the asset. (SITES-44266)


#### Core Components{#sites-core-components-6526}

* The Remote Asset Picker keeps each multifield item's image separate. Previously, selecting an image in one multifield item applied it to every other item, and the remote asset reference didn't save. Each item now holds its own selection, and the reference persists after you save the dialog box. (SITES-42376) 

* This release includes backported fixes for Commerce, Core Components, Foundation Components (Legacy), Launches, and MSM Live Copies. The fixes address security vulnerabilities, cross-site scripting (XSS) violations, file upload behavior, and Live Copy behavior. The backports bring AEM 6.5 and AEM 6.5 LTS in line with fixes that shipped earlier in AEM as a Cloud Service. (SITES-43738)


<!--
#### Campaign integration{#sites-campaign-integration-6526}

#### ContentHub {#sites-contenthub-6526}

#### Crosswalk {#sites-crosswalk-6526}

#### Experience Fragments{#sites-experiencefragments-6526}

#### Foundation Components (Legacy){#sites-foundation-components-legacy-6526}
-->


#### Headless - Admin {#sites-headless-admin-6526}

Enhancement: The Preview view in the Headless Admin now passes the selected variation path to the preview component. This change ensures that previews of content fragments with multiple variations load content from the correct variation. The `draftFragmentIds` array includes the variation parameter. (SITES-42714)


#### Launches{#sites-launches-6526}

* Timeline entries for promoted launches now display in the user's language. Previously, the strings "Created version of" and "before promoting launch" remained in English after authors promoted a launch and opened the Timeline for the site in Sites. The updated resources provide the translations in all locales. (SITES-13389)
* The Select Path of Launch Source placeholder in the Launches filter panel displays in full. Previously, the text was cut off in localized interfaces, such as French, Italian, and Portuguese, because it didn't fit the field. The updated layout shows the complete placeholder. (SITES-42792)
* The Live Date column in Tools > Sites > Launches no longer shows AM or PM in the German, French, Spanish, Italian, Brazilian Portuguese, and Traditional Chinese locales. Previously, the column used a 12-hour format that doesn't match those locales. The column now displays the 24-hour format. (SITES-43178) 


<!--
#### Link Checker{#sites-link-checker-6526}
-->


#### Localization{#sites-localization-6526}

* Strings on the Health Reports pages under **Tools** > **Operations** now display in the user's language. Previously, messages for Resource Search Path, Maintenance, Replication Queue, Log Errors, Active Bundles, and Request Performance remained in English. Updated i18n resources supply the translations, and a fallback file keeps the strings available. (NPR-44279) 

* The error message "Settings to 'JSON Path' are ignored when the 'Add Manually' option is checked" now displays in the user's language in the **Tools** > **Assets** > **Metadata Schemas** console. Previously, the message remained in English after authors added a dropdown element, selected Add through JSON path, and switched to Add Manually. The updated resources provide the translations. (ASSETS-31575)
* The "promoted" string in **Assets** > **Manage** tags now displays in the user's language. Previously, the string remained in English when you hovered over a smart tag after you selected Promote. The updated resources supply the translation in all locales. (ASSETS-36070)
* The Add button label no longer overlaps the button in **Folder Properties** > **Asset Contribution**. Previously, the text collided with the button in the German, Italian, and Brazilian Portuguese interfaces after you created a folder with the "Asset contribution" setting. Updated styles give the longer translated labels enough room. (ASSETS-36746)
* Column titles in the Assets List View now display horizontally in the Japanese interface. Previously, the titles appeared vertically in List View under **Assets** > **Files**, and in the card view of the content fragment editor. The updated `cq-dam-content` package corrects the text direction.(ASSETS-43105)
* The publication status "Scheduled for later" in the Assets column view now displays in the user's language. Previously, the string remained in English after authors selected an asset, chose **Manage Publication**, selected the **Later** option, added a date, and published. The updated `cq-dam-content` package supplies the translations in all locales. (ASSETS-43307)
* Strings in the **Smart Tags Configuration** tab now display in full for French and Brazilian Portuguese. Previously, the text was cut off after you clicked **Create** under **Tools** > **Cloud Services** > **Smart Tag**. To read the text without a tooltip, use the CSS update that provides enough space. (ASSETS-68045)
* The "Multi Path Value Property Predicate" string in the Assets admin search rail now displays in the user's language. Previously, the string remained in English when administrators edited the search form under **Tools** > **General** > **Search** forms and dragged the predicate onto the form. The updated `cq-dam-content` package supplies the translations.(CQ-4336103)
* Aria labels in the Projects view now display in the user's language. Previously, the Actions button on each project tile had no accessible name, and the Configure Tile action used a hard-coded English label while sibling labels were localized. The updated tile script supplies a localized label for both actions. (CQ-4352359)
* Smart Collections with Chinese, Japanese, or Korean characters in the name now save correctly. Previously, saving a collection from **Assets** > **Files** > **Filter** failed with "Save Search Failed - Invalid request, duplicate collection not allowed" when the name contained CJK characters. The duplicate check now compares the collection titles rather than the node names, so collections with different CJK titles no longer conflict. (GRANITE-62592)
* The Country/Region dropdown in **Security** > **Users** > **Create** now sorts names alphabetically in the user's language. Previously, the list sorted names in English order while it displayed localized names, so countries appeared out of order in locales such as Japanese. The updated `com.adobe.granite.security.content` bundle sorts with locale-aware rules. (GRANITE-67789)
* The disclaimer on the AuditLog Maintenance Task in **Tools** > **Operations** > **Maintenance** now displays in the user's language. Previously, the warning about audit log purging and compliance requirements remained in English after users clicked the disclaimer icon in the Weekly Maintenance window. The updated resources supply the translation in all locales. (NPR-44189)
* Permission names in **Security** > **Permissions** > **Audit View** now display in the user's language. Previously, the names appeared in English because the translations were missing. The updated `com.adobe.granite.platform.i18n` bundle supplies them. (NPR-44477)
* The Check Health dialog box in **Security** > **Adobe IMS Configurations** now displays in the user's language. Previously, the dialog box showed English strings in localized interfaces because the translations were missing. The updated `com.adobe.granite.platform.i18n` bundle supplies them. (NPR-44479)
* Strings in the User Sync Diagnostics tool under **Tools** > **Operations** > **Diagnosis** now display in the user's language. Previously, the tool showed English text in localized interfaces. The updated `com.adobe.granite.platform.i18n` bundle supplies the translations. (NPR-44481)
* Configuration flows now show user-friendly error messages in the user's language. Previously, failures in AEM configuration pages produced technical or untranslated text. The updated `com.adobe.granite.ui.content` bundle handles the errors and supplies localized messages. (NPR-44840)
* The error message that appears when you change properties of a deleted group in **Security** > **Groups** now displays in the user's language. Previously, the message remained in English for localized interfaces. The updated `com.adobe.granite.security.content` bundle supplies the translations. (NPR-44841)
* The error message "Something went wrong when saving the changes to the group!" now displays in the user's language in the **Security** > **Groups** > **Edit group** console. Previously, the message stayed in English for localized interfaces. The updated `com.adobe.granite.security.content` bundle supplies the translations. (NPR-44842)
* Chinese, Japanese, and Korean characters no longer display in italics in the Inbox icon error message. Previously, the italic style distorted the characters and made the text harder to read. The updated `com.adobe.granite.ui.coralui3` bundle removes the style for those languages. (NPR-44843)
* Numbers in **Operations** > **Monitoring** now follow the user's locale format. Previously, the page showed numbers in a fixed format regardless of the interface language. The updated `com.adobe.granite.monitoring.dashboard` bundle applies the correct separators and format. (NPR-44844)
* The Explain Query tab now shows the "Query Builder Debugger tool." link in the user's language. Previously, the link text was missing in localized interfaces because the string wasn't externalized. The updated `com.adobe.granite.monitoring.dashboard` bundle restores it. (NPR-44845)
* Text in the Query Builder Debugger tool dialog box now displays in the user's language on the Explain Query tab. Previously, several strings stayed in English because they weren't externalized. The updated `cq-platform-content` bundle supplies the translations. (NPR-44846)
* Text in the Consistency Check Result page now displays in the user's language. Previously, several strings appeared in English because they weren't externalized. The updated `com.adobe.granite.operations.ui.core` bundle supplies the translations. (NPR-44847)
* The Monitoring Chart now displays month and week labels in the user's language. Previously, the labels were hard-coded in English, so the chart ignored the interface locale. The updated `com.adobe.granite.monitoring.dashboard` bundle externalizes the strings, and translations now appear. (NPR-44848)
* The Country/Region dropdown in **Security** > **Users** > **Create** now sorts entries correctly. Previously, localized country names appeared in the wrong order for some languages. The updated `com.adobe.granite.security.content` bundle applies locale-aware sorting. (NPR-44942)
* Tooltips in the Button component dialog box now display in the user's language. Previously, the info text for the button text, link, icon, HTML ID, and `aria-label` fields remained in English even though the strings existed in the localization service. The updated dictionary supplies the translations in all supported locales. (SITES-7579)
* Tooltips in the Properties section of the Content Fragment List component now display in the user's language. Previously, the info text for the Content Fragment Model, Tags, Maximum number of items, Parent path, Sort order, and Order by fields remained in English. The updated dictionary provides translations for all supported locales. (SITES-14969)
* The Help links for Core Components in the Template Editor now lead to localized documentation pages. Previously, selecting Help in the component configure dialog box opened the English page regardless of the interface language. Updated URLs now route users to the page for their locale. (SITES-15058)
* The info tooltips in the Content Fragment dialog box now display in the user's language. Previously, the tooltip text for the Single Text Element and Multiple Elements modes and for the Content Fragment path remained in English. An updated dictionary provides translations for all locales. (SITES-17333)
* Error messages in the Template Editor Component Policy editor now appear in the user's language. Previously, the messages "Resource {} is not modifiable" and "Unable to create node at" remained in English when authors edited a component policy or created a new one. The updated resources provide translations for all supported locales. (SITES-17475)
* The Assets tab in the Page Editor now displays a translated string in the Select Components drop-down after you choose Paragraphs from the Images dropdown. Previously, the string "OTHER" appeared in English because the localization resources lacked it. The updated dictionary supplies the translation in all locales. (SITES-21481)
* Info tooltips in the Page Editor Configure component dialog box no longer show an extra line break. Previously, tooltips for components, such as PDF Viewer and Progress Bar, wrapped awkwardly in several locales. The tooltips now wrap correctly, and word hyphenation works as expected. (SITES-38567)
* The tooltip "to exit text editor press Esc key" now appears in the user's language in the Text component configure dialog box. Previously, the string displayed in English because the localization resources lacked it. The tooltip now translates in all locales. (SITES-43186)
* The STRUCTURE label in the Template Editor now appears in the user's language. Previously, the label remained in English when authors opened an Adaptive Form template, because the string was missing from the localization resources. The label now translates in all locales. (SITES-43599)


#### MSM - Live Copies{#sites-msm-live-copies-6526}

* The MSM Rollout dialog box loads the live copy list again after an upgrade. Previously, a `NullPointerException` in `AsyncOperationServlet.doGet` stopped the dialog box on a spinner, so authors failed to select target locales or start the rollout. An updated `com.adobe.granite.jobs.async` bundle handles the missing job data and finishes the request. (SITES-43116) 
* Rollout from the editable toolbar on a blueprint page works again. The toolbar action failed with "Cannot read properties of undefined (reading 'doRollout')" because the `MSM.Rollout` client library did not load. The updated page now loads the library, so the rollout job starts and changes reach the live copies. (SITES-46052) 

* Batch deactivation of a blueprint page and its child pages no longer sends duplicate rollout events. When you deactivated a parent and its children in one request, the replication system emitted five events instead of three, and each child page rolled out twice. Deduplication in the rollout manager now submits one rollout per page, so live copies receive no redundant packages. (SITES-44988)


#### Page Editor{#sites-pageeditor-6526}

* The selected style remains highlighted in the Page Editor style selection dialog box after you scroll the list. Previously, a style highlighted when you chose it, but the highlight vanished when you clicked the scrollbar. This regression began after SP22, and the dialog box now keeps the selected state visible. (SITES-30874) 

* Authors can edit pages in Layout mode when parent and child components define different responsive breakpoints. The getResponsiveCssClasses function previously failed with a TypeError on components that omitted the cq:responsive/phone width. The function now falls back to available values and continues rendering. (SITES-46681)
* Custom crop ratios now load in hybrid inline-editing mode for components with multiple image drop targets. Previously, the Image Editor initialized one generic ipeConfig for all drop targets, so the editor showed only the default ratios and ignored each target's aspectRatios. The editor now reads the configuration for the selected drop target, and the crop applies in both inline and fullscreen views. (SITES-45771)
* Pressing Backspace in the Rich Text Editor doesn't add extra inline styles to the text. A customer reported that removing a line break after bold text added style="font-size: 0.8125rem; background-color: transparent;" to the bold tag. Testing on the latest service pack failed to reproduce the behavior, so no change was necessary. (SITES-15883)


<!--
#### Replication{#sites-replication-6526}
-->


#### Rich Text Editor{#sites-rte-6526}

* Rich Text Editor toolbar buttons work in Responsive view and Layout mode. Previously, the buttons highlighted when clicked, but the selection stayed unchanged and no dialog box opened. The updated editor script applies the formatting, matching the behavior in Edit mode. (SITES-44233) 
* Authors can add currency and trademark symbols to Text components without losing them. The Special Characters plug-in inserted the symbols, but they displayed as blanks in both the editor and the published output. The corrected handling renders each symbol as entered. (SITES-46532) 
* The Full Screen icon in the Rich Text Editor toolbar expands the editor again. Previously, clicking the icon in the Core Text component did nothing, and the editor stayed at its inline size. Authors now have a focused workspace for long-form content in both inline and dialog box editing. (SITES-46396)


#### Site Admin UI{#sites-admin-ui-6526}

Reverting an asset to an earlier version now refreshes its card thumbnail. A URL-encoding change in the Timeline client library caused a path mismatch, so the card lookup failed and the thumbnail remained stale. Matching the encoded and raw paths restores the refresh. (SITES-46590)

<!--
#### Universal editor {#sites-universal-editor-6526}
-->

#### Workflow extensions {#sites-workflow-extensions-6526}

View Payload now opens the Touch UI package editor for workflows that Manage Publication starts for multiple pages. Previously, the action opened the deprecated Classic UI package editor, even though authors started the workflow in Touch UI. Authors now inspect the payload without leaving Touch UI. (SITES-40928) 


### [!DNL Assets] {#assets-6526}

* Enhancement: AEM Assets 6.5 includes support for Coalition for Content Provenance and Authenticity (C2PA) compliance for generative AI content. The Update Asset workflow detects C2PA credentials, extracts the metadata, and signs renditions that the workflow regenerates. Signing runs locally in each AEM instance, so customers don't need dedicated signing infrastructure. (ASSETS-75868) 

* Documentation enhancement: New public documentation explains how to customize the asset processing pipeline while keeping C2PA compliance. The documentation covers how to position the Detect C2PA Credential step before rendition steps and how signing runs locally in each AEM instance. The documentation also states the limitation on dedicated or customer-owned signing infrastructure. (ASSETS-76100)
* The Help drop-down in the shell header now remains open when you hover over its links in AEM 6.5 SP26 environments. Previously, the drop-down closed when the pointer entered the list, so authors failed to click Documentation, Community, or support links. The updated `com.adobe.granite.ui.content` bundle defers the focus check, so the menu closes only when focus truly leaves. (ASSETS-65676)

<!--
#### [!DNL Dynamic Media]{#assets-dm-6526}
-->

### [!DNL Forms]{#forms-6526}

* New feature: Support for accessibility tags on lists in Rich Text. Previously, list tags appeared in the accessibility tag tree only when the template followed a specific structure. The request closed as a duplicate of a related ticket that delivers the feature. (LC-3923202) 


<!--
#### Forms JEE {#forms-jee-6526}

#### Forms Designer {#forms-designer-6526}
-->


### Foundation {#foundation-6526}

* The "Country/Region" string in the **Security** > **Users** > **Create** user dialog box now appears in the user's language. Previously, the label remained in English for localized interfaces. The updated `com.adobe.granite.security.content` bundle supplies the translations. (NPR-43882)
* The Help drop-down in the shell header now stays open when you hover over its links in AEM 6.5 SP26 environments. Previously, the drop-down closed when the pointer entered the list, so authors failed to click Documentation, Community, or support links. The updated `com.adobe.granite.ui.content` bundle defers the focus check, so the menu closes only when focus truly leaves. (NPR-44686)
* Improvement: The `HtmlLibraryManagerImpl` query now includes a node type tag so that the query always uses the expected index. The service also logs an ERROR when it finds no client libraries, which alerts administrators to the problem. The update bumps the `com.adobe.granite.clientlibs` bundle version in the service pack. (NPR-44698)


<!--
#### Apache Felix {#foundation-apachefelix-6526}
-->


#### Authentication {#foundation-authentication-6526}

Save & Close in the User editor now returns to the search results of the current search. Previously, after authors searched for a second user in Omnisearch, edited properties, and clicked Save & Close, the page opened the first user's properties instead. The updated UserProperties.js script restores the expected navigation. (NPR-44774)

<!--
#### Campaign{#foundation-campaign-6526}

#### Cloud Services{#foundation-cloudservices-6526}

#### Communities {#foundation-communities-6526}

#### Content distribution{#foundation-content-distribution-6526}

#### Adobe CRX {#foundation-crx-6526}
-->


#### Granite{#foundation-granite-6526}

* The "Content Fragment Model" placeholder in the Assets Omnisearch filter now displays in full. Previously, the text was cut off after you went to Assets, clicked the Filters or Search icon, and expanded the Content Fragment Model field. Updated styling gives the placeholder enough space. (GRANITE-54387)
* The Help dropdown in the shell header now remains open when you move the pointer over its links. Previously, the drop-down closed as soon as the pointer entered the list of Documentation, Community, and support links, which made the links unreachable with a mouse. The focus handler now defers its check to the next animation frame, so hovering no longer counts as the focus leaving the menu. (GRANITE-70978)

<!--
#### Jetty{#foundation-jetty-6526}
-->

#### Launch integrations{#foundation-launch-integrations-6526}

Improvement: The Adobe Analytics integration with Adobe Experience Manager Launch uses the Analytics 2.0 API. The Analytics 1.4 API reaches end of life on August 31, 2026. The migration keeps reporting and Launch integrations working after that date. (CQ-4365074, CQ-4365080)

<!--
#### Localization{#foundation-localization-6526}

#### Oak {#foundation-oak-6526}
-->

#### Platform{#foundation-platform-6526}

* The Help link in the footer of the AEM login page now opens a working page. Previously, the link pointed to a marketing.adobe.com URL that no longer exists. The footer configuration now uses the [Adobe Experience Manager documentation](https://experienceleague.adobe.com/en/docs/experience-manager) URL. (NPR-44388) 
* Enhancement: A customer request asked for the Microsoft Graph API as an alternative to SMTP when AEM sends email. The ticket resolved as a duplicate, because another ticket already implements the Graph API flow. SMTP with OAuth 2.0 remains available for customers who need to move away from SMTP basic authentication. (GRANITE-57478) 

* The strings in the Effective Permissions dialog now align correctly in **Tools** > **General** > **Configuration** Browser. Previously, one string displayed out of line after you selected a folder, clicked Properties, and clicked Effective Permissions. Updated layout rules restore the alignment. (CQ-4359166)


#### Projects {#foundation-projects-6526}

The "Select Root Directory" string in the Select i18n Dictionary dialog now displays in full. Previously, the text was cut off in several localized interfaces after you created a translation project and added an i18n Dictionary. The updated `cq-projects-translation-content` package gives the string enough space. (CQ-4355405)

<!--
#### Security{#foundation-security-6526}

#### Sling{#foundation-sling-6526}

#### SPA editor {#foundation-spa-editor-6526}
-->


#### Translation{#foundation-translation-6526}

The style options for the List component now display in the user's language. Previously, strings such as Block and Grid remained in English in the Styles menu after authors added the List component to an Experience Fragment. The updated resources provide the translations, including the Korean, Simplified Chinese, and Traditional Chinese interfaces. (CQ-4349666)

<!--
#### User interface{#foundation-ui-6526}

#### WCM{#foundation-wcm-6526}
-->

#### Workflow{#foundation-workflow-6526}

Improvement: The Touch UI Page Editor now renders the Content Tree and supports editing Resource Definition components on workflow package pages. Previously, pages under `/etc/workflow/packages/` that **Manage Publication** > **Publish Later** creates showed no Content Tree in the left panel, and authors failed to edit the Resource Definition components. Approvers now inspect pages and assets within a workflow payload in Touch UI, matching Classic UI behavior. (GRANITE-65620) 

## Install [!DNL Experience Manager] 6.5.26.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.26.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.26.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.26.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe recommends that you do not remove or uninstall the [!DNL Experience Manager] 6.5.26.0 package. To roll back if necessary, create a backup of the `crx-repository` before you install the pack. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.26.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. For more information, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe advises that you wait for error logs to stop changing before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before confirming that the installation is successful. This issue occurs in the [!DNL Safari] browser but can occasionally occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.26.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.26.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

For the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.26.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.20 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE. CHECK WITH SAMEER DHAWAN -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the Service Pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/deploying/deploy), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

This lets you add the required index definition based on the features used.

Failure to install this package results in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.26.0 is available in the [Maven Central repository](https://repo1.maven.org/maven2/com/adobe/aem/uber-jar/6.5.26/). <!-- CHECK FOR UPDATE EACH NEW RELEASE FROM MADHULIKA SINGH -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.26</version>
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
      New folders for `cache` and `diff-cache` are automatically created and you no longer experience an exception related to `mvstore` in the `error.log`.

* Update your GraphQL queries that used a custom API name for your content model to use the default name of the content model instead.

* A GraphQL query uses the `damAssetLucene` index instead of the `fragments` index. This action results in GraphQL queries that fail or take a long time to run.

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

  After these steps, the GraphQL queries perform with improved speed.

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails; the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest Service Pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages appear during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at `granite/operations/maintenance`.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` : No maintenance windows found at `granite/operations/maintenance`.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the `org.apache.servicemix.bundles.rhino` bundle has a new hoisting behavior. Scripts that use the strict mode (`use strict;`) have to declare their correct variables. Otherwise, they do not get run, and end up throwing a runtime error.
 
* Installing tagging related standard content by way of an official update package resets the languages property of the `/content/cq:tags` node to default. This action is true for Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches, and so on. Therefore, it is necessary to add it to the properties before installation.

### Known issue for AEM Sites {#known-issues-aem-sites-6526}

<!--
* Known issue with a hotfix available for AEM Foundation {#known-issue-foundation-hotfix-6526}

  After you upgrade from an earlier service pack to Experience Manager 6.5.26.0, the OSGi version ordering for CRXDE Lite can prevent Experience Manager from selecting the intended bundle. An earlier service pack contains a higher CRXDE Lite version than the artifact that Service Pack 26 includes (`com.adobe.granite.crxde-lite-1.1.44-CQ651-B00024`).
  
  To resolve this issue, download and install the hotfix [cq-6.5.26-hotfix-GRANITE-76725.zip](https://artifactory.corp.adobe.com/ui/native/maven-aem-release-local/com/adobe/cq/hotfix/cq-6.5.26-hotfix-GRANITE-76725/1.0/cq-6.5.26-hotfix-GRANITE-76725.zip). The hotfix updates CRXDE Lite to `com.adobe.granite.crxde-lite-1.1.44-CQ651-B0026`, and it contains a version change only, with no code or functional changes. (GRANITE-76725)
-->

* Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)

### Known issues for AEM Forms {#known-issues-aem-forms-6526}

* When a form containing a **File Attachment** field that uses `bindref` is submitted to an AEM Workflow with an **Assign Task** step, the attachments are not displayed. As a result, they do not appear when the task is opened from the Inbox. The files are saved correctly to the repository but the Assign Task step UI fails to display the attachments. (FORMS-23722)

* When a digitally signed PDF is attached to a task in AEM Forms JEE Workspace, the upload remains stuck in the uploading state or fails with an "Invalid File" error. As a result, larger, signed PDF attachments cannot be added to the task. This issue is fixed in a later version. For a hotfix on the version, contact Adobe Support. (FORMS-28517)

#### Known issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

* After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder, perform the following steps to resolve the issue (FORMS-14926):

  1. Stop the locators, if they are running.
  1. Stop the AEM Server. 
  1. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  1. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  1. Open the command prompt in admin mode.  
  1. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following zip files contain the text documents that list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.26.0](/help/release-notes/assets/65260-bundles.zip) 
<!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.26.0](/help/release-notes/assets/65260-packages.zip) 
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




