---
title: Advanced configuration settings
seo-title: Advanced configuration settings
description: Learn about advanced configuration settings that apply to the integration of AEM 3D for both Maya and non-Maya deployments.
seo-description: Learn about advanced configuration settings that apply to the integration of AEM 3D for both Maya and non-Maya deployments.
uuid: 016e7745-e3c3-4d77-b95a-c0e671d719e2
contentOwner: Rick Brough
topic-tags: 3D
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: e43fd002-2954-4ef1-ac2b-e8d45afa75be
---

# Advanced configuration settings {#advanced-configuration-settings}

While the default configuration settings are appropriate for typical use cases, some situations may require you to make changes.

The following advanced configuration settings apply to the integration of AEM 3D for both Maya and non-Maya deployments.

All settings are accessed using **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**).

>[!NOTE]
>
>If you re-install the package, it resets all settings to their default values.

>[!CAUTION]
>
>Editing any settings that are not listed in the table below may result in unexpected or undesired program behavior.

## Asset Types Configuration {#asset-types-configuration}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

| Path |Description |
|---|---|
| `/libs/settings/dam/v3D/assetTypes/*/Conversion` |Specifies the file type for the intermediate 3D format created during ingestion. Must be empty for 'fbx' and 'obj' file formats or 'fbx' for formats enabled by Maya. |
| `/libs/settings/dam/v3D/assetTypes/*/Enabled` |Set to true or false to enable or disable this entry in the **[!UICONTROL assetTypes]** list. |
| `/libs/settings/dam/v3D/assetTypes/*/Extension` |Specify one or more comma-separated file suffixes or file extensions which are to be associated with this asset type. |
| `/libs/settings/dam/v3D/assetTypes/*/IngestRegime` |Must be `native` for FBX and OBJ file formats and  `maya` for formats enabled by Maya. |
| `/libs/settings/dam/v3D/assetTypes/*/MimeType` |Specifies the mime type for this asset type. For formats enabled by Maya it is recommended to use `application/x-ext`, where `ext` is the string specified as the `Extension` value. |

## Ingestion Configuration {#ingestion-configuration}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Path</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/settings/addGroundPlaneImageOnIngest</td> 
   <td>Enables generation of an ambient occlusion drop shadow when viewing or rendering with an IBL stage. Applies to Preview and Rendering with RapidRefine</td> 
  </tr> 
  <tr> 
   <td><p>/libs/settings/dam/v3D/settings/cleanupRenderWorkDir</p> </td> 
   <td>Set to <strong>false</strong> to keep temporary files in the MayaWork folder after conversion and rendering. May be useful when debugging issues with Maya conversion and rendering.</td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/settings/invokeAnimationOnIngest</td> 
   <td><p>When enabled, ImageMagick is installed on the server and magickPath is configured. Rapid Refine is used to create a simple animation for 3D objects that are used as a thumbnail in Card View and other views.</p> <p>Creating animations consumes significant CPU resources during the ingestion process.</p> </td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/settings/invokeLightMapsOnIngest</td> 
   <td>Enables the automatic creation of light maps on ingestion. Set to <strong>false</strong> to disable automatic light map creation; this can significantly reduce CPU consumption at the cost of reduced quality for preview and rendering with Rapid Refine. Does not affect rendering with Maya.</td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/settings/gPlaneZero</td> 
   <td><p>When set to <strong>true</strong> (default), objects are moved vertically, if necessary, to ensure that all parts of the object are above the ground plane (y=0).</p> <p>When set to <strong>false</strong> (default), objects are not repositioned and may be partially hidden by a stage's ground plane. (Applies only to preview and rendering with Rapid Refine.) However, it does not affect rendering with Maya. When set to <strong>true</strong>, the vertical position of objects in Maya may be different than in preview or when rendering with Rapid Refine.</p> </td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/Paths/magickPath</td> 
   <td>The path and name to the ImageMagick convert utility. An absolute path is required if animated thumbnails creation is enabled.</td> 
  </tr> 
  <tr> 
   <td>/libs/settings/dam/v3D/settings/MaxCpuPercentage</td> 
   <td><p>Specifies how many CPUs are used at most for ingestion processing of 3D assets.</p> <p>Higher values speed up ingestions but may cause AEM to become less-responsive overall. This setting is approximate. That is, accuracy increases with the number of available CPU cores.</p> </td> 
  </tr> 
 </tbody> 
</table>

## Cloud Services configuration settings {#cloud-services-configuration-settings}

Values for the following settings are provided by your Adobe account manager, provisioning expert, or support representative.

| **Path** |**Description** |
|---|---|
| `/libs/settings/dam/v3D/services/aws/accountId` |The account id of the Adobe AWS account. |
| `/libs/settings/dam/v3D/services/aws/bucketName` |The name of the S3 transfer bucket; normally `aem3d`. |
| `/libs/settings/dam/v3D/services/aws/customerId` |The unique id assigned by Adobe to your organization. Used as AWS Cognito user ID. |
| `/libs/settings/dam/v3D/services/aws/encryptedPassword` |The password associated with this customerId. Used as AWS Cognito password. |
| `/libs/settings/dam/v3D/services/aws/region` |The AWS region where the cloud services are deployed. |
| `/libs/settings/dam/v3D/services/aws/userPoolId` |The applicable AWS Cognito user pool ID. |
| `/libs/settings/dam/v3D/services/dncr/clientId` |The AWS Cognito client id for the dncr conversion service. |

## Common processing settings {#common-processing-settings}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

| **Path** |**Description** |
|---|---|
| `/libs/settings/dam/v3D/Paths/mayaWorkPath` |The name and location of the working folder for Maya conversion and rendering. The folder is created automatically if it does not exist. |
| `/libs/settings/dam/v3D/Paths/maxWorkPath` |Name and location of the working folder for 3ds Max conversion. The folder is created automatically if it does not exist. |
| `/libs/settings/dam/v3D/settings/debugNative` |Set to **[!UICONTROL true]** to enable creation of debug information during format conversion and rendering with the RapidRefine renderer. |

## Renderer Configuration {#renderer-configuration}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

| **Path** |**Description** |
|---|---|
| `/libs/settings/dam/v3D/settings/dynamicIBL` |When set to **[!UICONTROL true]** and pre-generated light maps are not available (that is invokeLightMapsOnIngest=false), the Rapid Refine renderer creates light maps during rendering to improve render quality. This setting can substantially increase render time. Setting to **[!UICONTROL false]** minimizes CPU usage in such situations but may result in a lower render quality.  |
| `/libs/settings/dam/v3D/renderers/*/Enabled` |Set to **[!UICONTROL true]** or **[!UICONTROL false]** to enable or disable a renderer, respectively. |
| `/libs/settings/dam/v3D/renderers/*/Display` |Lets you change the string that is displayed for an enabled renderer in the Renderer selector in the Render panel. |
| `/libs/settings/dam/v3D/renderers/*/MaxCpuPercentage` |Specifies how many CPUs are used at most for rendering 3D scenes. Higher values speed up rendering but may cause AEM to become less-responsive overall. This setting is approximate. That is, accuracy increases with the number of available CPU cores. |

## 3D Asset preview settings {#d-asset-preview-settings}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

| Path |Description |
|---|---|
| `/libs/settings/dam/v3D/WebGLSites/autoSpin` |Set to **[!UICONTROL true]** or **[!UICONTROL false]** to enable or disable auto-spin (automatic camera orbit) on page load. |
| `/libs/settings/dam/v3D/WebGLSites/autoSpinAfterReset` |Set to **[!UICONTROL true]** to restart auto-spin after **[!UICONTROL Reset]** is pressed. Ignored when auto-spin is disabled. |
| `/libs/settings/dam/v3D/WebGLSites/autoSpinSpeed` |Specifies the speed (revolutions per minute) and direction of auto-spin, with negative values for right-to-left and positive values for left-to-right rotation. |
| `/libs/settings/dam/v3D/WebGL/continueRotate` |Set to **[!UICONTROL false]** to disable continuation with gradual fadeout of viewer responses to touch and mouse gestures. |
| `/libs/settings/dam/v3D/WebGL/curtainColor` |Specifies the color of the load curtain that can optionally cover the viewport of the 3D asset preview during load and initialization. R,G,B value, with each color component in the range 0 to 255. |
| `/libs/settings/dam/v3D/WebGL/fadeCurtains` |When set to **[!UICONTROL true]**, the load curtain will gradually fade out during the latter parts of viewer initialization. When set to **[!UICONTROL false]**, the curtain remains opaque until loading and initialization has completed. |
| `/libs/settings/dam/v3D/WebGL/showCurtains` |Set to **[!UICONTROL true]** or **[!UICONTROL false]** to enable or disable the load curtain for 3D asset preview. |
| `/libs/settings/dam/v3D/WebGL/spinHeight` |When auto-spin is enabled and active, the vertical position of the camera is automatically adjusted relative to the height of the 3D object. When set to 0.5, the camera will positioned vertically at 1/2 the height of the object, which results in the horizon to be centered vertically in the viewport. Larger values result in the camera looking down onto the object and raising the height of the rendered horizon, smaller values result in the camera looking up at the object and lowering the horizon. |

## 3D Sites component settings {#d-sites-component-settings}

In **CRXDE Lite** in AEM (**[!UICONTROL Tools > General > CRXDE Lite]**), access the following configurations:

| Path |Description |
|---|---|
| `/libs/settings/dam/v3D/WebGLSites/autoSpinAfterReset` |Set to **[!UICONTROL true]** to reactivate auto-spin (automatic camera orbit) after home is pressed. Ignored when auto-spin is disabled. |
| `/libs/settings/dam/v3D/WebGLSites/continueRotate` |Set to **[!UICONTROL false]** to disable continuation with gradual fadeout of viewer responses to touch and mouse gestures. |
| `/libs/settings/dam/v3D/WebGLSites/curtainColor` |Specifies the color of the load curtain that can optionally cover the viewport of the 3D Sites component during load. R,G,B value, with each color component in the range 0 to 255. |
| `/libs/settings/dam/v3D/WebGLSites/fadeCurtains` |When set to **[!UICONTROL true]**, the load curtain will gradually fade out during the latter parts of loading and initialization. When set to **[!UICONTROL false]**, the curtain remains opaque until loading and initialization has completed. |
| `/libs/settings/dam/v3D/WebGLSites/showCurtains` |Set to **[!UICONTROL true]** or **[!UICONTROL false]** to enable or disable the load curtain for the 3D Sites component. |
| `/libs/settings/dam/v3D/WebGLSites/spinHeight` |When auto-spin is enabled and active, the vertical position of the camera is automatically adjusted relative to the height of the 3D object. When set to 0.5, the camera will positioned vertically at 1/2 the height of the object, which results in the horizon to be centered vertically in the viewport. Larger values result in the camera looking down onto the object and raising the height of the rendered horizon, smaller values result in the camera looking up at the object and lowering the horizon. |

