---
title: Asset Selector
description: Learn how to use the asset selector to search, filter, browse, and fetch metadata for assets within Adobe Experience Manager Assets. Also learn how to customize the asset selector interface.
contentOwner: Adobe
feature: Asset Management,Metadata,Search
role: User
exl-id: 4b518ac0-5b8b-4d61-ac31-269aa1f5abe4
---
# Asset selector {#asset-selector}

>[!NOTE]
>
>The Asset selector was called [Asset picker](https://helpx.adobe.com/experience-manager/6-2/assets/using/asset-picker.html) in prior versions of [!DNL Experience Manager].

The asset selector lets you browse, search, and filter assets in [!DNL Adobe Experience Manager] Assets. You can also fetch the metadata of assets that you select using the asset selector. To customize the asset selector interface, you can launch it with supported request parameters. These parameters set the context of the asset selector for a particular scenario.

Currently, you can pass the request parameters `assettype` (*Image/Video/Text*) and selection `mode` (*Single/Multiple*) as contextual information for the asset selector, which remains intact throughout the selection.

The asset selector uses the HTML5 **Window.postMessage** message to send data for the selected asset to the recipient.

The asset selector is based on Granite's foundation picker vocabulary. By default, the asset selector operates in browse mode. However, you can apply filters using the Omnisearch experience to refine your search for particular assets.

You can integrate any web page (irrespective of whether it is part of the CQ container) with the asset selector (`https://[AEM_server]:[port]/aem/assetpicker.html`).

## Contextual Parameters {#contextual-parameters}

You can pass the following request parameters in a URL to launch the asset selector in a particular context:

| Name | Values | Example | Purpose |
|---|---|---|---|
| resource suffix (B) | Folder path as the resource suffix in the URL:`http://localhost:4502/aem/`<br>`assetpicker.html/<folder_path>` | To launch the asset selector with a particular folder selected, for example with the folder `/content/dam/we-retail/en/activities` selected, the URL should be of the form: `http://localhost:4502/aem/assetpicker.html`<br>`/content/dam/we-retail/en/activities?assettype=images` | If you require a particular folder to be selected when the asset selector is launched, passed it as a resource suffix. |
| mode | single, multiple | `http://localhost:4502/aem/assetpicker.html`<br>`?mode=multiple` <br> `http://localhost:4502/aem/assetpicker.html`<br>`?mode=single` | In multiple mode, you can select several assets simultaneously using the asset selector. |
| dialog | true, false | `http://localhost:4502/aem/assetpicker.html`<br>`?dialog=true` | Use these parameters to open the asset selector as Granite Dialog. This option is only applicable when you launch the asset selector through Granite Path Field, and configure it as pickerSrc URL. |
| root | `<folder_path>` | `http://localhost:4502/aem/`<br>`assetpicker.html?assettype=images`<br>`&root=/content/dam/we-retail/en/activities` | Use this option to specify the root folder for the asset selector. In this case, the asset selector lets you select only child assets (direct/indirect) under the root folder. |
| viewmode | search || To launch the asset selector in search mode, with assettype and mimetype parameters. |
| assettype (S) | images, documents, multimedia, archives | <ul><li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&assettype=images`</li> <li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&assettype=documents`</li> <li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&assettype=multimedia`</li> <li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&assettype=archives`</li> | Use this option to filter asset types based on the value passed. |
| mimetype | mimetype(s) (`/jcr:content/metadata/dc:format`) of an asset (wildcard also supported) | <ul><li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&mimetype=image/png`</li>  <li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&?mimetype=*png`</li>  <li>`http://localhost:4502/aem/assetpicker.html?viewmode=search&mimetype=*presentation`</li>  <li>`http://localhost:4502/aem/assetpicker?viewmode=search&mimetype=*presentation&mimetype=*png`</li></ul> | Use it to filter assets based on MIME type(s) |

## Use the asset selector {#using-the-asset-selector}

1. To access the asset selector interface, go to `https://[AEM_server]:[port]/aem/assetpicker`.
1. Navigate to the desired folder, and select one or more assets.

   ![chlimage_1-441](assets/chlimage_1-441.png)

   Alternatively, you can search for the desired asset from the OmniSearch box and then select it.

   ![chlimage_1-442](assets/chlimage_1-442.png)

   If you search for asssets using the OmniSearch box, you can select various filters from the **[!UICONTROL Filters]** pane to refine your search.

   ![chlimage_1-443](assets/chlimage_1-443.png)

1. Tap/click **[!UICONTROL Select]** from the toolbar.
