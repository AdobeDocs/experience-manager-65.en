---
title: Personalization
description: Learn about personalization in Adobe Experience Manager to provide the user with a tailor-made environment displaying dynamic content.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
exl-id: 3a550a33-b54b-4217-b9a6-b5a7971276ee
solution: Experience Manager, Experience Manager Sites
feature: Administering,Personalization
role: Admin
---
# Personalization {#personalization}

## What is Personalization? {#what-is-personalization}

There is an ever-increasing volume of content available today, be it on internet, extranet, or intranet websites.

Personalization centers on providing the user with a tailor-made environment displaying dynamic content that is selected according to their specific needs; be this on the basis of predefined profiles, user selection, or interactive user behavior.

There are three main elements involved in personalization:

### Users {#users}

* Have profiles, both individual and group. These profiles contain characteristics (such as job description, location, interests) which can be used to personalize the content they can see.
* Take actions. These can then be analyzed and matched against behavior rules to tailor the content they see.

### Content {#content}

* Is what the user wants to see. Preferably content of interest, and use, to them for fulfilling their tasks.
* Can be categorized, and therefore made available to users according to predefined rules.
* Must be dynamic.

In other words, the content must, in some way, be dependent upon the user. If every user sees the same content, then personalization is redundant.

### Rules {#rules}

* Define how personalization actually happens - which content the user can see, and when.

Personalization can be either:

#### Explicit {#explicit}

* Customization: the user makes selections from a choice of content sources.

#### Implicit {#implicit}

* Rules based: business managers define specific rules for actions based upon specific profiles and/or behavior.
* Simple filtering: selections are made on the basis of predefined profiles at user and/or group level.
* Collaborative/recommendation filtering: user behavior is registered according to predefined rules. These rules are based on behavior observed with like-minded individuals. The information collected is used to tailor the information displayed to the user, particularly in the form of recommendations.

## How and When can Personalization be Used? {#how-and-when-can-personalization-be-used}

Personalization can be used in many cases, for example:

### Intranet Pages {#intranet-pages}

* Content can be proffered based on the location, department, and/or role of a user - already defined within an internal network.
* Dependent on the choice available, the user can make further selections.

### Specific, Limited, Target User Groups - Extranets {#extranets}

* Users require a login for authorization; this will be linked to a profile providing information required for personalization; possibly details such as their location, relationship to the product, usage history, budgeting responsibilities, and so on.
* Such instances can range over sites such as:
* Companies which provide websites to a highly specialized section of their market for example, a pharmaceutical company providing a specialized website for physicians.
* Companies which provide websites allowing their customer to view current account and billing information; for example, telephone providers.

### Sales and Distribution Website {#sales-site}

* Sales and distribution websites, such as Amazon, can combine a user profile, the user's sales history and their browsing history to make suggestions as to what might interest the user next.

### Search Websites {#search-site}

* Many of the major search engine websites have very powerful analytical tools which record user behavior, the search terms they use and the websites they actually visit. This is then used to customize the content provided - particularly with regard to displaying advertisements.

### Strengths of Personalization and Points to Consider {#strengths-of-personalization-and-points-to-consider}

The following are reasons why personalization should be used:

* A user can experience a comfortable, focused website.
* Personalization can be used to automatically propagate access to the latest version of content.
* Social collaboration features are available for users to communicate with each other, as they can be identified by their profiles.
* A user can be provided with the content they need to fulfill a particular task. Within a company's intranet this can provide an invaluable tool for disseminating information.
* A user can be provided with the content they need/want, thus reducing the time they need to perform search operations.
* The content provider can steer the content to be seen by specific categories of users.
* Rules can be defined to deliver content based on combinations of both user characteristics and behavior. This provides a sophisticated mechanism for personalizing their web-experience.

When using personalization, consider the following:

#### Performance {#performance}

* Naturally the extra analysis and evaluation has an impact on performance. However, the methods used are highly sophisticated and can be optimized to minimize the impact.

#### Authorization {#authorization}

* Personalization requires a login mechanism as the website must be able to identify the user.

#### Caching {#caching}

* Caching is an aspect which the user will see in terms of performance and accuracy - how quickly does the website deliver personalized content, and is it always current.
* Caching is a key consideration when configuring personalization and time must be taken to ensure that the correct implementation is used.

>[!TIP]
>
>Personalization's effect on performance and related caching topics are discussed further in the document [Performance Optimization.](/help/sites-deploying/configuring-performance.md)

#### Accuracy of Rules {#accuracy}

* Personalization realized by tracking the user's behavior, or setting rules based on the user's profile, must be accurate and logical.
* There is nothing more frustrating to the user than having content forced upon, or denied to, them because of the inaccurate logic of a rule.
* Therefore rules must be well thought-out - with the user's requirements in the foreground. This can take much effort, and is not to be under-estimated; defining the business rules often outweighs the technical effort when implementing personalization.

#### When to Use {#when-to-use}

* Like many features on the web, personalization should be used with care. Will its use really benefit the user? should always be the first consideration - or whether the desired goal can be achieved with less effort by another method. Personalization can run the risk of being a feature that users configure once (to see how it works) and only once - as it brings them no real advantages.
* Personalization is only meaningful when the content is dynamic - dependent on the user in some way. If all users see the same content, then the personalization is redundant.

#### Confidentiality {#confidentiality}

* Many users are concerned about Data Protection and Security. In particular concerning data retrieved when tracking their behavior when surfing the web.

## Personalization and Access {#personalization-and-access}

Personalization should be considered separately from access control, but they do interrelate.

Personalization itself does not create any form of access control. It is simply a method of steering what the user sees; it does not restrict the user from accessing other content and as with any content, they need to have the correct access controls already assigned.

However, access control can be used to create a form of personalization. If you allow or deny a user access to content, this inevitably affects the choice of content that they have available - thus personalizing their web-experience.

## Components available for Personalization {#components-available-for-personalization}

Various components are provided with AEM for personalization. Some allow users to log in and edit their profiles, others (like My Gadgets) allow the users to configure a specific page:

| Title in Sidekick |Purpose |
|---|---|
| Checked Password Field |Requests password and confirmation of password. |
| Combined Sign-in Sign-up |Allows the user to either sign in to an existing account, or to sign up for a new account. |
| Forms Address Field |A complex field allowing the input of an international address. |
| Forms Begin |Starts a form definition |
| Forms Captcha |A field consisting of an alphanumeric word that refreshes automatically. The captcha component protects websites against bots. |
| Forms Checkbox Group |Multiple items organized into a list and preceded by check boxes. Users can select multiple check boxes. |
| Forms Dropdown List |Multiple items organized into a drop-down list. The Multi Selectable switch specifies if several elements can be selected from the list. |
| Forms End |Terminates the form definition. |
| Forms File Upload |An upload element that allows the user to upload a file to the server. |
| Forms Hidden Field |This field is not displayed to the user. It can be used to transport a value to the client and back to the server. This field should have no constraints. |
| Forms Image Button |An additional submit button for the form that is rendered as an image. |
| Forms Password Field |Same as text field but only a single line is allowed and the text input from the user is not visible in the field. |
| Forms Radio Group |Multiple items organized into a list preceded by a radio button. Users must select only one radio button. |
| Forms Submit Button |An additional submit button for the form where the title is displayed as text on the button. |
| Forms Text Field |Text field that allows users to enter information. |
| My Gadgets |Lets you include one of a selection of gadgets available. |
| Profile Avatar Photo |Allows input of an Avatar Photo. |
| Profile Detailed Name |Input of name details, including elements such as title, middle name and suffix if necessary. |
| Profile Display Name |Name to be displayed. |
| Profile E-mail |Input of an e-mail address. |
| Profile Gender |Allows input of the gender. |
| Profile Primary Phone Number |Allows input of a telephone number. |
| Profile Primary URL |Allows input of a URL. |
| Profile General Text property |Profile properties. |
| Sign-in |Lets you submit a username and password when logging in. |
| Sign out |Indicates the user currently logged in, and gives you a link to log out. |
| Tag Cloud |A tag cloud to show a graphically presented selection of tags within your website |
| Teaser |A piece of content (usually an image) displayed on a main page to "tease" users into accessing the underlying content. |

## Personalization and Community Content {#personalization-and-community-content}

Community features such as blogs, forums and calendars result in the creation of community content, commonly referred to as user generated content (UGC). When UGC is entered in a publish environment consisting of multiple AEM instances (a [publish farm](/help/communities/topologies.md)), one major issue has been how to synchronize UGC across all instances.

With [AEM Communities 6.1](/help/communities/overview.md) extension, this issue is solved by using a [common store for UGC](/help/communities/working-with-srp.md). In regards, to personalization, Communities includes [Social Login](/help/communities/social-login.md) - the ability to provide the option for site visitors to sign in with Facebook and Twitter.

Without Communities extension, various methods to explore for addressing the issue of UGC consistency are :

* Synchronize the multiple publish instances when necessary
* Send the UGC from the publish instance to the author environment, from where it can be published in a manner similar to publishing page content

The method used to achieve UGC consistency across a publish environment consisting of multiple publish instances should be carefully designed and tested for performance and consistency.
