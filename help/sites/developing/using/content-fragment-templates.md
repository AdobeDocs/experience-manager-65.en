---
title: Content Fragment Templates
seo-title: Content Fragment Templates
description: Templates are selected when creating a content fragmen and provide the new fragment with the basic structure, element, and variation
seo-description: Templates are selected when creating a content fragmen and provide the new fragment with the basic structure, element, and variation
uuid: d147bac8-b710-40ed-9664-decb5ffcf8e7
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: a975ea2e-5e24-4a96-bd62-63bb98836ff2
docset: aem65

---

# Content Fragment Templates{#content-fragment-templates}

>[!CAUTION]
>
>[Content fragment models](../../../assets/using/content-fragments-models.md) are now recommended for creating all your fragments. 
>
>Content fragment models are used for all examples in We.Retail.

Templates are selected when creating a content fragment. They provide the new fragment with the basic structure, element(s) and variation. The templates used for content fragments are subject to the Granite Configuration Manager.

The out-of-the-box templates are held under:

* `/libs/settings/dam/cfm/templates`

You can create your site-specific templates for content fragments under:

* `/apps/settings/dam/cfm/templates`  
  The location for overlaying out-of-the-box templates or providing customer-specific, application-wide templates that are not intended to be extended/changed at runtime.

* `/conf/global/settings/dam/cfm/templates`  
  The location for instance-wide customer-specific templates that need to be changed at runtime.

The order of precedence is (in descending order) `/conf`, `/apps`, `/libs`.

>[!CAUTION]
>
>You ***must*** not change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
>
>The recommended method for configuration and other changes is:
>
>1. Recreate the required item (i.e. as it exists in `/libs`) under `/apps`  
>
>1. Make any changes within `/apps`
>

The basic structure of a template is held under:

```xml
conf
  global
    settings
      dam
        cfm
          templates
            <template-name>
              ...
```

With the specific structure being:

```xml
+ <template-name>
    - jcr:primaryType
    - jcr:title
    - jcr:description
    - initialAssociatedContent
    - precreateElements
    - version 
    + elements
        - jcr:primaryType
        + <element-name>
            - jcr:primaryType
            - jcr:title 
            - defaultContent 
            - initialContentType 
            - name 
        ... + other element definitions
    + variations
        - jcr:primaryType 
        + <variation-name>
            - jcr:primaryType 
            - jcr:title 
            - jcr:description
            - name 
        ... + other variation definitions 
```

More details about the nodes and their properties are:

* **Template**

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row">Name</th> 
   <th>Type</th> 
   <th>Value</th> 
  </tr> 
  <tr> 
   <td><span class="code">&lt;<em>template-name</em>&gt;</span></td> 
   <td><span class="code">nt:unstructured</span></td> 
   <td>This node is the root for each template. It is mandatory and should have a unique name.</td> 
  </tr> 
  <tr> 
   <td><span class="code">jcr:title</span></td> 
   <td><p><span class="code">String</span></p> <p>required<br /> </p> </td> 
   <td>The title of the template (displayed in the <strong>Create Fragment</strong> wizard).</td> 
  </tr> 
  <tr> 
   <td><span class="code">jcr:description</span></td> 
   <td><p><span class="code">String</span></p> <p>optional</p> </td> 
   <td>A text that describes the purpose of the template (displayed in the <strong>Create Fragment</strong> wizard).</td> 
  </tr> 
  <tr> 
   <td><span class="code">initialAssociatedContent</span></td> 
   <td><p><span class="code">String[]</span></p> <p>optional</p> </td> 
   <td>An array with paths to collections that should be associated to a newly created content fragment by default.</td> 
  </tr> 
  <tr> 
   <td><span class="code">precreateElements</span></td> 
   <td><p><span class="code">Boolean</span></p> <p>required</p> </td> 
   <td><p><span class="code">true</span>, if the subassets representing the elements (except the master element) of the content fragment should be created when the content fragment is created; <em>false</em> if they should be created "on the fly".</p> <p><strong>Note</strong>: currently this parameter has to be set to <span class="code">true</span>.</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">version</span></td> 
   <td><p><span class="code">Long</span></p> <p>required</p> </td> 
   <td><p>Version of the content structure; currently supported:</p> <p><strong>Note</strong>: currently this parameter has to be set to <span class="code">2</span>.<br /> </p> </td> 
  </tr> 
 </tbody> 
</table>

* **Elements**

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row">Name</th> 
   <th>Type</th> 
   <th>Value</th> 
  </tr> 
  <tr> 
   <td><span class="code">elements</span><br /> </td> 
   <td><p><span class="code">nt:unstructured</span></p> <p>required</p> </td> 
   <td><p>Node that contains the definition of the elements of the content fragment. It is mandatory and needs to contain at least one child node for the <strong>Main</strong> element, but can contain [1..n] child nodes.</p> <p>When the template is used the elements sub-branch is copied to the model sub-branch of the fragment.</p> <p>The first element (as viewed in CRXDE Lite) is automatically considered to be the <i>main</i> element; the node name is irrelevant and the node itself does not have a special significance, apart from the fact that it is represented by the main asset; the other elements are handled as sub assets.</p> </td> 
  </tr> 
 </tbody> 
</table>

* **Element Name**

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row">Name</th> 
   <th>Type</th> 
   <th>Value</th> 
  </tr> 
  <tr> 
   <td><span class="code">&lt;<i>element-name</i>&gt;</span></td> 
   <td><span class="code">nt:unstructured</span></td> 
   <td>This node defines an element. It is mandatory and should have a unique name.</td> 
  </tr> 
  <tr> 
   <td><span class="code">jcr:title</span></td> 
   <td><p><span class="code">String</span></p> <p>required</p> </td> 
   <td>The title of the element (displayed in the fragment editor's element selector).</td> 
  </tr> 
  <tr> 
   <td><span class="code">defaultContent</span></td> 
   <td><p><span class="code">String</span></p> <p>optional</p> <p>default: ""</p> </td> 
   <td>Initial content of the element; only used if <span class="code">precreateElements</span><i> = </i><span class="code">true</span></td> 
  </tr> 
  <tr> 
   <td><span class="code">initialContentType</span></td> 
   <td width="150"><p><span class="code">String</span></p> <p>optional</p> <p>default: <span class="code">text/html</span></p> </td> 
   <td><p>Initial content type of the element; only used if <span class="code">precreateElements</span><i> = </i><span class="code">true</span>; currently supported:</p> 
    <ul> 
     <li><span class="code">text/html</span></li> 
     <li><span class="code">text/plain</span></li> 
     <li><span class="code">text/x-markdown</span></li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td><span class="code">name</span></td> 
   <td><p><span class="code">String</span></p> <p>required</p> </td> 
   <td>The internal name of the element; must be unique for the fragment type.</td> 
  </tr> 
 </tbody> 
</table>

* **Variations**

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row">Name</th> 
   <th>Type</th> 
   <th>Value</th> 
  </tr> 
  <tr> 
   <td><span class="code">variations</span><br /> </td> 
   <td><p><span class="code">nt:unstructured</span></p> <p>optional</p> </td> 
   <td>This optional node contains the definition of the initial variations of the content fragment.</td> 
  </tr> 
 </tbody> 
</table>

* **Variation Name**

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th scope="row">Name</th> 
   <th>Type</th> 
   <th>Value</th> 
  </tr> 
  <tr> 
   <td><span class="code">&lt;<i>variation-name</i>&gt;</span><br /> </td> 
   <td><p><span class="code">nt:unstructured</span></p> <p>required if a variation node is present</p> </td> 
   <td><p>Defines an initial variation.<br /> The variation is added to all elements of the content fragment by default.</p> <p>The variation will have the same initial content as the respective element (see <code class="code">defaultContent/
       initialContentType</code>)</p> </td> 
  </tr> 
  <tr> 
   <td><span class="code">jcr:title</span></td> 
   <td><p><span class="code">String</span></p> <p>required</p> </td> 
   <td>The title of the variation (displayed in the fragment editor's <strong>Variation</strong> tab (left rail)).</td> 
  </tr> 
  <tr> 
   <td><span class="code">jcr:desciption</span></td> 
   <td><p><span class="code">String</span></p> <p>optional</p> <p>default: ""</p> </td> 
   <td>A text that provides a description of the variation <span>(displayed in the fragment editor's <strong>Variation</strong> tab (left rail)).</span></td> 
  </tr> 
 </tbody> 
</table>

