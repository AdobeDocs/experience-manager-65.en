---
title: Create accessible complex tables in HTML5 forms
description: Learn how to create accessible tables in HTML5 forms.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 3504afe1-abf5-4fbf-a0d2-e093361764bd
feature: HTML5 Forms,Mobile Forms
exl-id: 3b8e3323-9ac4-4f5c-8c52-e2186e9169ea
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
# Create accessible complex tables in HTML5 forms {#create-accessible-complex-tables-in-html-forms}

The default implementation of tables in HTML5 Forms uses HTML DIV elements to render a table. Rendering involves using ARIA roles to satisfy the accessibility requirements.

To avoid accessibility issues with screen-readers which do not fully support the ARIA-roles used with data-tables, HTML5 Forms provides an alternate rendition for the tables. These tables are based on the new table format introduced in Designer which also supports:

* Row Headers
* Row-span

To use the new format in HTML5 Forms, mark the table as complex. To mark the table as complex, add `extras` tag in the XML source of table subform as follows:

```xml
</extras>
 <text name="complexTable">1</text>
 </extras>
```

The tables which are marked as *complexTable* follow the native HTML rendition, and provide better accessibility support for certain screen readers.  To create a row span, select consecutive cells of a table in the same column, right-click the selection, and then click **[!UICONTROL Merge Cells]**.

>[!NOTE]
>
>Creating a row-span works for leftmost cells only.

To mark a row as row header, select all cells in the row, right-click the selection, and then click **[!UICONTROL Mark Header]**.

To mark a cell as column header, select any cell in the column, right-click the selection, and then click **[!UICONTROL Mark Header]**.

Limitations in new *AccessibleTable* format:

* Lack of support for grow-able fields if rowspan is used in the table
* No support for nested tables (tables within table cells)
* Support for rowspan is limited to the header rows and header cells
* Support is limited to regular tables
* No support for data prefills in tables with rowspan &gt; 1
