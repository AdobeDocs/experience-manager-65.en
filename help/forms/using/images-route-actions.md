---
title: Customize images used in route actions
seo-title: Customize images used in route actions
description: How-to customize the images used in route actions in LiveCycle AEM Forms workspace.
seo-description: How-to customize the images used in route actions in LiveCycle AEM Forms workspace.
uuid: 42608376-587e-4b57-a9d5-8f9ebd981426
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 10158c13-47b4-43e3-ac47-690f3cbab158
exl-id: 687c6569-7189-4039-9c7a-bc29658a7756
---
# Customize images used in route actions {#customize-images-used-in-route-actions}

To customize the images used in route actions, perform the steps described in [Generic Steps of customization](/help/forms/using/generic-steps-html-workspace-customization.md) followed by the steps described in this article.

## Images for route actions {#images-for-route-actions}

1. Add the styles defining images in the CSS at the following location for the new route actions:

   `/apps/ws/css/newStyle.css`

   For example: Add a new style called `myStyle1`as shown below and upload the image file `myStyleIcon1.png` to the `/apps/ws/image`s folder using a WebDAV client.

   >[!NOTE]
   >
   >For more information about WebDAV access, see [https://dev.day.com/docs/en/crx/current/how_to/webdav_access.html](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/previous-updates/aem-previous-versions.html?lang=en).

   >[!NOTE]
   >
   >Prefer to use the style name to be same as the route action name.

   ```css
   .myStyle1{

           background-image: url('../images/myStyleIcon1.png');

       }

   ```

## Task List task action popup {#task-list-task-action-popup}

1. Create a task list action popup, see [Building AEM Forms workspace code](introduction-customizing-html-workspace.md#building-html-workspace-code). It requires to use the dev package.

1. Copy `/libs/ws/js/runtime/templates/task.html` to `/apps/ws/js/runtime/templates/task.html`.

1. If the name of the CSS style is same as the route action name coming from the server, modify the following code in `/apps/ws/js/runtime/templates/task.html`:

    ```jsp
    <%if(routeList == null){%>
                <li>
                    <a href="javascript:void(0);" title="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%>" value="<%= availableCommands.directCommands[0]%>" data-action="route"><%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%></a>
                </li>
                <%}else{%>
                <%for(var i = 0; i<availableCommands.directCommands.length; i++){%>
                <li>
                    <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                </li>
                <%}%>
                <%}%>

    To

    <%if(routeList == null){%>
                <li class="<%= availableCommands.directCommands[0]%>" alt="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0]+'.value')%>">
                    <a href="javascript:void(0);" title="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%>" value="<%= availableCommands.directCommands[0]%>" data-action="route"><%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%></a>
                </li>
                <%}else{%>
                <%for(var i = 0; i<availableCommands.directCommands.length; i++){%>
                <li class="<%= availableCommands.directCommands[i]%>" alt="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[i]+'.value')%>">
                    <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                </li>
                <%}%>
                <%}%>
    ```

1. If the name of the CSS style is different from the route action name coming from the server, modify the following code in `/apps/ws/js/runtime/templates/task.html`. It adds a stack of the `if-else` servlet conditions to map the style with the route action name.

```jsp
<%if(routeList == null){%>
            <li>
                <a href="javascript:void(0);" title="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%>" value="<%= availableCommands.directCommands[0]%>" data-action="route"><%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%></a>
            </li>
            <%}else{%>
            <%for(var i = 0; i<availableCommands.directCommands.length; i++){%>
            <li>
                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
            </li>
            <%}%>
            <%}%>

To

<%if(routeList == null){%>
            <li class="<%= availableCommands.directCommands[0]%>" alt="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0]+'.value')%>">
                <a href="javascript:void(0);" title="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%>" value="<%= availableCommands.directCommands[0]%>" data-action="route"><%= $.t('taskaction.directcommand.'+availableCommands.directCommands[0])%></a>
            </li>
            <%}else{%>
            <%for(var i = 0; i<availableCommands.directCommands.length; i++){%>
                <%if(availableCommands.directCommands[i].equals("myAction1")){%>
                     <li class="myStyle1" alt="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[i]+'.value')%>">
                         <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                     </li>
                <%}else if(availableCommands.directCommands[i].equals("myAction2")){%>
                     <li class="myStyle2" alt="<%= $.t('taskaction.directcommand.'+availableCommands.directCommands[i]+'.value')%>">
                         <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                     </li>
                <%}%>
            <%}%>
            <%}%>
```

## Task Details task action popup {#task-details-task-action-popup}

1. Copy `/libs/ws/js/runtime/templates/taskdetails.html` to `/apps/ws/js/runtime/templates/taskdetails.html`.

1. If the name of the CSS style is same as the route action name coming from the server, modify the following code in `/apps/ws/js/runtime/templates/taskdetails.html`:

    ```jsp

    <%for (var i = 0; i < availableCommands.directCommands.length; i++) {%>
                            <li class="routeAction">
                                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                            </li>
                        <%}%>

    To

    <%for (var i = 0; i < availableCommands.directCommands.length; i++) {%>
                            <li class="routeAction">
                                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route">
                                <i class="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"/>
                                </a>
                            </li>
                        <%}%>
    ```

1. If the name of the CSS style is different from the route action name coming from the server, modify the following code in `/apps/ws/js/runtime/templates/taskdetails.html`. It adds a stack of `if-else` servlet conditions to map the style with the route action name.

    ```jsp

    <%for (var i = 0; i < availableCommands.directCommands.length; i++) {%>
                            <li class="routeAction">
                                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route"><%= availableCommands.directCommands[i]%></a>
                            </li>
                        <%}%>

    To

    <%for (var i = 0; i < availableCommands.directCommands.length; i++) {%>
                    <%if(availableCommands.directCommands[i].equals("myAction1")){%>
                        <li class="routeAction">
                                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route">
                                <i class="myStyle1" value="<%= availableCommands.directCommands[i]%>" data-action="route"/>
                                </a>
                            </li>
                    <%}else if(availableCommands.directCommands[i].equals("myAction2")){%>
                        <li class="routeAction">
                                <a href="javascript:void(0);" title="<%= availableCommands.directCommands[i]%>" value="<%= availableCommands.directCommands[i]%>" data-action="route">
                                <i class="myStyle2" value="<%= availableCommands.directCommands[i]%>" data-action="route"/>
                                </a>
                            </li>
                    <%}%>
                <%}%>
    ```

1. Open `/apps/ws/js/registry.js` for editing and look for the following text :
`"text!/lc/libs/ws/js/runtime/templates/taskdetails.html"`

1. Replace the text with the following:
`"text!/lc/apps/ws/js/runtime/templates/taskdetails.html"`
