---
title: PDF generation fails to print a large number of PDFs with WorkBench 
description: When a customer generates a large number of PDFs via services implemented through WorkBench,  the print service fails.
hidefromtoc: yes
---
# PDF generation fails to print a large number of PDFs via WorkBench {#PDF-generation-fails-to-print-a-large-number-of-PDFs-via-WorkBench}

## Issue {#issue}

When a customer generates a large number of PDFs via services implemented through WorkBench. The service fails due to being out of memory. The error shows as:

`ALC-OUT-002-013: XMLFormFactory, PAexecute failure: "0: Out of Memory"`

<!-- Attached is a simplified template (BollatoRiservatiLandscape_table_simple.xdp) that simulates the problem.
Using the Designer, if we associate the template "BollatoRiservatiLandscape_table_semplice.xdp" with the XML file "BollatoRiservati.xml" during the generation of the pdf, the process comes to occupy 1.6 Gb of RAM. On the server side, with the complete template, the pdf generation process breaks down, occupying 2 GB of RAM.-->

This is because the maximum number of pages in a print request is limited to approximately 1000 pages on Windows. When a print output is being generated, the template and data need to be loaded into memory and the resulting layout is built up in memory. This means there are limits to the size of the final output. The process that generates the print output is a 32-bit task which means it is limited to 2 GB of RAM on Windows <!--and 4 GB on UNIX-->.

## Applies to {#applies-to}

The solution applies to AEM Forms <!--JEE Server and AEM Forms on OSGi Server--> for x86_win32 XMLFM.

## Solution {#solution}

The largest factor affecting memory usage is the amount of data on a form. However, other factors are there in a form design that affect memory usage to a lesser degree. When you are aware of these factors, you can design a form for larger print output. The following section indicates, in prioritized order, factors that influence memory footprint:

### Impact Factor {#impact-factor}

**High**

1. **Choice Subforms** - A choice subform set is a variation of the subform set object that allows you to customize the display of specific subforms from within the set through the use of conditional statements.
1. **Use static text in place of captions** - Almost every field provides a caption within, user should use that instead of having an additional static text as a caption.
1. Use **Rich text format (RTF)** wherever possible.

**Average**

Additional factors one should consider while designing form template to help improve the memory usage:

1. Avoid using Static Text to label a field. Instead, use captions in the Text Field.
2. Don't overuse Rectangles, Line Objects and Tables.
3. Avoid using RichText and Choice Subforms if possible.
4. Avoid excessive use of Subforms and nested Subforms.

### Data size Limitation {#data-size-limitations}

As we are limited by the max process memory and the memory consumed by the process does not only depend on the size of the data file. It is very closely linked to the form design, and to some extent, to the actual amount of data being merged in the form. 

If the form has many small nodes with small data, the process will consume more memory (and hence go out of memory faster), than a form that has less no of nodes (even) with big data.

Read the **updated sapnote_0001033661** note for more information, where test results are based on Print form (Non-Tagged PDF). Using tagged PDF Process memory requirement increases. It also depends on the number of fields in the form - roughly the process memory requirement would be slightly more than 1.5 times of non-tagged PDF.

### Interactive Forms {#interactive-forms}

Interactive forms would consume more memory than Print Forms as interactive fields are rendered again. In the tests carried out, the memory consumption increased by a factor of 1.5 approximately as compared to print forms and these were static interactive forms.

### Image formats {#image-formats}

Adobe does not recommend any specific image format. But it would be nice to have a smaller size of image e.g. PNG (Portable Network Graphics). It is also not advisable to use images of very high resolutions whose sizes vary several hundreds of MegaBytes. Also, it is not advisable to use compressed images whose size upon decompression expands to several hundreds of Megabytes of data.