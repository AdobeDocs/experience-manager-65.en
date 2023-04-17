---
title: Screen readers for HTML5 forms
seo-title: Screen readers for HTML5 forms
description: Lists the screen readers supported with HTML5 forms.
seo-description: Lists the screen readers supported with HTML5 forms.
uuid: 035354e2-957f-4eb6-bc16-4ca96ec7ac74
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 53c57180-7004-4534-9146-603f7770a6fe
feature: Mobile Forms
exl-id: 07d20c2f-7d13-48ac-8d58-b367eb194558
---
# Screen readers for HTML5 forms {#screen-readers-for-html-forms}

HTML5 forms components render XFA form template to an HTML5 format. All standard browsers supporting HTML5 can render these forms. To support similar data capture experience across PDF and HTML5 forms, the layout of PDF forms is retained in HTML5 forms.

HTML5 forms use standard HTML constructs allowing regular accessibility tools for HTML to be used with these forms. If a form is designed according to the best practices for accessible forms, it works with any supported screen reader. Also, such forms are enabled for keyboard navigation.

## Accessibility standards {#accessibility-standards}

HTML5 forms comply with section 508 for accessibility with known exceptions. See [VPAT for HTML5 forms](https://www.adobe.com/content/dam/cc1/en/accessibility/compliance/pdfs/adobe-livecycle-es4-section-508-vpat-portfolio.pdf) for details.

## Certified screen readers for HTML5 forms {#certified-screen-readers-for-html-forms}

* JAWS 14.0 on Microsoft&reg; Windows
* VoiceOver on macOS X and iPad

### JAWS {#jaws}

All default keystrokes and shortcuts work for HTML5 forms. For more information on using JAWS, visit [https://www.freedomscientific.com/jaws-hq.asp](https://www.freedomscientific.com/jaws-hq.asp).

### VoiceOver {#voiceover}

HTML5 forms support all the default keystrokes and gestures of Voice over. For more information on setting up and using VoiceOver, see [https://www.apple.com/accessibility/vision/](https://www.apple.com/accessibility/vision/).

## Known issues {#known-issues}

* **(Internal Explorer 9 only)** In HTML5 forms, the pages are loaded on demand (dynamically). On-demand page load causes issues with the functioning of screen readers. When focus of the screen reader is on the last field of the page and the user presses tab, the screen reader returns focus to the first field of the first page on the form.
* **(Internal Explorer 9 only)** The Date Picker control in HTML5 forms is not fully accessible with keyboard. In the Date Picker control, if you press Up/Down keys multiple times, the Date Picker control closes and focus moves to next/last field.

* VoiceOver is unable to detect arrow keys on the date widget on iPad safari.
