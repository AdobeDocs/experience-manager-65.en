---
title: Content Fragment Templates
description: Templates are selected when creating a content fragmen and provide the new fragment with the basic structure, element, and variation
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
docset: aem65
exl-id: 1b75721c-b223-41f0-88d9-bd855b529f31
solution: Experience Manager, Experience Manager Sites
feature: Developing,Content Fragments
role: Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Content Fragment Templates{#content-fragment-templates}

>[!CAUTION]
>
>[Content fragment models](/help/assets/content-fragments/content-fragments-models.md) are recommended for creating all new content fragments.
>
>Content fragment models are used for all examples in WKND.

>[!NOTE]
>
>Prior to AEM 6.3 Content Fragments were created based on templates instead of models. 
>
>Content Fragment templates are now deprecated. They can still be used for creating fragments, but using Content Fragment Models instead is recommended. No new features will be added to fragment templates, and they will be removed in a future version.

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
>1. Recreate the required item (that is, as it exists in `/libs`) under `/apps`
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

  <table>
   <tbody>
    <tr>
     <th>Name</th>
     <th>Type</th>
     <th>Value</th>
    </tr>
    <tr>
     <td><code>&lt;<em>template-name</em>&gt;</code></td>
     <td><code>nt:unstructured</code></td>
     <td>This node is the root for each template. It is mandatory and should have a unique name.</td>
    </tr>
    <tr>
     <td><code>jcr:title</code></td>
     <td><p><code>String</code></p> <p>required<br /> </p> </td>
     <td>The title of the template (displayed in the <strong>Create Fragment</strong> wizard).</td>
    </tr>
    <tr>
     <td><code>jcr:description</code></td>
     <td><p><code>String</code></p> <p>optional</p> </td>
     <td>A text that describes the purpose of the template (displayed in the <strong>Create Fragment</strong> wizard).</td>
    </tr>
    <tr>
     <td><code>initialAssociatedContent</code></td>
     <td><p><code>String[]</code></p> <p>optional</p> </td>
     <td>An array with paths to collections that should be associated to a newly created content fragment by default.</td>
    </tr>
    <tr>
     <td><code>precreateElements</code></td>
     <td><p><code>Boolean</code></p> <p>required</p> </td>
     <td><p><code>true</code>, if the subassets representing the elements (except the master element) of the content fragment should be created when the content fragment is created; <em>false</em> if they should be created "on the fly".</p> <p><strong>Note</strong>: currently this parameter has to be set to <code>true</code>.</p> </td>
    </tr>
    <tr>
     <td><code>version</code></td>
     <td><p><code>Long</code></p> <p>required</p> </td>
     <td><p>Version of the content structure; currently supported:</p> <p><strong>Note</strong>: currently this parameter has to be set to <code>2</code>.<br /> </p> </td>
    </tr>
   </tbody>
  </table>

* **Elements**

  <table>
   <tbody>
    <tr>
     <th>Name</th>
     <th>Type</th>
     <th>Value</th>
    </tr>
    <tr>
     <td><code>elements</code><br /> </td>
     <td><p><code>nt:unstructured</code></p> <p>required</p> </td>
     <td><p>Node that contains the definition of the elements of the content fragment. It is mandatory and needs to contain at least one child node for the <strong>Main</strong> element, but can contain [1..n] child nodes.</p> <p>When the template is used the elements sub-branch is copied to the model sub-branch of the fragment.</p> <p>The first element (as viewed in CRXDE Lite) is automatically considered to be the <i>main</i> element; the node name is irrelevant and the node itself does not have a special significance, apart from the fact that it is represented by the main asset; the other elements are handled as sub assets.</p> </td>
    </tr>
   </tbody>
  </table>

* **Element Name**

  <table>
   <tbody>
    <tr>
     <th>Name</th>
     <th>Type</th>
     <th>Value</th>
    </tr>
    <tr>
     <td><code>&lt;<i>element-name</i>&gt;</code></td>
     <td><code>nt:unstructured</code></td>
     <td>This node defines an element. It is mandatory and should have a unique name.</td>
    </tr>
    <tr>
     <td><code>jcr:title</code></td>
     <td><p><code>String</code></p> <p>required</p> </td>
     <td>The title of the element (displayed in the fragment editor's element selector).</td>
    </tr>
    <tr>
     <td><code>defaultContent</code></td>
     <td><p><code>String</code></p> <p>optional</p> <p>default: ""</p> </td>
     <td>Initial content of the element; only used if <code>precreateElements</code><i> = </i><code>true</code></td>
    </tr>
    <tr>
     <td><code>initialContentType</code></td>
     <td><p><code>String</code></p> <p>optional</p> <p>default: <code>text/html</code></p> </td>
     <td><p>Initial content type of the element; only used if <code>precreateElements</code><i> = </i><code>true</code>; currently supported:</p>
      <ul>
       <li><code>text/html</code></li>
       <li><code>text/plain</code></li>
       <li><code>text/x-markdown</code></li>
      </ul> </td>
    </tr>
    <tr>
     <td><code>name</code></td>
     <td><p><code>String</code></p> <p>required</p> </td>
     <td>The internal name of the element; must be unique for the fragment type.</td>
    </tr>
   </tbody>
  </table>

* **Variations**

  <table>
   <tbody>
    <tr>
     <th>Name</th>
     <th>Type</th>
     <th>Value</th>
    </tr>
    <tr>
     <td><code>variations</code><br /> </td>
     <td><p><code>nt:unstructured</code></p> <p>optional</p> </td>
     <td>This optional node contains the definition of the initial variations of the content fragment.</td>
    </tr>
   </tbody>
  </table>

* **Variation Name**

  <table>
   <tbody>
    <tr>
     <th>Name</th>
     <th>Type</th>
     <th>Value</th>
    </tr>
    <tr>
     <td><code>&lt;<i>variation-name</i>&gt;</code><br /> </td>
     <td><p><code>nt:unstructured</code></p> <p>required if a variation node is present</p> </td>
     <td><p>Defines an initial variation.<br /> The variation is added to all elements of the content fragment by default.</p> <p>The variation will have the same initial content as the respective element (see <code class="code">defaultContent/
       initialContentType</code>)</p> </td>
    </tr>
    <tr>
     <td><code>jcr:title</code></td>
     <td><p><code>String</code></p> <p>required</p> </td>
     <td>The title of the variation (displayed in the fragment editor's <strong>Variation</strong> tab (left rail)).</td>
    </tr>
    <tr>
     <td><code>jcr:desciption</code></td>
     <td><p><code>String</code></p> <p>optional</p> <p>default: ""</p> </td>
     <td>A text that provides a description of the variation <span>(displayed in the fragment editor's <strong>Variation</strong> tab (left rail)).</code></td>
    </tr>
   </tbody>
  </table>
