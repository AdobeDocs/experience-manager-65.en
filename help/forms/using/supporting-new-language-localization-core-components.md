---
title: How do I add support for new locales to an adaptive form based on core components?
description: Learn to add new locales for an Adaptive Form.
feature: Adaptive Forms, Core Components
role: Admin, User, Developer
---
# Add a locale for Adaptive Forms based on Core Components {#supporting-new-locales-for-adaptive-forms-localization}

| Version | Article link |
| -------- | ---------------------------- |
| Foundation Components  |    [Click here](/help/forms/using/supporting-new-language-localization.md)                  |
| Core Components     | This article         |

<span class="preview"> The Right-to-Left language support feature is available under early adopter program. You can write to aem-forms-ea@adobe.com from your official email id to join the early adopter program and request access to the capability. </span>

AEM Forms provide out of the box support for English (en), Spanish (es), French (fr), Italian (it), German (de), Japanese (ja), Portuguese-Brazilian (pt-BR), Chinese (zh-CN), Chinese-Taiwan (zh-TW), and Korean (ko-KR) locales. You can add support for more locales also, like Hindi(hi_IN). You can also present Adaptive Forms in a Right-to-Left (RTL) language like Arabic, Persian, and Urdu by adding these locales.

## How is the locale selected for an Adaptive Form?

Before you start with adding a locale for Adaptive Forms, build an understanding about how a locale is selected for an Adaptive Form. There are two methods for identifying and selecting the locale for an Adaptive Form when it is rendered:

* **Using the `locale` Selector in the URL**: When rendering an Adaptive Form, the system identifies the requested locale by inspecting the [locale] selector in the adaptive form's URL. The URL follows this format: http:/[AEM Forms Server URL]/content/forms/af/[afName].[locale].html?wcmmode=disabled. The use of the [locale] selector allows for caching of the Adaptive Form. For example, the URL `www.example.com/content/forms/af/contact-us.hi.html?wcmmmode=disabled` renders the form in Hindi language. 

* Retrieving the parameters in the order listed below:

    * **Using the `afAcceptLang`request parameter**: To override the user's browser locale, you can pass the afAcceptLang request parameter. For example, the `https://'[server]:[port]'/<contextPath>/<formFolder>/<formName>.html?wcmmode=disabled&afAcceptLang=ca-fr` URL enforces AEM Forms Server to render the form in Canadian French locale.
    
    * **Using the browser locale (Accept-Language Header)**: The system also considers the user's browser locale, which is specified in the request using the `Accept-Language` header.

    If a client library (the process to create and use the library is covered later in this article) for the requested locale is not available, the system checks if a client library exists for the language code within the locale. For instance, if the requested locale is `en_ZA` (South African English) and there's no client library for `en_ZA`, the Adaptive Form uses the client library for en (English) if available. If neither is found, the Adaptive Form resorts to the dictionary for the `en` locale.

    Once the locale is identified, the Adaptive Form selects the corresponding form-specific dictionary. If the dictionary for the requested locale is not found, it defaults to using the dictionary in the language in which the Adaptive Form was authored.

    In cases where no locale information is available, the Adaptive Form is displayed in its original language, which is the language used during the form's development


## Prerequisites {#prerequistes}

Before you start adding a locale: 

* Install a plain text editor (IDE) for easier editing. The examples in this document are based on [Microsoft&reg; Visual Studio Code](https://code.visualstudio.com/download).
* Install a version of [Git](https://git-scm.com), if not available on your machine. 
* Clone the [Adaptive Forms Core Components](https://github.com/adobe/aem-core-forms-components) repository. To clone the repository: 
    1. Open the command line or terminal window and navigate to a location to store the repository. For example, `/adaptive-forms-core-components`
    1. Run the following command to clone the repository:

        ``` SHELL

            git clone https://github.com/adobe/aem-core-forms-components.git

        ```
        
    The repository includes a client library necessary for adding a locale. 
    
    On successful execution of command, the repository is cloned to the `aem-core-forms-components` folder on your machine. In the rest of the article, the folder is reffred as, [Adaptive Forms Core Components repository].


## Add a locale {#add-localization-support-for-non-supported-locales}

To add support for a new locale, follow these steps:

![Add a locale to a repository](add-a-locale-adaptive-form-core-components.png)

### 1. Clone your AEM as a Cloud Service Git repository {#clone-the-repository}

1. Open the command line and choose a directory to store your AEM Forms as a Cloud Service repository, such as `/cloud-service-repository/`.

1. Run the following command to clone the repository:

    ``` SHELL

    git clone https://git.cloudmanager.adobe.com/<my-org>/<my-program>/

    ```
    
    Replace `<my-org>` and `<my-program>` in the above URL with your organization name and program name. For detailed instructions to obtain the organization name, program name, or the complete path of your Git repository and the credentials required to clone the repository, see [Accessing Git](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/onboarding/journey/developers.html#accessing-git) article. 

    After successful completion of command, a folder `<my-program>` is created. It contains the content cloned from the Git repository. In rest of the article, the  folder is reffred as, `[AEM Forms as a Cloud Service Git repository]`.


### 2. Add the new locale to the Guide Localization Service {#add-a-locale-to-the-guide-localization-service}

1. Open the repository folder, cloned in the previous section, in a plain text editor. 
1. Navigate to the `[AEM Forms as a Cloud Service Git repository]/ui.config/src/main/content/jcr_root/apps/<appid>/osgiconfig/config` folder. You can find the `<appid>` in the `archetype.properties` files of the project. 
1. Open the `[AEM Forms as a Cloud Service Git repository]/ui.config/src/main/content/jcr_root/apps/<appid>/osgiconfig/config/Guide Localization Service.cfg.json` file for editing. If the file does not exist, create it. A sample file with supported locales looks like the following:

    ![A sample Guide Localization Service.cfg.json](locales.png)

1. Add the [locale code for the language](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) that you are looking to add, for example, add 'hi' for hindi.  
1. Save and close the file. 

### 3. Create a Client Library to add a locale

AEM Forms provides a sample client library to help you add new locales easily. You can download and add the `clientlib-it-custom-locale` client library from the [Adaptive Forms Core Components repository] on GitHub to your Forms as a Cloud Service repository. To add the client library, follow these steps:

1. Open your [Adaptive Forms Core Components repository] in your plain text editor. If you do not have the repository cloned, see [Prerequisites](#prerequistes) for instructions to clone the repository.
1. Navigate to the `/aem-core-forms-components/it/apps/src/main/content/jcr_root/apps/forms-core-components-it/clientlibs` directory. 
1. Copy the `clientlib-it-custom-locale` directory.
1. Navigate to `[AEM Forms as a Cloud Service Git repository]/ui.apps/src/main/content/jcr_root/apps/moonlightprodprogram/clientlibs` and paste the `clientlib-it-custom-locale` directory.


### 4. Create a locale-specific file {#locale-specific-file}

1. Navigate to `[AEM Forms as a Cloud Service Git repository]/ui.apps/src/main/content/jcr_root/apps/<program-id>/clientlibs/clientlib-it-custom-locale/resources/i18n/`
1. Locate the [English locale .json file on GitHub](https://github.com/adobe/aem-core-forms-components/blob/master/ui.af.apps/src/main/content/jcr_root/apps/core/fd/af-clientlibs/core-forms-components-runtime-all/resources/i18n/en.json), which contains the latest set of default strings included in the product.
1. Create a .json file for your specific locale.
1. In your newly created .json file, mirror the structure of the English locale file.
1. Replace the English language strings in your .json file with the corresponding localized strings for your language.
1. Save and Close the file. 


### 5. Add locale support to the dictionary {#add-locale-support-for-the-dictionary}

Perform this step only if the `<locale>` you are adding is not among `en`, `de`, `es`, `fr`, `it`, `pt-br`, `zh-cn`, `zh-tw`, `ja`, `ko-kr`.

1. Navigate to the `[AEM Forms as a Cloud Service Git repository]/ui.content/src/main/content/jcr_root/etc/` folder. 

1. Create an `etc` folder under the `jcr_root` folder, if not present already. 

1. Create a folder `languages` under the `etc` folder, if not present already.

    ![Alt text](etc-content-xml.png)

1. Create a `.content.xml` file under the `languages` folder. Add the following content to the file:

    ``` XML

    <?xml version="1.0" encoding="UTF-8"?>
    <jcr:root xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
    jcr:primaryType="nt:unstructured"
    languages="[de,es,fr,it,pt-br,zh-cn,zh-tw,ja,ko-kr]"/>

    ```

1. Add the locale code to the `languages` property. For example, hi added for hindi to the following example code. 


    ``` XML

    <?xml version="1.0" encoding="UTF-8"?>
    <jcr:root xmlns:jcr="http://www.jcp.org/jcr/1.0" xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
    jcr:primaryType="nt:unstructured"
    languages="[de,es,fr,it,pt-br,zh-cn,zh-tw,ja,ko-kr,hi]"/>

    ```
    
1. Add the newly created folders in the `filter.xml` under `/ui.content/src/main/content/meta-inf/vault/filter.xml` as: 

    ``` 

    <filter root="/etc/languages"/>
    
    ```

    ![Add the created folders in the `filter.xml` under `/ui.content/src/main/content/meta-inf/vault/filter.xml`](langauge-filter.png)

### 6. Commit the changes and deploy the pipeline {#commit-changes-in-repo-deploy-pipeline}

Commit the changes to the GIT repository after adding the new locale. Deploy your code using the full stack pipeline. Learn [how to set up a pipeline](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/onboarding/journey/developers.html?lang=en#setup-pipeline) to add new locale support.

Once the pipeline run is successful, the newly added locale is ready for use. 

## Preview an Adaptive Form with newly added locale {#use-added-locale-in-af}

Perform the following steps to preview an Adaptive with newly added locale:

1. Log in to your AEM Forms as a Cloud Service instance.
1. Go to **Forms** >  **Forms and Documents**.
1. Select an Adaptive Form and click **Add Dictionary** and **Add Dictionary To Translation Project** wizard appears.
1. Specify the **Project Title** and select the **Target Languages** from the drop-down menu in the **Add Dictionary To Translation Project** wizard.
1. Click **Done** and execute the created translation project.
1. Select an Adaptive Form and click **Preview as HTML**.
1. Add `&afAcceptLang=<locale-name>` in the URL of an Adaptive Form.
1. Refresh the page and Adaptive Form is rendered in a specified locale. 

## Best Practices to support for new localization {#best-practices}

*   Adobe recommends creating a translation project after creating an Adaptive Form.

*   When new fields are added in an existing Adaptive Form:
    * **For machine translation**: Re-create the dictionary and [run the translation project](/help/forms/using-aem-translation-workflow-to-localize-adaptive-forms-core-components.md). Fields added to an Adaptive Form after creating a translation project remain untranslated. 
    * **For human translation**: Export the dictionary using the UI at `[AEM Forms Server]/libs/cq/i18n/gui/translator.html`. Update the dictionary for the newly added fields and upload it.

## See more

* [Generate document of record for Adaptive Forms](/help/forms/generate-document-of-record-core-components.md)
* [Add an Adaptive Form to an AEM Sites page or Experience Fragment](/help/forms/create-or-add-an-adaptive-form-to-aem-sites-page.md)


## See Also {#see-also}

{{see-also}}