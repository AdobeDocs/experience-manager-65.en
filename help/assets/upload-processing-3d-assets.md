---
title: About the uploading and processing of 3D assets in AEM
seo-title: About the uploading and processing of 3D assets in AEM
description: Best practices for uploading and processing 3D assets.
seo-description: Best practices for uploading and processing 3D assets.
uuid: d8abf460-adff-4f0f-92ae-2c8651a17488
contentOwner: Rick Brough
topic-tags: 3D
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: a0319701-21eb-4b7f-8b2e-ac81a7a75875
---

# About the uploading and processing of 3D assets in AEM {#about-the-uploading-and-processing-of-d-assets-in-aem}

Use standard upload or sync mechanisms to bring 3D assets and their associated referenced files into AEM Assets.

See [Uploading Assets](managing-assets-touch-ui.md#uploading-assets).

Adobe recommends that you upload all referenced files before-or at the same time-you upload the primary 3D model file. However, this is not a requirement.

When uploading is complete, your 3D files are converted and additional processing is applied to prepare the asset for viewing and rendering.

## Best practices for uploading 3D assets {#best-practices-for-uploading-d-assets}

* Generally, there are no restrictions on where you upload 3D content in the AEM Assets folder hierarchy. AEM 3D's automated file dependencies resolution, however, has range limitations to control the time it takes to search large asset repositories. Therefore, Adobe recommends that when you upload 3D assets and their file dependents, you do so within reasonable proximity to each file (common grandparent folder). After file dependencies are resolved, you can freely move both the 3D asset and its dependents anywhere within the repository without losing the established relationships.
* Adobe recommends that you decide on a consistent folder structure for 3D content *before* you upload. The following tips are some suggested approaches that you can take:

    * **Maintain a separate folder for each 3D asset you upload**. 

      The folder contains both the primary 3D model file and all its dependents. While putting all assets and dependents into one folder is easy to implement, it is cumbersome to browse for content. It also complicates sharing dependents (texture maps) between models.
  
    * **Keep models in one folder and dependents in a sibling or sub-folder**. 

      This approach readily supports the sharing of dependents between models. However, it can become difficult to find specific dependents if the number of assets is large.
  
    * **Separate, parallel folder hierarchies for models and dependents**. 
  
      You can model this approach to how 3D authoring applications such as Autodesk Maya, prefer to store content.

* Dependent assets should not be deleted unless the associated 3D asset or assets that referenced them are also removed. You can, however, freely delete 3D assets without the need to delete their dependent assets. If a dependency is lost accidentally, you can easily resolve the dependency to restore it.  

  See Resolving file dependencies.

## Performance considerations when uploading 3D files {#performance-considerations-when-uploading-d-files}

Converting and processing 3D files typically consumes significant CPU and memory resources on a server. It also takes a substantial amount of time. Processing times often vary greatly depending on the size of the model and the capabilities of the server. For example, a typical small model with less than 100k faces is usually ready for viewing in less than one minute; it is fully processed in 2-3 minutes. Whereas, a large model with more than one million faces can take tens of minutes to process completely.

Conversion, processing, and render jobs are queued as needed to prevent slowing down the server too much. The message "Waiting for processing..." is sometimes shown in the **[!UICONTROL Card View]** at the time you uploaded assets. This status indicates that other processing or render jobs must finish before the current asset is processed.

Mechanisms are available to restrict CPU use for ingestion processing and for rendering. See [Advanced configuration settings](advanced-config-3d.md) for information on how to configure the CPU limits.

## Monitoring the processing status of your uploaded 3D files {#monitoring-the-processing-status-of-your-uploaded-d-files}

In **[!UICONTROL Card View]** only, the processing status and progression is displayed as a progress banner on the asset's card. Each uploaded 3D model typically undergoes the following 4-6 ordered processing stages:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Processing stage</strong><br /> </td> 
   <td><strong>Processing names</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>1</td> 
   <td>Processing</td> 
   <td>Basic initial processing and metadata extraction.</td> 
  </tr> 
  <tr> 
   <td>2</td> 
   <td>Converting format</td> 
   <td>The 3D model is being converted from a native format (Autodesk® Maya® or Autodesk® 3ds Max®) to an intermediate format (FBX).</td> 
  </tr> 
  <tr> 
   <td>3</td> 
   <td>Creating preview</td> 
   <td>The FBX or OBJ file is ingested and processed. File dependencies are evaluated and resolved as asset references, where possible.</td> 
  </tr> 
  <tr> 
   <td>4</td> 
   <td>Creating ground shadow</td> 
   <td>Optional. Lets you generate an ambient occlusion drop shadow on the ground plane beneath the 3D object. See <a href="/help/assets/advanced-config-3d.md">Advanced configuration settings</a> to enable or disable this processing.</td> 
  </tr> 
  <tr> 
   <td>5<br /> </td> 
   <td>Creating lightmaps</td> 
   <td>Optional. Lets you increase the quality of the interactive preview and expedite rendering with the default renderer. See <a href="/help/assets/advanced-config-3d.md">Advanced configuration settings</a> to enable or disable this processing.</td> 
  </tr> 
  <tr> 
   <td>6<br /> </td> 
   <td>Creating animation</td> 
   <td>Optional. Lets you render a simple animation that is then used as a visual thumbnail in Card View. See <a href="/help/assets/advanced-config-3d.md">Advanced configuration settings</a> to enable or disable this processing.</td> 
  </tr> 
  <tr> 
   <td>7<br /> </td> 
   <td>Waiting for processing</td> 
   <td>Shown when other 3D assets have processing priority. For example, assets that were uploaded earlier but have not yet completed processing.</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>You can view a 3D asset in **[!UICONTROL Detail View]** or render it after the Creating preview stage is complete. You do not need to wait for all processing stages to complete.

