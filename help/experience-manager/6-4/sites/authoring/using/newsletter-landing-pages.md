---
title: Creating an Effective Newsletter Landing Page
seo-title: Creating an Effective Newsletter Landing Page
description: An effective newsletter landing page helps you get as many people as possible to sign up for your newsletter
seo-description: An effective newsletter landing page helps you get as many people as possible to sign up for your newsletter
uuid: 1ff4db6a-ebc2-4487-bf23-e6ffa7842a13
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: personalization
discoiquuid: 98678802-047d-473f-907d-901a42189972
index: y
internal: n
snippet: y
---

# Creating an Effective Newsletter Landing Page{#creating-an-effective-newsletter-landing-page}

An effective newsletter landing page helps you get as many people as possible to sign up for your newsletter (or other email marketing campaign). You can use the information you gather from your newsletter sign ups to get leads.

To create an effective newsletter landing page, you need to do the following:

1. Create a list for the newsletter so people can subscribe to the newsletter.
1. Create the Sign-Up form. When doing this, add a workflow step that automatically adds the person who signs up for the newsletter to your list of leads.
1. Create a Confirmation page that thanks users for signing up and possibly provides them with a promotion.
1. Add teasers.

>[!NOTE]
>
>Adobe is not planning to further enhance this capability (Managing Leads and Lists).  
>Recommendation is to leverage [Adobe Campaign and the integration to AEM](/6-4/sites/administering/using/campaign.md).

See [Creating an Effective Newsletter Landing Page (classic user interface)](/6-4/sites/classic-ui-authoring/using/classic-personalization-campaigns-email-landingpage.md) for more information.

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-77F410094CD97C4F0A746C1B@AdobeID)
Last Modified Date: 2018-02-02T12:33:13.308-0500
<p>Not sure what below can be deleted.</p>
-->

<!--
Comment Type: draft

<h3>Creating a List for the Newsletter</h3>
-->

<!--
Comment Type: draft

<p>Create a list, for example, <strong>Geometrixx Newsletter</strong>, in MCM for the newsletter that people should subscribe to. Creating lists is described in <a href="../../../../6-4/sites/authoring/using/campaigns.md#creatingnewlists">Creating lists</a>.<br /> </p>
<p>The following shows an example of a list:<br /> </p>
-->

<!--
Comment Type: draft

<img imagerotate="0" src="assets/mcm_listcreate.png" />
-->

<!--
Comment Type: draft

<h3>Create a Sign Up Form</h3>
-->

<!--
Comment Type: draft

<p>Create a newsletter registration form that allows users to subscribe to tags. The sample Geometrixx web site provides a newsletter page in the Geometrixx toolbar where you can create your form.</p>
<p>To create your own newsletter form, see information about creating forms in the <a href="/6-4/sites/authoring/using/default-components.md#form">Forms documentation</a>. The newsletter uses the tags from the Tag library. To add additional tags, see <a href="/6-4/sites/authoring/using/tags.md#tagadministration">Tag Administration</a>.</p>
<p>The hidden fields in the following example provide the bare minimum amount of information (e-mail); in addition, you can add more fields later but this will impact the conversion rate.</p>
<p>The following example is a form created at http://localhost:4502/cf#/content/geometrixx/en/toolbar/newsletter.html.</p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Create the form.<br /> </p> <img imagerotate="0" src="assets/mcm_newsletterpage.png" /></li>
<li><p>Click <strong>Edit</strong> in the Form component to configure the form to go to a Thank you page (see <a href="#creating-a-thank-you-page">Creating Thank You Pages</a>).<br /> </p> <img imagerotate="0" src="assets/dc_formstart_thankyou.png" /></li>
<li><p>Set the Form action (that is what will happen when you submit the form) and configure the group to assign registered users to the list you previously created (for example, geometrixx-newsletter).<br /> </p> <img imagerotate="0" src="assets/dc_formstart_thankyouadvanced.png" /></li>
</ol>
-->

<!--
Comment Type: draft

<h3>Creating a Thank You Page</h3>
-->

<!--
Comment Type: draft

<p>When users click <strong>Subscribe Now</strong>, you want a Thank You page to automatically open. Create the Thank You page in the Geometrixx Newsletter page. After creating the Newsletter Form, edit the Form component and add the path to the thank you page.<br /> </p>
-->

<!--
Comment Type: draft

<p>Submitting the request takes the user to a <strong>Thank You</strong> page after which they will receive an email. This Thank You page was created at /content/geometrixx/en/toolbar/newsletter/thank_you.<br /> </p>
-->

<!--
Comment Type: draft

<img imagerotate="0" src="assets/mcm_newsletter_thankyoupage.png" />
-->

<!--
Comment Type: draft

<h3>Adding Teasers</h3>
-->

<!--
Comment Type: draft

<p>Add <a href="../../../../6-4/sites/authoring/using/campaigns.md#teasers">teasers</a> to target specific audiences. For example, you can add teasers to the Thank You page and Newsletter sign up page.<br /> </p>
<p>To add teasers to make an effective newsletter landing page:<br /> </p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Create a teaser paragraph for a sign-up gift. Select <strong>First</strong> as the strategy and include text that informs them what gift they will receive.<br /> </p> <img imagerotate="0" src="assets/dc_teaser_thankyou.png" /></li>
<li><p>Create a teaser paragraph for the Thank You page. Select <strong>First</strong> as the strategy and include text that indicates that the gift is on its way.<br /> </p> <img imagerotate="0" src="assets/chlimage_1-36.png" /></li>
<li><p>Create a campaign with the two teasers -- tag one with business and one untagged.<br /> </p> </li>
</ol>
-->

<!--
Comment Type: draft

<h3>Pushing Content to Subscribers</h3>
-->

<!--
Comment Type: draft

<p>Push any changes to pages through the Newsletter functionality in the MCM. You then push updated content to subscribers.</p>
<p>See <a href="../../../../6-4/sites/authoring/using/campaigns.md#newsletters">Sending Newsletters</a>.</p>
-->

