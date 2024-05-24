---
title: Creating custom layout components for adaptive forms
description: Procedure to create custom layout components for adaptive forms.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 544b06f9-2456-4c05-88c2-b5349947742d
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Foundation Component 
role: User, Developer
---
# Creating custom layout components for adaptive forms{#creating-custom-layout-components-for-adaptive-forms}

## Prerequisite {#prerequisite}

Knowledge of layouts, which enables you to create/use a custom layout. See [Changing Panel Layout](../../forms/using/layout-capabilities-adaptive-forms.md).

## Adaptive Form Panel Layout component {#adaptive-form-panel-layout-component}

The Adaptive Form Panel Layout component controls the way adaptive form components are laid out in a panel relative to the user interface.

## Creating a custom panel layout {#creating-a-custom-panel-layout}

1. Navigate to the location `/crx/de`.
1. Copy a panel layout from the location `/libs/fd/af/layouts/panel` (for example, `tabbedPanelLayout`) to `/apps` (for example, `/apps/af-custom-layout`).
1. Rename the layout you copied to `customPanelLayout`. Change the properties of the nodes `qtip` and `jcr:description`. For example, change them to `Custom layout - Toggle tabs`.

qtip

![Custom Panel Layout CRX DE Snapshot](assets/custom_layout_new.png)

>[!NOTE]
>
>Setting the property `guideComponentType`to the value `fd/af/layouts/panel` determines that the layout is a panel-layout.

1. Rename the file `tabbedPanelLayout.jsp` under the new layout to customPanelLayout.jsp.
1. To introduce new styles and behavior, create a client library under the `etc` node. For example, at the location /etc/af-custom-layout-clientlib, create the node client-library. Let the node have the categories property af.panel.custom. It has following .css and .js files:

   ```css
   /** CSS defining new styles used by custom layout **/

   .menu-nav {
       background-color: rgb(198, 38, 76);
       height: 30px;
    width: 30px;
    font-size: 2em;
    color: white;
       -webkit-transition: -webkit-transform 1s;  /* For Safari 3.1 to 6.0 */
    transition: transform 1s;
   }

   .tab-content {
    border: 1px solid #08b1cf;
   }

   .custom-navigation {
       -webkit-transition: width 1s, height 1s, -webkit-transform 1s;  /* For Safari 3.1 to 6.0 */
    transition: width 1s, height 1s, transform 1s;
   }

   .panel-name {
       padding-left: 30px;
       font-size: 20px;
   }

   @media (min-width: 992px) {
    .nav-close {
     width: 0px;
       }
   }

   @media (min-width: 768px) and (max-width: 991px) {
    .nav-close {
     height: 0px;
       }
   }

   @media (max-width: 767px) {
    .menu-nav, .custom-navigation {
        display: none;
       }
   }
   ```

   ```javascript
   /** function for toggling the navigators **/
   var toggleNav = function () {

       var nav = $('.custom-navigation');
       if (nav) {
           nav.toggleClass('nav-close');
       }
   }

   /** function to populate the panel title **/
   $(window).on('load', function() {
       if (window.guideBridge) {
           window.guideBridge.on("elementNavigationChanged",
           function (evntName, evnt) {
                       var activePanelSom = evnt.newText,
                           activePanel = window.guideBridge._guideView.getView(activePanelSom);
                       $('.panel-name').html(activePanel.$itemNav.find('a').html());
                   }
           );
       }
   });
   ```

1. To enhance the appearance and behavior, you can include a `client library`.

   In addition, update the paths of included scripts in .jsp files. For example, update the `customPanelLayout.jsp` file as follows:

   ```html
   <%-- jsp encapsulating navigator container and panel container divs --%>

   <%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
   <cq:includeClientLib categories="af.panel.custom"/>
   <div>
       <div class="row">
           <div class="col-md-2 col-sm-2 hidden-xs menu-nav glyphicon glyphicon-align-justify" onclick="toggleNav();"></div>
           <div class="col-md-10 col-sm-10 hidden-xs panel-name"></div>
       </div>
       <div class="row">
           <div class="col-md-2 hidden-xs guide-tab-stamp-list custom-navigation">
               <cq:include script = "/apps/af-custom-layout/customPanelLayout/defaultNavigatorLayout.jsp" />
           </div>
           <div  class="col-md-10">
               <c:if test="${fn:length(guidePanel.description) > 0}">
                   <div class="<%=GuideConstants.GUIDE_PANEL_DESCRIPTION%>">
                       ${guide:encodeForHtml(guidePanel.description,xssAPI)}
                           <cq:include script="/libs/fd/af/components/panel/longDescription.jsp"/>
                   </div>
               </c:if>
               <cq:include script = "/apps/af-custom-layout/customPanelLayout/panelContainer.jsp"/>
           </div>
       </div>
   </div>
   ```

   The `/apps/af-custom-layout/customPanelLayout/defaultNavigatorLayout.jsp` file:

   ```html
   <%-- jsp governing the navigation part --%>

   <%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
   <%@ page import="com.adobe.aemds.guide.utils.StyleUtils" %>
   <%-- navigation tabs --%>
   <ul id="${guidePanel.id}_guide-item-nav-container" class="tab-navigators tab-navigators-vertical in"
       data-guide-panel-edit="reorderItems" role="tablist">
       <c:forEach items="${guidePanel.items}" var="panelItem">
           <c:set var="isNestedLayout" value="${guide:hasNestablePanelLayout(guidePanel,panelItem)}"/>
           <li id="${panelItem.id}_guide-item-nav" title="${guide:encodeForHtmlAttr(panelItem.navTitle,xssAPI)}" data-path="${panelItem.path}" role="tab" aria-controls="${panelItem.id}_guide-item">
               <c:set var="panelItemCss" value="${panelItem.cssClassName}"/>
               <% String panelItemCss = (String) pageContext.getAttribute("panelItemCss");%>
               <a data-guide-toggle="tab" class="<%= StyleUtils.addPostfixToClasses(panelItemCss, "_nav") %> guideNavIcon nested_${isNestedLayout}">${guide:encodeForHtml(panelItem.navTitle,xssAPI)}</a>
               <c:if test="${isNestedLayout}">
                   <guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuidePanel"
                       resourcePath="${panelItem.path}" restoreOnExit="true">
                       <sling:include path="${panelItem.path}"
                                      resourceType="/apps/af-custom-layout/customPanelLayout/defaultNavigatorLayout.jsp"/>
                   </guide:initializeBean>
               </c:if>
               <em></em>
           </li>
       </c:forEach>
   </ul>
   ```

   The updated `/apps/af-custom-layout/customPanelLayout/panelContainer.jsp`:

   ```html
   <%-- jsp governing the panel content --%>

   <%@include file="/libs/fd/af/components/guidesglobal.jsp"%>

   <div id="${guidePanel.id}_guide-item-container" class="tab-content">
       <c:if test="${guidePanel.hasToolbar && (guidePanel.toolbarPosition == 'Top') }">
           <sling:include path="${guidePanel.toolbar.path}"/>
       </c:if>

   <c:forEach items="${guidePanel.items}" var="panelItem">
       <div class="tab-pane" id="${panelItem.id}_guide-item" role="tabpanel">
           <c:set var="isNestedLayout" value="${guide:hasNestablePanelLayout(guidePanel,panelItem)}"/>
           <c:if test="${isNestedLayout}">
               <c:set var="guidePanelResourceType" value="/apps/af-custom-layout/customPanelLayout/panelContainer.jsp" scope="request"/>
           </c:if>
           <sling:include path="${panelItem.path}" resourceType="${panelItem.resourceType}"/>
       </div>
   </c:forEach>
   <c:if test="${guidePanel.hasToolbar && (guidePanel.toolbarPosition == 'Bottom')}">
       <sling:include path="${guidePanel.toolbar.path}"/>
   </c:if>
   </div>
   ```

1. Open an adaptive form in the Authoring mode. The panel-layout you defined is added to the list for configuring panel layouts.

   ![Custom Panel layout shows up in the panel layout list](assets/auth-layt.png) ![Screen shot of adaptive form, using custom panel layout](assets/s1.png) ![Screenshot demonstrating toggle functionality of the custom layout](assets/s2.png)

Sample ZIP for a custom panel layout and an adaptive form using it.

[Get File](assets/af-custom-layout.zip)
