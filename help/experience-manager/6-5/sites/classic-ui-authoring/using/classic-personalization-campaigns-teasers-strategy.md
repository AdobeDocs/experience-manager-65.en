---
title: Teasers and Strategies
seo-title: Teasers and Strategies
description: Campaigns often use teasers as a mechanism to entice a specific segment of the visitor population through to content focused on their interests. One or more teasers are defined for a specific campaign.
seo-description: Campaigns often use teasers as a mechanism to entice a specific segment of the visitor population through to content focused on their interests. One or more teasers are defined for a specific campaign.
uuid: d8a8337c-7a3d-4d49-9e3d-5731f4636a47
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
discoiquuid: 28703822-6564-407c-befc-2db82e7b7299
index: y
internal: n
snippet: y
---

# Teasers and Strategies{#teasers-and-strategies}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-77F410094CD97C4F0A746C1B@AdobeID)
Last Modified Date: 2017-11-30T05:07:11.642-0500
<p>Delete this page? Teasers are no longer part of 6.3. Deprecated in 6.2.</p>
-->

Campaigns often use teasers as a mechanism to entice a specific segment of the visitor population through to content focused on their interests. One or more teasers are defined for a specific campaign.

>[!NOTE]
>
>The Teaser component has been deprecated in AEM 6.2. Please use the [Target component](/6-5/sites/classic-ui-authoring/using/classic-personalization-content-targeting-touch.md#creatinganofferbyaddingatargetcomponent) instead.

* **Brand pages** are stored within the Campaigns section of the website. A brand contains the individual campaigns.   

* **Campaign pages** are stored within the Campaigns section of the website. Each campaign has an individual page, under which the teaser definitions are held. The container, or overview, page also holds certain information and statistics concerning the individual teaser pages.

Teasers within AEM are comprised of several parts:

* **Teaser pages** are stored under the appropriate campaign page and hold the definitions of the teaser paragraphs available for each specific campaign. These definitions are used when displaying the teaser paragraphs; including content variations, the segment to be used for selecting a variation and boost factor.
* The **Teaser component** is available out of the box and allows you to create an instance of your specific teaser paragraph in a content page. You can drag the teaser component from the sidekick, then specify your teaser definition to create your own teaser paragraph. **Note: **The Teaser component has been deprecated in AEM 6.2. Please use the [Target component](/6-5/sites/classic-ui-authoring/using/classic-personalization-content-targeting-touch.md#creatinganofferbyaddingatargetcomponent) instead.

* **Teaser paragraphs** are actual instances of your teaser within a content page. These entice a segment of visitors through to content focused on their interests.
* Pages that hold the campaign content focused on a specific visitor segment. Usually the teaser paragraphs will lead the visitor to such pages.

### Strategies {#strategies}

When adding a teaser paragraph to a page you need to define the **Strategy**.

This is for the case that several teasers are available for selection as their assigned segments all resolve successfully. The **Strategy** then specifies an extra criteria used to select the teaser shown:

* **Clickstream Score**, is based on the tags and related tag hits held within the visitor's client context (show how often a visitor has clicked on pages containing the respective tag). The hit rates for tags defined on the teaser page are compared.
* **Random**, for "random" selection; uses the random factor generated for a page, this can be seen with the [client context](../../../../6-5/sites/administering/using/client-context.md).

* **First** in the list of resolved segments. The order is that of the teasers within the campaign container page.

The [Boost Factor](../../../../6-5/sites/administering/using/campaign-segmentation.md#boost-factor) of the segment also has an impact on the selection. This is a weighting factor added to a segment definition to increase/decrease the relative likelihood of it being selected.

The process and interrelationships of the various selection criteria are best illustrated with an example (a method that can also be used to ensure that your teasers will reach the required audience).

If the following segments have already been created and assigned their respective Boost Factor:

| Segment |Boost Factor |
|---|---|
| S1 |0 |
| S2 |0 |
| S3 |10 |
| S4 |30 |
| S5 |0 |
| S6 |100 |

And we use the following teaser definitions:

<table border="1" cellpadding="1" cellspacing="0" columns="3" header="none" width="400"> 
 <tbody> 
  <tr> 
   <td>Campaign</td> 
   <td>Teaser</td> 
   <td>Assigned Segment(s)</td> 
   <td>Assigned Tags </td> 
  </tr> 
  <tr> 
   <td>C1</td> 
   <td>T1</td> 
   <td>S1, S2</td> 
   <td>Business, Marketing</td> 
  </tr> 
  <tr> 
   <td>C1</td> 
   <td>T2 </td> 
   <td>S1</td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T3</td> 
   <td>S3, S4</td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T4</td> 
   <td>S2, S5</td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T5</td> 
   <td>S1, S2, S6</td> 
   <td>Marketing</td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T6</td> 
   <td>S6</td> 
   <td>Business<br /> </td> 
  </tr> 
 </tbody> 
</table>

Then if we apply this to a visitor where:

* **S1**, **S2** and **S6** resolve successfully

* the tag **marketing** has 3 hits
* the tag **business** has 6 hits

We can see the resulting:

* match success - do any of the segments assigned to the teaser resolve successfully for the current visitor?
* boost factor - the highest boost factor of all applicable segments
* clickstream score - the accumulative total for all applicable tag hits

that are calculated before applying the appropriate strategy:

<table border="1" cellpadding="1" cellspacing="0" columns="3" header="none" width="400"> 
 <tbody> 
  <tr> 
   <td>Campaign</td> 
   <td>Teaser</td> 
   <td>Assigned Segment(s)</td> 
   <td>Tags </td> 
   <td>Successful Match?</td> 
   <td>Resulting Boost Factor</td> 
   <td>Resulting Clickstream Score </td> 
  </tr> 
  <tr> 
   <td>C1</td> 
   <td>T1</td> 
   <td>S1, S2</td> 
   <td>Business, Marketing</td> 
   <td>Yes</td> 
   <td>0</td> 
   <td>9</td> 
  </tr> 
  <tr> 
   <td>C1</td> 
   <td>T2 </td> 
   <td>S1</td> 
   <td><br /> </td> 
   <td>Yes</td> 
   <td>0</td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T3</td> 
   <td>S3, S4</td> 
   <td><br /> </td> 
   <td>No</td> 
   <td><br /> </td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T4</td> 
   <td>S2, S5</td> 
   <td><br /> </td> 
   <td>Yes<br /> </td> 
   <td>0<br /> </td> 
   <td><br /> </td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T5</td> 
   <td>S1, S2, S6</td> 
   <td>Marketing</td> 
   <td>Yes</td> 
   <td>100</td> 
   <td>3</td> 
  </tr> 
  <tr> 
   <td>C1 </td> 
   <td>T6</td> 
   <td>S6</td> 
   <td>Business</td> 
   <td>Yes</td> 
   <td>100</td> 
   <td>6 </td> 
  </tr> 
 </tbody> 
</table>

These values are used to determined the teaser(s) that the visitor will see, depending on the **Strategy** applied to the teaser paragraph:

<table border="1" cellpadding="1" cellspacing="0" columns="3" header="none" width="400"> 
 <tbody> 
  <tr> 
   <td>Strategy</td> 
   <td>Resulting Teaser</td> 
   <td>Comments</td> 
  </tr> 
  <tr> 
   <td>First</td> 
   <td>T5</td> 
   <td>Only T5 and T6 are considered as their segments all resolve <i>and</i> they have the highest boost factor. The list returned is in the order T5, T6; so T5 is selected and shown.</td> 
  </tr> 
  <tr> 
   <td>Random</td> 
   <td>T5 or T6</td> 
   <td>Both teasers have segments that all resolve and the same boost factor. Therefore, the two teasers are shown in equal proportion.</td> 
  </tr> 
  <tr> 
   <td>Clickstream Score</td> 
   <td>T6</td> 
   <td><p>Segments for T1, T4, T5 and T6 all resolve for the visitor. The higher boost factors of T5 and T6 then excludes T1 and T4. Finally the higher Clickstream Score of T6 result in this being selected.</p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>If, after the above resolution techniques, multiple teasers are available for selection, then an internal selection (random) will select a single teaser for display.
>
>For example, if the strategy was Clickstream Score and T5 had the same Clickstream Score as T6 (i.e. 6 instead of 3) then the internal selection (random) would be used to select one of these two.

Teaser Pages / Paragraphs are used to steer specific visitor segments to content that is focused on their interests. They can present a range of options for the visitor to choose from, or show only one teaser paragraph that is based on the specific visitor segment; for example, the teaser paragraph shown may be dependent on the age of the visitor.

Typically a teaser page is a temporary action that will last for a specific period of time, until it is replaced by the next teaser page.

After creating your brand and campaign you can create and set up your teaser experience.

<!--
Comment Type: draft

<h3>Creating a Teaser Experience</h3>
-->

<!--
Comment Type: draft

<ol>
<li><p>Select your new campaign in the left pane, or double-click it in the right pane.<br /> </p> </li>
<li><p>Select the list view, using the icon:<br /> </p> <img donotlocalize="true" imagerotate="0" src="do-not-localize/mcm_icon_listview.png" /></li>
<li> <p>Click <strong>New...</strong><br /> </p>
<draft-comment color="yellow" lastmodifiedby="aheimoz" lastmodifieddate="2017-11-30T05:07:12.159-0500" prevfirstname="Alison" prevlastname="Heimoz" type="remark">
<p>Teaser Page or Experience?</p>
<p>What are the implications of using the one or the other?</p>
<p>What about all the other options available here - need more detailed docu albeit not in this procedure:</p>
<p>- Blank Canvas page<br /> - Experience<br /> - Teaser Page<br /> - Offer<br /> - Voucher<br /> - Promotion<br /> - Teaser Page<br /> - Geometrixx Newsletter<br /> - Voucher<br /> - Promotion</p>
<p>What can you nest within what and why?</p>
</draft-comment> <p>You can specify the <strong>Title</strong>, <strong>Name</strong> and type of experience to be created; in this case, <strong>Teaser Page</strong>.<br /> </p> <img imagerotate="0" src="assets/chlimage_1.png" /></li>
<li><p>Click <strong>Create</strong>.<br /> </p> </li>
<li><p>A new dialog will open immediately. Here you can use the various tabs to enter properties for the teaser.<br /> </p> <img imagerotate="0" src="assets/chlimage_1-1.png" />
<draft-comment color="yellow" lastmodifiedby="aheimoz" lastmodifieddate="2017-11-30T05:07:12.298-0500" prevfirstname="Alison" prevlastname="Heimoz" type="remark">
<p>exactly how do identifiers work for the location?</p>
</draft-comment>
<ul>
<li><strong>Title</strong><br /> A title for the teaser.</li>
<li><strong>Tags/Keywords</strong><br /> Tags and/or keywords that can be assigned to the teaser.</li>
<li><strong>Description</strong><br /> A description for the teaser.</li>
<li><strong>Location</strong><br /> Where the teaser is displayed; path or identifier.<br /> </li>
<li><strong>On/Off Time</strong><br /> If required, the on and off times for when the teaser can be used.</li>
<li><strong>Segments</strong><br /> The visitor segment(s) with which the teaser can be used.</li>
<li><strong>Image</strong><br /> An image to identify the teaser.</li>
</ul> <p>These can be updated at a later stage from the <strong>Properties...</strong> dialog.<br /> </p> </li>
<li><p>Click <strong>OK</strong> to save.<br /> </p> </li>
</ol>
-->

<!--
Comment Type: draft

<h3>Adding Content to your Teaser</h3>
-->

<!--
Comment Type: draft

<p>To add content to your teaser:</p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Select your campaign, then from the list view, select your teaser experience and click <strong>Edit</strong>. The teaser page will open.<br /> </p> </li>
<li><p>Use the sidekick to add components, then add your content to the teaser page:<br /> </p> <img imagerotate="0" src="assets/chlimage_1-2.png" />
<note type="caution">
<p>When adding content to a teaser page (shown above) <strong>do not enable targeting</strong> on any of the components within this page (that is, do not select <strong>Target</strong> from the context menu when hovering over a component on this page). </p>
<p>Targeting is enabled on a teaser (or indeed any component) <strong>on the page where it is displayed to visitors</strong>, not here in the page used for editing.</p>
</note></li>
</ol>
-->

### Creating a Touchpoint for your Teaser {#creating-a-touchpoint-for-your-teaser}

>[!NOTE]
>
>The Teaser component has been deprecated in AEM 6.2. Please use the [Target component](/6-5/sites/classic-ui-authoring/using/classic-personalization-content-targeting-touch.md#creatinganofferbyaddingatargetcomponent) instead.

<!--
Comment Type: draft

<p>After creating your teaser you need to create a touchpoint (where the visitor will see and access the teaser) to lead to your campaign.</p>
<p>You do this by strategically placing the teaser paragraph within your content:</p>
-->

1. Navigate to the content page where you want to place the teaser paragraph that will lead to your campaign page.
1. Add a **Teaser** component (available in the **Personalization** section of sidekick) in the required position. When first created it will show that the campaign path is not yet configured:

   ![](assets/chlimage_1-3.png)

1. Edit the teaser component to add the:

    * **Campaign Path** 
      Path to the campaign page that holds the individual teaser page; segments determine exactly which teaser is shown.
    
    * ** [Strategy](/6-5/sites/classic-ui-authoring/using/classic-personalization-campaigns.md#strategies)** 
      Method used for selection when multiple segments resolve successfully.

   ![](assets/chlimage_1-4.png)

1. Click **OK** to save. Depending on the segments you have set on the teaser and the profile of the user you are currently logged in as, the appropriate content will be displayed:

   ![](assets/chlimage_1-5.png)

1. Mouse over the teaser paragraph to reveal the question mark icon (bottom right corner of the component). Click this to view the segments applied and whether they currently resolve.

   ![](assets/chlimage_1-6.png)

### Teaser Overview {#teaser-overview}

As well as the campaign view in the MCM, the campaign page also gives information about the teasers connected to it:

1. From the **Websites** console, open the campaign page; for example:

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2017-11-30T05:07:12.957-0500
   <p>Open the campaign page or the experience page?</p>
   <p>Either / or / both ?<br /> </p>
   -->

   `` `http://localhost:4502/content/campaigns/geometrixx-outdoors/storefront/summer.html`

   This shows an overview of the teaser definitions and viewing statistics:

   ![](assets/chlimage_1-7.png)

