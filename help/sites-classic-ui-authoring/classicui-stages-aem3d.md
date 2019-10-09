---
title: About the use of stages in AEM 3D
seo-title: About the use of stages in AEM 3D
description: Stages are light-weight 3D scene files that provide the basic viewing environment (lights, backgrounds, ground planes or other fixed geometry), optional pre-defined cameras, and render settings for third-party renderers.
seo-description: Stages are light-weight 3D scene files that provide the basic viewing environment (lights, backgrounds, ground planes or other fixed geometry), optional pre-defined cameras, and render settings for third-party renderers.
uuid: 303ecbbd-131e-4c6f-812a-1e056b1e1d63
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: authoring
content-type: reference
discoiquuid: cbcfbe88-e60c-446c-bbfe-2509831d6c22
---

# About the use of stages in AEM 3D{#about-the-use-of-stages-in-aem-d}

Stages are light-weight 3D scene files that provide the basic viewing environment (lights, backgrounds, ground planes or other fixed geometry), optional pre-defined cameras, and render settings for third-party renderers.

>[!NOTE]
>
>The OBJ 3D format does not support lights. Therefore, it cannot be used to provide stages to AEM 3D.

The file format of the stage determines which renderer you can use with that stage. For example, if Autodesk® Maya® is used for high-quality rendering, the stage must be in `.ma` or `.mb` format. If you intend to only use the default Rapid Refine™ renderer, any supported stage file format is acceptable.

All render settings in AEM 3D, except the output image type and size must be pre-configured and saved into the stage file prior to uploading to AEM.

