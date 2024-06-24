---
title: Customizing error messages for HTML5 forms
description: Learn how to customize the display of error messages for HTML5 forms including how to change their position and appearance.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
feature: "HTML5 Forms,Mobile Forms"
exl-id: c4ae53a3-8de1-4985-a73e-829749de9814
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Customizing error messages for HTML5 forms {#customizing-error-messages-for-html-forms}

In HTML5 forms, out of the box, the error messages, and warnings have a fixed position and appearance (font and color), the error is displayed only for a selected field, and only one error is displayed.

The article provides the steps to customize HTML5 forms error messages so you can do the following:

* change the appearance and position of error messages. You can make an error to appear at the top, bottom, and right of any field.
* display error messages for multiple fields at any given moment.
* display the error irrespective of whether a field is selected or not.

## Customizing Error Messages&nbsp; {#customizing-error-messages-nbsp}

Before customizing the error messages, download and extract the attached package (CustomErrorManager-1.0-SNAPSHOT.zip).

After extracting the package, open the CustomErrorManager-1.0-SNAPSHOT folder. It contains jcr_root and META-INF folders. These folders contain the CSS and .JS files required to customize the error message.

[Get File](assets/customerrormanager-1.0-snapshot.zip)

### Customizing the position of error messages&nbsp; {#customizing-the-position-of-error-messages-nbsp}

To customize the position of the error message, add a &lt;div&gt; tag for each error and warning field, position the &lt;div&gt; tag on the left or right, and apply css styles on the &lt;div&gt; tag. For detailed steps, see the procedure listed below:

1. Navigate to the `CustomErrorManager-1.0-SNAPSHOT`folder and open the `etc\clientlibs\mf-custom-error-manager\CustomErrorManager\javascript` folder.
1. Open the `customErrorManager.js` file for editing. The `markError` function in the file accepts the following parameters:

   |   |  |
   |---|---|
   | jqWidget | jqWidget is the handle for a widget. |
   | msg  |contains the error message |
   | type  |denotes whether it is an error or warning |

1. On the out of the box implementation, error messages appears on the right of the field. To make the error messages appear on the top use the following code.

   ```javascript
   markError: function (jqWidget, msg, type) {
               var element = jqWidget.element,                                //Gives the div containing widget
                   pos = $(element).offset(),                          //Calculates the position of the div in the view port
                                                                   msgHeight = xfalib.view.util.TextMetrics.measureExtent(msg).height + 5;  //Calculating the height of the Error Message
                   styles = {};
                   styles.left = pos.left + "px";         // Assign the desired left position using pos.left. Here it is calculated for exact left of the field
                   styles.top = pos.top - msgHeight + "px";  // Assign the desired top position using pos.top. Here it is calculated for top of the field
               if (type != "warning") {
                   if(!jqWidget.errorDiv){
                                                                                   //Adding the warning div if it is not present already
                       jqWidget.errorDiv=$("<div id='customError'></div>").appendTo('body');
                   }
                   jqWidget.$css(jqWidget.errorDiv.get(0), styles); // Applying the styles to the warning div
                   jqWidget.errorDiv.text(msg).show();                     //Showing the warning message
               } else {
                   if(!jqWidget.errorDiv){
                                                                                   //Adding the error div if it is not present already
                       jqWidget.errorDiv=$("<div id='customWarning'></div>").appendTo('body');
                   }
                   jqWidget.$css(jqWidget.errorDiv.get(0), styles); // Applying the styles to the error div
                   jqWidget.errorDiv.text(msg).show();                     //Showing the warning message
               }

           },

   ```

1. Save and close the file.
1. Navigate to the `CustomErrorManager-1.0-SNAPSHOT` folder and create an archive of jcr_root and META-INF folders. Rename the archive to CustomErrorManager-1.0-SNAPSHOT.zip.
1. Use the Package Manager to upload and install the package.

## Display error messages for multiple fields&nbsp; {#display-error-messages-for-multiple-fields-nbsp}

Ue the attached package to simultaneously display error messages for all the fields. To display a single error message, use the default profile.

### Customizing the appearance of error messages.&nbsp; {#customizing-the-appearance-of-error-messages-nbsp}

1. Navigate to the etc\clientlibs\mf-custom-error-manager\CustomErrorManager\css folder.

1. Open the file sample.css for editing. The css file contains 2 ids- #customError, #customWarning. You can use these ids to change various properties such as color and font size.

   Use the following code to change the font size and color of error/warning messages.

   ```css
   #customError {
   color: #0000FF; // it changes the color of Error Message
   display:none;
   position:absolute;
   opacity:0.85;
   font-size: 24px;  // it changes the font size of Error Message
   z-index:5;
   }

   #customWarning {
   color: #00FF00;  // it changes the color of Warning Message
   display:none;
   position:absolute;
   opacity:0.85;
   font-size: 18px;   // it changes the font size of Warning Message
   z-index:5;
   }

   Save the changes.
   ```

1. Save and close the file.
1. Navigate to the CustomErrorManager-1.0-SNAPSHOT folder and create an archive of jcr_root and META-INF folders. Rename the archive to CustomErrorManager-1.0-SNAPSHOT.zip.
1. Use the Package Manager to upload and install the package.

## Render the form with the new profile.&nbsp; {#render-the-form-with-the-new-profile-nbsp}

Out of the box, html5 forms use a default profile: `https://&lt;server&gt;/content/xfaforms/profiles/default.html?contentRoot=&lt;xdp location&gt;&template=&lt;name of the xdp&gt;`

To view a form with the custom error messages, render the form with error profile: `https://&lt;server&gt;/content/xfaforms/profiles/error.html?contentRoot=&lt;xdp location&gt;&template=&lt;name of the xdp&gt;`

>[!NOTE]
>
>The attached package installs the error profile.
