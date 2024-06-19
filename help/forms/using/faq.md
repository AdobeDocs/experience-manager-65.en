---
title: Frequently asked questions (FAQ) for HTML5 forms

description: Frequently Asked Questions (FAQ) about layout, scripting support, and scope of HTML5 forms.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms

docset: aem65
feature: HTML5 Forms
exl-id: 85c9315e-1bc8-44a9-937e-af6fc7cf54d1
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---

# Frequently asked questions (FAQ) for HTML5 forms{#frequently-asked-questions-faq-for-html-forms}

There are some frequently asked questions (FAQ) about layout, scripting support, and scope of HTML5 forms.

## Layout {#layout}

1. Why do barcodes and signature field in not appear in my form?

   Answer: Barcodes and signatures fields are not relevant in HTML or mobile scenarios. These fields appear as a non-interactive area. However, AEM Forms Designer provides a new signature scribble field that can be used instead of signature field. One can also add a [custom widget](../../forms/using/custom-widgets.md) for barcodes and integrate it.

1. Is Rich Text supported for the XFA Text Field?

   Answer: The XFA field, which allows rich content in AEM Forms Designer, is not supported and is rendered as normal text without support for styling the text from the user interface. Also, XFA fields with comb property are displayed as a normal field, though there are still restrictions on number of allowed characters based on the value of comb digits.

1. Are there any limitations regarding using repeatable Subforms?

   Answer: Repeatable Subforms should have an initial count of 1 or more. Repeatable Subforms with an initial count of zero are not supported. You can also choose to use a repeatable Subform and not display it when the form is loaded. To achieve the use case:

    1. Set initial count of the repeatable Subform to 1.

       ![intial-count](assets/intial-count.png)

    1. Use initialize event of the form to hide primary instance of the Subform. For example, the code below hides the primary instance of the Subform on form initialization. It also verifies the app type to ensure that the script is executed only on the client side:

       ```javascript
       if ((xfa.host.appType == "HTML 5" || xfa.host.appType == "Exchange-Pro" || xfa.host.appType == "Reader")&&(_RepeatSubform.count == 1)&&(form1.Page1.Subform1.RepeatSubform.Key.rawValue == null)) {
       RepeatSubform.presence = "hidden";
       }
       ```

    1. Open the script for adding an instance of the Subform for editing. Add the code like the below to add an instance of the Subform script.

       The code below checks the hidden instance of the Subform. If the hidden instance of the Subform is found, delete the hidden instance of the subform and insert a fresh instance of the Subform. If the hidden instance of the Subform is not found, then simply insert a fresh instance of the Subform.

       ```javascript
       if (RepeatSubform.presence == "hidden")
       {
       RepeatSubform.instanceManager.insertInstance(0);
       RepeatSubform.instanceManager.removeInstance(1);
       }
       else
       {
       RepeatSubform.instanceManager.addInstance(1);
       }
       ```

    1. Open the script for removing an instance of the Subform for editing. Add the code like the following to removing an instance of the Subform script.

       The code checks count of the Subforms. If the count of the Subform reached 1, the code hides the subform instead of deleting the Subform.

       ```javascript
       if (RepeatSubform.instanceManager.count == 1) {
       RepeatSubform.presence = "hidden";
       } else {
       RepeatSubform.instanceManager.removeInstance(RepeatSubform.instanceManager.count - 1);
       }
       ```

    1. Open the presubmit event of form for editing. Add the following script to the event to remove the hidden instance of the script before editing. It prevents sending data of the hidden Subform on submission.

       ```javascript
       if(RepeatSubform.instanceManager.count == 1 && RepeatSubform.presence == "hidden") {
       RepeatSubform.instanceManager.removeInstance(0);
       }
       ```

1. Are there any limitations regarding using hidden subforms?

   Answer: A hidden subform with complex hierarchy that is split across pages causes layout issues. A workaround is to mark the subform initially visible and then hide it in an initialize script based on some logic or data.

1. Why some text are truncated or are displayed incorrectly in HTML5?

   Answer: Where a Draw or Caption text element has not been given enough space to display content, the text appear truncated in mobile form rendition. This truncation is also visible in the Design view of AEM Forms Designer. Though this truncation can be handled in the PDFs, it cannot be handled in the HTML5 forms. To avoid the issue, provide enough space to Draw or Caption Text so that it does not truncate in the design mode of the AEM Forms Designer.

1. I am observing layout issues related to missing content or overlapping content. What is the reason?

   Answer: If there is a Draw Text or a Draw Image element along with another overlapping element at the same position (say a Rectangle), the Draw Text content are not visible if it comes later in the document order (in AEM Forms Designer Hierarchy view). PDF supports transparent layering but HTML/browsers do not support transparent layering.

1. Why are some fonts displayed in the HTML form different from the ones used while designing the form?

   Answer: HTML5 Forms do not allow embedding fonts (in contrast to PDF forms where fonts are embedded inside the form). For the HTML version of a form to render as expected, ensure that the fonts are available in the CRX Repository (AEM Content Repository) of your AEM Forms server and on the machine that has AEM Designer installed. When the fonts are not available in the CRX Repository of your AEM Forms server or at the location where AEM Designer is installed, the form is rendered with fallback fonts. 
   
1. Are vAlign and hAlign attributes supported in HTML forms?

   Answer: Yes, the vAlign and hAlign attributes are supported. The vAlign attribute is not supported in Internet Explorer and in multiline field.

1. Do HTML5 forms support Hebrew characters?

   Answer: HTML5 forms support Hebrew characters in all the browsers except Microsoft Internet Explorer.

1. Do HTML5 forms have any limitations on numeric field?

   Answer: Yes, HTML5 forms has a few limitations. If the number of digits are more than the count specified in the picture clause, then the numbers are not localized and are displayed in English locale.

1. Why HTML forms are larger in size than PDF forms?

   Answer: Numerous intermediate data structures and objects such as form dom, data dom, and layout dom are required to render an XDP to an HTML form.

   For PDF Forms, Adobe Acrobat has a built-in XTG engine to create intermediate data structures, and objects. Acrobat also takes care of layout and scripts.

   For HTML5 forms, browsers do not have a built-in XTG engine to create intermediate data structures, and objects from raw XDP bytes. So, for HTML5 forms, intermediate structures are generated on the server and sent to the client. At client,JavaScript based script and layout engine use these intermediate structures.

   The size of the intermediate structure depends on the size of the original XDP and the data merged with the XDP.

1. Are there any limitations regarding using tables in my xdp?

   Answer: Complex Tables cause issues in rendering.

    * Section (SubformSet) inside a table are not supported.
    * Header or footer rows in some tables are marked for repetition. Splitting such tables across multiple pages can run into some issues.

1. Do accessible tables have any limitations?

   Answer: Yes, accessible tables have the following limitations:

    * Nested tables and subform inside a table are not supported.
    * Headers are only supported for the top row or left columns of the table. Headers are not supported for mid-table elements. You can apply headers to multiple row and column headers are supported provided all such rows and columns are along with the topmost row or leftmost column of the table.
    * `Rowspan`and `colspan`from a random location inside the table is not supported.

    * You cannot dynamically add or remove instance of rows which contain elements with rowspan value greater than 1.

1. What is the reading order of tool tip and caption for screen readers?

   Answer: 
   * When both caption and tool tip are present, the only caption is read. If the caption is not available, then the tool tip is read. You can also specify the precedence for reading in an XDP using form designer
    * When you hover an element, then tool tip is displayed. If tool-tip is not available speech text is displayed. If speech text is not available, then field name is displayed.

1. When you hover a field, a tool tip is displayed. How to disable it?

   Answer: To disable tool tip on hover, select none in the accessibility panel of the Designer.

1. In Designer, a user can configure custom appearance properties of radio button and check boxes. Do, while rendering the forms, HTML5 forms take such custom appearance properties into account?

   Answer: HTML5 forms ignore the custom appearance properties of radio button and check boxes. The radio buttons and check boxes appear as per the specifications of the underlying browser.

1. When an HTML5 Form is opened in a supported browser, the border of the fields placed adjacently is not aligned properly or subforms appear overlapped. When the same HTML5 Form is previewed in Forms Designer, the fields and layout do not appear misaligned and subforms appear in the correct position. How to fix the issue?

   Answer: When a subform is set to flow content and the subform has a hidden border element, the border of the fields placed adjacently is not aligned properly or subforms appear overlapped. To resolve the issue, you can remove or comment the hidden &lt;border&gt; elements from the corresponding XDP. For example, the following &lt;border&gt; element is marked as a comment:

   ```xml
               <!--<border>
                  <edge presence="hidden"/>
                  <corner thickness="0.175mm" presence="hidden"/>
               </border> -->
   ```

1. Why screen readers do not work correctly with the Date/Time field object?

   Answer: Screen readers do not support date/time fields. However, you can manually enter date/time to the field to make the screen reader read it. Use tool-tip or screen-reader text to instruct the user to manually select date/time for the field.

1. Do HTML5 forms support display patterns for floating fields?

   Answer: HTML5 forms do not support display patterns for floating fields.

1. What is the format of the Date field in HTML5 Forms?
  Answer: The Date field accepts the ISO format, YYYY-MM-DD. If you specify a date in some other format, the Date Field does not accept the formatting until the user tabs out of the field.

### Scripting {#scripting}

1. Are there any limitations in JavaScript implementation for HTML Forms?

   Answer:

    * There is limited support for xfa.connectionSet script. For connectionSet, only server-side invocation of web service is supported. For detailed information, see [Scripting Support](/help/forms/using/scripting-support.md).
    * There is no support for $record and $data in client side scripts. However, if the scripts are written in a formReady, layoutReady block, the scripts still work because these events run on the server side.
    * XFA Draw element-specific scripts such as changing the Draw text (or Caption text if there are fields) are not supported.

1. Are there any limitations in using formCalc?

   Answer: Only a subset of the formCalc scripts is currently implemented. For detailed information, see [Scripting Support](/help/forms/using/scripting-support.md).

1. Is there any recommended naming convention and are there any reserved keywords to avoid?

   Answer:
    * In AEM Forms Designer, it is recommended not to begin the name of an object (such as a subform or a text field) with an underscore (_). To use underscore at the beginning of the name, add a prefix after the underscore,_&lt;prefix&gt;&lt;objectname&gt;.
    * All HTML5 forms APIs are reserved keywords. For custom APIs/functions, use a name that is not identical to [HTML5 forms APIs](/help/forms/using/scripting-support.md).

1. Do HTML5 forms support floating fields?

   Answer: Yes, HTML5 Forms support floating fields. To enable floating fields, add the following property to the rendering profile:

   >[!NOTE]
   >
   >By default, the fields are not enabled for floating. You can use Forms Designer to set the floating property of the fields..

    1. Open CRXde lite and navigate to the `/content/xfaforms/profiles/default` node.
    1. Add a property `mfDataDependentFloatingField`of type String and set the value of the property to `true`.
    1. Click **Save All**. Now the floating fields are enabled for the HTML Forms using the updated rendering profile.

       >[!NOTE]
       >
       >To enable floating fields for a specific form without updating the rendering profile, pass the mfDataDependentFloatingField=true property as a URL parameter.

1. Does HTML5 forms execute the initialization script and form ready event multiple times?

   Answer: Yes, the initialization scripts and form ready events are executed multiple times, at least once on the server and once on the client side. It is suggested to write scripts like initialize or form:ready events based on some business logic (form or field data) so that the action is performed based on the state of data and idempotent (if data is same).

### Designing XDP {#designing-xdp}

1. Are there any reserved keywords in HTML5 forms?

   Answer: All HTML5 forms APIs are reserved keywords. For custom APIs/functions, use a name that is not identical to [HTML5 forms APIs](/help/forms/using/scripting-support.md). Apart from reserved keywords, if you use object names that begin with an underscore (_), it is recommended to add a unique prefix after the underscore. Adding a prefix helps avoid any possible conflict with HTML5 forms internal APIs. For example, `_fpField1`
