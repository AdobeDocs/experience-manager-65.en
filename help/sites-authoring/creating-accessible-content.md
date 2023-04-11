---
title: Creating Accessible Content for Adobe Experience Manager (WCAG 2.1 Conformance)
description: Use AEM to help make web content accessible to, and usable by, persons with disabilities
exl-id: 2145d761-f51d-482b-a0e7-ef7500c4872f
---
# Creating Accessible Content (WCAG 2.1 Conformance) {#creating-accessible-content-wcag-conformance}

The [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG/), drawn up by [a working group of the World Wide Web Consortium](https://www.w3.org/groups/#Accessibility_Guidelines_Working_Group), consist of a set of technology-independent guidelines and success criteria to help make web content accessible to, and usable by, persons with disabilities.

As an introduction, the consortium provides a series of sections and supporting documents:

* [New Features in WCAG 2.1](https://www.w3.org/TR/WCAG/#new-features-in-wcag-2-1)
* [How to Meet WCAG 2.1](https://www.w3.org/WAI/WCAG21/quickref/)
* [Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/)
* [Techniques for WCAG 2.1](https://www.w3.org/WAI/WCAG21/Techniques/)
* [The WCAG Documents](https://www.w3.org/WAI/standards-guidelines/wcag/docs/)

In addition, see:
* The [Quick Guide to WCAG 2.1](/help/managing/qg-wcag.md).
* The [Accessibility Conformance reports for Adobe solutions](https://www.adobe.com/accessibility/compliance.html).
* [Configuring the Rich Text Editor for producing accessible content](/help/sites-administering/rte-accessible-content.md)

The guidelines are graded according to three conformance levels: Level A (lowest), Level AA, and Level AAA (highest). Briefly, the levels are defined as follows:

* **Level A:** Your site reaches a basic, minimum level of accessibility. To meet this level, all Level A Success Criteria are satisfied.
* **Level AA:** This is an ideal level of accessibility to strive for, in which your site reaches a foundational level of accessibility, so that it is accessible to most people in most situations using most technologies. To meet this level, all Level A and Level AA Success Criteria are satisfied.
* **Level AAA:** Your site reaches a high level of accessibility. To meet this level, all Level A, Level AA, and Level AAA Success Criteria are satisfied.

When creating your site, you should determine the overall level to which you would like your site to conform.

The following section presents [layers of the WCAG 2.1 Guidelines](https://www.w3.org/TR/WCAG/#wcag-2-layers-of-guidance) with related success criteria for Level A and Level AA [conformance levels](https://www.w3.org/TR/WCAG/#conformance-to-wcag-2-1).

>[!NOTE]
>
>In this document, the following is used:
>
>* The [short names for the WCAG 2.1 Guidelines](https://www.w3.org/TR/WCAG/#wcag-2-layers-of-guidance).
>* The [numbering used in the WCAG 2.1 Guidelines](https://www.w3.org/TR/WCAG/#numbering-in-wcag-2-1) to aid cross-referencing with the WCAG website.

## Principle 1: Perceivable {#principle-perceivable}

[Principle 1: Perceivable - Information and user interface components must be presentable to users in ways they can perceive.](https://www.w3.org/TR/WCAG/#perceivable)

### Text Alternatives (1.1) {#text-alternatives}

[Guideline 1.1 Text Alternatives: Provide text alternatives for any non-text content so that it can be changed into other forms people need, such as large print, braille, speech, symbols, or simpler language.](https://www.w3.org/TR/WCAG/#text-alternatives)

### Non-text Content (1.1.1) {#non-text-content}

* Success Criterion 1.1.1
* Level A
* Non-text Content: All non-text content that is presented to the user has a text alternative that serves the equivalent purpose, except for the situations listed below.

#### Purpose - Non-text Content (1.1.1) {#purpose-non-text-content}

Information on a web page can be provided in many different non-text formats, such as pictures, videos, animations, charts, and graphs. People who are blind or have severe visual impairments are unable to see non-text content. However, they can access text content by having it read to them by a screen reader or presented in tactile form by a Braille display device. So, by providing text alternatives to content in graphical format, people who cannot see the graphical content can access an equivalent version of the information the content provides.

A useful additional benefit is that text alternatives enable non-text content to be indexed by search engine technology.

#### How to Meet - Non-text Content (1.1.1) {#how-to-meet-non-text-content}

For static graphics, the basic requirement is to provide an equivalent text alternative for the graphic. This can be done in the **Alternative Text** field. See, for example, the Core Component **[Image](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/wcm-components/image.html)**.

>[!NOTE]
>
>Some out-of-the-box Core Components, such as **[Carousel](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/wcm-components/carousel.html)** do not provide an **Alternative Text** field for adding alternate text descriptions to individual images, though there is the **Label** field (**[Accessibility](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/wcm-components/carousel.html#accessibility-tab)** tab) for the entire component. 
>
>When implementing versions of these for your AEM instance, your development team must configure such components to support the `alt` attribute so that authors can add it to the content (see [Adding Support for Additional HTML Elements and Attributes](/help/sites-administering/rte-accessible-content.md#add-support-for-more-html-elements-and-attributes)).

AEM requires the **Alternative Text** field to be filled by default. If the image is purely decorative and alternative text would be unnecessary, the **Image is decorative** option can be checked.

#### Creating Good Text Alternatives {#creating-good-text-alternatives}

There are various forms of non-text content, so the value of the text alternative depends on the role the graphic plays in the web page. Some general rules of thumb to follow include:

* Text alternatives should be succinct yet clearly capture the essential information provided by the non-text content.
* Overly long descriptions (over 100 characters) should be avoided. If a text alternative requires more detail:
  * provide a short description in the alternative text
  * and have a longer description in text elsewhere on the same page or in a separate web page. Link to this separate description by making the image a link, or by placing a text link next to the image.
* Alternative text should not replicate content provided in text form nearby on the same page. Remember that many images are illustrations of points already covered in the text of a page, so a detailed text alternative may exist.
* If the non-text content is a link to another page or document and there is no other text forming part of the same link, then the alternative text for the image must indicate the destination of the link. It must not describe the image.
* If the non-text content is contained in a button element and there is no text forming part of the same button, then the alternative text of the image must indicate the functionality of the button. It must not describe the image.
* It is perfectly acceptable for an image to be given an empty (null) alternative text, but only if the image needs no alternative text. For example, it is a purely decorative graphic, or if the equivalent text exists in the page text.

<!--
The [W3C draft: HTML5 Techniques for providing useful text alternatives](https://dev.w3.org/html5/alt-techniques/) has more details and examples of appropriate alternative text provision for images of different types.
-->

Specific types of non-text content that require text alternatives might include:

* Illustrative photos: These are images of people, objects, or places. It is important to think about the role of the photo in the page, and to describe the image content, as assistive technology will announce the element type (for example, `graphic` or `image`); it can increase clarity to use `screenshot` or `illustration` in the alternative text descriptions, but this depends on the context. Consistency is a significant factor, a decision should be made for an entire authoring team and this applied throughout the user experience.
* Icons: These are small pictograms (graphics) conveying specific information. They must be consistently used across a page and site. All instances of the icon on a page or site should have the same short and succinct text alternative, unless doing so results in unnecessary duplication of adjacent text.
* Charts and graphs: These typically represent numerical data. So one option for providing a text alternative might be to include a brief summary of the main trends shown in the chart or graphic. If necessary, also provide a more detailed description in text using the **Description** field in the **Advanced** image properties tab. Also, you could provide the source data in tabular form elsewhere in the page or site.
* Maps, diagrams, flowcharts: For graphics providing spatial data (for example, to support describing relationships between objects or a process), ensure that the key message is provided in text format, and that this text information is positioned near each associated data point. For maps, providing a full text equivalent is likely to be impractical, but if the map is provided as a way of helping people find their way to a particular location, then the map image's alternative text can briefly indicate *Map of X*, then provide directions to that location in text elsewhere in the page or through the **Description** field in the **Advanced** tab of the **Image** component.
* CAPTCHAs: A CAPTCHA is a *Completely Automated Public Turing test to tell Computers and Humans Apart*. It is a security check used on web pages to distinguish humans from malicious software, but which can cause accessibility barriers. They are images that require users to describe what they see to pass a security test. Providing a text alternative for the image is not possible, so instead you must consider alternative non-graphic solutions. The W3C provides a few suggestions, such as:
  * Logic puzzles
  * The use of sound output instead of images
  * Limited use accounts and spam filters.
* Background images: These are achieved using Cascading Style Sheets (CSS) rather than in HTML. This means it is not possible to specify an alternative text value. Therefore background images should not provide important textual information - if they do, this information must also be provided in the page's text. However, it is important that an alternative background is displayed when the image cannot be displayed.

>[!NOTE]
>
>There should be an appropriate level of contrast between the background and the foreground text; this is discussed in more detail in [Contrast (Minimum) (1.4.3)](#contrast-minimum).

#### More Information - Non-text Content (1.1.1) {#more-information-non-text-content}

* [Understanding Success Criteria 1.1.1](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)
* [How to Meet Success Criteria 1.1.1](https://www.w3.org/WAI/WCAG21/quickref/#non-text-content)
* [W3C explanation of and alternatives to CAPTCHAs](https://www.w3.org/TR/turingtest/)

<!--
* [W3C: HTML5 Techniques for providing useful text alternatives (draft)](https://dev.w3.org/html5/alt-techniques/)
-->

### Time-based Media (1.2) {#time-based-media}

[Guideline 1.2 Time-based Media: Provide alternatives for time-based media.](https://www.w3.org/TR/WCAG/#time-based-media)

This deals with web content that is *time-based*. This covers content that the user can play (such as video, audio, and animated content) and may be prerecorded or a live stream.

### Audio-only and Video-only (Prerecorded) (1.2.1) {#audio-only-and-video-only-prerecorded}

* Success Criterion 1.2.1
* Level A
* Audio-only and Video-only (Prerecorded): For prerecorded audio-only and prerecorded video-only media, the following are true, except when the audio or video is a media alternative for text and is clearly labeled as such:
  * Prerecorded Audio-only: An alternative for time-based media is provided that presents equivalent information for prerecorded audio-only content.
  * Prerecorded Video-only: Either an alternative for time-based media, or an audio track is provided that presents equivalent information for prerecorded video-only content.

#### Purpose - Audio-only and Video-only (Prerecorded) (1.2.1) {#purpose-audio-only-and-video-only-prerecorded}

Accessibility problems for video and audio may be experienced by:

* People with visual impairments when there is no soundtrack, or the soundtrack is not sufficient to inform them of what is happening in the video or animation;
* People with hearing impairments or who are deaf, who cannot hear the soundtrack;
* People who can hear the soundtrack, but do not understand what is being spoken (for example, because it is in a language they do not understand).

Video or audio may also be unavailable to people using browsers or devices that do not support the playing of content in specific media formats, such as Adobe Flash.

Providing this information in a different format, such as text (or audio for video without audio) can make it accessible for people unable to access the original content.

#### How to Meet - Audio-only and Video-only (Prerecorded) (1.2.1) {#how-to-meet-audio-only-and-video-only-prerecorded}

* If the content is prerecorded audio with no video (such as a podcast):
  * Provide a link immediately before or after the content to a text-transcript of the audio content. The transcript should be an HTML page with a text equivalent of all spoken and important non-spoken content, plus an indication of who is speaking, a description of the setting, vocal expressions, and a description of any other significant audio.
* If the content is an animation or prerecorded video with no audio:
  * Provide a link immediately before or after the content to an equivalent text description of the information provided by the video
  * Or an equivalent audio description in a commonly used audio format such as MP3.

>[!NOTE]
>
>If the audio or video content is provided as an alternative to content that exists in another format on the same web page, an extra alternative may not be required. 
>
>The guidelines, [Understanding WCAG 1.2.1](https://www.w3.org/WAI/WCAG21/Understanding/audio-only-and-video-only-prerecorded.html), provide further information.

Inserting multimedia into your AEM web pages is similar to inserting an image. However, as multimedia content is much more than a still image, there are various different settings and options for controlling how the multimedia plays.

>[!NOTE]
>
>When you use multimedia with informational content, you must also create links to alternatives. For example, to include a text transcript, create an HTML page to display the transcript and then add a link next to or underneath the audio content.

#### More Information - Audio-only and Video-only (Prerecorded) (1.2.1) {#more-information-audio-only-and-video-only-prerecorded}

* [Understanding Success Criteria 1.2.1](https://www.w3.org/WAI/WCAG21/Understanding/audio-only-and-video-only-prerecorded.html)
* [How to Meet Success Criteria 1.2.1](https://www.w3.org/WAI/WCAG21/quickref/#audio-only-and-video-only-prerecorded)

### Captions (Prerecorded) (1.2.2) {#captions-prerecorded}

* Success Criterion 1.2.2
* Level A
* Captions (Prerecorded): Captions are provided for all prerecorded audio content in synchronized media, except when the media is a media alternative for text and is clearly labeled as such.

#### Purpose - Captions (Prerecorded) (1.2.2) {#purpose-captions-prerecorded}

People who are Deaf or hard of hearing will be unable or have great difficulty accessing audio content. Captions are text equivalents for spoken and non-spoken audio, shown on screen at the appropriate time during the video. They allow people who cannot hear the audio to understand what is happening.

#### How to Meet - Captions (Prerecorded) (1.2.2) {#how-to-meet-captions-prerecorded}

Captions can be either:

* Open: always visible when the video is played
* Closed: the captions can be switched on or off by the user

Use closed captioning wherever possible, as this gives users the choice over whether to view captions.

For closed captions, create and provide a synchronized caption file in an appropriate format (such as [SMIL](https://www.w3.org/AudioVideo/)) alongside the video file (details on how to do this are beyond the scope of this guide, but we have provided links to some tutorials under [More Information - Captions (Prerecorded) (1.2.2)](#more-information-captions-prerecorded)). Make sure you provide a note, or enable the caption feature in the video player, to let users know that captions are available for the video.

If you must use open captions, embed the text into the video track. This can be achieved using video editing applications that allow the overlaying of titles onto the video.

#### More Information - Captions (Prerecorded) (1.2.2) {#more-information-captions-prerecorded}

* [Understanding Success Criteria 1.2.2](https://www.w3.org/WAI/WCAG21/Understanding/captions-prerecorded.html)
* [How to Meet Success Criteria 1.2.2](https://www.w3.org/WAI/WCAG21/quickref/#captions-prerecorded)

<!--
* [W3C: Synchronized Multimedia](https://www.w3.org/AudioVideo/)
* [Captions, Transcripts, and Audio Descriptions - by WebAIM](https://webaim.org/techniques/captions/)
-->

### Audio Description or Media Alternative (Prerecorded) (1.2.3) {#audio-description-or-media-alternative-prerecorded}

* Success Criterion 1.2.3
* Level A
* Audio Description or Media Alternative (Prerecorded): An alternative for time-based media or audio description of the prerecorded video content is provided for synchronized media, except when the media is a media alternative for text and is clearly labeled as such.

#### Purpose - Audio Description or Media Alternative (Prerecorded) (1.2.3) {#purpose-audio-description-or-media-alternative-prerecorded}

People who are blind or visually impaired will experience accessibility barriers if the information in a video or animation is only provided visually, or if the soundtrack does not provide sufficient information to allow understanding of what is happening visually.

#### How to Meet - Audio Description or Media Alternative (Prerecorded) (1.2.3) {#how-to-meet-audio-description-or-media-alternative-prerecorded}

There are two approaches that can be adopted to meet this success criterion. Either is acceptable:

1. Include additional audio description for the video content. This can be achieved in one of three ways:
    * During pauses in the existing dialogue, provide information about changes in the scene that are not presented as part of the existing audio track;
    * Provide a new, additional, and optional audio track containing the original soundtrack, but also including extra audio information about changes in the scene.
      * Users can switch between the existing audio track (which *does not* contain an audio description) and the new audio track (which *does* contain an audio description).
      * This prevents disruption to users who do not need the additional description.
    * Create a second version of the video content to allow for extended audio descriptions. This reduces the difficulties associated with providing detailed audio descriptions within the gaps between existing dialogue, by temporarily pausing the audio and video at appropriate points. As a result, a much longer audio description can be given, before the action starts again. As in the previous example, this is best provided as an optional extra audio track to prevent disruption to users who do not need the additional description.
1. Provide a text transcript that is a suitable text equivalent of the audio and visual elements of the video or animation. This should include, where appropriate, an indication as to who is speaking, a description of the setting, any events, or information presented visually, and vocal expressions. Depending on its length, you can place the transcript on the same page as the video or animation, or on a separate page; if you choose the latter option, provide a link to the transcript next to the video or animation.

Exact details of how to create audio-described video are beyond the scope of this guide. Creating videos and audio descriptions can be time consuming, but other Adobe products can help achieve these tasks. 

#### More Information - Audio Description or Media Alternative (Prerecorded) (1.2.3) {#more-information-audio-description-or-media-alternative-prerecorded}

* [Understanding Success Criteria 1.2.3](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-or-media-alternative-prerecorded.html)
* [How to Meet Success Criteria 1.2.3](https://www.w3.org/WAI/WCAG21/quickref/#audio-description-or-media-alternative-prerecorded)

<!--
* [Adobe Encore](https://www.adobe.com/products/encore.html) - a DVD authoring software tool
-->

### Captions (Live) (1.2.4)  {#captions-live}

* Success Criterion 1.2.4
* Level AA
* Captions (Live): Captions are provided for all live audio content in synchronized media.

#### Purpose - Captions (Live) (1.2.4) {#purpose-captions-live}

This success criterion is identical to [Captions (Prerecorded)](#captions-prerecorded) in that it addresses accessibility barriers experienced by people who are deaf or hearing-impaired, except that this success criterion deals with live presentations such as webcasts.

#### How to Meet - Captions (Live) (1.2.4) {#how-to-meet-captions-live}

Follow the guidance provided for [Captions (Prerecorded)](#captions-prerecorded) above. However, due to the live nature of the media, caption provision has to be created as quickly as possible and in response to what is happening. Therefore, you should consider using real-time captioning or speech-to-text tools.

Detailed instructions are beyond the scope of this document, but the following resources provide helpful information:

* [WebAIM: Real Time Captioning](https://webaim.org/techniques/captions/realtime)

* [AccessComputing project (University of Washington): Can captions be generated automatically using speech recognition?](https://www.washington.edu/accesscomputing/can-captions-be-generated-automatically-using-speech-recognition)

#### More Information - Captions (Live) (1.2.4) {#more-information-captions-live}

* [Understanding Success Criteria 1.2.4](https://www.w3.org/WAI/WCAG21/Understanding/captions-live.html)
* [How to Meet Success Criteria 1.2.4](https://www.w3.org/WAI/WCAG21/quickref/#captions-live)

### Audio Description (Prerecorded) (1.2.5)  {#audio-description-prerecorded}

* Success Criterion 1.2.5
* Level AA
* Audio Description (Prerecorded): Audio description is provided for all prerecorded video content in synchronized media.

#### Purpose - Audio Description (Prerecorded) (1.2.5) {#purpose-audio-description-prerecorded}

This success criterion is identical to [Audio Description or Media Alternative (Prerecorded)](#audio-description-or-media-alternative-prerecorded), except that authors must provide a much more detailed audio description to conform to Level AA.

#### How to Meet - Audio Description (Prerecorded) (1.2.5) {#how-to-meet-audio-description-prerecorded}

Follow the guidance provided for [Audio Description or Media Alternative (Prerecorded)](#audio-description-or-media-alternative-prerecorded).

#### More Information - Audio Description (Prerecorded) (1.2.5) {#more-information-audio-description-prerecorded}

* [Understanding Success Criteria 1.2.5](https://www.w3.org/WAI/WCAG21/Understanding/audio-description-prerecorded.html)
* [How to Meet Success Criteria 1.2.5](https://www.w3.org/WAI/WCAG21/quickref/#audio-description-prerecorded)

### Adaptable (1.3) {#adaptable}

[Guideline 1.3 Adaptable: Create content that can be presented in different ways (for example simpler layout) without losing information or structure.](https://www.w3.org/TR/WCAG/#adaptable)

This guideline covers the requirements necessary to support people who:

* may not be able to access information as presented by an author in the default presentation of that content (for example, a multi-column layout or a page with heavy use of color and/or images).

* may use audio-only, or alternative visual display such as large text or high contrast.

### Info and Relationships (1.3.1)  {#info-and-relationships}

* Success Criterion 1.3.1
* Level A
* Info and Relationships: Information, structure, and relationships conveyed through presentation can be programmatically determined or are available in text.

#### Purpose - Info and Relationships (1.3.1) {#purpose-info-and-relationships}

Many assistive technologies used by people with disabilities rely on structural information to effectively display or *understand* content. This structural information can take the form of page headings, table row and column headings, and list types. For example, a screen reader could allow a user to navigate through a page from heading to heading. However, when page content only appears to have structure through visual styling, rather than the underlying HTML, then there is no structural information available to assistive technologies, limiting their ability to support easier browsing.

This success criterion exists to make sure that such structural information is provided programmatically through HTML, or other coding techniques, so that browsers and assistive technologies can access and take advantage of the information.

#### How to Meet - Info and Relationships (1.3.1) {#how-to-meet-info-and-relationships}

AEM makes it easy to construct semantically meaningful web content using the appropriate HTML elements. Open your page content in the RTE (a Text component), and use the **Paraformat** menu (paragraph symbol) to specify the appropriate structural element (for example, paragraph and heading).

You can make sure that your web pages are given the appropriate structure by using the following elements where applicable:

* **Headings:** As long as you have the accessibility features of the RTE enabled, AEM offers three levels of page heading. You can use these to identify sections and subsections of content. Heading 1 is the highest level of heading, Heading 3 the lowest. The system administrator can configure the system to allow the use of more heading levels.

* **Lists**: You can use HTML to specify three different types of lists:
  * The `<ul>` element is used for *unordered* (bulleted) lists. Individual list items are identified using the `<li>` element. In the RTE, use the **Bullet List** icon.
  * The `<ol>` element is used for *numbered* lists. Individual list items are identified using the `<li>` element. In the RTE, use the **Numbered List** icon.

  If you want to change existing content into a specific list type, highlight the appropriate text and select the appropriate list type. As in the earlier example showing how paragraph text is entered, the appropriate list elements are automatically added to your HTML.

  In full screen mode, the individual **Bullet List** and **Numbered List** icons are visible. When not in full screen mode, the two options are available behind the single **Lists** icon.

* **Tables**: Tables of data must be identified using HTML table elements:
  * one `<table>` element
  * a `<tr>` element for each row of the table
  * a `<th>` element for each row and column heading
  * a `<td>` element for every data cell

  Also, accessible tables make use of the following elements and attributes:

  * The `<caption>` element is used to provide a visible caption for the table. Captions by default appear centered above the table, but can be positioned appropriately using CSS. The caption is programmatically associated with the table, thus it is a useful method for providing an introduction to content.
  * The `<summary>` element assists non-sighted users to more easily understand the information presented within a table, by providing a synopsis of what a sighted user can see. This is useful where complex or unconventional table layouts are used (this attribute is not displayed in the browser, it is only read out to assistive technologies).
  * The `scope` attribute of the `<th>` element is used to indicate whether a cell represents a header for a particular row, or for a particular column. A similar approach is to use the header and id attributes in complex tables, where data cells may be associated with one or more headers.

  >[!NOTE]
  >
  >By default, these elements and attributes are not directly available, though it is possible for the system administrator to add support for these values in the **Table properties** dialog box (see [Adding Support for Additional HTML Elements and Attributes](/help/sites-administering/rte-accessible-content.md#add-support-for-more-html-elements-and-attributes).

  To open the **Table** dialog where you can select the **Table Properties** tab:

  * Define an appropriate **Caption**.
  * Ideally remove any default values for **Width**, **Height**, **Border**, **Cell padding**, **Cell spacing**. as these properties can be set in a global style sheet.
  
  You can then use the **Cell Properties** to choose whether the cell is a data or header cell:

* **Emphasis**: Use the `<strong>` or `<em>` element to indicate emphasis. Do not use headings to highlight text within paragraphs.
  * Highlight the text that you want to emphasize;
  * Click the **B** icon (for `<strong>`) or the **I** icon (for `<em>`) shown within the **Properties** panel (make sure that HTML is selected).

    >[!NOTE]
    >
    >RTE in a standard AEM installation is set up to use:
    >
    >* `<b>` for `<strong>`
    >* `<i>` for `<em>`
    >
    >They are effectively the same, but `<strong>` and `<em>` are preferable as they are semantically correct html. Your development team can configure the RTE to use `<strong>` and `<em>` (instead of `<b>` and `<i>`) when developing your project instance.

* **Complex Data Tables**: Sometimes, where there are complex tables with two or more levels of headers, then the basic Table Properties may not be enough to provide all the structural information necessary. For these kinds of complex tables, direct relationships must be created between the headers and their related cells using the **header** and **id** attributes. 

  >[!NOTE]
  >
  >The id attribute is not available in an out-of-the-box installation. It can be enabled by configuring HTML rules and the serializer in the RTE.

  For example, in the table below headers and ids are matched to make a programmatic association for assistive technology users.

  ```xml
    <table>
      <tr>
        <th rowspan="2" id="h">Homework</th>
        <th colspan="3" id="e">Exams</th>
        <th colspan="3" id="p">Projects</th>
      </tr>
      <tr>
        <th id="e1" headers="e">1</th>
        <th id="e2" headers="e">2</th>
        <th id="ef" headers="e">Final</th>
        <th id="p1" headers="p">1</th>
        <th id="p2" headers="p">2</th>
        <th id="pf" headers="p">Final</th>
      </tr>
      <tr>
        <td headers="h">15%</td>
        <td headers="e e1">15%</td>
        <td headers="e e2">15%</td>
        <td headers="e ef">20%</td>
        <td headers="p p1">10%</td>
        <td headers="p p2">10%</td>
        <td headers="p pf">15%</td>
      </tr>
    </table>
  ```

  To achieve this in AEM, add the markup directly using the source edit mode.

  >[!NOTE]
  >
  >This functionality is not immediately available in a standard installation. It requires configuration of the RTE, HTML rules, and serializer.

#### More information - Info and Relationships (1.3.1) {#more-information-info-and-relationships}

* [Understanding Success Criteria 1.3.1](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships.html)
* [How to Meet Success Criteria 1.3.1](https://www.w3.org/WAI/WCAG21/quickref/#info-and-relationships)

### Meaningful Sequence (1.3.2)  {#meaningful-sequence}

* Success Criterion 1.3.2
* Level A
* Meaningful Sequence: When the sequence in which content is presented affects its meaning, a correct reading sequence can be programmatically determined.

#### Purpose - Meaningful Sequence (1.3.2) {#purpose-meaningful-sequence}

The intent of this Success Criterion is to enable a user agent to provide an alternative presentation of content while preserving the reading order needed to understand the meaning. It is important that it be possible to programmatically determine at least one sequence of the content that makes sense. Content that does not meet this Success Criterion may confuse or disorient users when assistive technology reads the content in the wrong order, or when alternate style sheets or other formatting changes are applied.

#### How to Meet - Meaningful Sequence (1.3.2) {#how-to-meet-meaningful-sequence}

Follow the guidelines under [How to Meet Success Criteria 1.3.2](https://www.w3.org/WAI/WCAG21/quickref/#meaningful-sequence).

#### More information - Meaningful Sequence (1.3.2) {#more-information-meaningful-sequence}

* [Understanding Success Criteria 1.3.2](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence.html)
* [How to Meet Success Criteria 1.3.2](https://www.w3.org/WAI/WCAG21/quickref/#meaningful-sequence)

### Sensory Characteristics (1.3.3)  {#sensory-characteristics}

* Success Criterion 1.3.3
* Level A
* Sensory Characteristics: Instructions provided for understanding and operating content do not rely solely on sensory characteristics of components such as shape, size, visual location, orientation, or sound.

#### Purpose - Sensory Characteristics (1.3.3) {#purpose-sensory-characteristics}

Designers often focus on visual design features, such as color, shape, text style, or a piece of content's absolute or relative position when presenting information. These can be powerful design techniques in conveying information (and can improve the overall accessibility for sighted users with cognitive accessibility needs), but people who are blind or visually impaired may be unable to access information that requires visual identification of attributes such as position, color or shape.

Similarly, information that requires distinguishing between different sounds (for example, male or female spoken content) present accessibility barriers to people with hearing impairment, if it is not reflected in any text alternative for the audio content.

>[!NOTE]
>
>For requirements related to alternatives to color, refer to [Use of Color](#use-of-color).

#### How to Meet - Sensory Characteristics (1.3.3) {#how-to-meet-sensory-characteristics}

Make sure that any information that relies on visual characteristics of page content is also presented in an alternative format.

* Do not rely on visual position to give information. For example, if you want to refer users to a menu on the right-hand side of the page for access to further information, do not refer to *the menu on the right*; instead, name the menu (for example via a heading) and refer to that name in text.
* Do not rely on text styling (for example, bold or italicized text) as the only way to convey information.

>[!NOTE]
>
>The use of descriptive terms are acceptable if they're understood to have meaning in a non-visual context. For example, using *above* and *below* would generally be acceptable, as they respectively imply content before and after a particular item of content; this would still make sense when the content is spoken aloud.

#### More information - Sensory Characteristics (1.3.3) {#more-information-sensory-characteristics}

* [Understanding Success Criteria 1.3.3](https://www.w3.org/WAI/WCAG21/Understanding/sensory-characteristics.html)
* [How to Meet Success Criteria 1.3.3](https://www.w3.org/WAI/WCAG21/quickref/#sensory-characteristics)

### Distinguishable (1.4) {#distinguishable}

[Guideline 1.4 Distinguishable: Make it easier for users to see and hear content including separating foreground from background.](https://www.w3.org/TR/WCAG/#distinguishable)

### Use of Color (1.4.1)  {#use-of-color}

* Success Criterion 1.4.1
* Level A
* Use of Color: Color is not used as the only visual means of conveying information, indicating an action, prompting a response, or distinguishing a visual element.

>[!NOTE]
>
>This success criterion addresses color perception specifically. Other forms of perception are covered in [Adaptable (1.3)](#adaptable); including programmatic access to color and other visual presentation coding.

#### Purpose - Use of Color (1.4.1) {#purpose-use-of-color}

Color is an effective way of enhancing the aesthetic appeal of web pages and is also useful in conveying information. However, there is a range of visual impairments, from blindness to color vision deficiency, which means that some people are unable to distinguish between certain colors. This makes color-coding an unreliable way of providing information.

For example, someone with red-green color vision deficiency will be unable to distinguish between shades of green and shades of red. They may see both colors as a third color (for example, brown), in which case they are unable to distinguish between red, green, and brown.

Also, color cannot be perceived by people using text-only browsers, monochrome display devices, or viewing a black-and-white printout of the page.

A further consideration is the *selected* state for an interface element (for example, tabs, toggle buttons, among others), which must be conveyed in some way other than just with color and beyond just a visual presentation. For such elements, the additional use of patterns, shapes, and programmatic information are helpful when creating a fully inclusive user experience that does not rely on a specific sense.

#### How to Meet - Use of Color (1.4.1) {#how-to-meet-use-of-color}

Wherever color is used to convey information, make sure that the information is available without the need to see the color.

For example, make sure that information provided by color is also provided explicitly in text.

If color is used as a cue to provide information, you should provide an extra visual cue, such as changing the style (for example, bold, italics) or font. This helps people with low vision or who have color vision deficiency to identify the information. However, it cannot be relied on entirely, as it will not help people who cannot see the page at all. Therefore it is (sometimes) useful to provide hidden text or to use programmatic solutions, such as the [Accessible Rich Internet Applications (ARIA) suite of web standards](https://www.w3.org/WAI/standards-guidelines/aria/), to convey this information to non-sighted users.

#### More Information - Use of Color (1.4.1) {#more-information-use-of-color}

* [Understanding Success Criteria 1.4.1](https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html)
* [How to Meet Success Criteria 1.4.1](https://www.w3.org/WAI/WCAG21/quickref/#use-of-color)

### Audio Control (1.4.2)  {#audio-control}

* Success Criterion 1.4.2
* Level A
* Audio Control: If any audio on a Web page plays automatically for more than 3 seconds, either a mechanism is available to pause or stop the audio, or a mechanism is available to control audio volume independently from the overall system volume level.

#### Purpose - Audio Control (1.4.2) {#purpose-audio-control}

Individuals who use screen reading software can find it hard to hear the speech output if there is other audio playing at the same time. This difficulty is exacerbated when the screen reader's speech output is software-based (as most are today) and is controlled via the same volume control as the sound. Also, some people with cognitive disabilities and people who are neurodivergent may have sound sensitivity. These individuals find any inability to change the volume level on audio content disruptive. 

Therefore, it is important that the user be able to turn off the background sound. 

>[!NOTE]
>
>Having control of the volume includes being able to reduce its volume to zero.

#### How to Meet - Audio Control (1.4.2) {#how-to-meet-audio-control}

Follow the guidelines under [How to Meet Success Criteria 1.4.2](https://www.w3.org/WAI/WCAG21/quickref/#audio-control).

#### More information - Audio Control (1.4.2) {#more-information-audio-control}

* [Understanding Success Criteria 1.4.2](https://www.w3.org/WAI/WCAG21/Understanding/audio-control.html)
* [How to Meet Success Criteria 1.4.2](https://www.w3.org/WAI/WCAG21/quickref/#audio-control)

### Contrast (Minimum) (1.4.3) {#contrast-minimum}

* Success Criterion 1.4.3
* Level AA
* Contrast (Minimum): The visual presentation of text and images of text has a contrast ratio of at least 4.5:1, except for the following:
  * Large Text: Large-scale text and images of large-scale text have a contrast ratio of at least 3:1.
  * Incidental: Text or images of text that are part of an inactive user interface component, [pure decoration](https://www.w3.org/TR/WCAG/#dfn-pure-decoration), not visible to anyone, or are part of a picture that contains significant other visual content, have no contrast requirement.
  * Logotypes: Text that is part of a logo or brand name has no minimum contrast requirement.
  
  >[!NOTE]
  >
  >See [Understanding Non-text Contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html) for further information, to help ensure that content authors understand the additional requirements around non-text elements (including icons, interface elements, among others).

#### Purpose - Contrast (Minimum) (1.4.3) {#purpose-contrast-minimum}

People with certain visual impairments may be unable to distinguish between certain low-contrast color pairs. Accessibility problems may occur for these people if either:

* The text contrasts poorly with its background color.
* The color coding of text (such as link text and non-link text) is important in distinguishing information.

>[!NOTE]
>
>Text used purely for decoration purposes is excluded from this success criterion.

#### How to Meet - Contrast (Minimum) (1.4.3) {#how-to-meet-contrast-minimum}

Make sure that the text contrasts sufficiently with its background. Contrast ratios depend on the size and style of the text in question:

* For text less than 18-point (or 14-point bold) in size, the contrast ratio between text/images of text and the background should be at least 4.5:1.
* For text that is at least 18-point (or 14-point bold) in size, the contrast ratio should be at least 3:1.
* If a background is patterned, then the background around any text should be shaded so that the 4.5:1 or 3:1 ratio is maintained.

>[!NOTE]
>
>Remember that fonts can differ in how they render the equivalent PT/PX/EM sizing. 
>
>Use good judgment and err on the side of readability and usability when selecting the appropriate fonts and sizing for web content.

>[!NOTE]
>
>The following sites can help with conversions to other units:
>
>* [Px to Em Calculator - Omni](https://www.omnicalculator.com/conversion/px-to-em)
>* See "Font size conversion: pixel-point-em-rem-percent" at `https://websemantics.uk/tools/font-size-conversion-pixel-point-em-rem-percent/`
>* See PMtoEM.com: PX to EM conversion made simple at `http://pxtoem.com/`

To check contrast ratios, use a color contrast tool, such as the [Paciello Group Color Contrast Analyzer](https://www.paciellogroup.com/resources/contrast-analyser.html) or the [WebAIM color contrast checker](https://webaim.org/resources/contrastchecker/). These tools allow you to check pairs of colors and report on any contrast problems.

Alternatively, if you are less concerned about specifying the appearance of your page, you can choose not to specify background and foreground text colors. No contrast checking is required, as the user's browser determines the colors of the text and background.

If it is not possible to meet the recommended contrast levels, provide a link to an alternative, equivalent version of the page (which has no color contrast issues). Or, let the user adjust the contrast of the page color scheme to their own requirements.

#### More Information - Contrast (Minimum) (1.4.3) {#more-information-contrast-minimum}

* [Understanding Success Criteria 1.4.3](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
* [How to Meet Success Criteria 1.4.3](https://www.w3.org/WAI/WCAG21/quickref/#contrast-minimum)

### Resize Text (1.4.4)  {#resize-text}

* Success Criterion 1.4.4
* Level A
* Resize Text: Except for captions and images of text, text can be resized without assistive technology up to 200 percent without loss of content or functionality.

#### Purpose - Resize Text (1.4.4) {#purpose-resize-text}

The intent of this Success Criterion is to ensure that visually rendered text, including text-based controls (text characters that have been displayed so that they can be seen [vs. text characters that are still in data form such as ASCII]) can be scaled successfully so that it can be read directly by people with mild visual disabilities, without requiring the use of assistive technology such as a screen magnifier. Users may benefit from scaling all content on the Web page, but text is most critical.

#### How to Meet - Resize Text (1.4.4) {#how-to-meet-resize-text}

Besides following the guidelines under [How to Meet Success Criteria 1.4.4](https://www.w3.org/WAI/WCAG21/quickref/#resize-text) you can encourage content authors to use fluid, flexible widths, and heights in their page designs and font sizes (for example, Responsive Web Design) to allow readers the ability to resize text.

#### More information - Resize Text (1.4.4) {#more-information-resize-text}

* [Understanding Success Criteria 1.4.4](https://www.w3.org/WAI/WCAG21/Understanding/resize-text.html)
* [How to Meet Success Criteria 1.4.4](https://www.w3.org/WAI/WCAG21/quickref/#resize-text)

### Images of Text (1.4.5) {#images-of-text}

* Success Criterion 1.4.5
* Level AA
* Images of Text: If the technologies being used can achieve the visual presentation, text is used to convey information rather than images of text except for the following:
  * Customizable: The image of text can be visually customized to the user's requirements;
  * Essential: A particular presentation of text is essential to the information being conveyed.

>[!NOTE]
>
>Logotypes (text that is part of a logo or brand name) are considered essential.

#### Purpose - Images of Text (1.4.5) {#purpose-images-of-text}

Images of text are often used when a particular style of text is preferred; for example, a logotype or if text has been generated from another source (for example, a scan of a paper document). However, compared to text presented in HTML and styled using CSS, images of text lack the flexibility to change size or appearance that might be necessary for people with visual impairments or reading difficulties.

#### How to Meet - Images of Text (1.4.5) {#how-to-meet-images-of-text}

If images of text must be used, use CSS to replace the images of text with equivalent text in HTML so that the text is available in a customizable way. For an example, see [C30: Using CSS to replace text with images of text and providing user interface controls to switch](https://www.w3.org/TR/2008/NOTE-WCAG20-TECHS-20081211/C30).

#### More Information - Images of Text (1.4.5) {#more-information-images-of-text}

* [Understanding Success Criteria 1.4.5](https://www.w3.org/WAI/WCAG21/Understanding/images-of-text.html)
* [How to Meet Success Criteria 1.4.5](https://www.w3.org/WAI/WCAG21/quickref/#images-of-text)

## Principle 2: Operable {#principle-operable}

[Principle 2: Operable - User interface components and navigation must be operable.](https://www.w3.org/TR/WCAG/#operable)

### Keyboard Accessible (2.1) {#keyboard-accessible}

[Guideline 2.1 Keyboard Accessible: Make all functionality available from a keyboard.](https://www.w3.org/TR/WCAG/#keyboard-accessible)

This deals with ensuring that users can access all functionality using a keyboard.

### Keyboard (2.1.1)  {#keyboard}

* Success Criterion 2.1.1
* Level A
* Keyboard: All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes, except where the underlying function requires input that depends on the path of the user's movement and not just the endpoints.

#### Purpose - Keyboard (2.1.1) {#purpose-keyboard}

The intent of this Success Criterion is to ensure that, wherever possible, content can be operated through a keyboard or keyboard interface (so an alternate keyboard can be used). When content can be operated through a keyboard or alternate keyboard, it is operable by people with no vision (who cannot use devices such as mice that require eye-hand coordination) and by people who must use alternate keyboards or input devices that act as keyboard emulators. Keyboard emulators include speech input software, sip-and-puff software, on-screen keyboards, scanning software, and various assistive technologies and alternate keyboards. Individuals with low vision may also have trouble tracking a pointer and find the use of software much easier (or only possible) if they can control it from the keyboard.

#### How to Meet - Keyboard (2.1.1) {#how-to-meet-keyboard}

Follow the guidelines under [How to Meet Success Criteria 2.1.1](https://www.w3.org/WAI/WCAG21/quickref/#keyboard).

#### More information - Keyboard (2.1.1) {#more-information-keyboard}

* [Understanding Success Criteria 2.1.1](https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html)
* [How to Meet Success Criteria 2.1.1](https://www.w3.org/WAI/WCAG21/quickref/#keyboard)

### No Keyboard Trap (2.1.2)  {#no-keyboard-trap}

* Success Criterion 2.1.2
* Level A
* No Keyboard Trap: If keyboard focus can be moved to a component of the page using a keyboard interface, then focus can be moved away from that component using only a keyboard interface, and, if it requires more than unmodified arrow or tab keys or other standard exit methods, the user is advised of the method for moving focus away.

#### Purpose - No Keyboard Trap (2.1.2) {#purpose-no-keyboard-trap}

The intent of this Success Criterion is to ensure that that content does not *trap* keyboard focus within subsections of content on a Web page. This is a common problem when multiple formats are combined within a page and rendered using plug-ins or embedded applications.

There may be times when the functionality of the web page restricts the focus to a subsection of the content (for example, a modal dialog). In such cases you should provide a method for a user to be able to exit from that subsection of content (for example, the ESC key closes the modal dialog, or a Close button closes the modal dialog).

#### How to Meet - No Keyboard Trap (2.1.2) {#how-to-meet-no-keyboard-trap}

Follow the guidelines under [How to Meet Success Criteria 2.1.2](https://www.w3.org/WAI/WCAG21/quickref/#no-keyboard-trap).

#### More information - No Keyboard Trap (2.1.2) {#more-information-no-keyboard-trap}

* [Understanding Success Criteria 2.1.2](https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html)
* [How to Meet Success Criteria 2.1.2](https://www.w3.org/WAI/WCAG21/quickref/#no-keyboard-trap)

### Enough Time (2.2) {#enough-time}

[Guideline 2.2 Enough Time: Provide users enough time to read and use content.](https://www.w3.org/TR/WCAG/#enough-time)

This deals with ensuring that users have enough time to read and take action.

### Timing Adjustable (2.2.1)  {#timing-adjustable}

* Success Criterion 2.2.1
* Level A
* Keyboard: Provide users enough time to read and use content.

#### Purpose - Timing Adjustable (2.2.1) {#purpose-timing-adjustable}

The intent of this Success Criterion is to ensure that users with disabilities are given adequate time to interact with Web content whenever possible. People with disabilities such as blindness, low vision, dexterity impairments, and cognitive limitations may require more time to read content or to perform functions such as filling out on-line forms. If Web functions are time-dependent, it will be difficult for some users to perform the required action before a time limit occurs. This may render the service inaccessible to them. Designing functions that are not time-dependent helps people with disabilities succeed at completing these functions. Providing options to disable time limits, customize the length of time limits, or request more time before a time limit occurs, helps those users who require more time than expected to successfully complete tasks. These options are listed in the order that will be most helpful for the user. Disabling time limits is better than customizing the length of time limits, which is better than requesting more time before a time limit occurs.

#### How to Meet - Timing Adjustable (2.2.1) {#how-to-meet-timing-adjustable}

Follow the guidelines under [How to Meet Success Criteria 2.2.1](https://www.w3.org/WAI/WCAG21/quickref/#timing-adjustable).

#### More information - Timing Adjustable (2.2.1) {#more-information-timing-adjustable}

* [Understanding Success Criteria 2.2.1](https://www.w3.org/WAI/WCAG21/Understanding/timing-adjustable.html)
* [How to Meet Success Criteria 2.2.1](https://www.w3.org/WAI/WCAG21/quickref/#timing-adjustable)

### Pause, Stop, Hide (2.2.2)  {#pause-stop-hide}

* Success Criterion 2.2.2
* Level A
* Pause, Stop, Hide: For moving, blinking, scrolling, or auto-updating information, the following are true:
  * Moving, blinking, scrolling: For any moving, blinking, or scrolling information that (a) starts automatically, (b) lasts more than five seconds, and (c) is presented in parallel with other content, there is a mechanism for the user to pause, stop, or hide it unless the movement, blinking, or scrolling is part of an activity where it is essential;
  * Auto-updating: For any auto-updating information that (a) starts automatically and (b) is presented in parallel with other content, there is a mechanism for the user to pause, stop, or hide it or to control the frequency of the update unless the auto-updating is part of an activity where it is essential.

Points to note are:

1. For requirements related to flickering or flashing content, refer to Do not Design Content in a Way that is Known to Cause Seizures (2.3).
1. Since any content that does not meet this success criterion can interfere with a user's ability to use the whole page, all content on the web page (whether it is used to meet other success criteria or not) must meet this success criterion. See [Conformance Requirement 5: Non-Interference](https://www.w3.org/TR/WCAG20/#cc5).
1. Content that is updated periodically by software or that is streamed to the user agent is not required to preserve or present information that is generated or received between the initiation of the pause and resuming presentation, as this may not be technically possible, and in many situations could be misleading to do so.
1. An animation that occurs as part of a preload phase or similar situation can be considered essential if interaction cannot occur during that phase for all users and if not indicating progress could confuse users or cause them to think that content was frozen or broken.

#### Purpose - Pause, Stop, Hide (2.2.2) {#purpose-pause-stop-hide}

Certain users may find content that moves is distracting, or even physically painful, making it difficult to concentrate on other parts of the page. Also, such content may prove difficult to read for people who have trouble keeping up with moving text.

#### How to Meet - Pause, Stop, Hide (2.2.2) {#how-to-meet-pause-stop-hide}

Depending on the nature of the content, you can apply one or more of the following suggestions when creating web pages containing moving, flashing, or blinking content:

* Provide a means of pausing scrolling content to give users enough time to read it. For example, news tickers, auto-updated text, and image carousels that auto-advance.
* Make sure that content that blinks stops blinking after five seconds.
* Use appropriate technologies to display moving or blinking content that can be disabled by the browser. For example, Graphics Interchange Format (GIF) or Animated Portable Network Graphics (APNG) files.
* Provide a form control on the web page to allow the user to disable all moving or blinking content on the page.
* If any of the above is not possible, provide a link to a page containing all the content, but without any moving or blinking.

#### More information - Pause, Stop, Hide (2.2.2) {#more-information-pause-stop-hide}

* [Understanding Success Criterion 2.2.2](https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide.html)
* [How to meet Success Criterion 2.2.2](https://www.w3.org/WAI/WCAG21/quickref/#pause-stop-hide)

### Seizures and Physical Reactions (2.3) {#seizures-and-physcial-reactions}

[Guideline 2.3 Seizures: Do not design content in a way that is known to cause seizures or physical reactions.](https://www.w3.org/TR/WCAG/#seizures-and-physical-reactions)

### Three Flashes or Below Threshold (2.3.1) {#three-flashes-or-below-threshold}

* Success Criterion 2.3.1
* Level A
* Three Flashes or Below Threshold: Web pages do not contain anything that flashes more than three times in any one-second period, or the flash is below the general flash and red flash thresholds.

>[!NOTE]
>
>Because any content that does not meet this success criterion can interfere with a user's ability to use the whole page, all content on the web page (whether it is used to meet other success criteria or not) must meet this success criterion. See [Conformance Requirement 5: Non-Interference](https://www.w3.org/TR/WCAG/#cc5).

#### Purpose - Three Flashes or Below Threshold (2.3.1) {#purpose-three-flashes-or-below-threshold}

In certain cases, flashing content can cause photosensitive seizures. This success criterion allows such users to access and experience all content without worrying about flashing content.

#### How to Meet - Three Flashes or Below Threshold (2.3.1) {#how-to-meet-three-flashes-or-below-threshold}

Take steps to make sure that the following techniques are applied:

* Make sure that components do not flash for more than three times during any one-second period;
* If the above condition cannot be met, then display flashing content within a *small safe area* in pixels on the screen. This area is calculated using a complex formula, covered in [G176: Keeping the flashing area small enough](https://www.w3.org/TR/2008/NOTE-WCAG20-TECHS-20081211/G176), so this technique should only be followed if flashing content is *necessary.

#### More Information - Three Flashes or Below Threshold (2.3.1) {#more-information-three-flashes-or-below-threshold}

* [Understanding Success Criterion 2.3.1](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold.html)
* [How to meet Success Criterion 2.3.1](https://www.w3.org/WAI/WCAG21/quickref/#three-flashes-or-below-threshold)

### Navigable (2.4) {#navigable}

[Guideline 2.4 Navigable: Provide ways to help users navigate, find content, and determine where they are.](https://www.w3.org/TR/WCAG/#navigable)

This deals with ensuring the content is easy and straightforward for users to navigate.

### Bypass Blocks (2.4.1)  {#bypass-blocks}
 
* Success Criterion 2.4.1
* Level A
* Bypass Blocks: A mechanism is available to bypass blocks of content that are repeated on multiple Web pages.
 
#### Purpose - Bypass Blocks (2.4.1) {#purpose-bypass-blocks}

The intent of this Success Criterion is to allow people who navigate sequentially through content more direct access to the primary content of the Web page. Web pages and applications often have content that appears on other pages or screens. Examples of repeated blocks of content include but are not limited to navigation links, header graphics, menus, and advertising frames. Small repeated sections such as individual words, phrases, or single links are not considered blocks for the purposes of this provision.

#### How to Meet - Bypass Blocks (2.4.1) {#how-to-meet-bypass-blocks}
 
Follow the guidelines under [How to Meet Success Criteria 2.4.1](https://www.w3.org/WAI/WCAG21/quickref/#bypass-blocks).
 
#### More information - Bypass Blocks (2.4.1) {#more-information-bypass-blocks}
 
* [Understanding Success Criteria 2.4.1](https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks.html)
* [How to Meet Success Criteria 2.4.1](https://www.w3.org/WAI/WCAG21/quickref/#bypass-blocks)

### Page Titled (2.4.2)  {#page-titled}

* Success Criterion 2.4.2
* Level A
* Page Titled: Web pages have titles that describe topic or purpose.

#### Purpose - Page Titled (2.4.2) {#purpose-page-titled}

This success criterion helps everyone, regardless of any particular impairment, to quickly identify the content of a web page without reading the page in full. This is useful where several web pages are opened in browser tabs, as the page title is shown in the tab and therefore can be located quickly.

#### How to Meet - Page Titled (2.4.2) {#how-to-meet-page-titled}

When a new HTML page is created in AEM, you can specify the page title. Make sure that the title adequately describes the content and purpose of the page, especially any unique aspects, so that visitors can quickly identify whether the content is relevant to their needs.

You can also edit the page title when editing a page, which is accessible by **Page Information** - **Properties.**

#### More Information - Page Titled (2.4.2) {#more-information-page-titled}

* [Understanding Success Criterion 2.4.2](https://www.w3.org/WAI/WCAG21/Understanding/page-titled.html)
* [How to meet Success Criterion 2.4.2](https://www.w3.org/WAI/WCAG21/quickref/#page-titled)

### Focus Order (2.4.3)  {#focus-order}
 
* Success Criterion 2.4.3
* Level A
* Focus Order: If a Web page can be navigated sequentially and the navigation sequences affect meaning or operation, focusable components receive focus in an order that preserves meaning and operability.
 
#### Purpose - Focus Order (2.4.3) {#purpose-focus-order}

The intent of this Success Criterion is to ensure that when users navigate sequentially through content, they encounter information in an order that is consistent with the meaning of the content and can be operated from the keyboard. This reduces confusion by letting users form a consistent mental model of the content. There may be different orders that reflect logical relationships in the content. For example, moving through components in an online form composed of multiple fields and/or steps reflects the logical relationships in the content. 

#### How to Meet - Focus Order (2.4.3) {#how-to-meet-focus-order}
 
Follow the guidelines under [How to Meet Success Criteria 2.4.3](https://www.w3.org/WAI/WCAG21/quickref/#focus-order).
 
#### More information - Focus Order (2.4.3) {#more-information-focus-order}
 
* [Understanding Success Criteria 2.4.3](https://www.w3.org/WAI/WCAG21/Understanding/focus-order.html)
* [How to Meet Success Criteria 2.4.3](https://www.w3.org/WAI/WCAG21/quickref/#focus-order)

### Link Purpose (In Context) (2.4.4)  {#link-purpose-in-context}

* Success Criterion 2.4.4
* Level A
* Link Purpose (In Context): The purpose of each link can be determined from the link text alone or from the link text together with its programmatically determined link context, except where the purpose of the link would be ambiguous to users in general.

#### Purpose - Link Purpose (In Context) (2.4.4) {#purpose-link-purpose-in-context}

For all users, regardless of impairment, clearly indicating the direction of a link through appropriate link text is vital. This helps users decide whether they actually want to follow a link. For sighted users, meaningful link text is useful where there are several links on a page (particularly if the page is text-heavy), as meaningful link text provides a clearer indication of the functionality of the target page. Users of some assistive technologies, which can generate a list of all the links on a single page, can more easily understand the link text out of context if that link text is both unique and informative. However, sighted individuals with cognitive disabilities may become confused if a link does not provide enough information to accurately describe where the link takes them.

#### How to Meet - Link Purpose (In Context) (2.4.4) {#how-to-meet-link-purpose-in-context}

Above all, make sure that the purpose of a link is clearly described within the text of the link.

* Bad Example:
  * Text: For details of our evening classes for autumn 2010, click here.
  * Reason: it does not clearly and unambiguously indicate its destination.
* Good Example:
  * Text: Evening classes for autumn 2010 - details.
  * Reason: By slightly adjusting the text and the position of the link element, the link text can be improved:

Links should be phrased consistently across pages, especially for navigation bars. For example, if a link to a specific page is named **Publications** on one page, use that text on other pages to ensure consistency.

At the time of writing, there are some issues surrounding the use of title attributes to ensure that similar links presented on a page provide unique information about the destination (for example, "read more" will often refer to a range of different destinations):

* Text contained within the title attribute is only available to mouse users as a tool-tip pop-up and cannot be consistently accessed using the keyboard, or by mobile users.
* Screen readers can read out title attributes, but this functionality may not be enabled by default; so users may be unaware a title attribute exists.
* It is difficult to change the appearance of the title text, which means it may be difficult or impossible to read by some people.

So, while the title attribute can be used to provide extra context to a link, be aware of its limitations and do not use it as an alternative to appropriate link text.

Where the link is made up of an image, make sure that the alternative text for the image describes the destination of the link. For example, if an image of a bookshelf is set as a link to a person's publications, the alternative text should read **John Smith's publications** and not **Bookshelf**.

Alternatively, if the link anchor contains text that describes the purpose of the link in addition to the image element (and thus the text appears alongside the image), use an empty alt attribute for the image:

```xml
<a href="publications.html">
<img src = "bookshelf.jpg" alt = "" />
John Smith's publications
</a>
```

>[!NOTE]
>
>The above snippet is an illustration, it is recommended to use the **Image** component.

While it is advisable to give link text that identifies the purpose of the link without needing additional context, it is recognized that this is not always possible. Context free links can be used in the following cases, HTML examples of which can be found in [How to Meet Success Criterion 2.4.4](https://www.w3.org/WAI/WCAG21/quickref/#link-purpose-in-context).

* The link text is part of a list of closely related links and when the list item enclosing the link provides enough context.
* The purpose of a link can be clearly identified from the *preceding* (not the following) paragraph text.
* The link is contained within a data table and thus the purpose can clearly be identified from the associated headings.
* A list of links is contained within a set of headings and the heading itself provides suitable context.
* A list of links is contained within a nested link and the parent list item above the nested link provides suitable context.

Sometimes, where there are several links on a page (each of which provides the direction of a link in complex, but necessary detail), it can be appropriate to provide an alternative version of the web page that displays the exact same content but where the link text is not as detailed.

Alternatively, use scripts so that a minimal amount of text is provided within the link itself. On activating an appropriate control positioned towards the top of the page, the link text is *expanded* into further detail. A similar approach is to use CSS to *hide* the full link from sighted users, but still output it in full to screen reader users. This falls outside the scope of this document, but more information on how this can be achieved can be found in the [More Information - Link Purpose (In Context) (2.4.4)](#more-information-link-purpose-in-context) section.

#### More Information - Link Purpose (In Context) (2.4.4) {#more-information-link-purpose-in-context}

* [Understanding Success Criterion 2.4.4](https://www.w3.org/WAI/WCAG21/Understanding/link-purpose-in-context.html)
* [How to meet Success Criterion 2.4.4](https://www.w3.org/WAI/WCAG21/quickref/#link-purpose-in-context)

<!--
* [C7: Using CSS to hide a portion of the link text](https://www.w3.org/TR/2008/NOTE-WCAG20-TECHS-20081211/C7)
--> 

### Multiple Ways (2.4.5)  {#multiple-ways}
 
* Success Criterion 2.4.5
* Level AA
* Multiple Ways: More than one way is available to locate a Web page within a set of Web pages except where the Web Page is the result of, or a step in, a process.
 
#### Purpose - Multiple Ways (2.4.5) {#purpose-multiple-ways}

The intent of this Success Criterion is to make it possible for users to locate content in a manner that best meets their needs. Users may find one technique easier or more comprehensible to use than another.

Even small sites should provide users some means of orientation. For a three or four page site, with all pages linked from the home page, it may be sufficient simply to provide links from and to the home page where the links on the home page can also serve as a site map.

#### How to Meet - Multiple Ways (2.4.5) {#how-to-meet-multiple-ways}
 
Follow the guidelines under [How to Meet Success Criteria 2.4.5](https://www.w3.org/WAI/WCAG21/quickref/#multiple-ways).
 
#### More information - Multiple Ways (2.4.5) {#more-information-multiple-ways}
 
* [Understanding Success Criteria 2.4.5](https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways.html)
* [How to Meet Success Criteria 2.4.5](https://www.w3.org/WAI/WCAG21/quickref/#multiple-ways)

### Headings and Labels (2.4.6)  {#headings-and-labels}
 
* Success Criterion 2.4.6
* Level AA
* Headings and Labels: Headings and labels describe topic or purpose.
 
#### Purpose - Headings and Labels (2.4.6) {#purpose-headings-and-labels}

The intent of this Success Criterion is to help users understand what information is contained in Web pages and how that information is organized. When headings are clear and descriptive, users can find the information they seek more easily, and they can understand the relationships between different parts of the content more easily. Descriptive labels help users identify specific components within the content.

#### How to Meet - Headings and Labels (2.4.6) {#how-to-meet-headings-and-labels}
 
Follow the guidelines under [How to Meet Success Criteria 2.4.6](https://www.w3.org/WAI/WCAG21/quickref/#headings-and-labels).
 
#### More information - Headings and Labels (2.4.6) {#more-information-headings-and-labels}
 
* [Understanding Success Criteria 2.4.6](https://www.w3.org/WAI/WCAG21/Understanding/headings-and-labels.html)
* [How to Meet Success Criteria 2.4.6](https://www.w3.org/WAI/WCAG21/quickref/#headings-and-labels)

### Focus Visible (2.4.7)  {#focus-visible}
 
* Success Criterion 2.4.7
* Level AA
* Focus Visible: Any keyboard operable user interface has a mode of operation where the keyboard focus indicator is visible.
 
#### Purpose - Focus Visible (2.4.7) {#purpose-focus-visible}

The purpose of this success criterion is to help a person know which element has the keyboard focus.

It must be possible for a person to know which element among multiple elements has the keyboard focus. If there is only one keyboard actionable control on the screen, the success criterion would be met because the visual design presents only one keyboard actionable item.

Where the success criterion says "mode of operation", this is to account for platforms which may not always show a focus indicator. Usually, there is only one mode of operation so this success criteria applies.

#### How to Meet - Focus Visible (2.4.7) {#how-to-meet-focus-visible}
 
Follow the guidelines under [How to Meet Success Criteria 2.4.7](https://www.w3.org/WAI/WCAG21/quickref/#focus-visible).
 
#### More information - Focus Visible (2.4.7) {#more-information-focus-visible}
 
* [Understanding Success Criteria 2.4.7](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible.html)
* [How to Meet Success Criteria 2.4.7](https://www.w3.org/WAI/WCAG21/quickref/#focus-visible)

## Principle 3: Understandable {#principle-understandable}

[Principle 3: Understandable - Information and the operation of user interface must be understandable.](https://www.w3.org/TR/WCAG/#understandable)

### Make Text Content Readable and Understandable (3.1) {#make-text-content-readable-and-understandable}

[Guideline 3.1 Readable: Make text content readable and understandable.](https://www.w3.org/TR/WCAG/#readable)

### Language of Page (3.1.1) {#language-of-page}

* Success Criterion 3.1.1
* Level A
* Language of Page: The default human language of each web page can be programmatically determined.

#### Purpose - Language of Page (3.1.1) {#purpose-language-of-page}

The purpose of this success criterion is to make sure that text and other linguistic content is rendered correctly. For screen reader users, this ensures that the content is pronounced correctly, while visual browsers are more likely to display certain character sets correctly.

#### How to Meet - Language of Page (3.1.1) {#how-to-meet-language-of-page}

To meet this success criterion, the default language of a web page can be identified using the `lang` attribute within the `<html>` element at the top of the page. For example:

* If a page is written in English, the `<html>` element should read:
  `<html lang = "en">`

* Whereas a page to be rendered in Spanish should adopt the following standard:
  `<html lang = "es">`

In AEM, the default language of your page is set when creating the page, but may also be changed when editing [Page Properties](/help/sites-authoring/editing-page-properties.md).

>[!NOTE]
>
>AEM provides further fine-tuning for variations of a root language; for example, American English - en-us, British English - en-gb, and Canadian English - en-ca. This level of detail is often superfluous for assistive technology, though can be used for regional variations in page content.

#### More Information - Language of Page (3.1.1) {#more-information-language-of-page}

* [Understanding Success Criterion 3.1.1](https://www.w3.org/WAI/WCAG21/Understanding/language-of-page.html)
* [How to meet Success Criterion 3.1.1](https://www.w3.org/WAI/WCAG21/quickref/#language-of-page)
* The codes are based on ISO 639-1. A more extensive list of codes for each language can be found at the [W3 Schools site](https://www.w3schools.com/tags/ref_language_codes.asp).

### Language of Parts (3.1.2)  {#language-of-parts}

* Success Criterion 3.1.2
* Level AA
* Language of Parts: The human language of each passage or phrase in the content can be programmatically determined. The exceptions are proper names, technical terms, words of indeterminate language, and words or phrases that have become part of the vernacular of the immediately surrounding text.

#### Purpose - Language of Parts (3.1.2) {#purpose-language-of-parts}

The purpose of this success criterion is similar to the success criterion [Language of Page](#language-of-page), except that it applies to web pages containing content in multiple languages on a single page (for example, because of quotations or uncommon loan words).

Pages applying this success criterion allow:

* Braille transition software to insert accented characters.
* Screen readers to pronounce those words that have special characters or are not in the default language that was identified at the page level.
* Translation tools such as Google Translate to correctly translate content from one language to another.

#### How to Meet - Language of Parts (3.1.2) {#how-to-meet-language-of-parts}

The `lang` attribute can be used to identify changes in the language of content. For example, a quotation in German (ISO 639-1 code "de") can be shown as follows:

```xml
<blockquote cite = "John F. Kennedy" lang = "de">
     <p>Ich bin ein Berliner</p>
 </blockquote>
```

>[!NOTE]
>
>Blockquotes are not supported in an out-of-the-box instance. A custom component could be developed to support the feature.

Similarly, the browser can render an uncommon loan word or phrase correctly if the `span` element is used as follows:

```xml
<p>The only French phrase I know is <span lang = "fr">je ne sais quoi</code>.</p>
```

>[!NOTE]
>
>It is not necessary to follow this success criterion when including names or cities in different languages. Or, when using loan words or phrases that have become commonplace in the default language, such as *schadenfreude* in English.

To add the span element, with an appropriate language, you can manually edit your HTML markup in the source edit mode of the RTE so that it reads as above. Alternatively the `lang` attribute can be included in the RTE by a system administrator (see [Adding Support for Additional HTML Elements and Attributes](/help/sites-administering/rte-accessible-content.md#add-support-for-more-html-elements-and-attributes)).

#### More Information - Language of Parts (3.1.2) {#more-information-language-of-parts}

* [Understanding Success Criterion 3.1.2](https://www.w3.org/WAI/WCAG21/Understanding/language-of-parts.html)
* [How to meet Success Criterion 3.1.2](https://www.w3.org/WAI/WCAG21/quickref/#language-of-parts)

### Predictable (3.2) {#predictable}

[Guideline 3.2 Predictable: Make Web pages appear and operate in predictable ways.](https://www.w3.org/TR/WCAG/#predictable)

This deals with ensuring the web pages are consistent in how they look and operate.

### On Focus (3.2.1)  {#on-focus}
 
* Success Criterion 3.2.1
* Level A
* On Focus: When any user interface component receives focus, it does not initiate a change of context.
 
#### Purpose - On Focus (3.2.1) {#purpose-on-focus}

The intent of this Success Criterion is to ensure that functionality is predictable as visitors navigate their way through a document. Any component that is able to trigger an event when it receives focus must not change the context. Examples of changing context when a component receives focus include, but are not limited to:

* forms submitted automatically when a component receives focus;
* new windows launched when a component receives focus;
* focus is changed to another component when that component receives focus;

Focus may be moved to a control either via the keyboard (for example, tabbing to a control) or the mouse (for example, clicking a text field). Moving the mouse over a control does not move the focus unless scripting implements this behavior. For some types of controls, clicking a control may also activate the control (for example, button), which may, in turn, initiate a change in context.

#### How to Meet - On Focus (3.2.1) {#how-to-meet-on-focus}
 
Follow the guidelines under [How to Meet Success Criteria 3.2.1](https://www.w3.org/WAI/WCAG21/quickref/#on-focus).
 
#### More information - On Focus (3.2.1) {#more-information-on-focus}
 
* [Understanding Success Criteria 3.2.1](https://www.w3.org/WAI/WCAG21/Understanding/on-focus.html)
* [How to Meet Success Criteria 3.2.1](https://www.w3.org/WAI/WCAG21/quickref/#on-focus)

### On Input (3.2.2)  {#on-input}
 
* Success Criterion 3.2.2
* Level A
* On Input: Changing the setting of any user interface component does not automatically cause a change of context unless the user has been advised of the behavior before using the component.
 
#### Purpose - On Input (3.2.2) {#purpose-on-input}

The intent of this Success Criterion is to ensure that entering data or selecting a form control has predictable effects. Changing the setting of any user interface component is changing some aspect in the control that persists when the user is no longer interacting with it. So checking a checkbox, entering text into a text field, or changing the selected option in a list control changes its setting, but activating a link or a button does not. Changes in context can confuse users who do not easily perceive the change or are easily distracted by changes. Changes of context are appropriate only when it is clear that such a change happens in response to the user's action.

#### How to Meet - On Input (3.2.2) {#how-to-meet-on-input}
 
Follow the guidelines under [How to Meet Success Criteria 3.2.2](https://www.w3.org/WAI/WCAG21/quickref/#on-input).
 
#### More information - On Input (3.2.2) {#more-information-on-input}
 
* [Understanding Success Criteria 3.2.2](https://www.w3.org/WAI/WCAG21/Understanding/on-input.html)
* [How to Meet Success Criteria 3.2.2](https://www.w3.org/WAI/WCAG21/quickref/#on-input)

### Consistent Navigation (3.2.3)  {#consistent-navigation}
 
* Success Criterion 3.2.3
* Level AA
* Consistent Navigation: Navigational mechanisms that are repeated on multiple Web pages within a set of Web pages occur in the same relative order each time they are repeated, unless a change is initiated by the user.
 
#### Purpose - Consistent Navigation (3.2.3) {#purpose-consistent-navigation}

The intent of this Success Criterion is to encourage the use of consistent presentation and layout for users who interact with repeated content within a set of Web pages and must locate specific information or functionality more than once. Individuals with low vision who use screen magnification to display a small portion of the screen at a time often use visual cues and page boundaries to quickly locate repeated content. Presenting repeated content in the same order is also important for visual users who use spatial memory or visual cues within the design to locate repeated content.

It is important to note that the use of the phrase "same order" in this section is not meant to imply that subnavigation menus cannot be used or that blocks of secondary navigation or page structure cannot be used. Instead, this Success Criterion is intended to assist users who interact with repeated content across Web pages to be able to predict the location of the content they are looking for. And, to find it more quickly when they encounter it again.

Users may initiate a change in the order by using adaptive user agents or by setting preferences so that the information is presented in a way that is most useful to them.

#### How to Meet - Consistent Navigation (3.2.3) {#how-to-meet-consistent-navigation}
 
Follow the guidelines under [How to Meet Success Criteria 3.2.3](https://www.w3.org/WAI/WCAG21/quickref/#consistent-navigation).
 
#### More information - Consistent Navigation (3.2.3) {#more-information-consistent-navigation}
 
* [Understanding Success Criteria 3.2.3](https://www.w3.org/WAI/WCAG21/Understanding/consistent-navigation.html)
* [How to Meet Success Criteria 3.2.3](https://www.w3.org/WAI/WCAG21/quickref/#consistent-navigation)

### Consistent Identification (3.2.4)  {#consistent-identification}
 
* Success Criterion 3.2.4
* Level A
* Consistent Identification: Components that have the same functionality within a set of Web pages are identified consistently.
 
#### Purpose - Consistent Identification (3.2.4) {#purpose-consistent-identification}

The intent of this Success Criterion is to ensure consistent identification of functional components that appear repeatedly within a set of Web pages. A strategy that people who use screen readers use when operating a Web site is to rely heavily on their familiarity with functions that may appear on different Web pages. If identical functions have different labels (or, more generally, a different accessible name) on different Web pages, the site is considerably more difficult to use. It may also be confusing and increase the cognitive load for people with cognitive limitations. Therefore, consistent labeling helps.

This consistency extends to the text alternatives. If icons or other non-text items have the same functionality, then their text alternatives should be consistent as well.

If there are two components on a web page that both have the same functionality as a component on another page in a set of web pages, then all 3 must be consistent. Hence the two on the same page will be consistent.

While it is desirable and best practice always to be consistent within a single web page, 3.2.4 only addresses consistency within a set of web pages where something is repeated on more than one page in the set.

#### How to Meet - Consistent Identification (3.2.4) {#how-to-meet-consistent-identification}
 
Follow the guidelines under [How to Meet Success Criteria 3.2.4](https://www.w3.org/WAI/WCAG21/quickref/#consistent-identification).
 
#### More information - Consistent Identification (3.2.4) {#more-information-consistent-identification}
 
* [Understanding Success Criteria 3.2.4](https://www.w3.org/WAI/WCAG21/Understanding/consistent-identification.html)
* [How to Meet Success Criteria 3.2.4](https://www.w3.org/WAI/WCAG21/quickref/#consistent-identification)

### Input Assistance (3.3) {#input-assistance}

[Guideline 3.3 Input Assistance: Help users avoid and correct mistakes.](https://www.w3.org/TR/WCAG/#input-assistance)

### Error Identification (3.3.1)  {#error-identification}
 
* Success Criterion 3.3.1
* Level A
* Error Identification: If an input error is automatically detected, the item that is in error is identified and the error is described to the user in text.
 
#### Purpose - Error Identification (3.3.1) {#purpose-error-identification}

The intent of this Success Criterion is to ensure that users are aware that an error has occurred and can determine what is wrong. The error message should be as specific as possible. In the case of an unsuccessful form submission, redisplaying the form and indicating the fields in error is insufficient for some users to perceive that an error has occurred. Screen reader users, for example, do not know that there was an error until they encounter one of the indicators. They may abandon the form altogether before encountering the error indicator, thinking that the page simply is not functional. Per the definition in WCAG, an [input error](https://www.w3.org/TR/WCAG/#dfn-input-error) is information provided by the user that is not accepted. This includes the following.

Information that is required by the web page but omitted by the user, or information that is provided by the user but that falls outside the required data format or allowed values.
For example:

* the user fails to enter the proper abbreviation into state, province, or region field;
* the user enters a state abbreviation that is not a valid state;
* the user enters a non-existent zip code or postal code;
* the user enters a birth date 2 years in the future;
* the user enters alphabetic characters or parentheses into their phone number field that only accepts numbers;
* the user enters a bid that is below the previous bid or the minimum bid increment.

#### How to Meet - Error Identification (3.3.1) {#how-to-meet-error-identification}
 
Follow the guidelines under [How to Meet Success Criteria 3.3.1](https://www.w3.org/WAI/WCAG21/quickref/#error-identification).
 
#### More information - Error Identification (3.3.1) {#more-information-error-identification}
 
* [Understanding Success Criteria 3.3.1](https://www.w3.org/WAI/WCAG21/Understanding/error-identification.html)
* [How to Meet Success Criteria 3.3.1](https://www.w3.org/WAI/WCAG21/quickref/#error-identification)

### Labels or Instructions (3.3.2) {#labels-or-instructions}

* Success Criterion 3.3.2
* Level A
* Labels or Instructions: Labels or instructions are provided when content requires user input.

#### Purpose - Labels or Instructions (3.3.2) {#purpose-labels-or-instructions}

Providing instructions to help people complete forms is a fundamental part of good practice in interface usability. Doing this is helpful for people with visual or cognitive impairments who might otherwise have difficulty understanding the layout of a form and the sort of data to be provided in a particular form field.

##### Forms

In the AEM WKND demo project a default label is added when you add a form component, such as a **Text Field**, to the page. This default title depends on the component type. You can add your own title in the **Title and Text** tab of the edit dialog for that field. It is important to ensure that labels help users to understand the data associated with each form component.

This **Title** field must be used for field elements as it provides a label that is available to assistive technology. Simply writing a label in text beside the field is not sufficient.

For some form components, it is also possible to visually hide labels using the **Hide Title** checkbox. Labels hidden in this way are still available to assistive technology, but not displayed on the screen. While this can be a good approach in some situations, it is best to include a visual label wherever possible, as some users may be looking at a small section of the screen (one field at a time) and need the labels to identify the field correctly.

###### Image Buttons {#image-buttons}

Where image buttons are used (for example, the **Image Button** component of the WKND project), the **Title** field in the **Title and Text** tab of the edit dialog actually provides the alt text for the image, rather than the label. So, in the example below, the image with the text `Submit` has alt text of `Submit`, added using the **Title** field in the edit dialog.

###### Groups of Form Fields {#groups-of-form-fields}

In the WKND project, where there is a group of related controls, such as **Radio Group**, a title may be needed for the group, and individual controls. When adding a set of radio buttons in AEM, the **Title** field provides this group title, while individual titles are specified as the radio buttons (**Items**) are created.

However, there is no programmatic association between the group title and the radio buttons themselves. Template editors would must wrap the title in the necessary `fieldset` and `legend` tags to create this association and this can only be done by editing the page source code. Alternatively, a system administrator can add support for these elements so that they appear in the **Field Properties** dialog (see [Adding Support for Additional HTML Elements and Attributes](/help/sites-administering/rte-accessible-content.md#add-support-for-more-html-elements-and-attributes)).

###### Additional Considerations for Forms {#additional-considerations-for-forms}

If data is to be entered in a specific format, make this clear in the label text. For example, if a date has to be entered in the `DD-MM-YYYY` format, specifically indicate this as part of the label. This means that when screen reader users encounter the field, the label is automatically announced, along with the additional information about format.

If input for a form field is mandatory, make this clear by using the word required as part of the label. AEM adds an asterisk when a field is required, but it would be ideal to include the word `required`in the label itself (in the **Title** field in the edit dialog).

The positioning of labels is also important as it helps them to locate appropriate fields. This is of particular importance when the user is faced with a complex form. Follow the convention below:

* Checkboxes or radio buttons:
  Labels are positioned immediately to the right of the field.
* All other form components (for example, text boxes, combo boxes):
  Labels are positioned either immediately above or immediately to the left of the field.

In simple forms with limited functionality, appropriately labeling a `Submit` button can act as a label for the adjacent field (for example `Search`). This is useful in situations when finding space for the label text might be difficult.

#### More Information - Labels or Instructions (3.3.2) {#more-information-labels-or-instructions}

* [Understanding Success Criterion 3.3.2](https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html)
* [How to meet Success Criterion 3.3.2](https://www.w3.org/WAI/WCAG21/quickref/#labels-or-instructions)

### Error Suggestion (3.3.3)  {#error-suggestion}
 
* Success Criterion 3.3.3
* Level AA
* Keyboard: If an input error is automatically detected and suggestions for correction are known, then the suggestions are provided to the user, unless it would jeopardize the security or purpose of the content.
 
#### Purpose - Error Suggestion (3.3.3) {#purpose-error-suggestion}

The intent of this Success Criterion is to ensure that users receive appropriate suggestions for correction of an input error if it is possible. The WCAG definition of [input error](https://www.w3.org/TR/WCAG/#dfn-input-error) says that it is "information provided by the user that is not accepted" by the system. Some examples of information that is not accepted include information that is required but omitted by the user and information that is provided by the user but that falls outside the required data format or allowed values.

Success Criterion 3.3.1 provides for notification of errors. However, persons with cognitive limitations may find it difficult to understand how to correct the errors. People with visual disabilities may not be able to figure out exactly how to correct the error. In the case of an unsuccessful form submission, users may abandon the form because they may be unsure of how to correct the error even though they are aware that it has occurred.

The content author may provide the description of the error, or the user agent may provide the description of the error based on technology-specific, programmatically determined information.

#### How to Meet - Error Suggestion (3.3.3) {#how-to-meet-error-suggestion}
 
Follow the guidelines under [How to Meet Success Criteria 3.3.3](https://www.w3.org/WAI/WCAG21/quickref/#error-suggestion).
 
#### More information - Error Suggestion (3.3.3) {#more-information-error-suggestion}
 
* [Understanding Success Criteria 3.3.3](https://www.w3.org/WAI/WCAG21/Understanding/error-suggestion.html)
* [How to Meet Success Criteria 3.3.3](https://www.w3.org/WAI/WCAG21/quickref/#error-suggestion)

### Error Prevention (Legal, Financial, Data) (3.3.4)  {#error-prevention-legal-financial-data}
 
* Success Criterion 3.3.4
* Level AA
* Error Prevention (Legal, Financial, Data): For Web pages that cause legal commitments or financial transactions for the user to occur, that modify or delete user-controllable data in data storage systems, or that submit user test responses, at least one of the following is true:

  * Reversible
    Submissions are reversible.
  * Checked
    Data entered by the user is checked for input errors and the user is provided an opportunity to correct them.
  * Confirmed
    A mechanism is available for reviewing, confirming, and correcting information before finalizing the submission.
 
#### Purpose - Error Prevention (Legal, Financial, Data) (3.3.4) {#purpose-error-prevention-legal-financial-data}

The intent of this Success Criterion is to help users with disabilities avoid serious consequences as the result of a mistake when performing an action that cannot be reversed. For example, purchasing non-refundable airline tickets or submitting an order to purchase stock in a brokerage account are financial transactions with serious consequences. If a user has made a mistake on the date of air travel, they could end up with a ticket for the wrong day that cannot be exchanged. If the user made a mistake on the number of stock shares to be purchased, they could end up purchasing more stock than intended. Both of these types of costly mistakes involve transactions that take place immediately and cannot be altered afterwards. Likewise, it may be an unrecoverable error if users unintentionally modify or delete data stored in a database that they later must access, such as their entire travel profile in a travel services web site. When referring to modification or deletion of 'user controllable' data, the intent is to prevent mass loss of data such as deleting a file or record. It is not the intent to require a confirmation for each save command or the simple creation or editing of documents, records or other data.

Users with disabilities may be more likely to make mistakes. People with reading disabilities may transpose numbers and letters, and those with motor disabilities may hit keys by mistake. Providing the ability to reverse actions allows users to correct a mistake that could result in serious consequences. Providing the ability to review and correct information gives the user an opportunity to detect a mistake before taking an action that has serious consequences.

User-controllable data is user-viewable data that the user can change and/or delete through an intentional action. Examples of the user controlling such data would be updating the phone number and address for the user's account, or deleting a record of past invoices from a website. It does not refer such things as internet logs and search engine monitoring data that the user can't view or interact with directly.

#### How to Meet - Error Prevention (Legal, Financial, Data) (3.3.4) {#how-to-meet-error-prevention-legal-financial-data}
 
Follow the guidelines under [How to Meet Success Criteria 3.3.4](https://www.w3.org/WAI/WCAG21/quickref/#error-prevention-legal-financial-data).
 
#### More information - Error Prevention (Legal, Financial, Data) (3.3.4) {#more-information-error-prevention-legal-financial-data}
 
* [Understanding Success Criteria 3.3.4](https://www.w3.org/WAI/WCAG21/Understanding/error-prevention-legal-financial-data.html)
* [How to Meet Success Criteria 3.3.4](https://www.w3.org/WAI/WCAG21/quickref/#error-prevention-legal-financial-data)

## Principle 4: Robust {#principle-robust}

[Principle 4: Robust - Content must be robust enough that it can be interpreted by a wide variety of user agents, including assistive technologies.](https://www.w3.org/TR/WCAG/#robust)

### Compatible (4.1) {#compatible}

[Guideline 4.1 Compatible: Maximize compatibility with current and future user agents, including assistive technologies.](https://www.w3.org/TR/WCAG/#compatible)

Maximize compatibility with current and future user agents, including assistive technologies.

### Parsing (4.1.1)  {#parsing}
 
* Success Criterion 4.1.1
* Level A
* Parsing: In content implemented using markup languages, elements have complete start and end tags, elements are nested according to their specifications, elements do not contain duplicate attributes, and any IDs are unique, except where the specifications allow these features.
 
#### Purpose - Parsing (4.1.1) {#purpose-parsing}

The intent of this Success Criterion is to ensure that user agents, including assistive technologies, can accurately interpret and parse content. If the content cannot be parsed into a data structure, then different user agents may present it differently or be unable to parse it. Some user agents use "repair techniques" to render poorly coded content.

Because repair techniques vary among user agents, authors cannot assume that content is accurately parsed into a data structure or that it will be rendered correctly by specialized user agents, including assistive technologies, unless the content is created according to the rules defined in the formal grammar for that technology. In markup languages, errors in element and attribute syntax and failure to provide properly nested start/end tags lead to errors that prevent user agents from parsing the content reliably. Therefore, the Success Criterion requires that the content can be parsed using only the rules of the formal grammar.

#### How to Meet - Parsing (4.1.1) {#how-to-meet-parsing}
 
Follow the guidelines under [How to Meet Success Criteria 4.1.1](https://www.w3.org/WAI/WCAG21/quickref/#parsing).
 
#### More information - Parsing (4.1.1) {#more-information-parsing}
 
* [Understanding Success Criteria 4.1.1](https://www.w3.org/WAI/WCAG21/Understanding/parsing.html)
* [How to Meet Success Criteria 4.1.1](https://www.w3.org/WAI/WCAG21/quickref/#parsing)

### Name, Role, Value (4.1.2)  {#name-role-value}
 
* Success Criterion 4.1.2
* Level A
* Name, Role, Value: For all user interface components (including but not limited to: form elements, links, and components generated by scripts), the name, and role can be programmatically determined; states, properties, and values that can be set by the user can be programmatically set; and notification of changes to these items is available to user agents, including assistive technologies.
 
#### Purpose - Name, Role, Value (4.1.2) {#purpose-ame-role-value}

The intent of this Success Criterion is to ensure that Assistive Technologies (AT) can gather information about, activate(or set) and keep up to date on the status of user interface controls in the content.

When standard controls from accessible technologies are used, this process is straightforward. If the user interface elements are used according to specification, the conditions of this provision are met. (See examples of Success Criterion 4.1.2 below)

If custom controls are created, however, or interface elements are programmed (in code or script) to have a different role and/or function than usual, then additional measures must be taken to ensure that the controls provide important information to assistive technologies and allow themselves to be controlled by assistive technologies.

An important state of a user interface control is whether it has focus. The focus state of a control can be programmatically determined, and notifications about change of focus are sent to user agents and assistive technology. Other examples of user interface control state are whether a checkbox or radio button has been selected. Or, whether a collapsible tree or list node is expanded or collapsed.

#### How to Meet - Name, Role, Value (4.1.2) {#how-to-meet-ame-role-value}
 
Follow the guidelines under [How to Meet Success Criteria 4.1.2](https://www.w3.org/WAI/WCAG21/quickref/#name-role-value).
 
#### More information - Name, Role, Value (4.1.2 {#more-information-ame-role-value}
 
* [Understanding Success Criteria 4.1.2](https://www.w3.org/WAI/WCAG21/Understanding/name-role-value.html)
* [How to Meet Success Criteria 4.1.2](https://www.w3.org/WAI/WCAG21/quickref/#name-role-value)
