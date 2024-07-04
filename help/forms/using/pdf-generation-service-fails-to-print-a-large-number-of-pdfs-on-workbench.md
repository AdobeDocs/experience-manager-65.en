---
title: PDF generation fails to print a large number of PDFs with WorkBench
description: When a customer generates a large number of PDFs via services implemented through WorkBench,  the print service fails.
exl-id: f3746b8e-4c38-447a-b5bf-d11fc77556f7
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Services
role: User, Developer
---
# PDF generation fails to print a large number of PDFs via WorkBench {#PDF-generation-fails-to-print-a-large-number-of-PDFs-via-WorkBench}

## Issue {#issue}

When a customer generates a large number of PDFs via services implemented through WorkBench. The service fails due to being out of memory. The error shows as:

`ALC-OUT-002-013: XMLFormFactory, PAexecute failure: "0: Out of Memory"`

<!-- Attached is a simplified template (BollatoRiservatiLandscape_table_simple.xdp) that simulates the problem.
Using the Designer, if we associate the template "BollatoRiservatiLandscape_table_semplice.xdp" with the XML file "BollatoRiservati.xml" during the generation of the pdf, the process comes to occupy 1.6 Gb of RAM. On the server side, with the complete template, the pdf generation process breaks down, occupying 2 GB of RAM.-->

This is because the maximum number of pages in a print request is limited to approximately 1000 pages on Windows. When a print output is being generated, the template and data need to be loaded into memory and the resulting layout is built up in memory. This means that there are limits to the size of the final output. The process that generates the print output is a 32-bit task which means it is limited to 2 GB of RAM on Windows <!--and 4 GB on UNIX-->.

## Applies to {#applies-to}

The solution applies to AEM Forms <!--JEE Server and AEM Forms on OSGi Server--> for x86_win32 XMLFM.

## Solution {#solution}

The largest factor affecting memory usage is the amount of data on a form. However, other factors are there in a form design that affect memory usage to a lesser degree. When you are aware of these factors, you can design a form for larger print output. The following section indicates, in prioritized order, factors that influence memory footprint:

### Impact Factor {#impact-factor}

**High**

1. **Choice Subforms** - A choice subform set is a variation of the subform set object that allows you to customize the display of specific subforms from within the set by using conditional statements.
1. **Use static text in place of captions** - Almost every field provides a caption within, user should use that instead of having an additional static text as a caption.
1. Use **Rich text format (RTF)** wherever possible.

**Average**

Additional factors one should consider while designing form template to help improve the memory usage:

1. Avoid using Static Text to label a field. Instead, use captions in the Text Field.
2. Do not overuse Rectangles, Lines, Objects, and Tables.
3. Avoid using RichText and Choice Subforms if possible.
4. Avoid excessive use of Subforms and nested Subforms.

### Data size Limitation {#data-size-limitations}

As we are limited by the max process memory and the memory consumed by the process does not only depend on the size of the data file. It is very closely linked to the form design, and to some extent, to the actual amount of data being merged in the form.

If the form has many small nodes with small data, the process consumes more memory (and hence go out of memory faster), than a form that has less number of nodes (even) with large data.

Read the [Appendix below](#appendix) for more information, where test results are based on Print form (Non-Tagged PDF). Using tagged PDF process memory requirement increases. It also depends on the number of fields in the form - roughly the process memory requirement would be slightly more than 1.5 times of non-tagged PDF.

### Interactive Forms {#interactive-forms}

Interactive forms would consume more memory than Print Forms as interactive fields are rendered again. In the tests carried out, the memory consumption increased by a factor of 1.5 approximately as compared to print forms and these were static interactive forms.

### Image formats {#image-formats}

Adobe does not recommend any specific image format. But it would be nice to have a smaller size of image, e.g.,  PNG (Portable Network Graphics). It is also not advisable to use images of high resolutions whose sizes vary several hundreds of MegaBytes. Also, it is not advisable to use compressed images whose size upon decompression expands to several hundreds of Megabytes of data.

### Appendix {#appendix}

**Table Examples**

Different variants for tables are shown below that show rendering number of pages versus data size for simple table and complex table.

1. A Table with a single column where 5000 pages of PDFs are generated, data file size 24 MB and 30-K records.

    ![table_single_column](/help/forms/using/assets/table_single_column.png)

1. A table with many small columns where 800 pages of PDFs are generated, data file size is 4.6 MB and 20-K records.
    ![table_many_small_columns](/help/forms/using/assets/table_many_small_columns.png)
    
1. A table with many small columns, but bigger data file because of usage of bigger xmlTag names.
Here, everything is same as the previous, but xml tag names have been made large (so that data file size will increase without any increase in the actual effective data), the end result (upper limit) is almost the same. Though the data file size increased from 4.6 MB to 44.6 MB. Here 800 pages of PDFs are generated, data file size is 44.6 MB and 20-K records.

    ![table_bigger_xml_tagname](/help/forms/using/assets/table_bigger_xml_tagname.png)

So, it is difficult to put a general upper limit on the data file size. Each form is unique, and hence the memory consumption would differ from form to form.
