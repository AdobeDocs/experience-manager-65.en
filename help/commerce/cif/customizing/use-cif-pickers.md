---
title: Usage of CIF product & category picker
description: Learn how to use CIF product & category picker in your customer commerce components to support authors and marketers to efficiently work with commerce product and catalog data.
sub-product: Commerce
topics: Development
version: Experience Manager as a Cloud Service
activity: develop
audience: developer
feature: Commerce Integration Framework
exl-id: 1e7c3748-92b5-45f1-8dd9-f1816e3e34aa
solution: Experience Manager,Commerce
role: Admin, Developer
---
# AEM Content & Commerce Authoring Pickers {#cif-pickers}

AEM Content & Commerce Authoring provides a set of authoring tools to help AEM authors and marketers efficiently work with commerce product data and catalogs. The Product Picker and Category Picker are part of CIF add-on and used by the CIF Core Components. Projects can use these pickers in any component dialog to select products or categories.

## Product Picker {#product-picker}

To use the product picker in a project component, a developer must add `commerce/gui/components/common/cifproductfield` to a component dialog. For example, use the following for the `cq:dialog`:

```xml
<product jcr:primaryType="nt:unstructured"
    sling:resourceType="commerce/gui/components/common/cifproductfield"
    fieldDescription="The product or product variant displayed by the teaser"
    fieldLabel="Select Product"
    filter="folderOrProductOrVariant"
    name="./selection"
    selectionId="sku"/>
```

The product field allows navigation to the product that a user wants to select by way of the different views. By default the product field returns the ID of the product, but it can be configured using the `selectionId` attribute.

The product picker field supports the following optional properties:

- selectionId (id, uid, sku, slug, combinedSlug, combinedSku) - lets you choose the product attribute to be returned by the picker (default = id). Using sku returns the sku of the selected product, while using combinedSku and returns a string like base#variant with the skus of the base product and the selected variant, or a single sku if a base product is selected.
- filter (folderOrProduct, folderOrProductOrVariant) - filters the content to be rendered by the picker while navigating the product tree. folderOrProduct - renders folders and products. folderOrProductOrVariant - renders folders, product, and product variants. If a product or product variant is rendered, it also becomes selectable in the picker. (default = folderOrProduct)
- multiple (true, false) - enable the selection of one or multiple products (default = false)
- emptyText - to configure the empty text value of the picker field

Also, standard dialog field properties like `name`, `fieldLabel`, or `fieldDescription`, are supported, as well.

>[!CAUTION]
>
>The `cifproductfield` component requires the `cif.shell.picker` clientlib. To add a clientlib to a dialog, you can use the extraClientlibs property.
>[!CAUTION]
>
>Starting with CIF Core Components version 2.0.0 the support for `id` was removed and replaced with `uid`. Adobe recommends using `sku` or `slug` as product identifier. Adobe continues to support `id` only for projects using CIF Core Components version 1.x.

A full working example of the `cifproductfield` can be found in the [CIF Core Components](https://github.com/adobe/aem-core-cif-components/blob/master/ui.apps/src/main/content/jcr_root/apps/core/cif/components/commerce/productteaser/v1/productteaser/_cq_dialog/.content.xml) project. See also [Customizing Dialogs](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/customizing.html#customizing-dialogs) of the AEM Core Components documentation.

## Category Picker {#category-picker}

The category picker can be used in a component dialog as well in a similar way like the product picker.

The following snippet can be used in a cq:dialog configuration:

```xml
<category jcr:primaryType="nt:unstructured" 
    sling:resourceType="commerce/gui/components/common/cifcategoryfield" 
    fieldLabel="Category" 
    name="./categoryId" 
    selectionId="uid" />
```

The category picker field supports the following optional properties:

- selectionId(id, uid, slug, urlPath, idAndUrlPath _(deprecated)_, uidAndUrlPath _(deprecated)_) - lets you choose the category attribute to be returned by the picker (default = id).
- multiple (true, false) - enable the selection of one or multiple categories (default = false)

Also, standard dialog field properties like `name`, `fieldLabel`, or `fieldDescription` are supported as well.

>[!CAUTION]
>
>Same as the `cifproductfield` component the `cifcategoryfield` component also requires the `cif.shell.picker` clientlib. To add a clientlib to a dialog, you can use the `extraClientlibs` property. See [Customizing Dialogs](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/developing/customizing.html#customizing-dialogs) of the AEM Core Components documentation.
>[!CAUTION]
>
>Starting with CIF Core Components version 2.0.0 the support for `id` was removed and replaced with `uid`. Adobe recommends using `uid` or `urlPath` as category identifier. Adobe continues to support `id` & `idAndUrlPath` only for projects using CIF Core Components version 1.x.

A full working example of the `cifcategoryfield` can be found in the [CIF Core Components](https://github.com/adobe/aem-core-cif-components/blob/master/ui.apps/src/main/content/jcr_root/apps/core/cif/components/commerce/featuredcategorylist/v1/featuredcategorylist/_cq_dialog/.content.xml) project.
