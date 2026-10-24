---
title: Create a Custom Index for Adaptive Form References
description: Learn how to create a tagged Lucene index for adaptive form reference queries in AEM Forms to avoid traversal queries when publishing Experience Fragments.
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, Developer
---

# Create a custom index for adaptive form references {#create-custom-index-for-adaptive-forms-references}

Create a tagged Lucene index to avoid traversal queries when Adobe Experience Manager (AEM) Forms resolves adaptive form references. Without a suitable index, publishing an Experience Fragment that contains an adaptive form reference can produce a `Traversal query (query without index)` warning in the logs.

In AEM Forms 6.5.24.0 and later, the reference query uses the `aemformsAFReferences` index tag. These releases include the query change, but you must create a custom index with that tag. This article shows how to define and deploy the index.

For AEM Forms 6.5 LTS, see [Create a custom index for adaptive form references in AEM Forms 6.5 LTS](https://experienceleague.adobe.com/en/docs/experience-manager-65-lts/content/forms/install-aem-forms/configure-aem-forms/create-custom-index-for-adaptive-forms-references).

## Prerequisites {#prerequisites}

Before you begin, ensure that you have:

* AEM Forms 6.5.24.0 or later, with the corresponding Forms add-on installed.
* Access to create an index under `/oak:index` on the author instance.
* An AEM project with a `ui.apps` module if you deploy the index through a content package, or access to CRXDE Lite for the development alternative.

Test the index in a development or staging environment before deploying it to production. [Building an index can take time on a large repository](/help/sites-deploying/queries-and-indexing.md#configuring-the-indexes).

## Define the custom index {#define-the-custom-index}

Create the index at `/oak:index/customAFReferenceLuceneIndex-1`. You can choose a different index node name, but keep the `aemformsAFReferences` tag unchanged so that the Forms reference query can select the index.

Use the following definition. It indexes `sling:resourceType` on `nt:unstructured` nodes under `/content`.

```json
{
  "jcr:primaryType": "oak:QueryIndexDefinition",
  "selectionPolicy": "tag",
  "compatVersion": 2,
  "includedPaths": ["/content"],
  "queryPaths": ["/content"],
  "tags": ["aemformsAFReferences"],
  "type": "lucene",
  "async": ["async"],
  "evaluatePathRestrictions": true,
  "reindex": false,
  "indexRules": {
    "jcr:primaryType": "nt:unstructured",
    "nt:unstructured": {
      "jcr:primaryType": "nt:unstructured",
      "properties": {
        "jcr:primaryType": "nt:unstructured",
        "resourceType": {
          "jcr:primaryType": "nt:unstructured",
          "propertyIndex": true,
          "name": "sling:resourceType"
        }
      }
    }
  }
}
```

Do not add `analyzed=true`. The reference query uses property restrictions rather than a full-text `contains` condition, so that setting is unnecessary.

## Deploy the index with a content package {#deploy-the-index-with-a-content-package}

Use a content package for production deployments.

1. In your AEM project's `ui.apps` module, create `ui.apps/src/main/content/jcr_root/_oak_index/customAFReferenceLuceneIndex-1/`.
1. Create `.content.xml` in that directory with the following definition:

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <jcr:root xmlns:oak="http://jackrabbit.apache.org/oak/ns/1.0"
             xmlns:jcr="http://www.jcp.org/jcr/1.0"
             xmlns:nt="http://www.jcp.org/jcr/nt/1.0"
             jcr:primaryType="oak:QueryIndexDefinition"
             async="[async]"
             compatVersion="{Long}2"
             evaluatePathRestrictions="{Boolean}true"
             includedPaths="[/content]"
             queryPaths="[/content]"
             reindex="{Boolean}false"
             selectionPolicy="tag"
             tags="[aemformsAFReferences]"
             type="lucene">
       <indexRules jcr:primaryType="nt:unstructured">
           <nt:unstructured jcr:primaryType="nt:unstructured">
               <properties jcr:primaryType="nt:unstructured">
                   <resourceType jcr:primaryType="nt:unstructured"
                                 name="sling:resourceType"
                                 propertyIndex="{Boolean}true"/>
               </properties>
           </nt:unstructured>
       </indexRules>
   </jcr:root>
   ```

1. Add the following filter inside the existing `workspaceFilter` element in `ui.apps/src/main/content/META-INF/vault/filter.xml`. Keep the project's other filters unchanged.

   ```xml
   <filter root="/oak:index/customAFReferenceLuceneIndex-1"/>
   ```

1. Build the project using its existing build configuration and install the resulting content package on the author instance. For package upload and installation instructions, see [Package Manager](/help/sites-administering/package-manager.md#uploading-packages-from-your-file-system).
1. Confirm that `/oak:index/customAFReferenceLuceneIndex-1` exists. Allow asynchronous indexing to complete before checking the query plan.

If you chose a different index name, use that name consistently in the directory, filter, and repository path.

## Create the index with CRXDE Lite {#create-the-index-with-crxde-lite}

Use this alternative in a development environment instead of the content-package method.

Use the following properties when you create the index node:

| Property | Type | Value |
| --- | --- | --- |
| `selectionPolicy` | String | `tag` |
| `compatVersion` | Long | `2` |
| `includedPaths` | `String[]` | `/content` |
| `queryPaths` | `String[]` | `/content` |
| `tags` | `String[]` | `aemformsAFReferences` |
| `type` | String | `lucene` |
| `async` | `String[]` | `async` |
| `evaluatePathRestrictions` | Boolean | `true` |
| `reindex` | Boolean | `false` |

`String[]` means a multi-value String property, even when it contains only one value.

1. Open `http://localhost:4502/crx/de/index.jsp`. Replace the host and port with those of your author instance.
1. Navigate to `/oak:index`. Right-click the node and select [!UICONTROL Create] > [!UICONTROL Create Node].
1. Create `customAFReferenceLuceneIndex-1` with type `oak:QueryIndexDefinition`.
1. Add the properties from the table above to the index node.
1. Under the index node, create the following child-node hierarchy. Set every child node's type to `nt:unstructured`:

   ```text
   indexRules
       nt:unstructured
           properties
               resourceType
   ```

1. On `resourceType`, add `name` (String) with value `sling:resourceType` and `propertyIndex` (Boolean) with value `true`.
1. Select [!UICONTROL Save All] and allow asynchronous indexing to complete.

## Verify that the query uses the index {#verify-that-the-query-uses-the-index}

Check the query plan to confirm that the reference query selects your custom index.

1. Confirm that asynchronous indexing has completed. Use [Index Manager](/help/sites-administering/operations-dashboard.md#the-index-manager) to inspect the index status.
1. Open [!UICONTROL Tools] > [!UICONTROL Operations] > [!UICONTROL Diagnosis] > [!UICONTROL Query Performance] and select [!UICONTROL Explain Query]. Select the XPath query language and enter:

   ```text
   /jcr:root/content//element(*, nt:unstructured)[
     (@sling:resourceType = 'fd/af/components/aemform'
     or jcr:like(@sling:resourceType, '%components/aemformscontainer%')
     or jcr:like(@sling:resourceType, '%components/adaptiveForm/fragment%'))]
   option (index tag aemformsAFReferences)
   ```

1. Select [!UICONTROL Explain]. Confirm that the plan uses `lucene:customAFReferenceLuceneIndex-1` and `/oak:index/customAFReferenceLuceneIndex-1`, or your chosen index name, for the query's branches rather than a traversal plan. For details, see [Explain Query](/help/sites-administering/operations-dashboard.md#explain-query).
1. Repeat the Experience Fragment publishing operation that produced the warning. Check `error.log` for new traversal warnings from `com.adobe.aem.formsndocuments.publish.AssetReferenceProvider.resolvePathsToFindReferences`.

If the plan does not select the custom index, check the tag, the `indexRules` hierarchy, and the `sling:resourceType` property definition against the examples above. For further diagnosis, see [Troubleshooting Oak indexes](/help/sites-deploying/troubleshooting-oak-indexes.md).

## Related tasks {#related-tasks}

For more information about query performance and index configuration, see:

* [Oak queries and indexing](/help/sites-deploying/queries-and-indexing.md)
* [Best practices for queries and indexing](/help/sites-deploying/best-practices-for-queries-and-indexing.md)
* [Troubleshooting slow queries](/help/sites-developing/troubleshooting-slow-queries.md)
