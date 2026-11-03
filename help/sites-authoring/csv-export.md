---
title: Export to CSV
description: Export information about your pages to a CSV file on your local system
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: page-authoring
content-type: reference
docset: aem65
exl-id: 18910143-f2f2-4cfe-88b9-651df90d9cb9
solution: Experience Manager, Experience Manager Sites
feature: Authoring
role: User,Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: e2c1b6d3-bb7e-4fe8-8c72-f7b403298e91
    internal-label: Authoring
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Export to CSV{#export-to-csv}

**Create CSV Report** enables you to export information about your pages to a CSV file on your local system.

* The file downloaded is called `export.csv`
* The contents are dependent on the properties you select.
* You can define the path together with the depth of the export.

>[!NOTE]
>
>The download feature and default destination of your browser is used.

The **Create CSV Export** wizard lets you select:

* Properties to export
    * Metadata
        * Name
        * Modified
        * Published
        * Template
        * Workflow
    * Translation
      * Translated
    * Analytics
        * Page Views
        * Unique Visitors
        * Time on Page
* Depth
    * Parent Path
    * Direct children only
    * Additional levels of children
    * Levels

The resulting `export.csv` file can be opened in Excel or any other compatible application.

![etc-01](assets/etc-01.png)

The create **CSV Report** option is available when browsing the **Sites** console (in List view): it is an option of the **Create** drop-down menu:

![etc-02](assets/etc-02.png)

To create a CSV export:

1. Open the **Sites** console, navigate to the required location if necessary.
1. From the toolbar, select **Create** then **CSV Report** to open the wizard:

   ![etc-03](assets/etc-03.png)

1. Select the required properties to export.
1. Select **Create**.
