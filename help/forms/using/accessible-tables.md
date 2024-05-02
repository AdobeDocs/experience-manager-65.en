---
title: Create accessible complex tables in HTML5 forms

description: Learn how to create accessible tables in HTML5 forms.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 3504afe1-abf5-4fbf-a0d2-e093361764bd
feature: HTML5 Forms
exl-id: 3b8e3323-9ac4-4f5c-8c52-e2186e9169ea
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
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
