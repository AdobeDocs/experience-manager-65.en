---
title: Screen readers for HTML5 forms
description: Lists the screen readers supported with HTML5 forms.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 53c57180-7004-4534-9146-603f7770a6fe
feature: HTML5 Forms,Mobile Forms
exl-id: 07d20c2f-7d13-48ac-8d58-b367eb194558
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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
