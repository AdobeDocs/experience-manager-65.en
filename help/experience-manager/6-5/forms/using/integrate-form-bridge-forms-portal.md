---
title: Integrating Form Bridge with custom portal for HTML5 forms
seo-title: Integrating Form Bridge with custom portal for HTML5 forms
description: You can use the FormBridge API to get or set the values of form fields from the HTML page and submit the form.
seo-description: You can use the FormBridge API to get or set the values of form fields from the HTML page and submit the form.
uuid: 3d2f3655-d6cd-4ec3-b764-938fec3c8ad0
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 369beeeb-9aef-4bb5-a186-bc77b92f36ff
index: y
internal: n
snippet: y
---

# Integrating Form Bridge with custom portal for HTML5 forms{#integrating-form-bridge-with-custom-portal-for-html-forms}

FormBridge is a HTML5 forms bridge API that allows you to interact with a form. For the FormBridge API reference, see [FormBridge API reference](/6-5/forms/using/form-bridge-apis.md).

You can use the FormBridge API to get or set the values of form fields from the HTML page and submit the form. For example, you can use API to build a wizard-like experience.

An existing HTML application can leverage the FormBridge API to interact with a form and embed it in the HTML page. You can use following steps to set the value of a field using Form Bridge API.

## Integrating HTML5 forms to a web page {#integrating-html-forms-to-a-web-page}

1. **Choose a Profile or create a Profile  
   **

    1. In the CRX DE interface, navigate to: `http://[server]:[port]/crx/de`.
    1. Log in with administrator credentials.
    1. Create a profile or choose an existing profile.

       For details on how to create a profile, see [Creating a new Profile](/6-5/forms/using/custom-profile.md).

1. **Modify the HTML Profile**

   Include XFA runtime, XFA locale library, and XFA form HTML snippet in the profile renderer, design your web page, and place the form inside the web page.

   For example, use the following code snippet, to create an app with two input fields and a form to demonstrate the interaction between the form and an external app.

   ```xml
   <%@ page session="false"
                  contentType="text/html; charset=utf-8"%><%
   %><%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %><%
   %><!DOCTYPE html>
   <html manifest="${param.offlineSpec}">
       <head>
          <cq:include script="formRuntime.jsp"/>
           <!-- Portal Scripts and Styles -->
          <cq:include script="portalheader.jsp"/> 
       </head>
       <body>
           <div id="leftdiv" >
               <div id="leftdivcontentarea">   
                   <!-- Portal Body -->
                 <cq:include script="portalbody.jsp"/>  
               </div>
           </div>
           <div id="rightdiv">
               <div id="formBody">
               <cq:include script="config.jsp"/>
               <!-- Form body -->
               <cq:include script="formBody.jsp"/>
               <!  --To assist in page transitions -- add navigation, based on scrolling -->
               <cq:include  script="../nav/scroll/nav_footer.jsp"/>
               <cq:include script="footer.jsp"/>
               </div>    
           </div>
       </body>
   </html>
   
   ```

   >[!NOTE]
   >
   >The **line 9**, contains additional JSP reference for CSS styles and JavaScript files to design the page.
   >
   >
   >The &lt;div id="rightdiv"&gt; tag on **line 18** contains the HTML snippet of the XFA form.
   >
   >
   >The page is styled into two containers: **left** and **right**. The right container has the form. The left container has two input fields and part of the external HTML page.
   >
   >
   >The following screen shot shows how the form displays in a browser.

   ![](assets/portal.jpg)

   The left side is part of the **HTML page**. The right side containing the fields is the **xfa form**.

1. **Accessing the form fields from the page**

   The following is a sample script you can add to set values in a form field.

   For example, if you want to set the **EmployeeName **using the values in the Fields **First Name** and **Last Name**, call the **window.formBridge.setFieldValue** function.

   Similarly, you can read the value by calling **window.formBridge.getFieldValue **API.

   ```
   $(function() {
               $(".input").blur(function() {
                   window.formBridge.setFieldValue(
                               'xfa.form.form1.#subform[0].EmployeeName',
                                $("#lname").val()+' '+$("#fname").val()
                              )
                   });
           });
   ```

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="/6-5/forms/using/introduction-widgets.md">Appearance framework for adaptive and HTML5 forms</a>
<a href="/6-5/forms/using/custom-profile.md">Creating custom profiles for HTML5 forms</a>
<a href="../../../6-5/forms/using/custom-widgets.md">Custom Widgets for HTML5 forms</a>
<a href="/6-5/forms/using/form-bridge-apis.md">Form Bridge for HTML5 forms</a>
<a href="../../../6-5/forms/using/integrate-form-bridge-forms-portal.md">Integrating form bridge with forms portal</a>
<a href="/6-5/forms/using/css-styles.md">Changing default styles of HTML5 forms</a>
</related-links>
-->

