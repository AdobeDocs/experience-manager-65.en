---
title: Best practices for optimizing the quality of your images in Dynamic Media
description: Learn best practices for optimizing image quality in Dynamic Media
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
feature: Asset Management
role: User, Admin
exl-id: 7a568cae-e505-4b3a-abc5-8aae723460c3
solution: Experience Manager, Experience Manager Assets
---
# Best practices for optimizing the quality of your images in Dynamic Media {#best-practices-for-optimizing-the-quality-of-your-images}

Optimizing image quality can be a time consuming process as many factors contribute to rendering acceptable results. The outcome is partly subjective because individuals perceive image quality differently. Structured experimentation is key.

Adobe Experience Manager includes more than 100 Dynamic Media image delivery commands for tuning and optimizing images and rendering results. The following guidelines can help you streamline the process and achieve good results quickly using some essential commands and best practices.

## Best practices for image format (`&fmt=`) {#best-practices-for-image-format-fmt}

* JPG or PNG are the best choices to deliver images in good quality and with manageable size and weight.
* If no format command is supplied in the URL, Dynamic Media Image Delivery defaults to JPG for delivery.
* JPG compresses at a ratio of 10:1 and usually produces smaller image file sizes. PNG compresses at a ratio of about 2:1, except sometimes, such as when images contain a white background. Typically though, PNG file sizes are larger than JPG files.
* JPG uses lossy compression, meaning that picture elements (pixels) are dropped during compression. PNG on the other hand uses lossless compression.
* JPG often compresses photographic images with better fidelity than synthetic images with sharp edges and contrast.
* If your images contain transparency, use PNG because JPG does not support transparency.

As a best practice for image format, start with the most common setting `&fmt=JPG`.

## Best practices for image size {#best-practices-for-image-size}

Dynamically reducing image size is one of the most common tasks. It involves specifying the size and, optionally, which downsampling mode is used to downscale the image.

* For image sizing, the best and most straightforward approach is to use `&wid=<value>` and `&hei=<value>,`or just `&hei=<value>`. These parameters automatically set the image width in accordance to the aspect ratio.
* `&resMode=<value>`controls the algorithm used for downsampling. Start with `&resMode=sharp2`. This value provides the best image quality. While using the downsampling `value =bilin` is faster, it often results in the aliasing of artifacts.

As a best practice for image sizing, use `&wid=<value>&hei=<value>&resMode=sharp2` or `&hei=<value>&resMode=sharp2`

## Best practices for image sharpening {#best-practices-for-image-sharpening}

Image sharpening is the most complex aspect of controlling images on your website, and where many mistakes are made. Take the time to learn more about how sharpening and unsharp masking works in Experience Manager by referring to the following helpful resources:

Best practices white paper [Sharpen images in Adobe Dynamic Media Classic](/help/assets/assets/sharpening_images.pdf) which applies to Experience Manager as well.

<!-- To be reviewed and updated: Broken link.
See also [Sharpening an image with unsharp mask](https://helpx.adobe.com/photoshop/atv/cs6-tutorials/sharpening-an-image-with-unsharp-mask.html). -->

With Experience Manager, you can sharpen images on ingestion, on delivery, or both. Usually, however, sharpen images using only one method or the other, but not both. Sharpening images on delivery, on a URL, typically gives you the best results.

There are two image sharpening methods that you can use:

* Simple sharpening ( `&op_sharpen`) &ndash; Similar to the sharpen filter used in Photoshop, simple sharpening applies basic sharpening to the final view of the image following dynamic resizing. However, this method is not user-configurable. The best practice is to not use &op_sharpen unless required.
* Unsharp masking ( `&op_USM`) &ndash; Unsharp masking is an industry standard sharpening filter. The best practice is to sharpen images with unsharp masking following the guidelines below. Unsharp masking lets you control the following three parameters:

  * `&op_sharpen=amount,radius,threshold`

    * **[!UICONTROL *amount*]** (0-5, strength of the effect.)
    * **[!UICONTROL *radius*]** (0-250, width of the "sharpening lines" drawn around the sharpened object, as measured in pixels.)

    Keep in mind that the parameters radius and amount work against each other. Reducing radius can be compensated by increasing amount. Radius allows finer control as a lower value sharpens only the edge pixels, whereas a higher value sharpens a wider band of pixels.

    * **[!UICONTROL *threshold*]** (0-255, sensitivity of effect.)

          This parameter determines how different the sharpened pixels must be from the surrounding area before they are considered edge pixels and the filter sharpens them. The **[!UICONTROL threshold]** parameter helps to avoid over-sharpening areas with similar colors, such as skin tones. For example, a threshold value of 12 ignores slight variations in skin tone brightness to avoid adding "noise", while still adding edge contrast to high contrast areas, such as where eyelashes meet skin.

      For more information about how you set these three parameters, including best practices to use with the filter, see the following resources:

      Experience Manager Help topic on Sharpening an image.

      Best practices white paper [Sharpen images in Adobe Dynamic Media Classic](/help/assets/assets/sharpening_images.pdf).

    * Experience Manager also lets you control a fourth parameter: monochrome (0,1). This parameter determines if unsharp masking is applied to each color component separately using the value 0 or to the image brightness/intensity using the value 1.

As a best practice, start with the unsharp mask radius parameter. Radius settings that you can start with are the following:

* **[!UICONTROL Website]** - 0.2-0.3 pixels
* **[!UICONTROL Photographic printing (250-300 ppi)]** - 0.3-0.5 pixels
* **[!UICONTROL Offset printing (266-300 ppi)]** - 0.7-1.0 pixels
* **[!UICONTROL Canvas printing (150 ppi)]** - 1.5-2.0 pixels

Gradually increase the amount from 1.75 to 4. If sharpening is still not the way you want, increase the radius by a decimal point and run the amount again from 1.75 to 4. Repeat as necessary.

Leave the monochrome parameter setting at 0.

### Best practices for JPEG compression (`&qlt=`) {#best-practices-for-jpeg-compression-qlt}

* This parameter controls JPG encoding quality. A higher value means a higher-quality image but a large file size; alternatively, a lower value means a lower quality image but a smaller file size. The range for this parameter is 0-100.
* To optimize for quality, do not set the parameter value to 100. The difference between a setting of 90 or 95 and 100 is almost imperceptible, yet 100 unnecessarily increases the size of the image file. Therefore, to optimize for quality but avoid image files becoming too large, set the `qlt= value` to 90 or 95.
* To optimize for a small image file size but keep image quality at an acceptable level, set the `qlt= value` to 80. Values below 70 to 75 results in significant image quality degradation.
* As a best practice, to stay in the middle, set the `qlt= value` to 85 to stay in the middle.
* Using the chroma flag in `qlt=`

  * The `qlt=` parameter has a second setting that lets you turn on RGB chromaticity downsampling using the value `,1` or off using the value `,0`.
  * To keep it simple, start with RGB chromaticity downsampling turned off (`,0`). This setting usually results in better image quality, especially for synthetic images with lots of sharp edges and contrast.

As a best practice for JPG compression use `&qlt=85,0`.

## Best practices for JPEG sizing (`&jpegSize=`) {#best-practices-for-jpeg-sizing-jpegsize}

jpegSize is a useful parameter if you want to guarantee that an image does not exceed a certain size for delivery to devices that have limited memory.

* This parameter is set in kilobytes (`jpegSize=&lt;size_in_kilobytes&gt;`). It defines the maximum allowed size for image delivery.
* `&jpegSize=` interacts with the JPG compression parameter `&qlt=`. If the JPG response with the specified JPG compression parameter (`&qlt=`) does not exceed the jpegSize value, the image is returned with `&qlt=` as defined. Otherwise, `&qlt=` is gradually decreased until the image fits in the maximum allowed size, or until the system determines it cannot fit and returns an error.

As a best practice, set `&jpegSize=` and add the parameter `&qlt=` if you are delivering JPG images to devices with limited memory.

## Best practices summary {#best-practices-summary}

As a best practice, to achieve a high image quality and small file size, start with the following combination of parameters:

`fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0`

This combination of settings products excellent results under most circumstances.

If the image requires further optimization, gradually fine-tune sharpening (unsharp masking) parameters by starting with a radius set to 0.2 or 0.3. Then, gradually increase the amount from 1.75 to a maximum of 4 (equivalent to 400% in Photoshop). Check to see that the desired result is achieved.

If sharpening results are still not satisfactory, increase the radius in decimal increments. For every decimal increment, restart the amount at 1.75 and gradually increase it to 4. Repeat this process until you achieve the desired result. While the values above are an approach that creative studios have validated, remember that you can start with other values and follow other strategies. Whether the results are satisfactory to you or not is a subjective matter, therefore structured experimentation is key.

As you experiment, the following general suggestions can be helpful to further optimize your workflow:

* Try out and test different parameters in real time, directly on a URL.
* As a best practice, remember that you can group Dynamic Media Image Serving commands into an image preset. An image preset is basically URL command macros with custom preset names such as `$thumb_low$` and `&product_high$`. The custom preset name in a URL path calls these presets. Such functionality helps you manage commands and quality settings for different usage patterns of images on your website and shortens the overall length of URLs.
* Experience Manager also provides more advanced ways to tune image quality, such as applying sharpening images on ingestion. For advanced use cases where there are options to tune and optimize rendering results, [Adobe Professional Services](https://business.adobe.com/customers/consulting-services/main.html) can help you with customized insight and best practices.
