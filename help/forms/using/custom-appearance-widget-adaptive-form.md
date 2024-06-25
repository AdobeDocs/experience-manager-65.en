---
title: Create custom appearances for adaptive form fields
description: Customize appearance of out-of-the-box components in Adaptive Forms.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 770e257a-9ffd-46a4-9703-ff017ce9caed
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms,Foundation Components
---
# Create custom appearances for adaptive form fields{#create-custom-appearances-for-adaptive-form-fields}

## Introduction {#introduction}

Adaptive forms uses the [appearance framework](/help/forms/using/introduction-widgets.md) to help you create custom appearances for adaptive form fields and provide a different user experience. For example, replace radio buttons and check boxes with toggle buttons or use custom jQuery plugins to restrict users inputs in fields like phone numbers or email ID.

This document explains how to use a jQuery plugin to create these alternate experiences for adaptive form fields. In addition, it showcases an example to create a custom appearance for numeric field component to appear as a numeric stepper or slider.

Let's first look at the key terms and concepts used in this article.

**Appearance** Refers to the style, look and feel, and organization of various elements of an adaptive form field. It usually includes a label, an interactive area to provide inputs, a help icon, and short and long descriptions of the field. The customization of appearance discussed in this article is applicable for the appearance of the input area of the field.

**jQuery plugin** Provides a standard mechanism, based on the jQuery widget framework, to implement an alternate appearance.

**ClientLib** A client-side libraries system in AEM client-side processing driven by complex JavaScript and CSS code. For more information, see Using Client-Side Libraries.

**Archetype** A Maven project templating toolkit defined as an original pattern or model for Maven projects. For more information, see Introduction to Archetypes.

**User Control** Refers to the main element in a widget that contains the value of the field, and is used by the appearance framework for binding the custom widget UI with the adaptive form model.

## Steps to create a custom appearance {#steps-to-create-a-custom-appearance}

The steps, at a high level, to create a custom appearance are as follows:

1. **Create a project**: Create a Maven project that generates a content package to deploy on AEM.
1. **Extend an existing widget class**: Extend an existing widget class and override the required classes.
1. **Create a client library**: Create a `clientLib: af.customwidget` library and add the required JavaScript and CSS files.

1. **Build and install the project**: Build the Maven project and install the generated content package on AEM.
1. **Update the adaptive form**: Update adaptive form field properties to use the custom appearance.

### Create a project {#create-a-project}

A maven archetype is a starting point for creating a custom appearance. The details of the archetype to be used are as follows:

* **Repository**: https://repo1.maven.org/maven2/com/adobe/
* **Artifact Id**: custom-appearance-archetype
* **Group Id**: com.adobe.aemforms
* **Version**: 1.0.4

Execute the following command to create a local project based on the archetype:

`mvn archetype:generate -DarchetypeRepository=https://repo1.maven.org/maven2/com/adobe/ -DarchetypeGroupId=com.adobe.aemforms -DarchetypeArtifactId=custom-appearance-archetype -DarchetypeVersion=1.0.4`

The command downloads the Maven plugins and archetype information from the repository, and generates a project based on the following information:

* **groupId**: Group ID used by the generated Maven project
* **artifactId**: Artifact ID used by the generated Maven project.
* **version**: Version for the generated Maven project.
* **package**: Package used for the file structure.
* **artifactName**: Artifact name of the generated AEM package.
* **packageGroup**: Package group of the generated AEM package.
* **widgetName**: Appearance name used for reference.

The generated project has the following structure:

```java
─<artifactId>

 └───src

     └───main

         └───content

             └───jcr_root

                 └───etc

                     └───clientlibs

                         └───custom

                             └───<widgetName>

                                 ├───common [client library - af.customwidgets which encapsulates below clientLibs]

                                 ├───integration [client library - af.customwidgets.<widgetName>_widget which contains template files for integrating a third-party plugin with Adaptive Forms]

                                 │   ├───css

                                 │   └───javascript

                                 └───jqueryplugin [client library - af.customwidgets.<widgetName>_plugin which holds the third-party plugins and related dependencies]

                                     ├───css

                                     └───javascript
```

### Extend an existing widget class {#extend-an-existing-widget-class}

Once the project template is created, do the following changes, as required:

1. Include the third-party plugin dependency to the project.

    1. Place the third-party or custom jQuery plugins in the `jqueryplugin/javascript` folder and related CSS files in the `jqueryplugin/css` folder. For more details, see the JS and CSS files under the `jqueryplugin/javascript and jqueryplugin/css` folder.

    1. Modify the `js.txt` and `css.txt` files to include any additional JavaScript and CSS file of the jQuery plugin.

1. Integrate the third-party plugin with the framework to enable interaction between the custom appearance framework and the jQuery plugin. The new widget will be functional only after you extend or override the following functions.

<table>
 <tbody>
  <tr>
   <td><strong>Function</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td><code>render</code></td>
   <td>The render function returns the jQuery object for the default HTML element of the widget. The default HTML element should be of focusable type. For example, <code>&lt;a&gt;</code>, <code>&lt;input&gt;</code>, and <code>&lt;li&gt;</code>. The returned element is used as <code>$userControl</code>. If the <code>$userControl</code> specifies the above constraint, the functions of the <code>AbstractWidget</code> class work as expected, else some of the common APIs (focus, click) require changes. </td>
  </tr>
  <tr>
   <td><code>getEventMap</code></td>
   <td>Returns a map to convert HTML events to XFA events. <br /> <code class="code">{
      blur: XFA_EXIT_EVENT,
      }</code><br /> This example shows that <code>blur</code> is an HTML event and <code>XFA_EXIT_EVENT</code> is the corresponding XFA event. </td>
  </tr>
  <tr>
   <td><code>getOptionsMap</code></td>
   <td>Returns a map that provides detail about the action to perform on the change of an option. The keys are the options that are provided to the widget and the values are functions that are called whenever a change in the option is detected. The widget provides handlers for all the common options (except <code>value</code> and <code>displayValue</code>).</td>
  </tr>
  <tr>
   <td><code>getCommitValue</code></td>
   <td>The jQuery widget framework loads the function whenever the value of the jQuery widget is saved in the XFA model (for example, on exit event of a text field). The implementation should return the value saved in the widget. The handler is provided with the new value for the option.</td>
  </tr>
  <tr>
   <td><code>showValue</code></td>
   <td>By default, in XFA on enter event, the <code>rawValue</code> of the field is displayed. This function is called to show the <code>rawValue</code> to the user. </td>
  </tr>
  <tr>
   <td><code>showDisplayValue</code></td>
   <td>By default, in XFA on exit event, the <code>formattedValue</code> of the field is displayed. This function is called to show the <code>formattedValue</code> to the user. </td>
  </tr>
 </tbody>
</table>

1. Update the JavaScript file in the `integration/javascript` folder, as required.

    * Replace the text `__widgetName__` with the actual widget name.
    * Extend the widget from a suitable out-of-the-box widget class. In most cases, It is the widget class corresponding to the existing widget being replaced. The parent class name is used at multiple locations, so it is recommended to search for all instances of the string `xfaWidget.textField` in the file, and replace them with the actual parent class used.
    * Extend the `render` method to provide an alternate UI. It is the location from where the jQuery plugin will be invoked to update the UI or the interaction behavior. The `render` method should return a user-control element.

    * Extend the `getOptionsMap` method to override any option setting impacted due to a change in the widget. The function returns a mapping that provides details for the action to perform on change of an option. The keys are the options provided to the widget and the values are the functions called whenever a change in the option is detected.
    * The `getEventMap` method maps events triggered by the widget, with the events required by the adaptive form model. The default value maps standard HTML events for the default widget, and needs to be updated if an alternate event is triggered.
    * The `showDisplayValue` and `showValue` apply the display and edit picture clause and can be overridden to have an alternate behavior.

    * The `getCommitValue` method is called by the adaptive forms framework when the `commit`event occurs. Generally, it is the exit event, except for the dropdown, radio button, and check box elements where it occurs on change). For more information, see [Adaptive Forms Expressions](../../forms/using/adaptive-form-expressions.md#p-value-commit-script-p).

    * The template file provides sample implementation for various methods. Remove methods that are not to be extended.

### Create a client library {#create-a-client-library}

The sample project generated by the Maven archetype automatically creates required client libraries, and wraps them into a client library with a category `af.customwidgets`. The JavaScript and CSS files available in the `af.customwidgets` are automatically included at runtime.

### Build and install {#build-and-install}

To build the project, execute the following command on the shell to generate a CRX package that needs to be installed on the AEM server.

`mvn clean install`

>[!NOTE]
>
>The maven project refers to a remote repository inside the POM file. This is only for reference purposes, and according to Maven standards, the repository information is captured in the `settings.xml` file.

### Update the adaptive form {#update-the-adaptive-form}

To apply the custom appearance to an adaptive form field:

1. Open the adaptive form in edit mode.
1. Open the **Property** dialog for the field on which you want to apply the custom appearance.
1. In the **Styling** tab, update the `CSS class` property to add the appearance name in the `widget_<widgetName>` format. For example: **widget_numericstepper**

## Sample: Create a custom appearance &nbsp; {#sample-create-a-custom-appearance-nbsp}

Let's now look at an example to create a custom appearance for a numeric field to appear as a numeric stepper or slider. Perform the following steps:

1. Execute the following command to create a local project based on Maven archetype:

   `mvn archetype:generate -DarchetypeRepository=https://repo1.maven.org/maven2/com/adobe/ -DarchetypeGroupId=com.adobe.aemforms -DarchetypeArtifactId=custom-appearance-archetype -DarchetypeVersion=1.0.4`

   It prompts you to specify values for the following parameters.
   *The values used in this sample are highlighted in bold*.

   `Define value for property 'groupId': com.adobe.afwidgets`

   `Define value for property 'artifactId': customWidgets`

   `Define value for property 'version': 1.0.1-SNAPSHOT`

   `Define value for property 'package': com.adobe.afwidgets`

   `Define value for property 'artifactName': customWidgets`

   `Define value for property 'packageGroup': adobe/customWidgets`

   `Define value for property 'widgetName': numericStepper`

1. Navigate to the `customWidgets` (specified value for the `artifactID` property) directory and execute the following command to generate an Eclipse project:

   `mvn eclipse:eclipse`

1. Open the Eclipse tool and do the following to import the Eclipse project:

    1. Select **[!UICONTROL File > Import > Existing Projects into Workspace]**.

    1. Browse and select the folder where you executed the `archetype:generate` command.

    1. Click **[!UICONTROL Finish]**.

       ![eclipse-screenshot](assets/eclipse-screenshot.png)

1. Select the widget to be used for the custom appearance. This sample uses the following numeric stepper widget:

   [https://www.jqueryscript.net/form/User-Friendly-Number-Input-Spinner-with-jQuery-Bootstrap.html](https://www.jqueryscript.net/form/User-Friendly-Number-Input-Spinner-with-jQuery-Bootstrap.html)

   In the Eclipse project, review the plug-in code in the `plugin.js` file to ensure that it matches the requirements for the appearance. In this sample, the appearance fulfills the following requirements:

    * The numeric stepper should extend from `- $.xfaWidget.numericInput`.
    * The `set value` method of the widget sets the value after the focus is on the field. It is a mandatory requirement for an adaptive form widget.
    * The `render` method needs to be overridden to invoke the `bootstrapNumber` method.

    * There is no additional dependency for the plugin other than the main source code of the plugin.
    * The sample does not perform any styling on the stepper, so no additional CSS is required.
    * The `$userControl` object should be available to the `render` method. It is a field of the `text` type which is cloned with the plugin code.

    * The **+** and **-** buttons should be disabled when the field is disabled.

1. Replace the contents of the `bootstrap-number-input.js` (jQuery plugin) with the content of the `numericStepper-plugin.js` file.
1. In the `numericStepper-widget.js` file, add the following code to override the render method to invoke the plugin and return the `$userControl` object:

   ```javascript
   render : function() {
        var control = $.xfaWidget.numericInput.prototype.render.apply(this, arguments);
        var $control = $(control);
        var controlObject;
        try{
            if($control){
            $control.bootstrapNumber();
            var id = $control.attr("id");
            controlObject = $("#"+id);
            }
        }catch (exc){
             console.log(exc);
        }
        return controlObject;
   }
   ```

1. In the `numericStepper-widget.js` file, override the `getOptionsMap` property to override the access option, and hide the + and - buttons in disabled mode.

   ```javascript
   getOptionsMap: function(){
       var parentOptionsMap = $.xfaWidget.numericInput.prototype.getOptionsMap.apply(this,arguments),

       newMap = $.extend({},parentOptionsMap,

        {

              "access": function(val) {
              switch(val) {
                 case "open" :
                   this.$userControl.removeAttr("readOnly");
                   this.$userControl.removeAttr("aria-readonly");
                   this.$userControl.removeAttr("disabled");
                   this.$userControl.removeAttr("aria-disabled");
                   this.$userControl.parent().find(".input-group-btn button").prop('disabled',false);
                   break;
                 case "nonInteractive" :
                 case "protected" :
                   this.$userControl.attr("disabled", "disabled");
                   this.$userControl.attr("aria-disabled", "true");
                   this.$userControl.parent().find(".input-group-btn button").prop('disabled',true);
                   break;
                case "readOnly" :
                   this.$userControl.attr("readOnly", "readOnly");
                   this.$userControl.attr("aria-readonly", "true");
                   this.$userControl.parent().find(".input-group-btn button").prop('disabled',true);
                   break;
               default :
                   this.$userControl.removeAttr("disabled");
                   this.$userControl.removeAttr("aria-disabled");
                   this.$userControl.parent().find(".input-group-btn button").prop('disabled',false);
                   break;
             }
          },
      });
      return newMap;
    }
   ```

1. Save the changes, navigate to the folder containing the `pom.xml` file, and execute the following Maven command to build the project:

   `mvn clean install`

1. Install the package using AEM Package Manager.

1. Open the adaptive form in edit mode on which you want to apply the custom appearance and do the following:

    1. Right-click the field on which you want to apply the appearance and click **[!UICONTROL Edit]** to open the Edit Component dialog.

    1. In the Styling tab, update the **[!UICONTROL CSS class]** property to add `widget_numericStepper`.

The new appearance you created is now available for use.
