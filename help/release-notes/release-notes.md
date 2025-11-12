---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
exl-id: 811fccbc-6f63-4309-93c8-13b7ace07925
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.24.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | November 20, 2025 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Fhotfix%2Fcq-6.5.0-hotfix-GRANITE-61551-SP23-1.2.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

<!-- OLD DOWNLOAD URL
(https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip) -->

## What is included in [!DNL Experience Manager] 6.5.24.0 {#what-is-included-in-aem-6524}

[!DNL Experience Manager] 6.5.24.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5.

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

### Sites {#sites-sp24}

* A ()

### [!DNL Assets]  {#assets-sp24}

* A ()


### Forms {#forms-sp24}




## Fixed issues in Service Pack 24 {#fixed-issues}

<!-- 6.5.24.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 

### [!DNL Sites]{#sites-6524}


#### Accessibility {#sites-accessibility-6524}

*  () CRITICAL
*  () CRITICAL
*  () CRITICAL
*  () CRITICAL
*  () CRITICAL
*  () CRITICAL
* Filters Rail now works at 400% zoom. The rail resizes with relative units and no longer blocks or hides filter controls. Users can view and select every filter option without horizontal scrolling or clipped hit-targets. (SITES-24981) CRITICAL
* Keyboard users can operate formatting menus in the Teaser modal. Pressing `Enter` or `Space` on **List** or **Paragraph Format** opens the pop-up, Arrow keys navigate options, and `Enter` applies the selection. `Escape` closes the menu and restores focus to the triggering control, producing a consistent toolbar workflow. (SITES-25235) CRITICAL
* The Swatch color picker popover now stays within the viewport at 320 px. The popover shows all color rows and supports scrolling, so authors can select any swatch on small screens. (SITES-25274) CRITICAL
* Demographic toolbar drop-down menus now work fully with the keyboard. Opening a menu moves focus to the first option, arrow keys navigate the list, and Esc/Tab close or advance without dumping focus to the toolbar. Interactive items use proper semantics so NVDA and other readers announce options correctly. (SITES-25310) CRITICAL
* Add Component in the Content tree works as designed on AEM 6.5 SP24. The error toast reported earlier came from missing author permissions in a local setup, not from AEM. Authors with edit rights can activate the button and add components by keyboard or mouse. (SITES-25312) CRITICAL
* Keyboard and screen-reader access in the Demographic toolbar now works reliably. Authors using NVDA can traverse **Commerce**, **Persona**, and 88 with arrows, observe clear focus feedback, and understand which tab is active. (SITES-25326) CRITICAL


*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
*  () MAJOR
* The filter bar now treats each selected tag as an action button. Clear accessible names and focus handling improve announcements and keyboard control. (SITES-24980) MAJOR
* Status updates in the Sites Admin filter view announce to screen readers. When users switch Card/List while items load, NVDA now speaks the "Please wait" message through a live region. This guidance prevents extra clicks and confusion. (SITES-24992) MAJOR
* Keyboard focus now moves in a logical order when users expand the Left Rail. Focus shifts directly from the Left Rail button to the expanded content, eliminating the need to backtrack or skip elements. This change improves accessibility for screen reader and keyboard users. (SITES-24998) MAJOR
* Screen reader feedback for the **Edit** button now matches the control. Activating the button announces the Edit action rather than a preview message, which improves clarity and reduces input errors for non-mouse users. (SITES-25208) MAJOR
* The confirm action in the Teaser dialog box announces correctly to screen readers. The control reports "Confirm," not the icon description, giving keyboard and screen-reader users clear guidance. (SITES-25223) MAJOR
* The Help button now exposes a clear accessible name. Screen readers announce "Help" instead of a verbose icon description. Users understand the action and can find assistance faster. (SITES-25224) MAJOR
* The Timewarp modal displays a clear focus ring on the **Set Date** and **Exit Timewarp** links. Users who tab see exactly where focus lands and avoid unintended actions. The ring maintains at least 3:1 contrast against the background. (SITES-25232) MAJOR
* Screen readers now announce the Annotate and Close Annotate controls accurately in the Annotation toolbar. NVDA no longer says "Preview button pressed," which misled authors and suggested the wrong action. The announcement matches the button pressed and keeps the workflow clear. (SITES-25234) MAJOR
* Keyboard navigation in the annotation toolbar behaves consistently. Focus no longer jumps to Exit when opening the mode and instead moves to the starting control for adding annotations. Users navigate the controls in sequence without reverse tabbing. (SITES-25241) MAJOR
* Small-screen viewing works as expected in the Teaser modal. The dialog box no longer creates a horizontal scroll bar at 320 px, and the toolbar stays accessible without panning sideways. This update helps low-vision users who zoom the page. (SITES-25242) MAJOR
* Small-screen viewing works as expected in the Image modal. The dialog box no longer creates a horizontal scroll bar at 320 px, and the image tools remain accessible without panning sideways. This update improves navigation for low-vision users who zoom the page. (SITES-25244) MAJOR
* The Search modal honors user text-spacing settings. Raising line height, paragraph spacing, letter spacing, or word spacing no longer cuts off text or overlaps the tree. Content reflows at WCAG 1.4.12 values and stays fully readable. (SITES-25245) MAJOR
* The Search modal now fits small screens without overlapping the tree directory at 320 px. Content reflows inside the dialog box, keeps vertical scrolling only, and keeps controls visible. This fix improves readability and keyboard navigation and aligns with WCAG Reflow. (SITES-25246) MAJOR
* Carousel modal overflow no longer forces horizontal scrolling at phone-sized widths. The component adapts to 320 px, preserves vertical flow, and keeps controls in view. The change improves readability and keyboard access during authoring. (SITES-25254) MAJOR
* Annotation workflows no longer lose focus. The modal places initial focus on a meaningful heading, prevents focus from jumping outside the dialog box, and restores focus to the trigger after dismissal. Screen-reader output stays concise and relevant. (SITES-25257) MAJOR
* The **Delete Annotation** dialog box now handles keyboard focus correctly. Opening the dialog box moves focus to its heading for screen-reader context, and closing it sends focus back to the **Delete Annotation** button that launched it. Users no longer land on unrelated controls or behind the modal. (SITES-25258) MAJOR
* The Timewarp Date Picker now manages focus correctly. Pressing `Esc` returns focus to the **Date Picker** button, and choosing a date moves focus to the linked input field. Keyboard and screen-reader users keep context and do not land behind the modal. (SITES-25264) MAJOR
* Screen readers announce the correct actions for the **Annotate** and **Close Annotate** buttons. NVDA no longer says "Preview button pressed"; it announces the button name so users know when annotation mode starts or ends. (SITES-25268) MAJOR
* The Annotation modal now shows a clear **Submit** action. Authors can add a comment and submit it with the pen icon button or dismiss the modal with `Esc`, without guessing the flow. (SITES-25269) MAJOR
* Annotation entry includes explicit action buttons. The dialog box exposes **Submit** to save the note and **Cancel** to close it, both keyboard accessible and announced by assistive technology. Authors no longer need to rely on clicking outside the dialog box or pressing only `Esc` to finish. (SITES-25281) MAJOR
* Annotation mode now keeps keyboard focus inside the overlay and its toolbar. The page behind the overlay no longer receives focus when authors press Tab, so users stay oriented and can navigate annotations without jumping to underlying content. (SITES-25282) MAJOR
* The device selector in Edit Layout works as designed. When two device options have similar widths (for example, iPhone 8 Plus next to Galaxy 7), the selected button shows a tooltip to reveal the full label while both buttons remain visible and accessible. (SITES-25285) MAJOR
* At 200% zoom, Edit Layout no longer overruns the page. The toolbar renders fully and exposes horizontal scroll when needed, restoring access to previously hidden controls for low-vision users. (SITES-25288) MAJOR
* Tab order in Layout Preview now moves from the primary toolbar directly to the Demographic toolbar. Keyboard and screen-reader users can traverse controls in a predictable sequence instead of jumping to the secondary toolbar. The change aligns with WCAG 2.4.3 Focus Order. (SITES-25305) MAJOR
* Zooming the page to 200% no longer hides part of the Demographic toolbar. The toolbar section manages overflow and provides scrolling in its own region, keeping every control visible and operable at high magnification. (SITES-25309) MAJOR
* Text inputs in the Demographics toolbar now expose proper accessible names. Each field includes a unique ID with a programmatic label, so screen readers announce the field purpose and users can navigate by label. The visible label sits near the control to improve low-vision readability. (SITES-25316) MAJOR
* The Edit button now announces the correct action to screen readers in the secondary toolbar. Activating it reads "Edit" instead of the unrelated "Preview button pressed," which removes confusion during keyboard navigation. (SITES-25320) MAJOR
* The Demographics toolbar Cart slider now exposes a proper accessible name. Screen readers announce "Cart total" and speech-input tools can target the control by name, improving compliance with WCAG 4.1.2 (Name, Role, Value). (SITES-25322) MAJOR
* The Demographics toolbar slider now keeps focus when authors change the value with the arrow keys. Focus no longer jumps to the Cart button, so keyboard users adjust the value continuously and screen readers announce each change. (SITES-25324) MAJOR
* Search Assets now reflows cleanly at 320 px (roughly 400% zoom). The modal keeps headings, fields, and actions readable and non-overlapping, so authors can search without horizontal scrolling. (SITES-25330) MAJOR
* The Assets panel in the editor follows a logical focus sequence. Keyboard users tab across each thumbnail and can access the panel exit controls. The change removes skips and improves compliance with WCAG 2.4.3. (SITES-25360) MAJOR
* AEM updates the **Lists** and **Paragraphs** buttons in the Teaser modal's rich text editor to expose their expanded and collapsed state. The buttons now toggle `aria-expanded` and announce the state change to screen readers. Authors get clear feedback and avoid guessing before opening or closing the format menus. (SITES-25365) MAJOR
* AEM announces the loading state in the Teaser modal. The modal now exposes a live status message while content loads, so NVDA and JAWS speak "Loading, please wait." Authors receive clear feedback and avoid interacting with the dialog box before it is ready. (SITES-25366) MAJOR
* Improves status messaging in the Asset tab of the Link selection dialog box. When an error occurs, the component injects a readable status update and keeps keyboard focus stable, letting NVDA/JAWS inform users right away. (SITES-25368) MAJOR
* Corrected UI behavior in the Note panel for very narrow viewports. At 320 px the title and Add control previously collided; the toolbar now reflows and preserves clear separation between elements. Authors can operate the controls without loss of information or function. (SITES-25376) MAJOR
* Fixed a lingering error state in the **Teaser** dialog box's **Links & Actions** tab. After authors enable **Call to Action** and correct blank or invalid fields, the tab clears its error styling and icon and removes aria-invalid. Screen readers no longer announce an error once the fields validate. (SITES-25527) MAJOR
* Error handling in Sites Admin forms now meets accessibility expectations. When validation fails, the page shows the error immediately, shifts focus to a usable message target, and exposes the text to screen readers such as JAWS. (SITES-27138) MAJOR
* Creating a folder in Sites now shows a clear confirmation toast. JAWS announces the message through the live region, so authors receive immediate, accessible feedback after the action. (SITES-27141) MAJOR
* Resolved an accessibility gap where images in authoring dialog boxes rendered without alt text. The dialog box now provides descriptive alt text where needed and empty alt for purely visual elements, restoring compliant behavior for JAWS and other screen readers. (SITES-27153) MAJOR
* Improved error handling in authoring dialog boxes. When a configuration error occurs, the UI shows explicit text and triggers a screen-reader announcement by way of an alert region. Authors receive immediate feedback and can correct the problem without losing context. (SITES-27155) MAJOR
* Fixed a Reflow accessibility defect in Sites Admin. At 400% browser zoom, the toolbar and grid controls overlapped and pushed key actions off-screen, which blocked keyboard navigation and screen-reader use. The layout now reflows correctly so the search, filter, and action buttons remain visible and operable at 400% zoom. (SITES-27238) MAJOR
* Corrected low contrast in the lock status message shown in the page Lock/Unlock workflow. The message now meets a 4.5:1 ratio, improving readability and ADA compliance for authors. (SITES-27270) MAJOR
* Added accessible names to the checkmark icons in the **Effective Permissions** dialog box. JAWS now announces the icons and their meaning, improving keyboard navigation and ADA compliance. (SITES-27272) MAJOR
* Hidden header navigation accepted focus and confused both sighted and screen-reader users. The update disables focus on collapsed controls and exposes only visible items. Navigation stays predictable and meets WCAG 2.4.3. (SITES-35224) MAJOR





* The Description RTE blocked forward Tab navigation and broke dialog flow. The fix restores standard keyboard movement. Authors continue past the field with a single Tab and keep selection order predictable. (SITES-35228)
* Authoring controls lacked accessible names and exposed raw icon text, which confused JAWS. The fix adds explicit ARIA labels and standard roles. Announcements sound correct and align with accessibility expectations. (SITES-35227)
* The Categories drop-down list lacked a specific label, so JAWS spoke a generic "images button menu." The update names the control "Categories" and defines its role. Screen-reader users hear an accurate label and understand the available choices. (SITES-35226)
* The Properties dialog box displayed a data grid that screen readers treated as plain text. JAWS and NVDA missed focus and failed to announce rows and columns. The fix adds real table semantics and ARIA roles. Screen readers now recognize the table and track focus correctly. (SITES-35225)
* The Content Fragment text editor loaded with a truncated action bar. Icons clipped and the overflow menu became unreachable. The update fixes the layout so the full toolbar stays visible and accessible. (SITES-33005)
* Basic tab form fields failed to show helpful error text. The form now displays clear, inline messages and links them to the field for screen readers. Keyboard and assistive-technology users get immediate guidance to fix input. (SITES-32480)
* The Multifield used in a custom component exposed unlabeled icon buttons and inconsistent tab order. JAWS/NVDA only announced "button" or skipped controls, which blocked keyboard operation. The update provides descriptive names for Add, Remove, and Move, normalizes tab stops, and announces list updates to meet ADA expectations. (SITES-30660)
* Quick Publish now returns a clear success notification. The dialog box closes, a toast confirms the action, and screen readers announce the message so authors do not miss the result. (SITES-26912)
* No change required. Adobe reviewed the claim that the search icon overlaps nearby text. The header included a customer-added label; vanilla AEM renders only the icon. A clean instance shows correct layout at 100% zoom, so the bug was closed as out of scope. (SITES-26910)
* Create Page themes no longer hide the focus state. Aquatic and Desert styles render a consistent highlight on the **Basic** tab and adjacent tabs during keyboard navigation. This change restores predictable, perceivable focus feedback for low-vision users. (SITES-26907)



#### Admin User Interface{#sites-adminui-6524}

* Screen-reader users received no navigational help in the **Catalog System Blueprint** grid. JAWS only announced the cell position and then fell silent. The release adds accessible guidance and roles, enabling JAWS to read the list context, the selected item, and the required arrow/Space controls. (SITES-30661)

#### Classic UI{#sites-classicui-6524} 

* Classic UI checkboxes lost their labels and showed blank options. Dialog boxes also displayed encoded HTML such as `<br>`. The update restores checkbox labels and decodes markup, so dialog boxes read correctly. (SITES-31822) MAJOR

#### [!DNL Content Fragments]{#sites-contentfragments-6524}




#### [!DNL Content Fragments] - Admin{#sites-admin-6524}

* Parentheses in a Content Fragment name caused the References panel to misreport usage. Authors saw 0 even when other fragments referenced it. The fix corrects the path parsing for "(" and ")" and surfaces the proper non-zero count and entries. (SITES-35078) CRITICAL


#### [!DNL Content Fragments] - Fragments Editor{#sites-fragments-editor-6524}

* Unpublish failed for Content Fragments whose DAM path contained parentheses. The Manage Publication wizard rewrote "(" and ")" and broke the asset path. The fix preserves the characters and resolves the correct item, so the unpublish action completes. (SITES-35077) CRITICAL
* Editing a Content Fragment and going back to the Assets list hid the fragment or the whole folder. The list failed to refresh after closing the editor. The fix now refreshes the list reliably and keeps the edited fragment visible without a hard reload. (SITES-35374) CRITICAL
* Content Fragment Editor failed to open the Polaris Asset Selector because required IMS scopes were removed. The fix restores the minimal scopes and re-establishes the Delivery connection. Asset browsing and selection work again, without HTTP 500 errors. (SITES-35837)



#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6524}

* After each deployment, valid GraphQL queries started returning `GraphQL_QueryValidationError`. The endpoint kept a stale schema until teams flushed caches or restarted. The fix refreshes the GraphQL schema and persisted-query registry during deployment, restoring normal responses immediately. (SITES-34301) CRITICAL


#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6524}

* A ()

#### [!DNL Content Fragments] - REST API{#sites-restapi-6524}

* A ()


#### Component Console{#sites-component-console-6524}



#### Core Backend{#sites-core-backend-6524}

* F


#### Core Components{#sites-core-components-6524}

* A ()

#### Campaign integration{#sites-campaign-integration-6524}

* A ()

#### ContentHub {#sites-contenthub-6524}

* ContextHub no longer injects a second jQuery copy on publish pages. The segment-engine client library drops the cq.shared dependency that pulled jQuery 1.12.4, so sites load one consistent jQuery and front-end code works reliably. (SITES-30404) MAJOR

#### Experience Fragments{#sites-experiencefragments-6524}

* Exporting an Experience Fragment to Target crashed with `Attempt to modify attribute at illegal index: -1`. Web vitals instrumentation conflicted with the exporter and corrupted attribute handling. The fix hardens attribute processing and removes that conflict. Exports succeed and the fragment renders in Target. (SITES-31891) MAJOR

#### Foundation Components (Legacy){#sites-foundation-components-legacy-6524}

* A ()


#### Launches{#sites-launches-6524}

* Deleting a very large Launch froze the repository. The job queued too many removals and starved other requests. The fix batches deletes and yields between chunks, so cleanup completes while the system stays responsive. (SITES-32004) MAJOR
* Launch promotion updates page properties `jcr:title`, `jcr:description`, and `cq:redirectTarget` on the source page. The change removes property exclusions in MSM rollout config and workflow logic. Campaigns, translations, and SEO keep consistent titles, descriptions, and redirects. (SITES-34509)
* The Launch action ignored scope and included pages that shared the same parent as the target section. The update enforces subtree boundaries and promotes only the chosen page and its descendants. Unrelated pages keep their existing content. (SITES-34344)
* Fixed nested Launch auto-promotion that stopped at Author and skipped the Publish tier. Auto-promotion for a child launch publishes the updated pages to the configured publishers and completes the Full Launch as scheduled. (SITES-30420)

#### Link Checker{#sites-link-checker-6524}

* A ()

#### MSM - Live Copies{#sites-msm-live-copies-6524}

* A folder-level rollout failed to create live copies for Experience Fragments under that folder. Individual rollouts worked, which broke bulk workflows. The change aligns folder rollout with page behavior and propagates relationships and references across the subtree. (SITES-35161)
* After deleting a component in a Live Copy, **Enable Inheritance** broke with a JavaScript error and the component stayed missing until a second try. The update fixes the post-delete reload to carry the right parameters and replaces the obsolete alert call. The dialog box opens cleanly and inheritance restores on the first attempt. (SITES-31387)
* The Rollout wizard accepted **Later** with no date. Authors advanced and created a rollout without a schedule. The update enforces date selection and displays a clear prompt. The **Continue** action stays disabled until a date exists. (SITES-31374)


#### Page Editor{#sites-pageeditor-6524}

* Opening Content Tree on a page with a Personalization Container returned an empty panel and a console null-reference error. Authors could not pick or configure components. The update removes the error and re-enables the tree and component interactions. (SITES-34336) MAJOR
* AEM 6.5 SP23 broke mode switching in the Page Editor. Clicking **Layout**, **Developer**, or **Targeting** left the editor stuck in **Edit** mode and threw a console `TypeError`. The update restores toolbar mode changes and clears the error. (SITES-34536)
* The Page Editor jumped away from the insertion point when authors added components in long containers. The update tunes overlay timing and scroll handling. The view holds its place and the new component remains in sight and ready to configure. (SITES-32621)
* Custom tag labels failed in Page Editor and the UI always displayed "Tags." The predicate now evaluates `fieldLabel` first and `labelText` second, then applies the default. Authors see the label they set. (SITES-32278)
* Canceling the Location filter in Sites misaligned the OmniSearch icon and overlapped it with the placeholder text. The icon became unclickable. The fix realigns the icon and restores its hit area, so mouse and keyboard both trigger search. (SITES-30946)
* Choosing Developer left the page in a bad state and blocked authoring on that page. The panel vanished and the UI stopped responding. The update repairs the mode-toggle logic and cache handling, keeping the page editable and showing Developer data immediately. (SITES-30922)
* Clicking **Clear** in **Insert New Component** did not remove the search query and left the list filtered to a single item (Accordion). The fix resets the query and refreshes the list. All allowed components appear again. (SITES-30921)


#### Replication{#sites-replication-6524}

* A ()


#### Rich Text Editor{#sites-rte-6524}

* In full-screen, the Rich Text Editor hid the Spell Check result behind the dialog box when no errors existed. The update brings the result panel to the front and keeps messages and suggestions visible. Authors review and accept corrections without leaving full-screen. (SITES-32366)
* Rich Text Editor images now honor the selected alignment. Authors set left, center, or right in the image dialog and the editor applies that choice consistently in the output. The change also stabilizes the Alt Text dialog so alt text and alignment save and persist across re-edits. (SITES-30634)



#### Universal editor {#sites-universal-editor-6524}

* Configuring the Query Token Authentication Handler confused users because labels didn't match the fields. The UI pulled text from the path and displayed the wrong names. The fix restores clear, accurate labels for service ranking and query token options. (SITES-31305)

### [!DNL Assets]{#assets-6524}

* T

#### [!DNL Dynamic Media]{#assets-dm-6524}






### [!DNL Forms]{#forms-6524}

#### Forms Designer 


#### Forms


#### Forms JEE 


 
#### Forms Captcha {#forms-captcha-6524} 

#### XMLFM {#forms-xmlfm-6524}

* A ()

[!DNL Adaptive Forms] {#adaptive-forms-6524}

* A ()


#### [!DNL Forms Designer] {#forms-designer-6524}

* A ()


### Foundation {#foundation-6524}

* F

#### Apache Felix {#foundation-apachefelix-6524}





#### Campaign{#foundation-campaign-6524}

* A ()


#### Cloud Services{#foundation-cloudservices-6524}

* A ()


#### Communities {#foundation-communities-6524}

* A ()


#### Content distribution{#foundation-content-distribution-6524}

* A ()


#### CRX {#foundation-crx-6524}

* A ()


#### Granite{#foundation-granite-6524}

* R


#### Integrations{#foundation-integrations-6524}

* A ()


#### Jetty{#foundation-jetty-6524}





#### Localization{#foundation-localization-6524}

* Sites Admin Column view cut off localized labels in French and Spanish. "End Time" and "Off Time" appeared truncated and showed no tooltip. Adobe corrected the translations and restored the tooltip on hover, so labels read in full. (SITES-31318)
* The **Move** dialog box in Sites showed raw i18n keys instead of readable labels. Items such as "Referencing pages," "Created on," "Created by," and "Path" looked garbled. The fix hooks the dialog box to the correct dictionaries and supplies translations, with English fallback. (SITES-30881)


#### Oak {#foundation-oak-6524}

* A ()


#### Platform{#foundation-platform-6524}



#### Security{#foundation-security-6524}

* A

#### Sling{#foundation-sling-6524}

* A ()

#### SPA editor {#foundation-spa-editor-6524}

* Turning on Sling Main Servlet **Check Content-Type** overrides broke `.model.json` exports in AEM 6.5 SP21/22. Requests returned HTML or errors because the exporter flipped the type mid-chain. The fix emits JSON with the correct type from the start, so `.model.json` works on Author and Publish environments. (SITES-32634)


#### Translation{#foundation-translation-6524}



#### User interface{#foundation-ui-6524}



#### WCM{#foundation-wcm-6524}



#### Workflow{#foundation-workflow-6524}




## Install [!DNL Experience Manager] 6.5.24.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.24.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.24.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.24.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Sack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.24.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.24.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.24.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

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

The UberJar for [!DNL Experience Manager] 6.5.24.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.22/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.24</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.



## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md/) for a detailed list of all features deprecated or removed for AEM 6.5.

### SPA Editor {#spa-editor}

[The SPA Editor](/help/sites-developing/spa-overview.md) has been deprecated for new projects starting with release 6.5.24 of AEM 6.5. The SPA Editor remains supported for existing projects, but should not be used for new projects.

The preferred editors for managing headless content in AEM are now:

* [The Universal Editor](/help/sites-developing/universal-editor/introduction.md) for visual editing.
* [The Content Fragment Editor](/help/sites-developing/universal-editor/introduction.md) for form-based editing.

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST. -->

* **Issue with JSP scripting bundle in AEM 6.5.21-6.5.24 and AEM 6.5 LTS GA**
AEM 6.5.21, 6.5.22, 6.5.23, 6.5.24, and AEM 6.5 LTS GA ship with the `org.apache.sling.scripting.jsp:2.6.0` bundle, which contains a known issue. The issue typically occurs under high load when the AEM instance handles many concurrent requests.

  When this issue occurs, one of the following exceptions may appear in the error logs alongside references to `org.apache.sling.scripting.jsp:2.6.0`:

  * `java.io.IOException: classFile.delete() failed`
  * `java.io.IOException: tmpFile.renameTo(classFile) failed`
  * `java.lang.ArrayIndexOutOfBoundsException: Index 0 out of bounds for length 0`
  * `java.io.FileNotFoundException`

  When this error occurs, the only recovery method is to restart the AEM instance.

  Contact Adobe Customer Support and reference this release note for a resolution.

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

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails. That is, the functionality does not work.
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

### Known issue for AEM Sites {#known-issues-aem-sites-6524}

Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)

### Known issues for AEM Forms {#known-issues-aem-forms-6524}

>[!NOTE]
>
> Do not upgrade to Service Pack 6.5.24.0 for issues that do not have hotfixes available, as it may lead to unexpected errors. Upgrade to Service Pack 6.5.24.0 only after the required hotfixes are released. 

#### Issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

* **FORMS-20203**: When a user upgrades the Struts framework from version 2.5.x to 6.x, the Policies UI in AEM Forms fails to display all configurations, such as the option to add a watermark.

* **FORMS-20360**: After upgrading to AEM Forms Service Pack 6.5.24.0, the ImageToPDF conversion service fails with the error:
    ```17:15:44,468 ERROR [com.adobe.pdfg.GeneratePDFImpl] (default task-49) ALC-PDG-001-000-ALC-PDG-011-028-Error occurred while converting the input image file to PDF. com/adobe/internal/pdftoolkit/core/encryption/EncryptionImp```

* **FORMS-20478**: When attempting to convert type 7/8 TIFF files to PDF, the conversion process fails with error "ALC-PDG-001-000-Image2Pdf conversion failed, caused by: com/sun/image/codec/jpeg/JPEGCodec" and "ALC-PDG-016-003-An unknown/unexpected error occurred during PDF post-processing." The system attempts to retry using TM ImageIO TIFF decoder but ultimately fails to complete the job.

* **FORMS-14521**: If a user tries to preview a draft letter with saved XML data, it gets stuck in `Loading` state for some specific letters.

* AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x for the forms component. This delivers previously missed Struts changes that were not included in SP24. The support was added via a [Hotfix](/help/release-notes/aem-forms-hotfix.md) that you can download and install to add support for the latest version of Struts.

#### Other Known Issues {#aem-forms-other-known-issues}

* After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder (FORMS-14926), perform the following steps to resolve the issue:

  1. Stop the locators, if they are running.
  2. Stop the AEM Server. 
  3. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  4. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  5. Open the command prompt in administrator mode.  
  6. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

* When users upgraded from AEM 6.5 Forms Service Pack 18 or 19 to Service Pack 20 or 21, they encountered a JSP compilation error. This error prevented them from opening or creating adaptive forms. It also caused issues with other AEM interfaces. Those interfaces included the Page Editor, AEM Forms UI, Workflow editor, and System Overview UI. (FORMS-15256)

  If you face such an issue, perform the following steps to resolve it:
    1. Navigate to the directory `/libs/fd/aemforms/install/` in CRXDE.
    2. Delete the bundle with the name `com.adobe.granite.ui.commons-5.10.26.jar`.
    3. Restart your AEM Server.

* In the Print Preview of the Interactive Communications Agent UI, the currency symbol (such as the dollar sign $) is inconsistently displayed for all field values. It appears for values up to 999 but is missing for values of 1000 and above. (FORMS-16557)
* Any modifications to nested layout fragments' XDP in an Interactive Communication are not reflected in the IC editor. (FORMS-16575)
* In the Print Preview of the Interactive Communications Agent UI, some calculated values are not displayed correctly. (FORMS-16603)
* When the letter is viewed in Print Preview, the content is changed. That is, some spaces disappear, and certain letters are replaced with `x`. (FORMS-15681)
* **FORMS-15428**: After updating to AEM Forms Service Pack 20 (6.5.20.0) with the Forms Add-On, configurations relying on the legacy Adobe Analytics Cloud Service using credential-based authentication stop working. This issue prevented analytics rules from executing correctly.

* When a user configures a WebLogic 14c instance, the PDFG service in AEM Forms Service Pack 21 (6.5.21.0) on JEE running on JBoss&reg; fails due to classloader conflicts involving the SLF4J library. The error is displayed as follows (CQDOC-22178):
  
    ```java
    Caused by: java.lang.LinkageError: loader constraint violation: when resolving method "org.slf4j.impl.StaticLoggerBinder.getLoggerFactory()Lorg/slf4j/ILoggerFactory;"
    the class loader org.ungoverned.moduleloader.ModuleClassLoader @404a2f79 (instance of org.ungoverned.moduleloader.ModuleClassLoader, child of 'deployment.adobe-livecycle-jboss.ear'
    @7e313f80 org.jboss.modules.ModuleClassLoader) of the current class, org/slf4j/LoggerFactory, and the class loader 'org.slf4j.impl@1.1.0.Final-redhat-00001' @506ab52
    (instance of org.jboss.modules.ModuleClassLoader, child of 'app' jdk.internal.loader.ClassLoaders$AppClassLoader) for the method's defining class, org/slf4j/impl/StaticLoggerBinder,
    have different Class objects for the type org/slf4j/ILoggerFactory used in the signature.

    ```

* FORMS-21378: When Server-Side Validation (SSV) is enabled, form submissions may fail. If you encounter this issue, please contact Adobe Support for assistance.



## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.24.0](/help/release-notes/assets/65230-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.24.0](/help/release-notes/assets/65230-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are available to customers only. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)
