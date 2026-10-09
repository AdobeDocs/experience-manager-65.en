---
title: Setting the message of the day
description: The message of the day let you set a message to be displayed on the Welcome page in the Workspace user interface.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_workspace
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: d8bab1c4-b830-4491-9486-d7e7f4dc2c99
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Setting the message of the day {#setting-the-message-of-the-day}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

You can set a message to be displayed on the Welcome page in the Workspace user interface.

If necessary, you can use the HTML tags supported by Adobe Flash® Player to format the appearance of the text:

* &lt;a&gt; Anchor tag
* &lt;b&gt; Bold tag
* &lt;br&gt; Break tag
* &lt;font&gt; Font tag
* &lt;img&gt; Image tag
* &lt;i&gt; Italic tag
* &lt;li&gt; List item tag
* &lt;p&gt; Paragraph tag
* &lt;span&gt; Span tag
* &lt;textformat&gt; Text format tag
* &lt;u&gt; Underline tag

For more information about the supported tags, see the definition of the `htmlText` property for the TextField class in the [Flex Language Reference](https://flex.apache.org/).

## Set the message of the day {#set-the-message-of-the-day}

1. In administration console, click Services &gt; Workspace &gt; Message Of The Day.
1. In The Message Of The Day box, provide the text to be displayed on the Welcome screen.
1. Click Save.

>[!NOTE]
>
>The Flex Workspace is deprecated for AEM forms release.
