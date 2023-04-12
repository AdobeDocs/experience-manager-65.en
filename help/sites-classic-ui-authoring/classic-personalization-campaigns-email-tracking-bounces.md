---
title: Tracking Bounced Emails
seo-title: Tracking Bounced Emails
description: When you send a newsletter to many users, there are usually some invalid emails addresses in the list. Sending newsletters to those addresses bounce back. AEM can manage those bounces and can stop sending newsletters to those addresses after the configured bounce counter is exceeded.
seo-description: When you send a newsletter to many users, there are usually some invalid emails addresses in the list. Sending newsletters to those addresses bounce back. AEM is capable of managing those bounces and can stop sending newsletters to those addresses after the configured bounce counter is exceeded.
uuid: 749959f2-e6f8-465f-9675-132464c65f11
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
discoiquuid: fde9027b-9057-48c3-ae34-3f3258c5b371
exl-id: 6cda0a68-0df9-44e7-ae4f-9951411af6dd
---
# Tracking Bounced Emails{#tracking-bounced-emails}

>[!NOTE]
>
>Adobe does not plan to further enhance tracking of opened/bounced emails send by AEM SMTP service.
>
>The recommendation is to [use Adobe Campaign and its AEM integration](/help/sites-administering/campaign.md).

When you send a newsletter to many users, there are usually some invalid emails addresses in the list. Sending newsletters to those addresses bounce back. AEM can manage those bounces and can stop sending newsletters to those addresses after the configured bounce counter is exceeded. By default, the bounce rate is set to 3 but is configurable.

To set AEM up to track bounced emails, set up AEM to poll an existing mailbox where bounced emails are received. Usually, this location is the "from" email address that you specify where you send the newsletter. AEM polls this inbox and imports all emails below the path specified in the polling configuration. A workflow is then triggered to search for the bounced email addresses within the users and updates the bounceCounter property value of the user accordingly. After the configured max bounces are exceeded, the user is removed from the newsletter list.

## Configuring the Feed Importer {#configuring-the-feed-importer}

The feed importer lets you repeatedly import content from external sources into your repository. With this configuration of the feed importer, AEM checks the sender's mailbox for bounced emails.

To configure the feed importer for tracking bounced emails, do the following:

1. In **Tools**, select the Feed Importer.

1. Click **Add** to create a configuration.

   ![chlimage_1](assets/chlimage_1a.png)

1. Add a configuration by selecting the type and by adding information to the polling URL so you can configure the host and port. In addition, add some mail and protocol-specific parameters to the URL query. Set the configuration to poll at least once a day.

   All configurations need information about the following in the polling URL:

   `username`: The username that is used for connecting

   `password`: The password that is used for connecting

   In addition, depending on the protocol, you can configure certain settings.

   **POP3 configuration properties:**

   `pop3.leave.on.server`: Defines whether to leave messages on server or not. Set to true to leave messages on server, false otherwise. Defaults to true.

   **POP3 examples:**

   | pop3s://pop.gmail.com:995/INBOX?username=user&password=secret |Using pop3 over SSL to connect to GMail on port 995 with user/secret, leaving messages on server by default |
   |---|---|
   | pop3s://pop.gmail.com:995/INBOX?username=user&password=secret&pop3.leave.on.server=false |pop3s://pop.gmail.com:995/INBOX?username=user&password=secret&pop3.leave.on.server=false |

   **IMAP configuration properties:**

   Lets you set flags to search for.

   `imap.flag.SEEN`:Set false for new/unseen message, true for already-read messages

   See [https://javaee.github.io/javamail/docs/api/index.html?javax/mail/Flags.Flag.html](https://javaee.github.io/javamail/docs/api/index.html?javax/mail/Flags.Flag.html) for the full list of flags.

   **IMAP examples:**

   | imaps://imap.gmail.com:993/inbox?username=user&password=secret |Using IMAP over SSL to connect to GMail on port 993 with user/secret. Getting new messages only by default. |
   |---|---|
   | imaps://imap.gmail.com:993/inbox?username=user&password=secret&imap.flag.SEEN=true |Using IMAP over SSL to connect to GMail 993 with user/secret, only getting already seen message. |
   | imaps://imap.gmail.com:993/inbox?username=user&password=secret&imap.flag.SEEN=true&imap.flag.SEEN=false |Using IMAP over SSL to connect to GMail 993 with user/secret, getting already read OR new messages. |

1. Save the configuration.

## Configuring the newsletter service component {#configuring-the-newsletter-service-component}

After configuring the feed importer, configure the From address and the bounce counter.

To configure the newsletter service:

1. In the OSGi console, at `<host>:<port>/system/console/configMgr`, navigate to **MCM Newsletter**.

1. Configure the service and save the changes when finished.

   ![chlimage_1-1](assets/chlimage_1-1a.png)

   The following configurations can be set to adjust the behavior:

   | Bounce Counter Maximum (max.bounce.count) |Defines the number of bounces until a user is omitted when sending a newsletter. Setting this value to 0 disables the bounce check completely. |
   |---|---|
   | Activity No Cache (sent.activity.nocache) |Defines the cache setting to use for the newsletter sent activity |

   Once saved, the newsletter MCM service does the following:

    * Writes an activity to the users hidden stream upon successful sending of a newsletter.
    * Writes an activity if a bounce is detected and the users bounce counter changes.
