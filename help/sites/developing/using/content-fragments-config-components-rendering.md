---
title: Content Fragments Configuring Components for Rendering
seo-title: Content Fragments Configuring Components for Rendering
description: Content Fragments Configuring Components for Rendering
seo-description: Content Fragments Configuring Components for Rendering
uuid: 3f5aaf36-e6a7-4a3c-b305-e35ebcc98d0d
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
discoiquuid: 2aef9048-9d6e-4f5d-b443-5e73f8066d76

---

# Content Fragments Configuring Components for Rendering{#content-fragments-configuring-components-for-rendering}

There are several [advanced services](../../../sites/developing/using/content-fragments-config-components-rendering.md#definition-of-advanced-services-that-need-configuration) related to the rendering of content fragments. To use these services, the resource types of such components must make themselves known to the content fragments framework.

This is done by configuring the [OSGi Service - Content Fragment Component Configuration](#osgi-service-content-fragment-component-configuration).

>[!CAUTION]
>
>If you do not need the [advanced services](../../../sites/developing/using/content-fragments-config-components-rendering.md#definition-of-advanced-services-that-need-configuration) described below, you can ignore this configuration.

>[!CAUTION]
>
>When you are extending or using the out-of-the-box component(s), it is not recommended to change the configuration.

>[!CAUTION]
>
>You can write a component from scratch that uses the Content Fragments API only, with no advanced services. However, in such a case, you will have to develop your component so that it handles the appropriate processing.
>
>Therefore, it is recommended to use the core components.

## Definition of Advanced Services that need Configuration {#definition-of-advanced-services-that-need-configuration}

The services that require the registration of a component are:

* Determining dependencies correctly during publication (i.e. ensure that fragments & models can be automatically published with a page if they have changed since last publication).
* Support for content fragments in full text search.
* The management/handling of *in-between content.*
* The management/handling of *mixed media assets.*
* Dispatcher flush for referenced fragments (if a page containing a fragment is re-published).
* Using paragraph-based rendering.

If you need one or more of these features, then (typically) it is easier to use the out-of-the-box functionality, instead of developing it from scratch.

## OSGi Service - Content Fragment Component Configuration {#osgi-service-content-fragment-component-configuration}

The configuration needs to be bound to the OSGi service **Content Fragment Component Configuration**:

`com.adobe.cq.dam.cfm.impl.component.ComponentConfigImpl`

>[!NOTE]
>
>See [Configuring OSGi](/sites/deploying/using/configuring-osgi.md) for further details.

For example:

![](assets/cfm-01.png)

The OSGi configuration is:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td>Label</td> 
   <td>OSGi Configuration<br /> </td> 
   <td>Description</td> 
  </tr> 
  <tr> 
   <td><strong>Resource type</strong></td> 
   <td><span class="code">dam.cfm.component.resourceType</span></td> 
   <td>The resource type to register; e.g. <br /> <p><span class="cmp-examples-demo__property-value"><span class="code">core/wcm/components/contentfragment/v1/contentfragment</span></span></p> </td> 
  </tr> 
  <tr> 
   <td><strong>Reference property</strong></td> 
   <td><span class="code">dam.cfm.component.fileReferenceProp</span></td> 
   <td>The name of the property that contains the reference to the fragment; e.g. <span class="code">fragmentPath</span> or <span class="code">fileReference</span></td> 
  </tr> 
  <tr> 
   <td><strong>Element(s) property</strong></td> 
   <td><span class="code">dam.cfm.component.elementsProp</span></td> 
   <td>The name of the property that contains the name(s) of the element(s) to render; e.g.<span class="code">elementName</span></td> 
  </tr> 
  <tr> 
   <td><strong>Variation property</strong><br /> </td> 
   <td><span class="code">dam.cfm.component.variationProp</span></td> 
   <td>The name of the property that contains the name of the variation to render; e.g.<span class="code">variationName</span></td> 
  </tr> 
 </tbody> 
</table>

For some functionality (e.g. to render only a paragraph range) you will have to adhere to some conventions:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td>Property Name</td> 
   <td>Description</td> 
  </tr> 
  <tr> 
   <td><span class="code">paragraphRange</span></td> 
   <td><p>A string property that defines the range of paragraphs to be output if in <em>single element render mode</em>.</p> <p>Format:</p> 
    <ul> 
     <li><span class="code">1</span> or <span class="code">1-3</span> or <span class="code">1-3;6;7-8</span> or <span class="code">*-3;5-*</span></li> 
     <li>only evaluated if <span class="code">paragraphScope</span> is set to <span class="code">range</span></li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><span class="code">paragraphScope</span></td> 
   <td><p>A string property that defines how paragraphs are to be output if in <em>single element render mode</em>.</p> <p>Values:</p> 
    <ul> 
     <li><span class="code">all</span> : to render all paragraphs</li> 
     <li><span class="code">range</span> : to render the range of paragraphs provided by <span class="code">paragraphRange</span></li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><span class="code">paragraphHeadings</span></td> 
   <td>A boolean property that defines if headings (for example, <span class="code">h1</span>, <span class="code">h2</span>, <span class="code">h3</span>) are counted as paragraphs (<span class="code">true</span>) or not (<span class="code">false</span>)</td> 
  </tr> 
 </tbody> 
</table>

>[!CAUTION]
>
>This may change in later 6.5 milestones.

## Example {#example}

As an example, see the following (on an out-of-the-box AEM instance):

```
/apps/core/wcm/config/com.adobe.cq.dam.cfm.impl.component.ComponentConfigImpl-core-comp-v1.config  
```

This contains:

```
dam.cfm.component.resourceType="core/wcm/components/contentfragment/v1/contentfragment"
dam.cfm.component.fileReferenceProp="fragmentPath"
dam.cfm.component.elementsProp="elementName"
dam.cfm.component.variationProp="variationName"
```

