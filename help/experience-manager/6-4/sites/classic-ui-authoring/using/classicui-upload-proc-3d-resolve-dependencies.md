---
title: Resolving file dependencies
seo-title: Resolving file dependencies
description: Primary 3D model file dependencies, such as texture map files, are automatically resolved where possible. This functionality is accomplished by having AEM search nearby Asset folders for files with the same names that are found in the 3D file.
seo-description: Primary 3D model file dependencies, such as texture map files, are automatically resolved where possible. This functionality is accomplished by having AEM search nearby Asset folders for files with the same names that are found in the 3D file.
uuid: c05ef1d6-3f87-44c8-8cc8-9db763399325
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: 9e8a15e9-c547-4eaa-a378-1683ca96194f
index: y
internal: n
snippet: y
---

# Resolving file dependencies{#resolving-file-dependencies}

Primary 3D model file dependencies, such as texture map files, are automatically resolved where possible. This functionality is accomplished by having AEM search nearby Asset folders for files with the same names that are found in the 3D file. If one or more dependencies are unresolvable during the Creating preview processing stage, the asset's card displays the following red banner message in the Card View:

![](assets/chlimage_1-4.png)

To resolve file dependencies:

1. In the Card View, hover the pointer over the **Unresolved Dependencies** banner message on the card, then tap the exclamation point icon.

   ![](assets/chlimage_1-5.png)

1. On the metadata properties page, tap the **Dependencies **tab.

   The files that AEM could not auto-resolve are listed under the Original Paths column, in red.

1. Do one or more of the following:

    * **Browse to and select the dependencies**. (This option assumes that you have already uploaded the dependency files.

        1. Tap the File Browse icon to the left of the red path.
        1. On the Select Content page, navigate to the missing file, then tap on the file's card to select it.
        1. In the upper-left corner of the Select Content page, tap Close (X icon) to return to the View Properties page.

    * **Upload the dependencies**. (This option assumes that you have not yet uploaded the missing files.)

        1. Note the missing paths and file names.
        1. Near the upper-right corner of the properties page, tap **Close**.

   After the files are uploaded return to View Properties &gt; Dependencies page. The newly uploaded asset are now properly listed as referenced assets.

    * **Ignore the dependencies**.  
      If a missing dependency is no longer needed, under the Referenced Asset column, in the text field to the left of the missing file, type `n/a` so that AEM 3D ignores the file.

1. Near the upper-right corner of the View Properties page, tap **Save**.
1. Tap **Close **to return to the Card View.

   The asset is automatically reprocessed with the newly resolved dependencies.

