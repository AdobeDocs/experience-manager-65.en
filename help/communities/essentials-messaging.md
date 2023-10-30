---
title: Messaging Essentials
description: Learn about the details of working with and using the Messaging component to include a messaging feature on a website.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
docset: aem65
exl-id: b941b5e0-f768-4393-9a9d-ded2cd7d10c4
---
# Messaging Essentials {#messaging-essentials}

This page documents the details of working with using the Messaging component to include a messaging feature on a website.

## Essentials for Client-Side {#essentials-for-client-side}

**Compose Message**

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td><p>social/messaging/components/hbs/composemessage</p> </td>
  </tr>
  <tr>
   <td> <a href="/help/communities/client-customize.md#clientlibs-for-scf" target="_blank"><strong>clientllibs</strong></a></td>
   <td><p>cq.social.hbs.messaging</p> </td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td>/libs/social/messaging/components/hbs/composemessage/composemessage.hbs</td>
  </tr>
  <tr>
   <td><strong>css</strong></td>
   <td>/libs/social/messaging/components/hbs/composemessage/clientlibs/composemessage.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td>See <a href="/help/communities/configure-messaging.md" target="_blank">Configure Messaging</a></td>
  </tr>
  <tr>
   <td><strong>admin configuration</strong></td>
   <td><a href="/help/communities/messaging.md">Configure Messaging</a></td>
  </tr>
 </tbody>
</table>

**Message List** 

(For Inbox, Sent, and Trash)

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td><p>social/messaging/components/hbs/messagebox</p> </td>
  </tr>
  <tr>
   <td> <a href="/help/communities/client-customize.md#clientlibs-for-scf" target="_blank"><strong>clientllibs</strong></a></td>
   <td><p>cq.social.hbs.messaging</p> </td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td>/libs/social/messaging/components/hbs/messagebox/messagebox.hbs</td>
  </tr>
  <tr>
   <td><strong>css</strong></td>
   <td>/libs/social/messaging/components/hbs/messagebox/clientlibs/messagebox.css</td>
  </tr>
  <tr>
   <td><strong>properties</strong></td>
   <td>See <a href="/help/communities/configure-messaging.md" target="_blank">Configure Messaging</a></td>
  </tr>
  <tr>
   <td><strong>admin configuration</strong></td>
   <td><a href="/help/communities/messaging.md" target="_blank">Configure Messaging</a></td>
  </tr>
 </tbody>
</table>

See also [Client-side Customizations](/help/communities/client-customize.md)

## Essentials for Server-Side {#essentials-for-server-side}

* [Configuring Messaging](/help/communities/configure-messaging.md)
* [Messaging client APIs](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/messaging/client/api/package-summary.html) for SCF components
* [Messaging APIs](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/messaging/api/package-summary.html) for the service
* [Messaging Endpoints](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/messaging/client/endpoints/package-summary.html)
* [Server-side Customizations](/help/communities/server-customize.md)

>[!CAUTION]
>
>The String parameter must *not* contain a trailing slash "/" for the following MessageBuilder methods:
>
>* `setInboxPath`()
>* `setSentItemsPath`()
>
>For example:
>
>```
>valid: mb.setInboxPath( "/mail/inbox" );
> not valid: mb.setInboxPath( "/mail/inbox/" );
>```

### Community Site {#community-site}

A community site structure, created using the wizard, includes the messaging feature when selected. See `User Management` settings of [Community Sites Console](/help/communities/sites-console.md#user-management).

### Sample Code: Message Received Notification {#sample-code-message-received-notification}

The Social Messaging feature throws events for operations, for example `send`, `marking read`, `marking delete`. These events can be caught and actions taken on the data contained in the event.

The following example is of an event handler which listens for the `message sent` event and sends an email to all message recipients using the `Day CQ Mail Service`.

To try the server-side sample script, you need a development environment and the ability to build an OSGi bundle:

1. Log in as an administrator to ` [CRXDE|Lite](https://localhost:4502/crx/de)`.
1. Create a `bundle node`in `/apps/engage/install` with arbitrary names, such as:

   * Symbolic Name: `com.engage.media.social.messaging.MessagingNotification`
   * Name: Getting Started Tutorial Message Notification
   * Description: A sample service for sending an email notification to users when they receive a message
   * Package: `com.engage.media.social.messaging.notification`

1. Navigate to `/apps/engage/install/com.engage.media.social.messaging.MessagingNotification/src/main/java/com/engage/media/social/messaging/notification`, and then:

   1. Delete the `Activator.java` class automatically created.
   1. Create class `MessageEventHandler.java`.
   1. Copy and paste the code below into `MessageEventHandler.java`.

1. Click **Save All**.
1. Navigate to `/apps/engage/install/com.engage.media.social.messaging.MessagingNotification/com.engage.media.social.messaging.MessagingNotification.bnd`, and add all the import statements as written in the `MessageEventHandler.java` code.
1. Build the bundle.
1. Ensure `Day CQ Mail Service`OSGi service is configured.
1. Log in as a demo user, and send email to another user.
1. The recipient receives an email regarding a new message.

#### MessageEventHandler.java {#messageeventhandler-java}

```java
package com.engage.media.social.messaging.notification;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.felix.scr.annotations.Reference;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.api.resource.Resource;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.commons.mail.HtmlEmail;
import java.util.List;
import org.osgi.service.event.Event;
import org.osgi.service.event.EventHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.adobe.cq.social.messaging.api.Message;
import com.adobe.cq.social.messaging.api.MessagingEvent;
import com.day.cq.mailer.MessageGatewayService;
import com.day.cq.mailer.MessageGateway;

@Component(immediate=true)
@Service(EventHandler.class)
@Properties({
        @Property(name = "event.topics", value = "com/adobe/cq/social/message")
})
public class MessagingEventHandler implements EventHandler {
    private Logger logger = LoggerFactory.getLogger(MessagingEventHandler.class);

    @Reference
    ResourceResolverFactory resourceResolverFactory;

    @Reference
    private MessageGatewayService messageGatewayService;

    ResourceResolver resourceResolver=null;
    MessageGateway messageGateway=null;

    public void sendMail(String from, String to,String subject, String content){
        Email email = new SimpleEmail();
        messageGateway = messageGatewayService.getGateway(SimpleEmail.class);
        try {
         email.addTo(to);
            email.addReplyTo(from);
            email.setFrom(from);
            email.setMsg(content);
            email.setSubject(subject);
         messageGateway.send(email);
        } catch(EmailException ex) {
            logger.error("MessageNotificaiton : Error sending email : "+ex.getMessage());
        }
        logger.info("**** MessageNotification **** Mail sent to " + to);
    }

    public void handleEvent(Event event) {
        //Get Message Path and originator User's ID from event
        String messagePath = (String) event.getProperty("path");
        String senderId = (String) event.getProperty("userId");
        MessagingEvent.MessagingActions action = (MessagingEvent.MessagingActions) event.getProperty("action");
        try{
            if(MessagingEvent.MessagingActions.MessageSent.equals(action)){
                resourceResolver = resourceResolverFactory.getAdministrativeResourceResolver(null);

                //Read message
                Resource resource = resourceResolver.getResource(messagePath);
                Message msg = resource.adaptTo(Message.class);

                //Get list of recipient Ids from message
                //For Getting Started Tutorial, Id is same as email. If that is not the case in your site,
                //an additional step is needed to retrieve the email for the Id
                List<String> reclist = msg.getRecipientIdList();
                for(int i=0;i<reclist.size();i++){
                    //Send Email using Mailing Service
                    sendMail("admin@cqadmin.qqq",reclist.get(i),"New message on Getting Started Tutorial", "Hi\nYou have received a new message from  " +  senderId + ". To read it, sign in to Getting Started Tutorial.\n\n-Engage Admin");
                }
            }
        } catch(Exception ex){
            logger.error("Error getting message info : " + ex.getMessage());
        } finally {
            resourceResolver.close();
        }

    }
}
```
