---
title: Exporting Experience Fragments to Adobe Target
seo-title: Exporting Experience Fragments to Adobe Target
description: Exporting Experience Fragments to Adobe Target
seo-description: Exporting Experience Fragments to Adobe Target
uuid: 909f47d4-483e-421a-997c-a3cffa96be34
contentOwner: carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: b3496bee-13e5-4104-9ff6-754984f28788
index: y
internal: n
snippet: y
---

# Exporting Experience Fragments to Adobe Target{#exporting-experience-fragments-to-adobe-target}

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-04T05:45:58.600-0400
<p>Rename page to "Exporting Experience Fragments to Adobe Target" ?<br /> </p>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-02T01:08:12.246-0400
<p>2019-08-14</p>
<p>BE CAREFUL ABOUT PUBLISHING THE PAGE - THERE ARE NOW CHANGES FOR 6.5.2.0...and 6.5.3.0</p>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-08-28T06:21:38.054-0400
<p>6.5.2.0</p>
-->

<!--
Comment Type: draft

<note type="caution">
<p>Some functionality on this page requires the application of AEM 6.5.2.0.</p>
<p>6.5.2.0:</p>
<ul>
<li>Experience Fragments can be exported to either:
<ul>
<li>the default workspace.</li>
<li>a named workspace, specified in the Cloud Configuration.</li>
</ul> </li>
<li>AEM must be <a href="../../../../6-5/sites/administering/using/integration-ims-adobe-io.md">integrated with Adobe Target using Adobe I/O</a>.</li>
</ul>
<p>AEM 6.5.0.0 and 6.5.1.0:</p>
<ul>
<li>The AEM Experience Fragments are exported into the default workspace of Adobe Target.</li>
<li>AEM must be integrated with Adobe Target according to the instructions under <a href="/6-5/sites/administering/using/target.md">Integrating with Adobe Target</a>.</li>
</ul>
</note>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-08-30T06:46:36.731-0400
<p>6.5.3.0</p>
-->

<!--
Comment Type: draft

<note type="caution">
<p>Some functionality on this page requires the application of AEM 6.5.3.0.</p>
<p>6.5.3.0:</p>
<ul>
<li>Externalizer Domains can now be selected.<br /> </li>
</ul>
<p>6.5.2.0:</p>
<ul>
<li>Experience Fragments can be exported to either:
<ul>
<li>the default workspace.</li>
<li>a named workspace, specified in the Cloud Configuration.</li>
</ul> </li>
<li>AEM must be <a href="../../../../6-5/sites/administering/using/integration-ims-adobe-io.md">integrated with Adobe Target using Adobe I/O</a>.</li>
</ul>
<p>AEM 6.5.0.0 and 6.5.1.0:</p>
<ul>
<li>The AEM Experience Fragments are exported into the default workspace of Adobe Target.</li>
<li>AEM must be integrated with Adobe Target according to the instructions under <a href="/6-5/sites/administering/using/target.md">Integrating with Adobe Target</a>.</li>
</ul>
</note>
-->

You can export [Experience Fragments](../../../../6-5/sites/authoring/using/experience-fragments.md), created in Adobe Experience Manager (AEM), to Adobe Target (Target). They can then be used as offers in Target activities, to test and personalize experiences at scale.

There are three format options available for exporting an Experience Fragment to Adobe Target:

* HTML (default): Support for web and hybrid content delivery  
* JSON: Support for headless content delivery  
* HTML & JSON

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-05T02:52:59.853-0400
<p>Remove for 6.5.2.0</p>
-->

The AEM Experience Fragments are exported to the default workspace in Adobe Target.

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-08-29T02:33:35.782-0400
<p>6.5.2.0</p>
-->

<!--
Comment Type: draft

<p>AEM Experience Fragments can be exported to the default workspace in Adobe Target, or to user-defined workspaces for Adobe Target. This is done via Adobe I/O, for which AEM must be <a href="../../../../6-5/sites/administering/using/integration-ims-adobe-io.md">integrated with Adobe Target using Adobe I/O</a>.</p>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-17T07:00:52.284-0400
<p>6.5.2.0</p>
-->

<!--
Comment Type: draft

<note type="note">
<p>The Adobe Target workspaces do not exist in Adobe Target itself. They are defined and managed in Adobe IMS (Identity Management System), then selected for usage across solutions using Adobe I/O integrations.</p>
</note>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-17T07:21:38.419-0400
<p>6.5.2.0</p>
-->

<!--
Comment Type: draft

<note type="note">
<p>Adobe Target workspaces can be used to allow members of an organization (group) to create and manage offers and activities for this organization only; without giving access to other users. For example, country-specific organizations within a global concern.<br /> </p>
</note>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-02T01:50:45.120-0400
<p>probably not for this page, but the development page - and when the Core Components update on Experience Fragments published<br /> </p>
-->

<!--
Comment Type: draft

<note type="note">
<p>For further information see also:</p>
<ul>
<li><a href="https://www.adobe.io/apis/experiencecloud/target.html">Adobe Target development</a></li>
<li><a href="https://docs.adobe.com/content/help/en/experience-manager-core-components/using/components/experience-fragment.html">Core Components - Experience Fragments</a><br /> </li>
</ul>
</note>
-->

## Prerequisites {#prerequisites}

Various actions are required:

1. You have to integrate AEM with Target. See [Integrating with Adobe Target](/6-5/sites/administering/using/target.md) for more information.

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-05T02:53:17.410-0400
   <p>Remove for 6.5.2.0</p>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-08-28T06:21:28.475-0400
   <p>6.5.2.0</p>
   -->

   <!--
   Comment Type: draft

   <p>You have to <a href="../../../../6-5/sites/administering/using/integration-ims-adobe-io.md">integrate AEM with Adobe Target using Adobe I/O</a>.</p>
   -->

1. Experience Fragments are exported from the AEM author instance, so you need to [Configure the AEM Link Externalizer](../../../../6-5/sites/administering/using/target-requirements.md#configuring-the-aem-link-externalizer) on the author instance to ensure that any references within the Experience Fragment are externalized for web delivery.

   >[!NOTE]
   >
   >For link rewriting not covered by the default, the [Experience Fragment Link Rewriter Provider](../../../../6-5/sites/developing/using/experience-fragments.md#the-experience-fragment-link-rewriter-provider-html) is available. With this, customized rules can be developed for your instance.

## Add the Cloud Configuration {#add-the-cloud-configuration}

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-09-05T02:53:24.530-0400
<p>Remove for 6.5.2.0</p>
-->

Before exporting a fragment you need to add the **Cloud Configuration** for **Adobe Target** to the fragment, or folder. This also enables you to specify the format option(s) to be used for the export.

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-08-22T06:58:16.571-0400
<p>6.5.2.0</p>
-->

<!--
Comment Type: draft

<p>Before exporting a fragment you need to add the <strong>Cloud Configuration</strong> for <strong>Adobe Target</strong> to the fragment, or folder. This also enables you to:</p>
<ul>
<li>specify the format option(s) to be used for the export</li>
<li>select a Target workspace as destination <br /> </li>
</ul>
-->

<!--
Comment Type: remark
Last Modified By: Alison Heimoz (aheimoz)
Last Modified Date: 2019-08-30T06:48:21.507-0400
<p>6.5.3.0</p>
-->

<!--
Comment Type: draft

<p>Before exporting a fragment you need to add the <strong>Cloud Configuration</strong> for <strong>Adobe Target</strong> to the fragment, or folder. This also enables you to:</p>
<ul>
<li>specify the format option(s) to be used for the export</li>
<li>select a Target workspace as destination <br /> </li>
<li>select an externalizer domain for rewriting references in the Experience Fragment (optional)</li>
</ul>
-->

The required options can be selected in **Page Properties** of the required folder and/or fragment; the specification will be inherited as necessary.

1. Navigate to the **Experience Fragments** console.
1. Open **Page Properties** for the appropriate folder or fragment.

   >[!NOTE]
   >
   >If you add the cloud configuration to the Experience Fragment parent folder, the configuration is inherited by all the children.
   >
   >
   >If you add the cloud configuration to the Experience Fragment itself, the configuration is inherited by all varations.

1. Select the **Cloud Services** tab.  

1. Under **Cloud Service Configuration**, select **Adobe Target** from the drop down list.
1. Under **Adobe Target** select:

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-05T02:53:42.544-0400
   <p>Remove for 6.5.2.0</p>
   -->

    * the appropriate configuration
    * the required format option

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-02T01:28:23.783-0400
   <p>there might be a Core Component for XFs coming....</p>
   <p>https://wiki.corp.adobe.com/display/DMSArchitecture/%5BM3%5D+%5BExperience+Fragments%5D+Export+Experience+Fragments+in+JSON+to+Adobe+Target</p>
   <p>This means that the Experience Fragment offer JSON can be customized if needed. The way to do so is to define a custom Experience Fragment component and then annotate how its properties should be exported in the component Sling Model. <br /> </p>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-02T02:11:47.473-0400
   <p>XF CC see:</p>
   <ul>
   <li><a href="https://jira.corp.adobe.com/browse/CQDOC-14840" title="https://jira.corp.adobe.com/browse/CQDOC-14840">https://jira.corp.adobe.com/browse/CQDOC-14840</a></li>
   </ul>
   -->

   <!--
   Comment Type: draft

   <note type="note">
   <p>The JSON format of an Experience Fragment offer can be customized. To do this define a customer Experience Fragment component and then annotate how to export its properties in the component Sling Model.</p>
   <p>See the core component:</p>
   <ul>
   <li><a href="https://docs.adobe.com/content/help/en/experience-manager-core-components/using/components/experience-fragment.html">Core Components - Experience Fragments</a><br /> </li>
   </ul>
   </note>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-08-28T06:35:48.083-0400
   <p>6.5.2.0 </p>
   <ul>
   <li>the externalizer domains field
   <ul>
   <li>was supposed to be in 6.5.1.0, but missed; waiting for confirmation about which SP it will be in</li>
   </ul> </li>
   </ul>
   -->

   <!--
   Comment Type: draft

   <p>Under <strong>Adobe Target</strong> select:</p>
   <ul>
   <li>the appropriate configuration</li>
   <li>the required format option</li>
   <li>an Adobe Target workspace<br /> </li>
   </ul>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-08-30T06:49:33.240-0400
   <p>6.5.3.0 <br /> </p>
   -->

   <!--
   Comment Type: draft

   <p>Under <strong>Adobe Target</strong> select:</p>
   <ul>
   <li>the appropriate configuration</li>
   <li>the required format option</li>
   <li>an Adobe Target workspace<br /> </li>
   <li>if required - the externalizer domain</li>
   </ul>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-08-30T07:36:26.812-0400
   <p>6.5.3.0 <br /> </p>
   -->

   <!--
   Comment Type: draft

   <note type="note">
   <p>The externalizer domain is optional. An AEM externalizer is configured when you want the exported content to point to a specific <em>publish</em> domain. For more details see <a href="../../../../6-5/sites/administering/using/target-requirements.md#configuring-the-aem-link-externalizer">Configuring the AEM Link Externalizer</a>.</p>
   </note>
   -->

   For example, for a folder:

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-05T02:54:36.045-0400
   <p>Remove for 6.5.2.0</p>
   -->

   ![](assets/xf-target-02-b.png) 

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-09-02T02:36:36.300-0400
   <p>6.5.2.0</p>
   <p>screenshot taken with 6.6 L10</p>
   -->

   <!--
   Comment Type: draft

   <img imagerotate="0" src="assets/xf-target-integration-01-b.png" />
   -->

   <!--
   Comment Type: remark
   Last Modified By: Alison Heimoz (aheimoz)
   Last Modified Date: 2019-08-30T06:58:23.155-0400
   <p>6.5.3.0 <br /> </p>
   <p>OK - here's an image from 6.6. L10<br /> </p>
   -->

   <!--
   Comment Type: draft

   <img imagerotate="0" src="assets/xf-target-integration-01.png" />
   -->

1. **Save & Close**.

## Exporting an Experience Fragment to Adobe Target {#exporting-an-experience-fragment-to-adobe-target}

<!--
Comment Type: remark
Last Modified By: Mathias Siegel (msiegel)
Last Modified Date: 2019-08-28T12:58:25.554-0400
<p>6.5.2.0 - any changes needed here?</p>
<p>(msiegel) no, this should be unchanged</p>
-->

>[!CAUTION]
>
>For media assets, such as images, only a reference is exported to Target. The asset itself remains stored in AEM Assets and is delivered from the AEM publish instance.
>
>Due to this the Experience Fragment, with all related assets, needs to be published before exporting to Target.

To export an experience fragment from AEM to Target (after specifying the Cloud Configuration):

1. Navigate to the Experience Fragment console.
1. Select the Experience Fragment you would like to export to target.

   >[!NOTE]
   >
   >It has to be an Experience Fragment Web variation.

1. Tap/click **Export to Adobe Target**.

   >[!NOTE]
   >
   >If the Experience Fragment has already been exported, select **Update in Adobe Target**.

1. Tap/click **Export without publishing** or **Publish** as required.

   >[!NOTE]
   >
   >Selecting** Publish** will publish the experience fragment right away and send it to Target.

1. Tap/click **OK** in the confirmation dialog.

   Your experience fragment should now be in Target.

   >[!NOTE]
   >
   >[Various details](../../../../6-5/sites/authoring/using/experience-fragments.md#details-of-your-experience-fragment) of the export can be seen in **List View** of the console and **Properties**.

   >[!NOTE]
   >
   >When viewing an Experience Fragment in Adobe Target, the *last modified* date that is seen is the date that the fragment was last modified in AEM, not the date that the fragment was last exported to Adobe Target.

>[!NOTE]
>
>Alternatively, you can perform the export from the page editor, using comparable commands in the [Page Information](../../../../6-5/sites/authoring/using/author-environment-tools.md#page-information) menu.

## Using your Experience Fragments in Adobe Target {#using-your-experience-fragments-in-adobe-target}

<!--
Comment Type: remark
Last Modified By: Mathias Siegel (msiegel)
Last Modified Date: 2019-08-28T13:00:32.658-0400
<p>6.5.2.0 - any changes needed here?</p>
<p>(msiegel) - no, this should be unchanged </p>
-->

After performing the preceding tasks, the experience fragment displays on the Offers page in Target. Please have a look at the [specific Target documentation](https://experiencecloud.adobe.com/resources/help/en_US/target/target/aem-experience-fragments.html) to learn about what you can achieve there.

>[!NOTE]
>
>When viewing an Experience Fragment in Adobe Target, the *last modified* date that is seen is the date that the fragment was last modified in AEM, not the date that the fragment was last exported to Adobe Target.

## Deleting an Experience Fragment already exported to Adobe Target {#deleting-an-experience-fragment-already-exported-to-adobe-target}

<!--
Comment Type: remark
Last Modified By: Mathias Siegel (msiegel)
Last Modified Date: 2019-08-28T13:01:10.923-0400
<p>6.5.2.0 - any changes needed here?</p>
<p>(msiegel) - no, this should be unchanged</p>
-->

Deleting an Experience Fragment that has already been exported to Target may cause problems if the fragment is already being used in an offer in Target. Deleting the fragment would render the offer unusable as the fragment content is being delivered by AEM.

To avoid such situations:

* If the Experience Fragment is not being currently used in an activity, AEM allows the user to delete the fragment without a warning message.
* If the Experience Fragment is currently in use by an activity in Target, an error message warns the AEM user about possible consequences that deleting the fragment will have on the activity.

  The error message in AEM does not prohibit the user from (force-)deleting the Experience Fragment. If the Experience Fragment is deleted:

    * The Target offer with AEM Experience Fragment may show undesired behavior

        * The offer will likely still render, as the Experience Fragment HTML was pushed to Target
        * Any references in the Experience Fragment may not work correctly if referenced assets were deleted in AEM as well.

    * Of course, any further modifications to the Experience Fragment are impossible as the Experience Fragment does not exist anymore in AEM.

