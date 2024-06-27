---
title: Guidelines and the best accessibility practices for creating forms in forms designer
description: Best practices and guidelines for accessibility while developing forms in forms designer.
feature: Adaptive Forms, Forms Designer
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Mapping between guidelines and best practices

The following sections map Section 508 and WCAG guidelines to the best practices described in this guide.

## § 1194.21 Guideline Description and Best Practices

### Section 508 §1194.21: Software applications and operating systems

| § 1194.21 Guideline | Guideline Description | Required LiveCycle Designer Best Practices for Compliance | Notes |
|-----------|-----------------------|-----------------------------------------------------------|-------|
| (a)       | When software is designed to run on a system that has a keyboard, product functions shall be executable from a keyboard where the function itself or the result of performing a function can be discerned textually. | <li> 2.7 Ensure form controls are keyboard accessible </li><li> 2.6 Ensure the reading and tab order are correct</li> | |
| (b)       | Applications shall not disrupt or disable activated features of other products that are identified as accessibility features, where those features are developed and documented according to industry standards. Applications also shall not disrupt or disable activated features of any operating system that are identified as accessibility features where the application programming interface for those accessibility features has been documented by the manufacturer of the operating system and is available to the product developer. | No LiveCycle Designer specific techniques – this guideline is handled by Adobe Reader for PDF forms. | |
| (c)       | A well-defined on-screen indication of the current focus shall be provided that moves among interactive interface elements as the input focus changes. The focus shall be programmatically exposed so that assistive technology can track focus and focus changes. | 2.3 Choose the right controls To ensure the focus is exposed programmatically as well as visually, always use the standard controls. | |
| (d)       | Sufficient information about a user interface element including the identity, operation and state of the element shall be available to assistive technology. When an image represents a program element, the information conveyed by the image must also be available in text. | <ul><li>2.1 Keep forms simple and easy to use</li> <li>2.1.1 Avoid moving, blinking, or flashing content</li> <li>2.2 Configure form properties to generate accessibility information</li> <li>2.5 Provide proper labels for form controls</li></ul> | |
| (e)       | When bitmap images are used to identify controls, status indicators, or other programmatic elements, the meaning assigned to those images shall be consistent throughout an application's performance. | <ul><li>2.4 Provide text equivalents for images</li><li> 2.5 Provide proper labels for form controls This standard only applies if you use the same image in multiple places on a form. The use of image based custom controls is not recommended. Instead, use only standard controls provided by LiveCycle Designer. If you do use images in your controls, always make sure they are used consistently.</li> | |
| (f)       | Textual information shall be provided through operating system functions for displaying text. The minimum information that shall be made available is text content, text input caret location, and text attributes. | 2.3 Choose the right controls Avoid using images to convey textual information. Rather than using custom input components which might not expose text properties properly to the operating system, always use the standard controls. | |
| (g)       | Applications shall not override user selected contrast and color selections and other individual display attributes. | No LiveCycle Designer specific techniques | Where possible, use the basic, default system colors. |
| (h)       | When animation is displayed, the information shall be displayable in at least one non-animated presentation mode at the option of the user. | 2.1 Keep forms simple and easy to use Avoid using animations in your forms, or provide separate versions in which animations are replaced with static images. | |
| (i)       | Color coding shall not be used as the only means of conveying information, indicating an action, prompting a response, or distinguishing a visual element. | 2.8 Use color responsibly | |
| (j)       | When a product permits a user to adjust color and contrast settings, a variety of color selections capable of producing a range of contrast levels shall be provided. | Not applicable | This functionality is generally provided by Adobe Reader, not by the form developer. |
| (k)       | Software shall not use flashing or blinking text, objects, or other elements having a flash or blink frequency greater than 2 Hz and lower than 55 Hz. | 2.1.1 Avoid moving, blinking, or flashing content | |
| (l)       | When electronic forms are used, the form shall allow people using assistive technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues. | 2.5 Provide proper labels for form controls | |

### Section 508 §11942: Web-based intranet and internet information and applications

| §11942 Guideline | Guideline Description | Required LiveCycle Designer Best Practices for Compliance | Notes |
|-----------|-----------------------|-----------------------------------------------------------|-------|
| (a) | A text equivalent for every non-text element shall be provided (e.g., via "alt", "longdesc", or in element content). | 2.4 Provide text equivalents for images | |
| (b) | Equivalent alternatives for any multimedia presentation shall be synchronized with the presentation. | 2.12 Ensure all multimedia content is accessible | |
| (c) | Web pages shall be designed so that all information conveyed with color is also available without color, for example from context or markup. | 2.8 Use color responsibly | |
| (d) | Documents shall be organized so they are readable without requiring an associated style sheet. | Not applicable | |
| (e) | Redundant text links shall be provided for each active region of a server-side image map. | Not applicable | |
| (f) | Client-side image maps shall be provided instead of server-side image maps except where the regions cannot be defined with an available geometric shape. | Not applicable | |
| (g) | Row and column headers shall be identified for data tables. | 2.9 Provide heading cells for tables | |
| (h) | Markup shall be used to associate data cells and header cells for data tables that have two or more logical levels of row or column headers. | 2.9 Provide heading cells for tables | |
| (i) | Frames shall be titled with text that facilitates frame identification and navigation. | Not applicable | |
| (j) | Pages shall be designed to avoid causing the screen to flicker with a frequency greater than 2 Hz and lower than 55 Hz. | 2.1 Keep forms simple and easy to use | |
| (k) | A text-only page, with equivalent information or functionality, shall be provided to make a web site comply with the provisions of this part, when compliance cannot be accomplished in any other way. The content of the text-only page shall be updated whenever the primary page changes. | Not applicable | |
| (l) | When pages utilize scripting languages to display content, or to create interface elements, the information provided by the script shall be identified with functional text that can be read by assistive technology. | 2.11 Avoid disruptive scripting | |
| (m) | When a web page requires that an applet, plug-in or other application be present on the client system to interpret page content, the page must provide a link to a plug-in or applet that complies with §1194.21(a) through (l). | Not applicable | Web pages linking to PDF forms should provide a link to Adobe Reader. |
| (n) | When electronic forms are designed to be completed on-line, the form shall allow people using assistive technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues. | 2.5 Provide proper labels for form controls | |
| (o) | A method shall be provided that permits users to skip repetitive navigation links. | 2.10 Provide a navigable form structure | |
| (p) | When a timed response is required, the user shall be alerted and given sufficient time to indicate more time is required. | 2.11 Avoid disruptive scripting | |

### WCAG 1.0 Priority 1 checkpoints

| Checkpoint | Checkpoint Description | Required LiveCycle Designer Best Practices for Compliance | Notes |
|------------|------------------------|-----------------------------------------------------------|-------|
| [1.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-text-equivalent) | Provide a text equivalent for every non-text element (e.g., via "alt", "longdesc", or in element content). This includes: images, graphical representations of text (including symbols), image map regions, animations (e.g., animated GIFs), applets and programmatic objects, ASCII art, frames, scripts, images used as list bullets, spacers, graphical buttons, sounds (played with or without user interaction), stand-alone audio files, audio tracks of video, and video. | <ul><li>2.4 Provide text equivalents for images</li> <li>2.12 Ensure all multimedia content is accessible</li> | |
| [1.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-redundant-server-links) | Provide redundant text links for each active region of a server-side image map. | Not applicable | |
| [1.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-auditory-descriptions) | Until user agents can automatically read aloud the text equivalent of a visual track, provide an auditory description of the important information of the visual track of a multimedia presentation. | 2.12 Ensure all multimedia content is accessible | |
| [1.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-synchronize-equivalents) | For any time-based multimedia presentation (e.g., a movie or animation), synchronize equivalent alternatives (e.g., captions or auditory descriptions of the visual track) with the presentation. | 2.12 Ensure all multimedia content is accessible | |
| [2.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-color-convey) | Ensure that all information conveyed with color is also available without color, for example from context or markup. | 2.8 Use color responsibly | |
| [4.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-identify-changes) | Clearly identify changes in the natural language of a document's text and any text equivalents (e.g., captions). | 2.13 Identify changes in language | |
| [5.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-table-headers) | For data tables, identify row and column headers. | 2.9 Provide heading cells for tables | |
| [5.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-table-structure) | For data tables that have two or more logical levels of row or column headers, use markup to associate data cells and header cells. | 2.9 Provide heading cells for tables | |
| [6.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-order-style-sheets) | Organize documents so they may be read without style sheets. For example, when an HTML document is rendered without associated style sheets, it must still be possible to read the document. | Not applicable | |
| [6.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-dynamic-source) | Ensure that equivalents for dynamic content are updated when the dynamic content changes. | 2.11 Avoid disruptive scripting | |
| [6.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-scripts) | Ensure that pages are usable when scripts, applets, or other programmatic objects are turned off or not supported. If this is not possible, provide equivalent information on an alternative accessible page. | 2.11 Avoid disruptive scripting | |
| [7.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-flicker) | Until user agents allow users to control flickering, avoid causing the screen to flicker. | 2.1 Keep forms simple and easy to use | |
| [9.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-client-side-maps) | Provide client-side image maps instead of server-side image maps except where the regions cannot be defined with an available geometric shape. | Not applicable | |
| [11.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-alt-pages) | If, after best efforts, you cannot create an accessible page, provide a link to an alternative page that uses W3C technologies, is accessible, has equivalent information (or functionality), and is updated as often as the inaccessible (original) page. | Not applicable | |
| [12.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-frame-titles) | Title each frame to facilitate frame identification and navigation. | Not applicable | |
| [14.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-simple-and-straightforward) | Use the clearest and simplest language appropriate for a site's content. | 2.1 Keep forms simple and easy to use | |

### WCAG 1.0 Priority 2 Checkpoints

| Priority 2 Checkpoint | Checkpoint Description | Required LiveCycle Best Practices for Compliance | Notes |
|------------|------------------------|-------------------------------------------------|-------|
| [2.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-color-contrast) | Ensure that foreground and background color combinations provide sufficient contrast when viewed by someone having color deficits or when viewed on a black and white screen. [Priority 2 for images, Priority 3 for text]. | 2.8 Use color responsibly | |
| [3.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-use-markup) | When an appropriate markup language exists, use markup rather than images to convey information. | <ul><li>2.1 Keep forms simple and easy to use</li><li> 2.1.1 Avoid moving, blinking, or flashing content</li> <li>2.2 Configure form properties to generate accessibility information Always use actual text rather than images of text.</li> | |
| [3.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-identify-grammar) | Create documents that validate to published formal grammars. | | PDF forms must match the published PDF specification in order to render in Adobe Reader. |
| [3.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-style-sheets) | Use style sheets to control layout and presentation. | Not applicable | |
| [3.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-relative-units) | Use relative rather than absolute units in markup language attribute values and style sheet property values. | Not applicable | |
| [3.5](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-logical-headings) | Use header elements to convey document structure and use them according to specification. | 2.10 Provide a navigable form structure | |
| [3.6](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-list-structure) | Mark up lists and list items properly. | 2.10.3 Marking up lists Mark up list-based content as lists using the List and List Item roles. | |
| [3.7](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-quotes) | Mark up quotations. Do not use quotation markup for formatting effects such as indentation. | Not applicable | |
| [5.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-table-for-layout) | Do not use tables for layout unless the table makes sense when linearized. Otherwise, if the table does not make sense, provide an alternative equivalent (which may be a linearized version). | No specific LiveCycle techniques | There is no reason to use tables for layout in LiveCycle forms. Instead, use the Layout palette to position the form fields in a grid pattern. Only use a table when utilizing table specific features such as table headers. |
| [5.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-table-layout) | If a table is used for layout, do not use any structural markup for the purpose of visual formatting. | No specific LiveCycle techniques | |
| [6.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-keyboard-operable-scripts) | For scripts and applets, ensure that event handlers are input device-independent. | 2.7 Ensure form controls are keyboard accessible | |
| [6.5](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-fallback-page) | Ensure that dynamic content is accessible or provide an alternative presentation or page. | 2.11 Avoid disruptive scripting | |
| [7.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-blinking) | Until user agents allow users to control blinking, avoid causing content to blink (i.e., change presentation at a regular rate, such as turning on and off). | 2.1 Keep forms simple and easy to use | |
| [7.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-movement) | Until user agents allow users to freeze moving content, avoid movement in pages. | 2.1 Keep forms simple and easy to use | |
| [7.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-no-periodic-refresh) | Until user agents provide the ability to stop the refresh, do not create periodically auto-refreshing pages. | Not applicable | |
| [7.5](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-no-auto-forward) | Until user agents provide the ability to stop auto-redirect, do not use markup to redirect pages automatically. Instead, configure the server to perform redirects. | Not applicable | |
| [8.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-directly-accessible) | Make programmatic elements such as scripts and applets directly accessible or compatible with assistive technologies [Priority 1 if functionality is important and not presented elsewhere, otherwise Priority 2.] | 2.11 Avoid disruptive scripting | |
| [9.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-keyboard-operable) | Ensure that any element that has its own interface can be operated in a device-independent manner. | 2.7 Ensure form controls are keyboard accessible | |
| [9.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-device-independent-events) | For scripts, specify logical event handlers rather than device-dependent event handlers. | 2.7 Ensure form controls are keyboard accessible | |
| [10.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-pop-ups) | Until user agents allow users to turn off spawned windows, do not cause pop-ups or other windows to appear and do not change the current window without informing the user. | 2.11 Avoid disruptive scripting | |
| [10.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-unassociated-labels) | Until user agents support explicit associations between labels and form controls, for all form controls with implicitly associated labels, ensure that the label is properly positioned. | 2.5 Provide proper labels for form controls | |
| [11.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-latest-w3c-specs) | Use W3C technologies when they are available and appropriate for a task and use the latest versions when supported. | Not applicable | |
| [11.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-avoid-deprecated) | Avoid deprecated features of W3C technologies. | Not applicable | |
| [12.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-frame-longdesc) | Describe the purpose of frames and how frames relate to each other if it is not obvious by frame titles alone. | Not applicable | |
| [12.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-group-information) | Divide large blocks of information into more manageable groups where natural and appropriate. | 2.10 Provide a navigable form structure | |
| [12.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-associate-labels) | Associate labels explicitly with their controls. | 2.5 Provide proper labels for form controls | |
| [13.1](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-meaningful-links) | Clearly identify the target of each link. | 2.5 Provide proper labels for form controls 2.5.6 Providing link text | |
| [13.2](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-use-metadata) | Provide metadata to add semantic information to pages and sites. | Not applicable | |
| [13.3](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-site-description) | Provide information about the general layout of a site (e.g., a site map or table of contents). | 2.10 Provide a navigable form structure | |
| [13.4](http://www.w3.org/TR/WCAG10/wai-pageauth.html#tech-clear-nav-mechanism) | Use navigation mechanisms in a consistent manner. | 2.10 Provide a navigable form structure  |Use master pages to create consistent navigation content. |

### WCAG 2.0 Success Criteria

| Priority 1 G 2 Checkpoints | Required LiveCycle Best Practices for Compliance | Notes |
| --- | --- | --- |
| 1.1 [Text Alternatives](http://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv.html) | | |
| 1.1.1 [Non-text Content](http://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html) | 2.4 Provide text equivalents for images | |
| | 2.5 Provide proper labels for form controls | |
| 1.2 [Time-based Media](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv.html) | | |
| 1.2.1 [Audio-only and Video-only (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-av-only-alt.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.2 [Captions (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-captions.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.3 [Audio Description or Media Alternative (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-audio-desc.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.4 [Captions (Live)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-real-time-captions.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.5 [Audio Description (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-audio-desc-only.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.6 [Sign Language (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-sign.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.7 [Extended Audio Description (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-extended-ad.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.8 [Media Alternative (Prerecorded)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-text-doc.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.2.9 [Audio-only (Live)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-live-audio-only.html) | 2.12 Ensure all audio and video content is accessible | |
| 1.3 [Adaptable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation.html) | | |
| 1.3.1 [Info and Relationships](http://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-programmatic.html) | 2.9 Provide heading cells for tables | |
| 1.3.2 [Meaningful Sequence](http://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-sequence.html) | 2.6 Ensure the reading and tab order are correct | |
| | 2.10 Provide a navigable form structure | |
| 1.3.3 [Sensory Characteristics](http://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-understanding.html) | 2.8 Use color responsibly | |
| 1.4 [Distinguishable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast.html) | | |
| 1.4.1 [Use of Color](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-without-color.html) | 2.8 Use color responsibly | |
| 1.4.2 [Audio Control](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-dis-audio.html) | No specific LiveCycle techniques | |
| 1.4.3 [Contrast (Minimum)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) | 2.8 Use color responsibly | |
| 1.4.4 [Resize text](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html) | No specific LiveCycle techniques | |
| 1.4.5 [Images of Text](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-text-presentation.html) | No specific LiveCycle techniques | |
| 1.4.6 [Contrast (Enhanced)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast7.html) | 2.8 Use color responsibly | |
| 1.4.7 [Low or No Background Audio](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-noaudio.html) | No specific LiveCycle techniques | |
| 1.4.9 [Images of Text (No Exception)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-text-images.html) | No specific LiveCycle techniques | |
| 2.1 [Keyboard Accessible](http://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation.html) | | |
| 2.1.1 [Keyboard](http://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation-keyboard-operable.html) | 2.6 Ensure the reading and tab order are correct | |
| | 2.7 Ensure form controls are keyboard accessible | |
| 2.1.2 [No Keyboard Trap](http://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation-trapping.html) | 2.7 Ensure form controls are keyboard accessible | |
| 2.1.3 [Keyboard (No Exception)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/keyboard-operation-all-funcs.html) | 2.6 Ensure the reading and tab order are correct | |
| | 2.7 Ensure form controls are keyboard accessible | |
| 2.2 [Enough Time](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits.html) | | |
| 2.2.1 [Timing Adjustable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-required-behaviors.html) | No specific LiveCycle techniques | |
| 2.2.2 [Pause, Stop, Hide](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-pause.html) | 2.1 Keep forms simple and easy to use | |
| 2.2.3 [No Timing](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-no-exceptions.html) | No specific LiveCycle techniques | |
| 2.2.4 [Interruptions](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-postponed.html) | No specific LiveCycle techniques | |
| 2.2.5 [Re-authenticating](http://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-server-timeout.html) | No specific LiveCycle techniques | |
| 2.3 [Seizures] | | |
| 2.3.1 [Three Flashes or Below Threshold](http://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure-does-not-violate.html) | 2.1 Keep forms simple and easy to use | |
| 2.3.2 [Three Flashes](http://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure-three-times.html) | 2.1 Keep forms simple and easy to use | |
| 2.4 [Navigable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms.html) | | |
| 2.4.1 [Bypass Blocks](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-skip.html) | 2.10 Provide a navigable form structure | |
| 2.4.2 [Page Titled](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-title.html) | No specific LiveCycle techniques | |
| 2.4.3 [Focus Order](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-focus-order.html) | 2.6 Ensure the reading and tab order are correct | |
| 2.4.4 [Link Purpose (In Context)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-refs.html) | No specific LiveCycle techniques | Link purpose is dependent on authors choosing meaningful text for linked elements. |
| 2.4.5 [Multiple Ways](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-mult-loc.html) | 2.10 Provide a navigable form structure | |
| 2.4.6 [Headings and Labels](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-descriptive.html) | <ul><li>2.5 Provide proper labels for form controls</li><li>2.10 Provide a navigable form structure</li> | |
| 2.4.7 [Focus Visible](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-focus-visible.html) | No specific LiveCycle techniques | The default focus in LiveCycle forms is visible. |
| 2.4.8 [Location](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-location.html) | No specific LiveCycle techniques | Not applicable: LiveCycle forms do not require navigation systems. |
| 2.4.9 [Link Purpose (Link Only)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-link.html) | No specific LiveCycle techniques | Link purpose is dependent on authors choosing meaningful text for linked elements. |
| 2.4.10 [Section Headings](http://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-headings.html) | 2.10 Provide a navigable form structure | |
| 3.1 [Readable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning.html) | | |
| 3.1.1 [Language of Page](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-doc-lang-id.html) | 2.13 Identify natural language and any changes in language | |
| 3.1.2 [Language of Parts](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-other-lang-id.html) | 2.13 Identify natural language and any changes in language | |
| 3.1.3 [Unusual Words](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-idioms.html) | No specific LiveCycle techniques | |
| 3.1.4 [Abbreviations](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-located.html) | No specific LiveCycle techniques | |
| 3.1.5 [Reading Level](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-supplements.html) | No specific LiveCycle techniques | |
| 3.1.6 [Pronunciation](http://www.w3.org/TR/UNDERSTANDING-WCAG20/meaning-pronunciation.html) | No specific LiveCycle techniques | |
| 3.2 [Predictable](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior.html) | | |
| 3.2.1 [On Focus](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-receive-focus.html) | 2.11 Avoid disruptive scripting | |
| 3.2.2 [On Input](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-unpredictable-change.html) | 2.11 Avoid disruptive scripting | |
| 3.2.3 [Consistent Navigation](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-consistent-locations.html) | 2.10 Provide a navigable form structure | |
| 3.2.4 [Consistent Identification](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-consistent-functionality.html) | <ul><li>2.3 Choose the right controls</li><li>2.5 Provide proper labels for form controls</li> | |
| 3.2.5 [Change on Request](http://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-no-extreme-changes-context.html) | 2.11 Avoid disruptive scripting | |
| 3.3 [Input Assistance](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error.html) | | |
| 3.3.1 [Error Identification](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-identified.html) |  |LiveCycle Designer provides tools to mark form fields as required and to perform form input validation. |
| 3.3.2 [Labels or Instructions](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-cues.html) | 2.5 Provide proper labels for form controls | |
| 3.3.3 [Error Suggestion](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-suggestions.html) |  |LiveCycle Designer provides tools to mark form fields as required and to perform form input validation. |
| 3.3.4 [Error Prevention (Legal, Financial, Data)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-reversible.html) | No specific LiveCycle techniques | |
| 3.3.5 [Help](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-context-help.html) | No specific LiveCycle techniques | |
| 3.3.6 [Error Prevention (All)](http://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-reversible-all.html) | No specific LiveCycle techniques | |
| 4.1 [Compatible](http://www.w3.org/TR/UNDERSTANDING-WCAG20/ensure-compat.html) | | |
| 4.1.1 [Parsing](http://www.w3.org/TR/UNDERSTANDING-WCAG20/ensure-compat-parses.html) | No specific LiveCycle techniques | |
| 4.1.2 [Name, Role, Value](http://www.w3.org/TR/UNDERSTANDING-WCAG20/ensure-compat-rsv.html) | <ul><li>2.3 Choose the right controls</li> <li>2.5 Provide proper labels for form controls</li> | |



