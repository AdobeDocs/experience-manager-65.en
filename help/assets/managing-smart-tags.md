---
title: Managing Smart Tags
seo-title: Managing Smart Tags
description: null
seo-description: null
uuid: fd3eedf0-f222-45bf-aac7-90da6b7b7087
contentOwner: asgupta
discoiquuid: 3394b56a-3054-419b-9547-5740f8c35071
---

# Managing Smart Tags {#managing-smart-tags}

You can curate Smart tags to remove any inaccurate tags that may have been assigned to your brand images so only the most relevant tags are displayed.

Moderating Smart tags also helps refine tag-based searches for images by ensuring that your image appears in search results for the most relevant tags. Essentially, it helps eliminate the chances of unrelated images from showing up in search results.

You can also assign a higher rank to a tag to increase its relevence with respect to an image. Promoting a tag for an image increases the chances of the image appearing in search results when a search is performed based on the particular tag.

1. In the OmniSearch box, search for assets based on a tag.
1. Inspect the search results to identify an image that you don't find relevant to your search.
1. Select the image, and then click/tap the **[!UICONTROL Manage Tags]** icon from the toolbar.
1. From the **[!UICONTROL Manage Tags]** page, inspect the tags. If you don't want the image to be searched based on a specific tag, select the tag and then click/tap the **[!UICONTROL Delete]** icon from the toolbar. Alternatively, click/tap the (**[!UICONTROL X]**) symbol that appears beside the label.
1. To assign a higher rank to a tag, select the tag and click/tap the **[!UICONTROL Promote]** icon from the toolbar. The tag you promote, is moved to the **[!UICONTROL Tags]** section.
1. Click/tap **[!UICONTROL Save]**, and then click/tap **[!UICONTROL OK]** to close the Success dialog.
1. Navigate to the properties page for the image. Observe that the tag you promoted is assigned a high relevance and, therefore, appears higher in the search results.

## Understand AEM search results with smart tags {#understand-search-results-with-smart-tags}

By default, AEM search combines the search terms with an `AND` clause. Using smart tags does not change this default behavior. Using smart tags adds an additional `OR` clause to find any of the search terms in the applies smart tags. For example, consider searching for `woman running`. Assets with just `woman` or just `running` keyword in the metadata do not appear in the search results by default. However, an asset tagged with either `woman` or `running` using smart taggs appears in such a search query. So the search results are a combination of,

* assets with both keywords, `woman` and `running` in the metadata.
* assets smart tagged with either of the keywords.

The search results that match all search terms in metadata fields are displayed first, followed by the search results that match any of the search terms in the smart tags. In the above example, the approximate order of display of search results is:

1. matches of `woman running` in the various metadata fields.
1. matches of `woman running` in smart tags.
1. matches of `woman` or of `running` in smart tags.
