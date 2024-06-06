---
title: How to create or customizing Adaptive Form themes?
description: Learn to create or customize themes for Adaptive Forms Core Components using BEM specifications
keywords: create adaptive forms core components theme, create new theme, customize theme, upload new theme, use theme in forms, delete a theme, create a theme in AEM 6.5 forms
contentOwner: Khushwant Singh
topic-tags: Adaptive Forms
docset: aem65
role: Admin, Developer
feature: Adaptive Forms, Core Components
exl-id: 9f9b35a3-0479-4179-9fad-994a482c96b6
solution: Experience Manager, Experience Manager Forms
---
# Create or customize an Adaptive Form theme {#introduction-to-theme}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service     | [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-core-components/create-an-adaptive-form-on-forms-cs/using-themes-in-core-components.html)|
| AEM 6.5  |    This Article                  |
 

<!--**Applies to:** ✅ Adaptive Form Core Components ❎ [Adaptive Form Foundation Components](/help/forms/using/create-adaptive-form.md).-->

In AEM Forms 6.5, a theme is an AEM client library that you use to define the styles (look and feel) for an Adaptive Form. A theme contains styling details for the components and panels. Styles include properties such as background colors, state colors, transparency, alignment, and size. When you apply a theme, the specified style reflects on the corresponding components. A theme is managed independently without a reference to an Adaptive Form and can be reused across multiple Adaptive Forms.
 
## Available  themes {#available-theme}

AEM 6.5 environment provides the below listed themes for Core Components based Adaptive Forms:  

* [Canvas theme](https://github.com/adobe/aem-forms-theme-canvas)
* [WKND theme](https://github.com/adobe/aem-forms-theme-wknd)
* [EASEL theme](https://github.com/adobe/aem-forms-theme-easel)
* [Public theme](https://github.com/adobe/aem-forms-theme-public)
* [Manufacturing theme](https://github.com/adobe/aem-forms-theme-manufacturing)

## Understanding structure of the themes {#understanding-structure-of-theme}

A theme is a package that encompasses the CSS file, JavaScript files, and resources (like icons) that define the style of your Adaptive Forms. An Adaptive Form theme follows a specific organization, consisting of the following components:

* `src/theme.scss`: This folder includes the CSS file that has a broad impact on the entire theme. It serves as a centralized location to define and manage the styling and behavior of your theme. By making edits to this file, you can make changes that are applied universally throughout the theme, influencing the appearance and functionality of both your Adaptive Forms and AEM Sites Pages.

* `src/site`: This folder contains CSS files that are applied to an entire AEM Site's page. These files consist of code and styles that affect the overall functionality and layout of your AEM Site's page. Any modifications made here is reflected across all pages of your Site.

* `src/components`: The CSS files in this folder are designed for individual AEM core components. Each dedicated folder for a component includes a `.scss` file that styles that particular component within an Adaptive Form. For instance, the `/src/components/button/_button.scss` file contains style information for the Adaptive Forms Button component.  

  ![Canvas Theme Structure](/help/forms/using/assets/component-based-theme-folder-structure.png)

* `src/resources`: This folder contains static files such as icons, logos, and fonts. These resources are used to enhance the visual elements and overall design of your theme.

## Create a theme 

AEM Forms 6.5 provides the below listed themes for Core Components based Adaptive Forms.

* [Canvas theme](https://github.com/adobe/aem-forms-theme-canvas)
* [WKND theme](https://github.com/adobe/aem-forms-theme-wknd)
* [EASEL theme](https://github.com/adobe/aem-forms-theme-easel)
* [Public theme](https://github.com/adobe/aem-forms-theme-public)
* [Manufacturing theme](https://github.com/adobe/aem-forms-theme-manufacturing)

You can [customize any of these themes to create a theme](#customize-a-theme-core-components).

## Customize a theme {#customize-a-theme-core-components-based-adaptive-forms}

Customizing a theme refers to the process of modifying and personalizing the appearance of a theme. When you customize a theme, you change its design elements, layout, colors, typography, and sometimes the underlying code. This lets you create a unique and tailored look for your website or application while maintaining the basic structure and functionality provided by the theme.

>[!NOTE]
>
> * Use the Package Manager to deploy a theme on all the Author and Publish instances. 
> * A theme client library is imported or exported via Package Manager like any other package.

### Prerequisites to customize a theme {#prerequisites}

* [Enable Adaptive Forms Core Components](/help/forms/using/enable-adaptive-forms-core-components.md) for your environment.

* Install the latest release of [Apache Maven.](https://maven.apache.org/download.cgi) Apache Maven is a build automation tool commonly used for Java&trade; projects. Installing the latest release ensures you have the necessary dependencies for theme customization.

* Learn how to create a [client library in Adobe Experience Manager](https://experienceleague.adobe.com/docs/experience-manager-65/developing/introduction/clientlibs.html). AEM provides client libraries, which let you store your client-side code in the repository, organize it into categories, and define when and how each category of code is to be served to the client.

* Install a plain text editor. For example, Microsoft&reg; Visual Studio Code. Using a plain text editor such as Microsoft&reg; Visual Studio Code provides a user-friendly environment for editing and modifying theme files.

* Ensure you AEM Forms environment is up and running. 

### Considerations to customize a theme {#consideration}

* Ensure that you use [the Archetype project used to enable Adaptive Forms Core Components](/help/forms/using/enable-adaptive-forms-core-components.md) on your environment to customize your themes. 

* When publishing an Adaptive Form, the client libraries are not automatically published at the Publish instance. Ensure that you manually publish the client library referenced in an Adaptive Form to your Publish environments. 

* Adobe recommends not to change the class names of client libraries.

### Customize a theme {#customize-a-theme-core-components}

 Creating or customizing a theme is a multi-step process. Perform the steps in listed order to create/customize the theme:

 1. [Clone a theme](#clone-git-repo-of-theme)
 1. [Customize the appearance of the theme](#customize-the-theme) 
 1. [Ready the theme for local deployment](#generate-the-clientlib) 
 1. [Deploy the theme on a local environment](#deploy-the-theme-on-a-local-environment) 
 1. [Deploy the theme on production environment](#5-deploy-a-theme-on-your-production-environment)

<!--
 ![Theme Customization workflow](/help/forms/using/assets/custom-theme-steps.png)
-->

The examples provided in the document are based on the **Canvas** theme, but you can clone any theme and customize it using the same instructions. These instructions are applicable to any theme, allowing you to modify themes according to your specific needs.
 
#### 1. Clone the Git repository of theme {#clone-git-repo-of-theme}

To clone a theme for Core Components based Adaptive Forms, choose one of the following themes:

* [Canvas theme](https://github.com/adobe/aem-forms-theme-canvas)
* [WKND theme](https://github.com/adobe/aem-forms-theme-wknd)
* [EASEL theme](https://github.com/adobe/aem-forms-theme-easel)

Perform the following instructions to clone a theme: 

1. Open the command prompt or terminal window on your local development environment.

1. Run the `git clone` command to clone a theme. 

   ```
      git clone [Path of Git Repository of the theme]
   ```

   Replace the [Path of Git Repository of the theme] with the  actual URL of the corresponding Git Repository of the theme

   For example, to clone the Canvas theme, execute the following  command:

      ```
         git clone https://github.com/adobe/aem-forms-theme-canvas
      ```

1. Select **Trust the authors of all files in the parent folder** and click **Yes, I trust the authors**.

After executing the command successfully, you have a local  copy of the theme available on your machine in the  `aem-forms-theme-canvas` folder.

#### 2. Customize the theme {#customize-the-theme}

You have the flexibility to customize individual components or make theme-level changes using the global variables of a theme. Modifying global variables have a cascading effect on all individual components. For instance, you can utilize global variables to change the border color of all components within an Adaptive Form or apply a vibrant fill color to Call to Action (CTA) buttons. You can: 

* [Set theme level styles](#theme-customization-global-level)

* [Set component level styles](#component-based-customization)

##### Set theme level styles {#theme-customization-global-level}

The `variable.scss` file contains the global variables of the theme. By updating these variables, you can make style-related changes at the theme level. To apply theme-level styles, follow these steps:

1. Open the `<your-theme-sources>/src/site/_variables.scss` file  for editing.
1. Change the value of any property. For example, the default error color is red. To change the error color from red to blue, change the color hex code of the `$error`variable. For example, `$error: #196ee5`.

    ![Example: Error color set to blue](/help/forms/using/assets/theme-level-changes.png)

1. Save and close the file.


Similarly, you can use the `variable.scss` file to set font family and type, theme and font colors, font size, theme spacing, error icon, theme border styles, and more variable that impact multiple Adaptive Form components.  

##### Set component level styles {#component-based-customization}

You also have the option to customize the font, color, size, and other CSS properties of specific Adaptive Form core components, such as buttons, checkboxes, containers, footers, and more. By editing the CSS file associated with the specific component, you can align its style with your organization's branding. To customize the style of a component, follow these steps:

1. Open the file `<your-theme-sources>/src/components/<component>/<component.scss>` for editing. For example, to change the font color of the button component, open the `<your-theme-sources>/src/components/button/button.scss`, file .
1. Change the value of any as per your requirements. For example, to change the color of the button component on mouse hover to Green, change the value of the `color: $white` property in the `cmp-adaptiveform-button__widget:hover` class to hex code #12b453 or any other shade of green. The final code looks like the following:

    ```
     .cmp-adaptiveform-button__widget:hover {
     background: $dark-gray;
     color: #12b453;
     }

    ```


1. Save and close the file.

<!--

   ![Example: Hover color set to green](/help/forms/using/assets/button-customization.png)

-->

>[!NOTE]
>
> When a style is defined both at theme and component level, the style defined at the component level takes priority. 

#### 3. Ready the theme for deployment {#generate-the-clientlib}

To deploy a theme to an AEM instance, it needs to be converted into a Client Library. Follow these steps to convert the theme into a client library:

1. Open the command prompt or terminal window.
1. Navigate to the `<your-theme-sources>` folder. For example, `C:\aem-forms-theme-canvas`
1. Run the following command:

     ```
        npm run create-clientlib --category=adaptiveform.theme.[yourtheme]

     ```
    
    Replace `[yourtheme]` with the name of your custom theme. For example, if the name of the custom theme is `customcanvastheme`, run the following command

    ```
        npm run create-clientlib --category=adaptiveform.theme.customcanvastheme

    ```

    On successful execution of the command, a client library folder is created at `themerepo\theme-clientlibs\[yourtheme]`. 

    ![Client Libary Generation](/help/forms/using/assets/clientlib_created.png)


    ![Client Libary location](/help/forms/using/assets/adaptiveform.theme.easel.png)

#### 4. Deploy the theme on a local environment {#deploy-the-theme-on-a-local-environment}

To deploy the theme to your local development or testing environment, follow these steps:

1. Copy the Client Library, created in the previous section,  to your Archetype project, at the following path:

    `/ui.apps/src/main/content/jcr_root/apps/[AEM Archetype Project Folder]/clientlibs/<yourtheme>`

1. Open the Command Prompt or Terminal.
1. Navigate to the root directory of your AEM Archetype project, the project used to enable Adaptive Form Core Components. 
1. Run the following command to deploy the custom theme on your environment: 

    `mvn clean install`

    ![Client Libary Build](/help/forms/using/assets/mvndeploy.png)

<!--

#### 5. Test the theme with a local Adaptive Form {#test-the-theme-with-a-local-adaptive-form}

To apply and test the customized theme with an Adaptive Form:

**Apply theme while creating an Adaptive Form**

1. Log in to your AEM Forms author instance. 

1. Select **Adobe Experience Manager** > **Forms** > **Forms & Documents**.

1. Click **Create** > **Adaptive Forms**. The wizard for creating Adaptive Form opens.

1. Select the core component template in the **Source** tab.
1. Select the theme in the **Style** tab.
1. Click **Create**.

An Adaptive Form with the selected theme is created. 

**Apply theme to an existing Adaptive Form**

1. Log in to your AEM Forms author instance. 

1. Select **Adobe Experience Manager** > **Forms** > **Forms & Documents**.

1. Select an Adaptive Form and click Properties. 

1. For the **Theme Client Library** option, select the theme. 

1. Click **Save & Close**.

The selected theme is applied to the Adaptive Form. 
-->

#### 5. Deploy a theme on your production environment {#deploy-theme}

Once you have successfully tested the theme on your local development environment, you can proceed to deploy the theme to your production environments, including both the Author and Publish instances. Follow these steps to deploy the theme on your production environments:

1. Log in to your AEM environment.
1. Open the Package Manager. The default URL is `https://localhost:4502/crx/packmgr/index.jsp`.
1. Click **Upload Package** and click **Browse**.
1. Navigate to and select `[AEM Archetype Project Folder]\all\target[appid].all-[version].zip`. Click **Open**. 
1. Click Install. Repeat the step on all the production environments.  


After the package is installed the theme is available for selection. 

![Theme Client Library](/help/forms/using/assets/themeclientlibrary.png)

>[!NOTE]
>
>
> In case you encounter difficulty accessing the login dialog on a publish instance to install the package through the Package Manager, try logging in through the following URL: `http://[Publish Server URL]:[PORT]/system/console`. This allows access to log in to Publish instance, allowing you to proceed with the installation process.

## Apply a theme to an Adaptive Form {#using-theme-in-adaptive-form}

Steps to apply a theme to an Adaptive Form are:

1. Log in to your local AEM author instance.
1. Enter your credentials on the Experience Manager login page. Select **Adobe Experience Manager** > **Forms** > **Forms & Documents**.
1. Click **Create** > **Adaptive Forms**. 
1. Select an Adaptive Forms Core Components template and click **Next**. The **Add Properties** appears
1. Specify the **Name** for your Adaptive Form.


    >[!NOTE]
    >
    > * By default, the `adaptiveform.theme.canvas3` theme is selected.
    > * You can choose a different theme from the **Theme Client Library** drop-down menu. 

1. Click **Create**.

Adaptive Form themes are used as part of an Adaptive Form template to define styling while creating an Adaptive Form.

## Delete a theme {#delete-a-theme}

To remove unused or unwanted themes:

 1. Log in to your Author instance.
 1. Open `http://[Publish Server URL]:[PORT]/crx/de/index.jsp`
 1. Navigate to `apps/[AEM Archetype Project Folder]/clientlibs/[yourtheme]`.
 1. Delete the theme folder and save the changes.


## Frequently Asked Question {#faq}

**Q:** Which customization takes priority when making customizations in a theme folder at both the global level and component level?

**Ans:** When a style is defined at both the theme and component levels, the style defined at the component level takes precedence.

**Q:** What steps should be taken if the custom theme is not visible in the **[!UICONTROL Theme Client Library]**?
 
**Ans:**  If your custom theme does not appear in the **[!UICONTROL Theme Client Library]** drop-down, follow these steps:

1. Navigate to the location where you have added your custom theme client library. The recommended path is `/ui.apps/src/main/content/jcr_root/apps[AEM Archetype Project Folder]/clientlibs/<yourtheme>`.

1. Open the `.content.xml` file and include the following metadata:

    ```

        formstheme:true
        allowproxy:true

    ```

1. Save the file and redeploy the theme.

## See also

* [Create a Core Components based Adaptive Form](create-an-adaptive-form-core-components.md)
* [Use rule editor to add dynamic behavior to form](rule-editor.md)
* [Create or customize themes for Core Components based Adaptive Forms](create-or-customize-themes-for-adaptive-forms-core-components.md)
* [Create a template for Core Components based Adaptive Forms](template-editor.md)
* [Create or Add an Adaptive Form to an AEM Sites Page or Experience Fragment](create-or-add-an-adaptive-form-to-aem-sites-page.md)
* [Sample themes templates and form data models](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components.html)
