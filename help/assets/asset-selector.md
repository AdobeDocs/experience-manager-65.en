---
title: Asset Selector
seo-title: Asset Selector
description: Learn how to use the asset selector to search, filter, browse, and fetch metadata for assets within Adobe Experience Manager (AEM) Assets. Also learn how to customize the asset selector interface.
seo-description: Learn how to use the asset selector to search, filter, browse, and fetch metadata for assets within Adobe Experience Manager (AEM) Assets. Also learn how to customize the asset selector interface.
uuid: 53065f6a-35ec-429d-8faa-0fa2d07f99f6
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: df7d8117-e6d6-4fd8-ae41-a7c9003d87c6
docset: aem65

---

# Asset Selector{#asset-selector}

>[!NOTE]
>
>Asset Selector was named [Asset Picker](https://helpx.adobe.com/experience-manager/6-2/help/assets/asset-picker.html) in prior versions of AEM.

The asset selector lets you search for, filter, and browse assets within Adobe Experience Manager (AEM) Assets. You can also fetch the metadata of assets that you select using the asset selector. To customize the asset selector interface, you can launch it with supported request parameters. These parameters set the context of the asset selector for a particular scenario.

Currently, you can pass the request parameters `Asset Type` (*Image/Video/Text*) and `Selection mode` (*Single/Multiple*) as contextual information for the asset selector, which remains intact throughout the selection.

The asset selector uses the HTML5 **Window.postMessage** message to send data for the selected asset to the recipient.

The asset selector is based on Granite's foundation picker vocabulary. By default, the asset selector operates in Browse mode. However, you can apply filters using the Omni search experience to refine your search for particular assets.

You can integrate any web page (irrespective of whether it is part of the CQ container) with the asset selector (`https://<host>:<port>/aem/assetpicker.html`).

## Contextual Parameters {#contextual-parameters}

You can pass the following request parameters in a URL to launch the asset selector in a particular context:

| Name                | Values                                                                                                 | Example                                                                                                                                                                                                                                                                    | Purpose                                                                                                                                                                                             |
|---------------------|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| resource suffix (B) | Folder path as the resource suffix in the URL:`http://localhost:4502/aem/assetpicker.html/<folder_path>` | To launch the asset selector with a particular folder selected, for example with the folder /content/dam/we-retail/en/activities, selected, the URL should be of the form: `http://localhost:4502/aem/assetpicker.html/content/dam/we-retail/en/activities?assettype=images` | If you require a particular folder to be selected when the asset selector is launched, passed it as a resource suffix.                                                                              |
| mode                | single, multiple                                                                                       | `http://localhost:4502/aem/assetpicker.html?mode=multiple`  `http://localhost:4502/aem/assetpicker.html?mode=single`                                                                                                                                                             | In multiple mode, you can select several assets simultaneously using the asset selector.                                                                                                            |
| mimetype            | mimetype(s) (/jcr:content/metadata/dc:format) of an asset (wildcard also supported)                    | `http://localhost:4502/aem/assetpicker.html?mimetype=image/png`  `http://localhost:4502/aem/assetpicker.html?mimetype=*png`  `http://localhost:4502/aem/assetpicker.html?mimetype=*presentation`  `http://localhost:4502/aem/assetpicker.html?mimetype=*presentation&mimetype=*png`     | Use it to filter assets based on MIME type(s)                                                                                                                                                       |
| dialog              | true, false                                                                                            | `http://localhost:4502/aem/assetpicker.html?dialog=true`                                                                                                                                                                                                                     | Use these parameters to open the asset selector as Granite Dialog. This option is only applicable when you launch the asset selector through Granite Path Field, and configure it as pickerSrc URL. |
| assettype (S)       | images, documents, multimedia, archives                                                                | http://`localhost:4502/aem/assetpicker.html?assettype=images`  `http://localhost:4502/aem/assetpicker.html?assettype=documents`  `http://localhost:4502/aem/assetpicker.html?assettype=multimedia`  `http://localhost:4502/aem/assetpicker.html?assettype=archives`                      | Use this option to filter asset types based on the value passed.                                                                                                                                    |
| root                | `<folder_path>`                                                                                          | `http://localhost:4502/aem/assetpicker.html?assettype=images&root=/content/dam/we-retail/en/activities`                                                                                                                                                                      | Use this option to specify the root folder for the asset selector. In this case, the asset selector lets you select only child assets (direct/indirect) under the root folder.                      |

## Using the asset selector {#using-the-asset-selector}

1. To access the asset selector interface, go to `https://&lt;host&gt;:&lt;port&gt;/aem/assetpicker`.
1. Navigate to the desired folder, and select one or more assets.

   ![chlimage_1-194](assets/chlimage_1-194.png)

   Alternatively, you can search for the desired asset from the OmniSearch box and then select it.

   ![chlimage_1-195](assets/chlimage_1-195.png)

   If you search for asssets using the OmniSearch box, you can select various filters from the **Filters** pane to refine your search.

   ![chlimage_1-196](assets/chlimage_1-196.png)

1. Tap/click **Select** from the toolbar.

