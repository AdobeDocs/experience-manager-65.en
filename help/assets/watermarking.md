---
title: Add watermark to your digital assets
description: Learn how to use the Watermarking feature to add a digital watermark to assets.
contentOwner: AG
role: User, Admin
feature: Asset Management
exl-id: bc0cfb0e-3f70-4377-8831-326a7cae73bd
hide: yes
---
# Watermark your digital assets {#watermarking}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets/manage/watermark-assets.html?lang=en)                  |
| AEM 6.5     | This article         |

[!DNL Adobe Experience Manager Assets] allows you to add a digital watermark to assets that helps users verify the authenticity and copyright ownership of the assets. [!DNL Experience Manager Assets] supports text to be used as a watermark on PNG and JPEG files.

To be able to apply watermark on assets, add the watermarking step in the [!UICONTROL DAM Update Asset] workflow.

1. Access the [!DNL Experience Manager] user interface, and go to **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]**.
1. From the **[!UICONTROL Workflow Models]** page, select the **[!UICONTROL DAM Update Asset]** workflow and click **[!UICONTROL Edit]**.

1. From the side panel, drag the **[!UICONTROL Add Watermark]** step to the [!UICONTROL DAM Update Asset] workflow.

   ![Drag the [!UICONTROL Add Watermark] step and add to the [!UICONTROL DAM Update Asset] workflow](assets/add_watermark_step_aem_assets.png)

   *Figure: Drag the [!UICONTROL Add Watermark] step and add to the [!UICONTROL DAM Update Asset] workflow.*

   >[!NOTE]
   >
   >Place the [!UICONTROL Add Watermark] step anywhere before the [!UICONTROL Process Thumbnail] step.

1. Open the **[!UICONTROL Add Watermark]** step to display its properties.
1. In the **[!UICONTROL Arguments]** tab, specify valid values in the various fields, including text, font type, size, color, position, orientation, and so on. To confirm the changes, click **[!UICONTROL Done]**.

   ![Provide the arguments in the add watermark step in [!DNL Assets]](assets/arguments_add_watermark_aem_assets.png)

   *Figure: Provide the arguments in the add watermark step in [!DNL Assets].*

1. Save the **[!UICONTROL DAM Update Asset]** workflow with the watermark step.
1. From the [!DNL Assets] user interface, upload a sample asset. The watermark appears with the font size, color and so on, at the position you configured in the above steps.

To watermark PDF documents programmatically or with dynamic information, consider using [Experience Manager Document Services](/help/forms/using/overview-aem-document-services.md) offering.

## Tips and limitations {#tips-limitations}

* Only text-based watermarks are supported. Images are not used as watermarks, even though you can upload images when creating the [!UICONTROL Add Watermark Process].
* Only PNG and JPEG files are supported to be watermarked. Other asset formats are not watermarked.
