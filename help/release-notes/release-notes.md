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

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.24.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | November 26, 2025 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.24.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

<!-- OLD DOWNLOAD URL
(https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip) -->

## What is included in [!DNL Experience Manager] 6.5.24.0 {#what-is-included-in-aem-6524}

[!DNL Experience Manager] 6.5.24.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5.

<!-- UPDATE FOR EACH NEW RELEASE -->


## Key features and enhancements

### Forms

* **Support for passing custom XCI:** Added support for passing custom XCI in parameters of the cmdline application xmlformcmd. This enables users to specify custom XCI files for testing, enhancing flexibility and control over the testing process. (LC-3923248)


## Fixed issues in Service Pack 24 {#fixed-issues}

<!-- 6.5.24.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 

### [!DNL Assets] {#assets-sp24}

* After updating to version 6.5.23.0, sorting folders by modification date in Card View caused difficulties in locating recently modified assets for on-premise deployments. (ASSETS-56946) 
* Repeated warning log entries are generated during scheduler executions. (ASSETS-52554) 
* Title sorting is not working in the List View. (ASSETS-50716) 
* The Collection Properties window does not close even after clicking the Cancel button. (ASSETS-48504) 

* An *Invalid URL* error occurs when attempting to annotate assets in AEM 6.5.22. (NPR-42684)
* The Assets Metadata Editor form does not reinitialize after performing relate or unrelate actions. (ASSETS-52207)
* When assets from the remote DAM resync to the Sites local, the published status of the assets incorrectly updates to `Not published`. (ASSETS-48958)
* Issues encountered while upgrading from SP23 to 6.5 LTS version. (ASSETS-50541)

### [!DNL Sites]{#sites-6524}

#### Accessibility {#sites-accessibility-6524}

* The **Switch display format** dialog box now supports full keyboard operation. Focus no longer skips the **View Settings** button, and standard keys (`Tab`, `Enter`, `Space`) work consistently. (SITES-24306) 
* Keyboard users can remove the published status tags without a mouse. Focus lands on each tag and activation works with `Enter`/`Space` and Backspace/Delete. The tag control now behaves like a button, which improves screen-reader feedback and meets WCAG 2.1.1 Keyboard. (SITES-24491) 
* Filters rail reflows responsively at narrow viewports. Selection controls and results stay within the viewport at 400% zoom, eliminating horizontal scrolling and content cut-off. (SITES-24708) 
* AEM restores full keyboard access to the ContextHub Reset, Persona, and Device buttons. Tab and arrow keys reach each control, show a visible focus indicator, and activate actions with `Enter` or `Space`. Screen readers announce clear labels. (SITES-24939) 
* Date input and picker remain fully visible at 320 px. The Timewarp modal uses responsive sizing, so the control no longer clips or disappears on the smallest viewport. (SITES-24962) 
* References rail now supports 400% browser zoom without losing access to its content. The rail uses responsive sizing instead of a fixed width, so items remain visible and selectable at 1280×1024. (SITES-24972) 
* Filters Rail now works at 400% zoom. The rail resizes with relative units and no longer blocks or hides filter controls. Users can view and select every filter option without horizontal scrolling or clipped hit-targets. (SITES-24981) 
* Keyboard users can operate formatting menus in the Teaser modal. Pressing `Enter` or `Space` on **List** or **Paragraph Format** opens the pop-up, Arrow keys navigate options, and `Enter` applies the selection. `Escape` closes the menu and restores focus to the triggering control, producing a consistent toolbar workflow. (SITES-25235) 
* The Swatch color picker popover now stays within the viewport at 320 px. The popover shows all color rows and supports scrolling, so authors can select any swatch on small screens. (SITES-25274) 
* Demographic toolbar drop-down menus now work fully with the keyboard. Opening a menu moves focus to the first option, arrow keys navigate the list, and Esc/Tab close or advance without dumping focus to the toolbar. Interactive items use proper semantics so NVDA and other readers announce options correctly. (SITES-25310) 
* Add Component in the Content tree works as designed on AEM 6.5 SP24. The error initial error came from missing author permissions in a local setup, not from AEM. Authors with edit rights can activate the button and add components by keyboard or mouse. (SITES-25312) 
* Keyboard and screen-reader access in the Demographic toolbar now works reliably. Authors using NVDA can traverse **Commerce**, **Persona**, and 88 with arrows, observe clear focus feedback, and understand which tab is active. (SITES-25326) 

* The **Skip to content** link now moves keyboard focus to the main content heading. Focus stays visible on a uniquely identified target, so screen readers announce the correct section. The change meets WCAG 2.4.1 and 2.4.3. (SITES-24061) 
* Keyboard navigation in the Sites home page tree follows a logical sequence after using **Select All**. Focus moves from **Select All** to the next control (Open left rail) instead of jumping back to the start of the page. (SITES-24307) 
* Section titles and edit controls in the Sites editor respond to keyboard focus and activation. Keyboard users reveal the same title and actions that previously appeared only on hover. (SITES-24479) 
* Buttons in the Sites editor expose descriptive names instead of generic or missing labels. Assistive technologies announce the correct action, which improves clarity and reduces misclicks. (SITES-24480) 
* Screen readers receive a spoken "Loading" message while the Sites view refreshes. The update adds a dedicated status live region and writes the message into it programmatically, which confirms progress without moving focus. (SITES-24481) 
* The Assets side rail now includes a clear **Close** control and returns focus to the toggle button. Keyboard and screen-reader users dismiss the panel immediately instead of tabbing through every control. The change reduces keystrokes and matches expected panel behavior. (SITES-24489) 
* The ARIA tab list in the Sites Page Editor includes a descriptive name. Screen readers now identify the control as a tab list and read the correct label, letting users find the right set of tabs and move between them reliably. (SITES-24492) 
* Search in the Editor side rail now announces results to screen readers. As users type, a live status message reports the number of matches and updates without moving focus. Keyboard users discover the results immediately. (SITES-24506) 
* Row selection in List View improves for assistive-technology users. The checkbox exposes a meaningful name that is derived from the row Title, so announcements stay brief and describe the action correctly. (SITES-24514) 
* Corrected List View accessibility names. The table removes `aria-label` from non-interactive elements and assigns the label to the actionable link or button. Screen reader users now hear accurate, non-duplicated labels across the column. (SITES-24515) 
* The sticky header stopped obscuring the teaser modal dialog box during high-zoom use. Content remains readable and usable at 200% and 400% zoom, with vertical flow and no clipped sections. (SITES-24523) 
* Typing in the search field no longer triggers a premature announcement of the first result or accidental activation. The experience now announces a concise status message with the result count, while the focus remains in the field until the user navigates to the list. (SITES-24658) 
* The Alternative text field in the text editor's hyperlink dialog box now exposes a programmatic label. Screen readers announce "Alternative text" for the field, and focus lands on the correctly named control. This fix improves navigation for keyboard and speech users. (SITES-24675) 
* Added a live status message to the References rail so assistive technologies announce changes immediately. Selecting multiple items triggers a clear message about reference availability, which prevents silent state changes and reduces repeat actions. (SITES-24678) 
* The Image dialog box now announces its loading state through an ARIA live region. Screen readers hear a "Loading, please wait" message while the spinner appears. And, a ready update when content finishes, so users know when they can interact. (SITES-24697) 
* The Link selection dialog box now exposes a live region that announces search results. Screen readers hear the "results updated" status after each search without moving focus, so users get clear confirmation that the search was completed. (SITES-24700) 
* The Link selection dialog box now reflows at 320 px. All fields and actions stay visible and usable, and the horizontal scroll bar no longer appears. (SITES-24709) 
* The Link Selection dialog box now uses the same label for both the on-screen text and the accessible name on every tree item. Screen readers announce each item while moving with the arrow keys, including the last level, eliminating silent nodes and mismatched names. (SITES-24710) 
* Change Filters now report its state as expanded or collapsed. The button toggles `aria-expanded` in sync with the filter panel and exposes a single, clear name ("Change filters"), removing the confusing "filter?" announcement. Screen-reader users can predict the result of activating the control. (SITES-24713) 
* Modal headers no longer cover content at 320 px width. The header releases from its sticky state and the dialog box body scrolls, so all fields and action buttons remain visible and usable. Keyboard users can reach every control without loss of focus. (SITES-24718) 
* App Navigation links now expose proper link semantics. Screen readers announce each item as a link rather than a list item, which improves keyboard navigation and voice control. The list container keeps list semantics, while links remain the focusable targets. (SITES-24719) 
* The results status now announces to screen readers when filters change. NVDA reads both the "X of Y results" count and the "no results" message. The paging status uses a live region that updates in place, so users hear confirmation without moving focus. (SITES-24720) 
* The spin button in the Carousel dialog box now announces a single, concise name to screen readers. The control no longer repeats both the group label and the input label, which reduces verbosity and confusion for NVDA users. (SITES-24725) 
* The Help menu search list exposes proper semantics. The container presents a list, and each result stays a link without a conflicting role. NVDA and JAWS announce links accurately and navigation remains consistent. (SITES-24729) 
* Adobe fixed the color-swatch pop-up in User Preferences so NVDA announces the swatch in focus, not the previously selected swatch. Keyboard users hear accurate color names while moving through the list and can confirm the correct selection. (SITES-24739) 
* NVDA now reads the full Description in the Tree directory. The details panel exposes multi-line text as one value and links it to the field label. Keyboard users hear the complete text while tabbing through read-only fields. (SITES-24780) 
* The tree directory now announces the Modified date. NVDA reads the date when focus moves into the Modified column. The grid ties each date to the item name so users hear both the file and its last update. (SITES-24782) 
* Preview mode now honors user text-spacing preferences. The canvas reflects letter, word, and line-height changes across all previewed content. Text no longer stays fixed or clips while spacing increases. Keyboard and low-vision users read content without layout breaks. (SITES-24936) 
* AEM corrects the tab order on Assets Editor pages. Tabbing now moves from the header controls to the contact hub buttons, and finally into the canvas tools in a clear sequence. Screen readers follow the same order, which removes confusion and speeds keyboard navigation. (SITES-24937) 
* AEM adds a programmatic name to the Card Actions menu bar. Screen readers announce the control correctly, and speech users can target it by name. Keyboard navigation and focus remain unchanged. (SITES-24938) 
* Card View menus honor increased text spacing. The More Actions item grows and no longer truncates labels, including Quick Publish. Users who raise letter, word, or line spacing keep full labels and keyboard access. (SITES-24941) 
* Removed the "presentation" role that hid the Sites home page table from the accessibility tree. The table reads correctly again. NVDA and JAWS detect the table, recognize headers, and announce header relationships during row and column navigation. (SITES-24942) 
* Sorting feedback in List View is explicit and consistent. After a sort, the header exposes the order through `aria-sort`. It announces the change, while unsorted headers no longer claim a state, helping screen reader users track which column controls the sort. (SITES-24943) 
* The Edit Layout header no longer exposes a non-working **Edit** button. The control now acts as a static status label and stays out of the tab order, so keyboard users do not waste a keystroke. Use **Select another mode** to change modes, with clear screen-reader feedback. (SITES-24950) 
* The emulator toolbar shows full device names by default. The label no longer truncates on load, so users can read and select devices without guessing. Text scales cleanly across zoom levels and narrow widths. (SITES-24952) 
* Emulator toolbar fits small viewports. At 320 pixels, the device list and controls the display without clipping, so users can select Galaxy S7 and newer models. The layout scales and wraps to avoid horizontal scrolling even at 400% zoom. (SITES-24953) 
* Screen readers announce the selected device and its measurements in the Emulator. NVDA stops reading the ruler stream; the device button uses an attached description for the tooltip text, which reduces noise and guides navigation. (SITES-24955) 
* The filter bar now treats each selected tag as an action button. Clear accessible names and focus handling improve announcements and keyboard control. (SITES-24980) 
* Status updates in the Sites Admin filter view announce to screen readers. When users switch Card/List while items load, NVDA now speaks the "Please wait" message through a live region. This guidance prevents extra clicks and confusion. (SITES-24992) 
* Keyboard focus now moves in a logical order when users expand the left rail. Focus shifts directly from the left rail button to the expanded content, eliminating the need to backtrack or skip elements. This change improves accessibility for screen reader and keyboard users. (SITES-24998) 
* Screen reader feedback for the **Edit** button now matches the control. Activating the button announces the Edit action rather than a preview message, which improves clarity and reduces input errors for non-mouse users. (SITES-25208) 
* The confirm action in the Teaser dialog box announces correctly to screen readers. The control reports "Confirm," not the icon description, giving keyboard and screen-reader users clear guidance. (SITES-25223) 
* The Help button now exposes a clear accessible name. Screen readers announce "Help" instead of a verbose icon description. Users understand the action and can find assistance faster. (SITES-25224) 
* The Timewarp modal displays a clear focus ring on the **`Set Date`** and **Exit Timewarp** links. Users who tab see exactly where the focus lands and avoid unintended actions. The ring maintains at least 3:1 contrast against the background. (SITES-25232) 
* Screen readers now announce the Annotate and Close Annotate controls accurately in the Annotation toolbar. NVDA no longer says "Preview button pressed," which misled authors and suggested the wrong action. The announcement matches the button pressed and keeps the workflow clear. (SITES-25234) 
* Keyboard navigation in the annotation toolbar behaves consistently. Focus no longer jumps to Exit when opening the mode and instead moves to the starting control for adding annotations. Users navigate the controls in sequence without reverse tabbing. (SITES-25241) 
* Small-screen viewing works as expected in the Teaser modal. The dialog box no longer creates a horizontal scroll bar at 320 px, and the toolbar stays accessible without panning sideways. This update helps low-vision users who zoom the page. (SITES-25242) 
* Small-screen viewing works as expected in the Image modal. The dialog box no longer creates a horizontal scroll bar at 320 px, and the image tools remain accessible without panning sideways. This update improves navigation for low-vision users who zoom the page. (SITES-25244) 
* The Search modal honors user text-spacing settings. Raising line height, paragraph spacing, letter spacing, or word spacing no longer cuts off text or overlaps the tree. Content reflows at WCAG 1.4.12 values and stays fully readable. (SITES-25245) 
* The Search modal now fits small screens without overlapping the tree directory at 320 px. Content reflows inside the dialog box, keeps vertical scrolling only, and keeps controls visible. This fix improves readability and keyboard navigation and aligns with WCAG Reflow. (SITES-25246) 
* Carousel modal overflow no longer forces horizontal scrolling at phone-sized widths. The component adapts to 320 px, preserves vertical flow, and keeps controls in view. The change improves readability and keyboard access during authoring. (SITES-25254) 
* Annotation workflows no longer lose focus. The modal places initial focus on a meaningful heading, prevents focus from jumping outside the dialog box, and restores focus to the trigger after dismissal. Screen-reader output stays concise and relevant. (SITES-25257) 
* The **Delete Annotation** dialog box now handles keyboard focus correctly. Opening the dialog box moves focus to its heading for screen-reader context, and closing it sends focus back to the **Delete Annotation** button that launched it. Users no longer land on unrelated controls or behind the modal. (SITES-25258) 
* The Timewarp Date Picker now manages focus correctly. Pressing `Esc` returns focus to the **Date Picker** button, and choosing a date moves focus to the linked input field. Keyboard and screen-reader users keep context and do not land behind the modal. (SITES-25264) 
* Screen readers announce the correct actions for the **Annotate** and **Close Annotate** buttons. NVDA no longer says "Preview button pressed"; it announces the button name so users know when annotation mode starts or ends. (SITES-25268) 
* The Annotation modal now shows a clear **Submit** action. Authors can add a comment and submit it with the pen icon button or dismiss the modal with `Esc`, without guessing the flow. (SITES-25269) 
* Annotation entry includes explicit action buttons. The dialog box exposes **Submit** to save the note and **Cancel** to close it, both keyboard accessible and announced by assistive technology. Authors no longer need to rely on clicking outside the dialog box or pressing only `Esc` to finish. (SITES-25281) 
* Annotation mode now keeps the keyboard focus on the overlay and its toolbar. The page behind the overlay no longer receives focus when authors press Tab, so users stay oriented and can navigate annotations without jumping to underlying content. (SITES-25282) 
* The device selector in Edit Layout works as designed. When two device options have similar widths (for example, iPhone 8 Plus next to Galaxy 7), the selected button shows a tooltip to reveal the full label while both buttons remain visible and accessible. (SITES-25285) 
* At 200% zoom, Edit Layout no longer overruns the page. The toolbar renders fully and exposes horizontal scroll when needed, restoring access to previously hidden controls for low-vision users. (SITES-25288) 
* Tab order in Layout Preview now moves from the primary toolbar directly to the Demographic toolbar. Keyboard and screen-reader users can traverse controls in a predictable sequence instead of jumping to the secondary toolbar. The change aligns with WCAG 2.4.3 Focus Order. (SITES-25305) 
* Zooming the page to 200% no longer hides part of the Demographic toolbar. The toolbar section manages overflow and provides scrolling in its own region, keeping every control visible and operable at high magnification. (SITES-25309) 
* Text inputs in the Demographics toolbar now expose proper accessible names. Each field includes a unique ID with a programmatic label, so screen readers announce the purpose of the field and users can navigate by label. The visible label sits near the control to improve low-vision readability. (SITES-25316) 
* The Edit button now announces the correct action to screen readers in the secondary toolbar. Activating it reads "Edit" instead of the unrelated "Preview button pressed," which removes confusion during keyboard navigation. (SITES-25320) 
* The Demographics toolbar Cart slider now exposes a proper accessible name. Screen readers announce "Cart total" and speech-input tools can target the control by name, improving compliance with WCAG 4.1.2 (Name, Role, Value). (SITES-25322) 
* The Demographics toolbar slider now keeps focus when authors change the value with the arrow keys. Focus no longer jumps to the Cart button, so keyboard users adjust the value continuously and screen readers announce each change. (SITES-25324) 
* Search Assets now Reflow cleanly at 320 px (roughly 400% zoom). The modal keeps headings, fields, and actions readable and non-overlapping, so authors can search without horizontal scrolling. (SITES-25330) 
* The Assets panel in the editor follows a logical focus sequence. Keyboard users tab across each thumbnail and can access the panel exit controls. The change removes skips and improves compliance with WCAG 2.4.3. (SITES-25360) 
* AEM updates the **Lists** and **Paragraphs** buttons in the Teaser modal's rich text editor to expose their expanded and collapsed state. The buttons now toggle `aria-expanded` and announce the state change to screen readers. Authors get clear feedback and avoid guessing before opening or closing the format menus. (SITES-25365) 
* AEM announces the loading state in the Teaser modal. The modal now exposes a live status message while content loads, so NVDA and JAWS speak "Loading, please wait." Authors should receive clear feedback and avoid interacting with the dialog box before it is ready. (SITES-25366) 
* Improves status messaging in the Asset tab of the Link selection dialog box. When an error occurs, the component injects a readable status update and keeps keyboard focus stable, letting NVDA/JAWS inform users right away. (SITES-25368) 
* Corrected UI behavior in the Note panel for very narrow viewports. At 320 px, the title and Add control previously collided; the toolbar now reflows and preserves clear separation between elements. Authors can operate the controls without loss of information or function. (SITES-25376) 
* Fixed a lingering error state in the **Teaser** dialog box's **Links & Actions** tab. After authors enable **Call to Action** and correct blank or invalid fields, the tab clears its error styling and icon and removes `aria-invalid`. Screen readers no longer announce an error once the fields validate. (SITES-25527) 
* Error handling in Sites Admin forms now meets accessibility expectations. When validation fails, the page shows the error immediately, shifts focus to a usable message target, and exposes the text to screen readers such as JAWS. (SITES-27138) 
* Creating a folder in Sites now shows a clear confirmation toast. JAWS announces the message through the live region, so authors receive immediate, accessible feedback after the action. (SITES-27141) 
* Fixed an accessibility gap where images in authoring dialog boxes rendered without alt text. The dialog box now provides descriptive alt text where needed and empty alt for purely visual elements, restoring compliant behavior for JAWS and other screen readers. (SITES-27153) 
* Improved error handling in authoring dialog boxes. When a configuration error occurs, the UI shows explicit text and triggers a screen-reader announcement by way of an alert region. Authors receive immediate feedback and can correct the problem without losing context. (SITES-27155) 
* Fixed a Reflow accessibility defect in Sites Admin. At 400% browser zoom, the toolbar and grid controls overlapped and pushed key actions off-screen, which blocked keyboard navigation and screen-reader use. The layout now reflows correctly so the search, filter, and action buttons remain visible and operable at 400% zoom. (SITES-27238) 
* Corrected low contrast in the lock status message shown in the page Lock/Unlock workflow. The message now meets a 4.5:1 ratio, improving readability and ADA compliance for authors. (SITES-27270) 
* Added accessible names to the checkmark icons in the **Effective Permissions** dialog box. JAWS now announces the icons and their meaning, improving keyboard navigation and ADA compliance. (SITES-27272) 
* Hidden header navigation accepted focus and confused both sighted and screen-reader users. The update disables focus on collapsed controls and exposes only visible items. Navigation stays predictable and meets WCAG 2.4.3. (SITES-35224) 

* Fixed the folder thumbnail icons in Sites Admin to behave as decorative images. The update removes the image role and applies empty alt text, so assistive technology ignores the icons and reads only meaningful labels. (SITES-2852)
* Adobe increased the color contrast for the References text in the Sites home page. The text now meets WCAG 2.1 AA with a ratio of at least 4.5:1 and reads clearly on light themes and bright screens. (SITES-24755)
* The References rail landmark now announces its name to screen readers. The region exposes a unique `aria-label` ("References rail"), which improves landmark navigation and distinguishes it from other regions. (SITES-24973)
* The Description RTE blocked forward Tab navigation and broke dialog flow. The fix restores standard keyboard movement. Authors continue past the field with a single Tab and keep the selection order predictable. (SITES-35228)
* Authoring controls lacked accessible names and exposed raw icon text, which confused JAWS. The fix adds explicit ARIA labels and standard roles. Announcements sound correct and align with accessibility expectations. (SITES-35227)
* The Categories drop-down list lacked a specific label, so JAWS spoke a generic "images button menu." The update names the control "Categories" and defines its role. Screen-reader users hear an accurate label and understand the available choices. (SITES-35226)
* The Properties dialog box displayed a data grid that screen readers treated as plain text. JAWS and NVDA missed focus and failed to announce rows and columns. The fix adds real table semantics and ARIA roles. Screen readers now recognize the table and track focus correctly. (SITES-35225)
* The Content Fragment text editor loaded with a truncated action bar. Icons clipped and the overflow menu became unreachable. The update fixes the layout so the full toolbar stays visible and accessible. (SITES-33005)
* Basic tab form fields failed to show helpful error text. The form now displays clear, inline messages and links them to the field for screen readers. Keyboard and assistive-technology users get immediate guidance to fix input. (SITES-32480)
* The Multifield used in a custom component exposed unlabeled icon buttons and inconsistent tab order. JAWS/NVDA only announced "button" or skipped controls, which blocked keyboard operation. The update provides descriptive names for Add, Remove, and Move, normalizes tab stops, and announces list updates to meet ADA expectations. (SITES-30660)
* Quick Publish now returns a clear success notification. The dialog box closes, a toast confirms the action, and screen readers announce the message so authors do not miss the result. (SITES-26912)
* No change required. Adobe reviewed the claim that the search icon overlaps nearby text. The header included a customer-added label; vanilla AEM renders only the icon. A clean instance shows the correct layout at 100% zoom, so the bug was closed as out of scope. (SITES-26910)
* Create Page themes no longer hide the focus state. Aquatic and Desert styles render a consistent highlight on the **Basic** tab and adjacent tabs during keyboard navigation. This change restores predictable, perceivable focus feedback for low-vision users. (SITES-26907)



#### Admin User Interface{#sites-adminui-6524}

Screen-reader users received no navigational help in the **Catalog System Blueprint** grid. JAWS only announced the cell position and then fell silent. The release adds accessible guidance and roles, enabling JAWS to read the list context, the selected item, and the required arrow/Space controls. (SITES-30661)

#### Classic UI{#sites-classicui-6524} 

Classic UI checkboxes lost their labels and showed blank options. Dialog boxes also displayed encoded HTML such as `<br>`. The update restores checkbox labels and decodes markup, so dialog boxes read correctly. (SITES-31822) 

<!--
#### [!DNL Content Fragments]{#sites-contentfragments-6524}
-->

#### [!DNL Content Fragments] - Admin{#sites-admin-6524}

Parentheses in a Content Fragment name caused the References panel to misreport usage. Authors saw 0 even when other fragments referenced it. The fix corrects the path parsing for "(" and ")" and surfaces the proper non-zero count and entries. (SITES-35078) 


#### [!DNL Content Fragments] - Fragments Editor{#sites-fragments-editor-6524}

* Unpublish failed for Content Fragments whose DAM path contained parentheses. The Manage Publication wizard rewrote "(" and ")" and broke the asset path. The fix preserves the characters and resolves the correct item, so the unpublish action completes. (SITES-35077) 
* Editing a Content Fragment and going back to the Assets list hid the fragment or the whole folder. The list failed to refresh after closing the editor. The fix now refreshes the list reliably and keeps the edited fragment visible without a hard reload. (SITES-35374) 

* Content Fragment Editor failed to open the Polaris Asset Selector because required IMS scopes were removed. The fix restores the minimal scopes and re-establishes the Delivery connection. Asset browsing and selection work again, without HTTP 500 errors. (SITES-35837)

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6524}

After each deployment, valid GraphQL queries started returning `GraphQL_QueryValidationError`. The endpoint kept a stale schema until teams flushed caches or restarted. The fix refreshes the GraphQL schema and persisted-query registry during deployment, restoring normal responses immediately. (SITES-34301) 

<!--
#### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6524}


#### [!DNL Content Fragments] - REST API{#sites-restapi-6524}


#### Component Console{#sites-component-console-6524}


#### Core Backend{#sites-core-backend-6524}


#### Core Components{#sites-core-components-6524}


#### Campaign integration{#sites-campaign-integration-6524}
-->


#### ContentHub {#sites-contenthub-6524}

ContextHub no longer injects a second jQuery copy on publish pages. The segment-engine client library drops the cq.shared dependency that pulled jQuery 1.12.4, so sites load one consistent jQuery and front-end code works reliably. (SITES-30404) 

#### Experience Fragments{#sites-experiencefragments-6524}

* Experience Fragments now localize the warning shown when no Adobe Target configuration exists. The message displays in the author's locale instead of English, so export and activation steps read correctly for global teams. (SITES-11868) 
* Publishing an Experience Fragment variation now shows a localized error message when no cloud service attaches to the variation. The message appears in the UI in the user's language instead of an English-only string. (SITES-20293) 
* Exporting an Experience Fragment to Target crashed with `Attempt to modify attribute at illegal index: -1`. Web vitals instrumentation conflicted with the exporter and corrupted attribute handling. The fix hardens attribute processing and removes that conflict. Exports succeed and the fragment renders in Target. (SITES-31891) 

* Experience Fragment properties now localize the **References** tab. Labels and column headings such as "Page," "Page path," and "Variation title" show in the author's language. This change removes English-only strings and keeps the properties view consistent for global teams. (SITES-11203)
* The **Variations** > **Create workflow** now shows complete translation text. The dialog box handles long locale strings by wrapping and sizing content correctly, eliminating clipped or cut-off labels. (SITES-19304)
* Experience Fragment properties now localize the Social Media status labels. Authors see status values such as Posted and Not Posted in their selected language across all locales. This change removes English-only strings that caused confusion during review. (SITES-20014)

<!--
#### Foundation Components (Legacy){#sites-foundation-components-legacy-6524}
-->

#### Launches{#sites-launches-6524}

* Deleting a very large Launch froze the repository. The job queued too many removals and starved other requests. The fix now batches delete and yields between chunks, so cleanup completes while the system stays responsive. (SITES-32004) 

* Launch Configuration > Properties shows working Company and Property drop-downs. **Save** and **Close** honors completed fields, and the Title validation no longer triggers errors on Company or Property. (CQ-4359853)
* Required checks in IMS Configuration run on update, not only on creation. Empty values in fields like Client ID or Client Secret display an error and halt the save until a valid value is entered, preventing reuse of the prior value. (CQ-4359938)
* Launch creation shows translated validation and error strings. English-only messages for creation failures and missing source pages no longer appear. Authors see clear, locale-correct feedback during Launch setup. (SITES-13085)
* Launch promotion updates page properties `jcr:title`, `jcr:description`, and `cq:redirectTarget` on the source page. The change removes property exclusions in MSM rollout config and workflow logic. Campaigns, translations, and SEO keep consistent titles, descriptions, and redirects. (SITES-34509)
* The Launch action ignored scope and included pages that shared the same parent as the target section. The update enforces subtree boundaries and promotes only the chosen page and its descendants. Unrelated pages keep their existing content. (SITES-34344)
* Fixed nested Launch auto-promotion that stopped at Author and skipped the Publishing tier. Auto-promotion for a child launch publishes the updated pages to the configured publishers and completes the Full Launch as scheduled. (SITES-30420)

<!--
#### Link Checker{#sites-link-checker-6524}
-->

#### MSM - Live Copies{#sites-msm-live-copies-6524}

* A folder-level rollout failed to create live copies for Experience Fragments under that folder. Individual rollouts worked, which broke bulk workflows. The change aligns folder rollout with page behavior and propagates relationships and references across the subtree. (SITES-35161)
* After deleting a component in a Live Copy, **Enable Inheritance** broke with a JavaScript error and the component stayed missing until a second try. The update fixes the post-deleted reload to carry the right parameters and replaces the obsolete alert call. The dialog box opens cleanly and inheritance restores on the first attempt. (SITES-31387)
* The Rollout Wizard accepted **Later** with no date. Authors advanced and created a rollout without a schedule. The update enforces date selection and displays a clear prompt. The **Continue** action stays disabled until a date exists. (SITES-31374)


#### Page Editor{#sites-pageeditor-6524}

* Opening the content tree on a page with a Personalization Container returned an empty panel and a console null-reference error. Authors could not pick or configure components. The update removes the error and re-enables the tree and component interactions. (SITES-34336) 
* AEM 6.5 SP23 broke mode switching in the Page Editor. Clicking **Layout**, **Developer**, or **Targeting** left the editor stuck in **Edit** mode and threw a console `TypeError`. The update restores toolbar mode changes and clears the error. (SITES-34536)
* The Page Editor jumped away from the insertion point when authors added components in long containers. The update tunes overlay timing and scrolling handling. The view holds its place and the new component remains in sight and ready to configure. (SITES-32621)
* Custom tag labels failed in Page Editor and the UI always displayed "Tags." The predicate now evaluates `fieldLabel` first and `labelText` second, then applies the default. Authors see the label that they set. (SITES-32278)
* Canceling the Location filter in Sites misaligned the OmniSearch icon and overlapped it with the placeholder text. The icon became unclickable. The fix realigns the icon and restores the hit area, so mouse and keyboard both trigger search. (SITES-30946)
* Choosing Developer left the page in a bad state and blocked authoring on that page. The panel vanished and the UI stopped responding. The update repairs the mode-toggle logic and cache handling, keeping the page editable and showing Developer data immediately. (SITES-30922)
* Clicking **Clear** in **Insert New Component** did not remove the search query and left the list filtered to a single item (Accordion). The fix resets the query and refreshes the list. All allowed components appear again. (SITES-30921)

<!--
#### Replication{#sites-replication-6524}
-->

#### Rich Text Editor{#sites-rte-6524}

* In full-screen, the rich text editor hid the Spell Check result behind the dialog box when no errors existed. The update brings the result panel to the front and keeps messages and suggestions visible. Authors review and accept corrections without leaving full-screen. (SITES-32366)
* Rich text editor images now honor the selected alignment. Authors set left, center, or right in the image dialog and the editor applies that choice consistently in the output. The change also stabilizes the Alt Text dialog so alt text and alignment save and persist across re-edits. (SITES-30634)

#### Universal editor {#sites-universal-editor-6524}

Configuring the Query Token Authentication Handler confused users because labels didn't match the fields. The UI pulled text from the path and displayed the wrong names. The fix restores clear, accurate labels for service ranking and query token options. (SITES-31305)


### [!DNL Assets]{#assets-6524}


#### [!DNL Dynamic Media]{#assets-dm-6524}

* The **Select Thumbnail** option for videos now behaves correctly in AEM Assets - Dynamic Media. The click opens the dialog box and allows selection of a thumbnail from Assets, eliminating the previous dead-click behavior and removing the limitation to video-frame extraction only. (ASSETS-58926) 


### [!DNL Forms]{#forms-6524}

<!--
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, December 4, 2025. In addition, a list of Forms fixes and enhancements is added to this section.
-->

#### Forms Designer 

* Users experienced issues with hyperlinks not being clickable in specific test cases, affecting their ability to navigate and verify links within the application. (LC-3923505)
* Users experienced accessibility issues with PDFs generated using AEM Forms Designer 6.5.23 for non-Latin languages. Path tags were not placed inside an Artifact container, causing failures in PAC and screen-reader checks. (LC-3923295) 
* Users experienced broken hyperlinks in Portable Document Format (PDF) text boxes after patching from version 6.5.21 to 6.5.23 using the Output Service. (LC-3923290)
* Users experienced accessibility issues with Document of Record (DoR) forms. When input fields were empty, screen readers only read the field captions and not the values, making it difficult for users with disabilities to navigate the forms effectively. (LC-3923234)
* Users faced accessibility problems in DoR PDF forms where NVDA incorrectly read "unavailable" for checkboxes, radio buttons, and text fields, often repeating the message and creating confusion for screen-reader users. (LC-3923201)
* Users experienced a tab order discrepancy in the XDP when adding new fields. The existing tab order changed unexpectedly, affecting form navigation. (LC-3923183, LC-3922630)
* Users experienced issues with HTML rendering. When using the `docReady` event, it did not trigger correctly in HTML, causing scripts not to execute as expected. (LC-3923118)
* Users experienced issues with PDF rendering scripts not working in the AEM Forms Cloud production environment. (LC-3923082 )
* Users experienced issues with floating fields in forms. When using different data files, floating fields rendered correctly with one file but not with the other, despite minor differences unrelated to the fields. (LC-3923056)
* Users experienced a blank Spanish master page when only English content was selected in an XDP (XML Data Package) with multiple master pages. (LC-3923009)
* Users observed outdated copyright year information in the AEM Designer. This occurred in the pop-up box at startup, the "About" section, and the "Legal Notices" section, displaying "2003-2024" instead of "2003-2025". (LC-3923005)
* Users encountered a blank PDF page when using pagination in AEM Forms Designer. The issue occurred when selecting "Top of the Next Page/Top of Page" for the WireAdviceHeader, disrupting the layout of data iterations. (LC-3922997, LC-3922830)
* Users experienced an issue where the filedigest value for Extensible Markup Language (XML) Schema Definition (XSD) was not persisting in the 64-bit version of AEM Forms Designer. (LC-3922924)
* Users experienced unstable hyperlink formatting in AEM Designer 6.5.19, where hyperlinks inside a textbox incorrectly adopted styles from surrounding text, such as the first character's formatting. (LC-3922376)
* Users experienced issues rendering HTML forms via Mobile rendering on MAC with AEM Forms OSGI v6.5.22. (LC-3923058)
* Users experienced "path object not tagged" errors in Portable Document Format (PDF) files when using bordered or backgrounded fields in XDP templates created with Designer 6.5.23 and analyzed with PAC 2024. (LC-3923013)
* Users experienced an error with the background color of the heading "Dati Richiedente" in Portable Application Component (PAC), receiving the message "path object not tagged". (LC-3922912)
* Users experienced an issue where specific templates substituted the intended font with a condensed font. (LC-3922330)

#### Adaptive Forms

* Users experienced missing options in the Rule Editor. When authors wrote rules on number inputs, the Query, UTM, and Browser details options were not available. (FORMS-21660)
* Users experienced application crashes when interacting with OdataResponse due to a null pointer exception. (FORMS-20344)
* Users experienced issues when creating rules to show a panel and set focus on an element inside it. The setFocus rule executed before the visibility update, causing the focus action to fail. (FORMS-19563)
* Users experienced issues with component selection in AEM Forms Author. When navigating between tabs in edit mode, some containers became unselectable, preventing easy identification and interaction. (FORMS-18525)
* Users experienced an "Invalid URL" error when attempting to annotate assets in AEM 6.5.22. (NPR-42684)

### Foundation {#foundation-6524}


#### Apache Felix {#foundation-apachefelix-6524}

Updated the Felix Web Console bundle to include FELIX-6747. This patch corrects response handling that previously broke page rendering and authentication in the OSGi Web Console. The console loads consistently and no longer throws IllegalStateException entries in the logs. (NPR-42730)

<!--
#### Campaign{#foundation-campaign-6524}

#### Cloud Services{#foundation-cloudservices-6524}

#### Communities {#foundation-communities-6524}

#### Content distribution{#foundation-content-distribution-6524}

#### CRX {#foundation-crx-6524}
-->

#### Granite{#foundation-granite-6524}

* Raw or English-only strings no longer appear in the **Remove Access Control** dialog box. The dialog box presents fully localized content across supported languages for consistent accessibility. (GRANITE-48479) 
* The Help icon now exposes a concise label to assistive technologies. JAWS reads "Help button" and no longer adds extraneous "menu" wording. This update brings the control into WCAG 4.1.2 conformance and simplifies keyboard and screen-reader use. (GRANITE-55360) 
* Restore the HTL script engine factory after eliminating a dependency loop in OSGi services. Environments start cleanly, HTL rendering works across author pods, and administrators no longer encounter startup failures or missing scripting services. (GRANITE-58276) 

* The header Search box no longer overlays the magnifying-glass icon on the placeholder text. The placeholder displays with proper padding and remains fully readable across browsers. (GRANITE-54391)
* Authors see readable labels in Autocomplete fields rather than raw values in the dialog box. The implementation keeps the value persisted in JCR and improves clarity for single- and multi-select configurations that source options dynamically. (GRANITE-57615)
* Edit mode stays functional when htmlLibraryManager.debug is set to true. The change restores proper clientlib resolution and loading, allowing developers to use the HTML Library Manager's debugging tools during authoring. (GRANITE-58002)
* Replication Agent editing page no longer throws a JavaScript error in the Classic UI. The page opens, displays all tabs, and saves agent settings without console errors. (GRANITE-58302)
* Corrected the health-status aggregation in System Overview. The view now updates after individual checks run and displays the right counts. Operators see "OK" when Security and Maintenance checks pass, instead of an incorrect "2 errors" banner. (GRANITE-61482)
* Stopped `CodeUpgradeTasks` from running during AEM 6.5 LTS (Long Term Support) upgrades. The upgrade now proceeds without task-triggered repository changes or reconfigurations. This fix reduces upgrade risk and prevents avoidable downtime. (GRANITE-61486)
* In authoring dialog boxes, required fields now show a single, accurate validation error. The message uses the field's own label when present, and falls back to a generic prompt when no label exists. Duplicate and mismatched messages across fields no longer appear. (GRANITE-59531)
* The page creation wizard dialog box now re-validates required fields on every interaction, including tab changes and multifield edits. The **Create** button stays disabled until authors complete all required inputs, and the wizard shows inline errors for missing values. (GRANITE-58826)

#### Integrations{#foundation-integrations-6524}

Publishing AEM Target activities no longer fails when authors set start and end dates. The integration sends standards-compliant timestamps that include the time zone, so Target processes the activity payload and completes the sync as expected. (CQ-4360733)

<!--
#### Jetty{#foundation-jetty-6524}
-->

#### Localization{#foundation-localization-6524}

* Localization in zh-CN removes an ambiguous phrase in the reference-gathering status shown during asset operations such as Move. The UI now displays `正在获取对 [[0]] 项的引用`, providing accurate meaning and consistent terminology. (CQ-4354648)
* Creating a smart collection no longer translates saved-search keywords on refresh. Authors who enter English terms see that those same terms are retained and the collection continues to return consistent results. (NPR-43158)
* Fixed truncated tooltip text in the Image panel. The "Display caption as pop-up" description renders completely in all supported locales, improving guidance for non-English authors. (SITES-10490)
* Sites Admin Column view truncated localized labels in French and Spanish. "End Time" and "Off Time" appeared truncated and showed no tooltip. Adobe corrected the translations and restored the tooltip on hover, so labels read in full. (SITES-31318)
* The **Move** dialog box in Sites showed raw i18n keys instead of readable labels. Items such as "Referencing pages," "Created on," "Created by," and "Path" looked garbled. The fix hooks the dialog box to the correct dictionaries and supplies translations, with an English fallback. (SITES-30881)

<!--
#### Oak {#foundation-oak-6524}
-->

#### Platform{#foundation-platform-6524}

* Validation errors now show clear, descriptive text instead of only an icon. Screen readers announce the message automatically when it appears, so users don't need to navigate to an icon to learn what went wrong. (CQ-4359152) 


* Hover labels in the Navigation Bar no longer remain on screen after the cursor moves off the control. The UI hides these tooltips immediately on blur or mouse out, preventing visual clutter and misclicks. (CQ-4360030)
* In Sites, toolbar actions stop creating a second pop-up on repeat clicks. The second click closes the existing pop-up and leaves only one instance visible, eliminating overlap and distraction. (CQ-4360038)
* The outdated 2024 copyright text no longer appears. The Login page and the **Help** > **About AEM** pop-up show 2025, and AEM reads the year programmatically to avoid manual edits. (CQ-4360042)
* Clicking a tooltip in the AEM header bar no longer triggers the underlying action. Pop-ups open only when users click the actual button, preventing accidental dialog boxes when interacting with tooltip text. (CQ-4360105)
* Year rollover no longer leaves outdated copyright text. The Login screen and the **Help** > **About AEM** dialog box derive the year from the system clock and render the up-to-date value every time the UI loads. (CQ-4360173)
* Header bar pop-ups now toggle correctly. Clicking the same action (for example, **Search** or **Filter**) closes the open pop-up instead of opening another overlay. The change prevents stacked pop-ups and returns focus to the header control. (NPR-42891)
* Projects and Inbox calendar view renders correctly. Switching views no longer blanks the page; the calendar loads and shows scheduled items. (NPR-42968)

<!--
#### Security{#foundation-security-6524}
-->

#### Sling{#foundation-sling-6524}

* Fixed an unexpected JSP compilation error with the `org.apache.sling.scripting.jsp:2.6.0` bundle. (SLING-12442) 
* The platform upgrades the core Sling Engine from 2.16.2 to 2.16.6. The newer engine hardens input validation and stabilizes request processing under load. (NPR-43105)

#### SPA editor {#foundation-spa-editor-6524}

Turning on Sling Main Servlet **Check Content-Type** overrides broke `.model.json` exports in AEM 6.5 SP21/22. Requests returned HTML or errors because the exporter flipped the type mid-chain. The fix emits JSON with the correct type from the start, so `.model.json` works on Author and Publish environments. (SITES-32634)


#### Translation{#foundation-translation-6524}

* Added a reindex operation for Translation Project status. Admins can rebuild the backing index when the status view goes out of sync, restoring results and eliminating Oak traversal warnings. The page loads faster and shows current job states. (NPR-42699) 
* Fixed a regression where XLIFF imports reported success but left JSON dictionary files unchanged. Imports now target the correct i18n path and persist translations so localization roundtrips are complete without manual edits. (NPR-42989) 


* Translation Rules XML now works as configured. The translation framework honors exception rules and applies to `include` and `exclude` patterns correctly during job creation. Translation requests no longer send excluded content. (NPR-42761)



#### User interface{#foundation-ui-6524}

* Fixed a UI regression that disabled inputs in the Adobe Stock License dialog box. The dialog box now behaves normally, accepts text in required fields, and completes the Stock asset licensing flow from the Asset Details view. (NPR-42748) 

* Fixed group visibility in the author environment. The Groups console no longer stops at about 41 results and returns the full set of memberships for each user. This fix restores consistent behavior after cumulative fixes and keeps current security hardening. (NPR-42749)


<!--
#### WCM{#foundation-wcm-6524}



#### Workflow{#foundation-workflow-6524}
-->




## Install [!DNL Experience Manager] 6.5.24.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.24.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.24.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.24.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.24.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Sack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.24.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

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

The UberJar for [!DNL Experience Manager] 6.5.24.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.24/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

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

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md) for a detailed list of all features deprecated or removed for AEM 6.5.

### SPA Editor {#spa-editor}

[The SPA Editor](/help/sites-developing/spa-overview.md) has been deprecated for new projects starting with release 6.5.24 of AEM 6.5. The SPA Editor remains supported for existing projects, but should not be used for new projects.

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

* **FORMS-14521** If a user tries to preview a draft letter with saved XML data, it gets stuck in `Loading` state for some specific letters.
* **FORMS-16603** In the Print Preview of the Interactive Communications Agent UI, some calculated values are not displayed correctly. 
* **FORMS-15681** When the letter is viewed in Print Preview, the content is changed. That is, some spaces disappear, and certain letters are replaced with `x`.
* **FORMS-15428**: After updating to AEM Forms Service Pack 20 (6.5.20.0) with the Forms Add-On, configurations relying on the legacy Adobe Analytics Cloud Service using credential-based authentication stop working. This issue prevented analytics rules from executing correctly.
* **FORMS-16557** In the Print Preview of the Interactive Communications Agent UI, the currency symbol (such as the dollar sign $) is inconsistently displayed for all field values. It appears for values up to 999 but is missing for values of 1000 and above.
* **FORMS-16575** Any modifications to nested layout fragments' XDP in an Interactive Communication are not reflected in the IC editor. 
* **FORMS-21378** When server-side validation (SSV) is enabled, form submissions may fail. If you encounter this issue, please contact Adobe Support for assistance.
* **FORMS-23722** (File attachments missing in Assign Task): When a form with a **File Attachment** field is submitted to an AEM Workflow that uses an **Assign Task** step, the attachments do not appear when the task is opened from Inbox. The files are saved correctly to the repository and are visible in CRX; only the Assign Task step UI does not show them.
#### Issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

>[!NOTE]
>
>Avoid upgrading to Service Pack 6.5.24.0 for issues without an available hotfix. It may lead to unexpected errors. Upgrade to Service Pack 6.5.24.0 only after the required hotfixes are released. 

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

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

* **FORMS-14613** When a user configures a WebLogic 14c instance, the PDFG service in AEM Forms Service Pack 21 (6.5.21.0) on JEE running on JBoss&reg; fails due to classloader conflicts involving the SLF4J library. The error is displayed as follows:
  
    ```java
    Caused by: java.lang.LinkageError: loader constraint violation: when resolving method "org.slf4j.impl.StaticLoggerBinder.getLoggerFactory()Lorg/slf4j/ILoggerFactory;"
    the class loader org.ungoverned.moduleloader.ModuleClassLoader @404a2f79 (instance of org.ungoverned.moduleloader.ModuleClassLoader, child of 'deployment.adobe-livecycle-jboss.ear'
    @7e313f80 org.jboss.modules.ModuleClassLoader) of the current class, org/slf4j/LoggerFactory, and the class loader 'org.slf4j.impl@1.1.0.Final-redhat-00001' @506ab52
    (instance of org.jboss.modules.ModuleClassLoader, child of 'app' jdk.internal.loader.ClassLoaders$AppClassLoader) for the method's defining class, org/slf4j/impl/StaticLoggerBinder,
    have different Class objects for the type org/slf4j/ILoggerFactory used in the signature.

    ```

* **FORMS-23703** When the `contains` rule is configured without a default value, the Server Side validation for an adaptive form fails. You can install latest version of [AEM Forms 6.5.24.0 Service Pack](https://experienceleague.adobe.com/en/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases#aem-65-forms-releases) to fix the issue.

* Form Data Model connectors may fail to authenticate because the required keywords and regex pattern are not allowed by default. To resolve the issue, add the following via the Configuration Manager (`/system/console/configmgr`):

  * **Keywords:** `fdm-client-secret`, `oauth-client-secret`
  * **Regex:** `^\[/conf/[^/]+(/[^/]+)?/settings/dam/cfm/models/[^,\]]+(?:,/conf/[^/]+(/[^/]+)?/settings/dam/cfm/models/[^,\]]+)*\]$`

    >[!VIDEO](https://video.tv.adobe.com/v/3479697)

* **FORMS-23979**  HTML-to-PDF conversion (PDFG) may experience intermittent timeouts. A newer version of the Forms add-on for SP24 was subsequently released that includes the fix. If you encounter this issue, update your environment to the [latest released Forms add-on for 6.5.24.0](https://experienceleague.adobe.com/en/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases#aem-65-forms-releases).

* **FORMS-23717** After upgrading to **AEM Forms 6.5.24.0**, `server.log` and `error.log` can be flooded with repeated WARN messages such as *Secure parser factory creation failed* or *Security attribute ... is not supported*. Logs may grow by about **5–10 lines per second** (hundreds of MB per hour), which can fill disk and block production rollout. **Fix:** Included in AEM Forms **6.5.25.0**. **Until then:** 

  To reduce log volume, set the logging level for `com.adobe.util.XMLSecurityUtil` to `ERROR` in your application server config or via JVM argument `-Dlogging.level.com.adobe.util.XMLSecurityUtil=ERROR`. This only hides the messages and does not fix the underlying cause.

* **FORMS-23875** In Form Data Model search, an HTML tag is displayed in the UI even when a relevant entity is not present. To resolve the issue, download and install the hotfix from [the link](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/bb-expressionmanager-pkg-10.0.48.zip).

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.24.0](/help/release-notes/assets/65240-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.24.0](/help/release-notes/assets/65240-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are available to customers only. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)
