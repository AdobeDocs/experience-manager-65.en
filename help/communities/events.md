---
title: OSGi Events for Communities Components
seo-title: OSGi Events for Communities Components
description: OSGi events are sent that can trigger asynchronous listeners
seo-description: OSGi events are sent that can trigger asynchronous listeners
uuid: 317e2add-689d-4c99-ae38-0703b6649cb7
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 25b7ac08-6cdc-4dd5-a756-d6169b86f9ab
---

# OSGi Events for Communities Components {#osgi-events-for-communities-components}

## Overview {#overview}

When members interact with Communities features, OSGi events are sent that can trigger asynchronous listeners, like notifications or gamification (scoring and badging).

A component's [SocialEvent](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/scf/core/SocialEvent.html) instance records the events as `actions`that occur for a `topic`. The SocialEvent includes a method to return a `verb`associated with the action. There is an *n-1* relationship between `actions`and `verbs`.

For the Communities components delivered in the release, the following tables describe the `verbs`defined for each `topic`available for use.

## Topics and Verbs {#topics-and-verbs}

[Calendar Component](calendar-basics-for-developers.md) 
SocialEvent `topic`= com/adobe/cq/social/calendar

| **Verb** |**Description** |
|---|---|
| POST |member creates a calendar event |
| ADD |member comments on a calendar event |
| UPDATE |member's calendar event or comment is edited |
| DELETE |member's calendar event or comment is deleted |

[Comments Component](essentials-comments.md) 
SocialEvent `topic`= com/adobe/cq/social/comment

| **Verb** |**Description** |
|---|---|
| POST |member creates a comment |
| ADD |member replies to comment |
| UPDATE |member's comment is edited |
| DELETE |member's comment is deleted |

[File Library Component](essentials-file-library.md)
SocialEvent `topic`= com/adobe/cq/social/fileLibrary

| **Verb** |**Description** |
|---|---|
| POST |member creates a folder |
| ATTACH |member uploads a file |
| UPDATE |member updates a folder or file |
| DELETE |member deletes a folder or file |

[Forum Component](essentials-forum.md) 
SocialEvent `topic`= com/adobe/cq/social/forum

| **Verb** |**Description** |
|---|---|
| POST |member creates forum topic |
| ADD |member replies to forum topic |
| UPDATE |member's forum topic or reply is edited |
| DELETE |member's forum topic or reply is deleted |

[Journal Component](blog-developer-basics.md) 
SocialEvent `topic`= com/adobe/cq/social/journal

| **Verb** |**Description** |
|---|---|
| POST |member creates a blog article |
| ADD |member comments on a blog article |
| UPDATE |member's blog article or comment is edited |
| DELETE |member's blog article or comment is deleted |

[QnA Component](qna-essentials.md) 
SocialEvent `topic` = com/adobe/cq/social/qna

| **Verb** |**Description** |
|---|---|
| POST |member creates a QnA question |
| ADD |member creates a QnA answer |
| UPDATE |member's QnA question or answer is edited |
| SELECT |member's answer is selected |
| UNSELECT |member's answer is de-selected |
| DELETE |member's QnA question or answer is deleted |

[Reviews Component](reviews-basics.md) 
SocialEvent `topic`= com/adobe/cq/social/review

| **Verb** |**Description** |
|---|---|
| POST |member creates review |
| UPDATE |member's review is edited |
| DELETE |member's review is deleted |

[Rating Component](rating-basics.md) 
SocialEvent `topic`= com/adobe/cq/social/tally

| **Verb** |**Description** |
|---|---|
| ADD RATING |member's content has been up rated |
| REMOVE RATING |member's content has been down rated |

[Voting Component](essentials-voting.md) 
SocialEvent `topic`= com/adobe/cq/social/tally

| **Verb** |**Description** |
|---|---|
| ADD VOTING |member's content has been up voted |
| REMOVE VOTING |member's content has been down voted |

**Moderation-enabled Components** 
SocialEvent `topic`= com/adobe/cq/social/moderation

| **Verb** |**Description** |
|---|---|
| DENY |member's content is denied |
| FLAG-AS-INAPPROPRIATE |member's content is flagged |
| UNFLAG-AS-INAPPROPRIATE |member's content is unflagged |
| ACCEPT |member's content is approved by moderator |
| CLOSE |member closes comment to edits and replies |
| OPEN |member re-opens comment |

## Events for Custom Components {#events-for-custom-components}

For a custom component, the [SocialEvent abstract class](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/scf/core/SocialEvent.html) must be extended d to record the component's events as `actions`that occur for a `topic`.

The custom event would override the method `getVerb()` so that an appropriate `verb`is returned for each `action`. The `verb` returned for an action may be one commonly used (such as `POST`) or one specialized for the component (such as `ADD RATING`). There is an *n-1* relationship between `actions`and `verbs`.

>[!NOTE]
>
>Ensure a custom extension is registered with a ranking lower than any existing implementation in the product.

### Pseudo-Code for Custom Component Event {#pseudo-code-for-custom-component-event}

[org.osgi.service.event.Event](https://osgi.org/javadoc/r4v41/org/osgi/service/event/Event.html);  
[com.adobe.cq.social.scf.core.SocialEvent](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/cq/social/scf/core/SocialEvent.html);  
[com.adobe.granite.activitystreams.ObjectTypes](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/granite/activitystreams/ObjectTypes.html);  
[com.adobe.granite.activitystreams.Verbs](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/adobe/granite/activitystreams/Verbs.html);

```java
package com.mycompany.recipe;

import org.osgi.service.event.Event;
import com.adobe.cq.social.scf.core.SocialEvent;
import com.adobe.granite.activitystreams.ObjectTypes;
import com.adobe.granite.activitystreams.Verbs;

/* 
 * The Recipe type, passed to RecipeEvent(), would be a custom Recipe class 
 * that extends either 
 * com.adobe.cq.social.scf.SocialComponent 
 * or
 * com.adobe.cq.social.scf.SocialCollectionComponent
 * See https://docs.adobe.com/docs/en/aem/6-2/develop/communities/scf/server-customize.html
 */

/**
 * Defines events that are triggered on a custom component, "Recipe".
 */
public class RecipeEvent extends SocialEvent<RecipeEvent.RecipeActions> {

    private static final long serialVersionUID = 1L;
    protected static final String PARENT_PATH = "PARENT_PATH";

    /**
     * The event topic suffix for Recipe events
     */
    public static final String RECIPE_TOPIC = "recipe";

    /**
     * @param recipe - the recipe resource on which the event was triggered
     * @param userId - the user id of the user who triggered the action
     * @param action - the recipe action that triggered this event
     */
    public RecipeEvent(final Recipe recipe, final String userId, final RecipeEvent.RecipeActions action) {
        String recipePath = recipe.getResource().getPath();
        String parentPath = (recipe.getParentComponent() != null) ? 
                             recipe.getParentComponent().getResource().getPath() : 
                             recipe.getSourceComponentId();
        this(recipePath, userId, parentPath, action);
    }

    /**
     * @param recipePath - the path to the recipe resource (jcr node) on which the event was triggered
     * @param userId - the user id of the user who triggered the action
     * @param parentPath - the path to the parent node of the recipe resource
     * @param action - the recipe action that triggered this event
     */
    public RecipeEvent(final String recipePath, final String userId, final String parentPath) {
        super(RECIPE_TOPIC, recipePath, userId, action, 
              new BaseEventObject(recipePath, ObjectTypes.ARTICLE), 
              new BaseEventObject(parentPath, ObjectTypes.COLLECTION),
              new HashMap<String, Object>(1) {
            private static final long serialVersionUID = 1L;
            {
                if (parentPath != null) {
                    this.put(PARENT_PATH, parentPath);
                }

            }
        });
    }

    private RecipeEvent (final Event event) {
      super(event);
    }

    /**
     * List of available recipe actions that can trigger a recipe event.
     */
    public static enum RecipeActions implements SocialEvent.SocialActions {
        RecipeAdded, 
        RecipeModified, 
        RecipeDeleted;

        @Override
        public String getVerb() {
            switch (this) {
                case RecipeAdded:
                    return Verbs.POST;
                case RecipeModified:
                    return Verbs.UPDATE;
                case RecipeDeleted:
                    return Verbs.DELETE;
                default:
                    throw new IllegalArgumentException("Unsupported action");
            }
        }
    }

}
```

## Sample EventListener to Filter Activity Stream Data {#sample-eventlistener-to-filter-activity-stream-data}

It is possible to listen to events for the purpose of modifying what appears in the activity stream.

The following pseudo-code sample will remove DELETE events for Comments component from the activity stream.

### Pseudo-code for EventListener {#pseudo-code-for-eventlistener}

Requires [latest feature pack](deploy-communities.md#latestfeaturepack).

```java
package my.company.comments;

import java.util.Collections;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.Activate;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Modified;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.commons.osgi.PropertiesUtil;
import org.osgi.service.component.ComponentContext;

import com.adobe.cq.social.activitystreams.listener.api.ActivityStreamProviderExtension;
import com.adobe.cq.social.commons.events.CommentEvent.CommentActions;
import com.adobe.cq.social.scf.core.SocialEvent;

@Service
@Component(metatype = true, label = "My Comment Delete Event Filter",
        description = "Prevents comment DELETE events from showing up in activity streams")
public class CommentDeleteEventActivityFilter implements ActivityStreamProviderExtension {

    @Property(name = "ranking", intValue = 10)
    protected int ranking;

    @Activate
    public void activate(final ComponentContext ctx) {
        ranking = PropertiesUtil.toInteger(ctx.getProperties().get("ranking"), 10);
    }

    @Modified
    public void update(final Map<String, Object> props) {
        ranking = PropertiesUtil.toInteger(props.get("ranking"), 10);
    }

    @Override
    public boolean evaluate(final SocialEvent<?> evt, final Resource resource) {
        if (evt.getAction() != null && evt.getAction() instanceof SocialEvent.SocialActions) {
            final SocialEvent.SocialActions action = evt.getAction();
            if (StringUtils.equals(action.getVerb(), CommentActions.DELETED.getVerb())) {
                return false;
            }
        }
        return true;
    }

    @Override
    public Map<String, ? extends Object> getActivityProperties(final SocialEvent<?> arg0, final Resource arg1) {
        return Collections.<String, Object>emptyMap();
    }

    @Override
    public Map<String, ? extends Object> getActorProperties(final SocialEvent<?> arg0, final Resource arg1) {
        return Collections.<String, Object>emptyMap();
    }

    @Override
    public String getName() {
        return "My Comment Delete Event Filter";
    }

    @Override
    public Map<String, ? extends Object> getObjectProperties(final SocialEvent<?> arg0, final Resource arg1) {
        return Collections.<String, Object>emptyMap();
    }

    /* Ensure a custom extension is registered with a ranking lower than any existing implementation in the product. */
    @Override
    public int getRanking() {
        return this.ranking;
    }

    @Override
    public Map<String, ? extends Object> getTargetProperties(final SocialEvent<?> arg0, final Resource arg1) {
        return Collections.<String, Object>emptyMap();
    }

    @Override
    public String[] getStreamProviderPid() {
        return new String[]{"*"};
    }

}
```

