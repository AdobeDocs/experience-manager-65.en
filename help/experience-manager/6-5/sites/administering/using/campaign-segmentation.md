---
title: Configuring Segmentation
seo-title: Configuring Segmentation
description: Learn how to configure segmentation for AEM Campaign.
seo-description: Learn how to configure segmentation for AEM Campaign.
uuid: 99e5a6b2-2d50-46a7-a76b-4c45507697bb
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
discoiquuid: 3cb18ec3-f3ba-4990-8848-e10271501ce1
index: y
internal: n
snippet: y
---

# Configuring Segmentation{#configuring-segmentation}

<!--
Comment Type: remark
Last Modified By: Alva Ware-Bevacqui (alvawb)
Last Modified Date: 2018-03-12T05:08:10.142-0400
<p>Segmentation concepts are split. In new organization, maybe this makes sense (although I think it needs a reorg) - currently under campaigns and administering.</p>
-->

>[!NOTE]
>
>This document covers the configuration of segmentation as used with the Client Context. To configure segments with ContextHub using the touch UI, please see [Configuring Segmentation with ContextHub](/6-5/sites/administering/using/segmentation.md).

Segmentation is a key consideration when creating a campaign. See [Segmentation glossary](/6-5/sites/authoring/using/segmentation-overview.md) for information on how segmentation works and key terms.

Depending on the information you have already collected about your site visitors and the goals you want to achieve, you will need to define the segments and strategies needed for your targeted content.

These segments are then used to provide a visitor with specifically targeted content. This content is maintained in the [Campaigns](/6-5/sites/classic-ui-authoring/using/classic-personalization-campaigns.md) section of the website. Teaser pages defined here can be included as teaser paragraphs on any page and define which visitor segment the specialized content is applicable for.

AEM allows you to easily create and update segments, teasers, and campaigns. It also allows you to verify the results of your definitions.

The **Segment Editor** allows you to easily define a segment:

![](assets/segmenteditor.png)

You can **Edit** each segment to specify a **Title**, **Description** and **Boost** factor. Using the sidekick you can add **AND** and **OR** containers to define the **Segment Logic**, then add the required **Segment Traits** to define the selection criteria.

#### Boost Factor {#boost-factor}

Each segment has a **Boost** parameter that is used as a weighting factor; a higher number indicates that the segment will be selected in preference to a segment with a lower number.

* Minimum value: `0`
* Maximum value: `1000000`

#### Segment Logic {#segment-logic}

The following logic containers are available out-of-the-box and allow you to construct the logic of your segment selection. They can be dragged from the sidekick to the editor:

<table border="1" cellpadding="1" cellspacing="0" columns="3" header="none" width="400"> 
 <tbody> 
  <tr> 
   <td width="125"> AND Container<br /> </td> 
   <td width="400"> The boolean AND operator.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> OR Container<br /> </td> 
   <td width="400"> The boolean OR operator.</td> 
  </tr> 
 </tbody> 
</table>

#### Segment Traits {#segment-traits}

The following segment traits are available out-of-the-box; they can be dragged from the sidekick to the editor:

<table border="1" cellpadding="1" cellspacing="0" columns="3" header="none" width="400"> 
 <tbody> 
  <tr> 
   <td width="125"> IP Range<br /> </td> 
   <td width="400">Defines a range of IP addresses that the visitor can have.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Page Hits<br /> </td> 
   <td width="400">How often the page has been requested. <br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Page Property<br /> </td> 
   <td width="400">Any property of the visited page.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Referral Keywords<br /> </td> 
   <td width="400">Keywords to match with information from the referring website. <br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Script</td> 
   <td width="400">Javascript expression to be evaluated.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Segment Reference <br /> </td> 
   <td width="400">Reference to another segment definition.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> Tag Cloud<br /> </td> 
   <td width="400">Tags to be matched with those from the pages visited.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> User Age<br /> </td> 
   <td width="400">As taken from the user profile.<br /> </td> 
  </tr> 
  <tr> 
   <td width="125"> User Property<br /> </td> 
   <td width="400">Any other information that is available in the user profile. </td> 
  </tr> 
 </tbody> 
</table>

You can combine these traits using the boolean operators OR and AND (see [Creating a New Segment](#creating-a-new-segment)) to define the exact scenario for selecting this segment.

When the entire statement evaluates to true then this segment has resolved. In the event of multiple segments being applicable, then the ** [Boost](../../../../6-5/sites/administering/using/campaign-segmentation.md#boost-factor)** factor is also used.

>[!CAUTION]
>
>The segment editor does not check for any circular references. For example, segment A references another segment B, which in turn references segment A. You must ensure that your segments do not contain any circular refernces.

>[!NOTE]
>
>Properties with the **_i18n** suffix are set by a script which is a part of personalization's UI clientlib. All UI-related clientlibs are loaded on author only since the UI is not needed on publish.
>
>Therefore when creating a segment with such properties is it normally necessary to rely on **browserFamily** for instance instead of **browserFamily_i18n**.

<!--
Comment Type: remark
Last Modified By: unknown unknown (fix-path)
Last Modified Date: 2018-03-12T05:08:11.648-0400
<p> ah - need details of all parameters possible for each trait definition; to be supplied by RnD</p>
<p>lt - please create sub-pages for each trait and a placeholder for the segments, we will fill in accordingly</p>
<p>See <a href="/content/docs/en/cq/attic/2014/segmentation_reference.md">Segmentation Reference</a> (for the moment at least).</p>
-->

<!--
Comment Type: remark
Last Modified By: Alva Ware-Bevacqui (alvawb)
Last Modified Date: 2018-03-12T05:08:11.734-0400
<p>ah - check screenshots.</p>
-->

### Creating a New Segment {#creating-a-new-segment}

To define your new segment:

1. In the rail, choose** Tools &gt; Operations &gt; Configuration**.
1. Click on the **Segmentation** page in the left pane, and navigate to the required location.
1. Create a [new page](../../../../6-5/sites/authoring/using/editing-content.md#creatinganewpage) using the **Segment** template.
1. Open the new page to see the segment editor:

   ![](assets/screen_shot_2012-02-02at101726am.png)

1. Use either the sidekick or the context menu (usually right mouse button click, then select **New...** to open the Insert New Component window) to find the segment trait you need. Then drag it to the **Segment Editor** it will appear in the default **AND** container.
1. Double-click on the new trait to edit the specific parameters; for example the mouse position:

   ![](assets/screen_shot_2012-02-02at103135am.png)

1. Click **OK** to save your definition:
1. You can **Edit** the segment definition to give it a **Title**, **Description** and ** [Boost](../../../../6-5/sites/administering/using/campaign-segmentation.md#boost-factor)** factor:

   ![](assets/screen_shot_2012-02-02at103547am.png)

1. Add more traits if required. You can formulate boolean expressions using the **AND Container** and **OR Container** components found under **Segment Logic**. With the segment editor you can delete traits or containers not needed anymore, or drag them to new positions within the statement.

### Using AND and OR Containers {#using-and-and-or-containers}

You can construct complex segments in AEM. It helps to be aware of a few basic points:

* The top level of the definition is always the AND container that is initially created; this cannot be changed, but does not have an effect on the rest of your segment definition.  
* Ensure that the nesting of your container makes sense. The containers can be viewed as the brackets of your boolean expression.

The following example is used to select visitors who are either:

Male and between the ages of 16 and 65

OR

Female and between the ages of 16 and 62

As the main operator is OR you need to start with an **OR Container**. Within this you have 2 AND statements, for each of these you need an **AND Container**, into which you can add the individual traits.

![](assets/screen_shot_2012-02-02at105145am.png) 

## Testing the Application of a Segment {#testing-the-application-of-a-segment}

Once the segment has been defined, potential results can be tested with the help of the ** [Client Context](../../../../6-5/sites/administering/using/client-context.md)**:

1. Select the segment to be tested.
1. Press ** [Ctrl-Alt-C](../../../../6-5/sites/authoring/using/page-authoring.md#keyboardshortcuts)** to open the ** [Client Context](../../../../6-5/sites/administering/using/client-context.md)**, which shows the data that has been collected. For testing purposes you can **Edit** certain values, or **Load** another profile to see the impact there.

1. Depending on the traits defined, the data available for the current page may or may not match the segment definition. The status of the match is shown underneath the definition.

For example, a simple segment definition can be based on the age and gender of the user. Loading a specific profile shows that the segment is successfully resolved:

![](assets/screen_shot_2012-02-02at105926am.png)

Or not:

![](assets/screen_shot_2012-02-02at110019am.png)

>[!NOTE]
>
>All traits are resolved immediately, though most only change on page reload. Changes to mouse position are visible immediately, so useful for testing purposes.

Such tests can also be performed on content pages and in combination with **Teaser** components.

Mouseover on a teaser paragraph will show the segments applied, whether they currently resolve and therefore, why the current teaser instance has been selected:

<!--
Comment Type: remark
Last Modified By: Alva Ware-Bevacqui (alvawb)
Last Modified Date: 2018-03-12T05:08:15.890-0400
<p>could not reproduce the below screenshot with CQ 5.5 load23a.</p>
<p>See bug#40716.<br /> </p>
-->

![](assets/chlimage_1-142.png) 

#### Using Your Segment {#using-your-segment}

Segments are currently used within [Campaigns](/6-5/sites/classic-ui-authoring/using/classic-personalization-campaigns.md). They are used to steer the actual content seen by specific target audiences. See [Understanding Segments](/6-5/sites/authoring/using/segmentation-overview.md) for more information.
