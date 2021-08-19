---
title: Replication
seo-title: Replication
description: Learn how to configure and monitor replication agents in AEM.
seo-description: Learn how to configure and monitor replication agents in AEM.
uuid: 6c0bc2fe-523a-401f-8d93-e5795f2e88b9
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: configuring
discoiquuid: 3cae081e-93e3-4317-b307-1316283c307a
docset: aem65

feature: Configuring
exl-id: 09943de5-8d62-4354-a37f-0521a66b4c49
---
# Replication{#replication}

Replication agents are central to Adobe Experience Manager (AEM) as the mechanism used to:

* [Publish (activate)](/help/sites-authoring/publishing-pages.md#activatingcontent) content from an author to a publish environment.
* Explicitly flush content from the Dispatcher cache.
* Return user input (for example, form input) from the publish environment to the author environment (under control of the author environment).

Requests are [queued](/help/sites-deploying/osgi-configuration-settings.md#apacheslingjobeventhandler) to the appropriate agent for processing.

>[!NOTE]
>
>User data (users, user groups, and user profiles) are not replicated between author and publish instances.
>
>For multiple publish instances, user data is Sling distributed when [User Synchronization](/help/sites-administering/sync.md) is enabled.

## Replicating from Author to Publish {#replicating-from-author-to-publish}

Replication, to a publish instance or dispatcher, takes place in several steps:

* the author requests that certain content be published (activated); this can be initiated by a manual request, or by automatic triggers which have been preconfigured.
* the request is passed to the appropriate default replication agent; an environment can have several default agents which will always be selected for such actions.
* the replication agent "packages" the content and places it in the replication queue.
* in the Websites tab the [colored status indicator](/help/sites-authoring/publishing-pages.md#determiningpagepublicationstatus) is set for the individual pages.
* the content is lifted from the queue and transported to the publish environment using the configured protocol; usually this is HTTP.
* a servlet in the publish environment receives the request and publishes the received content; the default servlet is `https://localhost:4503/bin/receive`.

* multiple author and publish environments can be configured.

![chlimage_1-21](assets/chlimage_1-21.png)

### Replicating from Publish to Author {#replicating-from-publish-to-author}

Some features allow users to enter data on a publish instance.

In some cases, a type of replication known as reverse replication, is needed to return this data to the author environment from where it is redistributed to other publish environments. Due to security considerations, any traffic from the publish to the author environment must be strictly controlled.

Reverse replication uses an agent in the publish environment which references the author environment. This agent places the data into an outbox. This outbox is matched with replication listeners in the author environment. The listeners poll the outboxes to collect any data entered and then distribute it as necessary. This ensures that the author environment controls all traffic.

In other cases, such as for Communities features (for example, forums, blogs, comments, and reviews), the amount of user generated content (UGC) being entered in the publish environment is difficult to efficiently synchronize across AEM instances using replicaiton.

AEM [Communities](/help/communities/overview.md) never uses replication for UGC. Instead, the deployment for Communities requires a common store for UGC (see [Community Content Storage](/help/communities/working-with-srp.md)).

### Replication - Out of the Box {#replication-out-of-the-box}

The we-retail website that is included in a standard installation of AEM can be used to illustrate replication.

To follow this example and use the default replication agents you need to [Install AEM](/help/sites-deploying/deploy.md) with:

* the author environment on port `4502`
* the publish environment on port `4503`

>[!NOTE]
>
>Enabled by default :
>
>* Agents on author : Default Agent (publish)
>
>Effectively disabled by default (as of AEM 6.1) :
>
>* Agents on author : Reverse Replication Agent (publish_reverse)
>* Agents on publish : Reverse Replication (outbox)
>
>To check the status of either the agent or the queue use the **Tools** console.
>See [Monitoring your Replication Agents](#monitoring-your-replication-agents).

#### Replication (Author to Publish) {#replication-author-to-publish}

1. Navigate to the support page on the author environment.
   **https://localhost:4502/content/we-retail/us/en/experience.html** `<pi>`
1. Edit the page to add some new text.
1. **Activate Page** to publish the changes.
1. Open the support page on the publish environment:
   **https://localhost:4503/content/we-retail/us/en/experience.html**
1. You can now see the changes that you entered on author.

This replication is actioned from the author environment by the:

* **Default Agent (publish)**
  This agent replicates content to the default publish instance.
  Details of this (configuration and logs) can be accessed from the Tools console of the author environment; or:
  `https://localhost:4502/etc/replication/agents.author/publish.html`.

#### Replication Agents - Out of the Box {#replication-agents-out-of-the-box}

The following agents are available in a standard AEM installation:

* [Default Agent](#replication-author-to-publish)
  Used for replicating from author to publish.

* Dispatcher Flush
  This is used for managing the Dispatcher cache. See [Invalidating Dispatcher Cache from the Authoring Environment](https://helpx.adobe.com/experience-manager/dispatcher/using/page-invalidate.html#invalidating-dispatcher-cache-from-the-authoring-environment) and [Invalidating Dispatcher Cache from a Publishing Instance](https://helpx.adobe.com/experience-manager/dispatcher/using/page-invalidate.html#invalidating-dispatcher-cache-from-a-publishing-instance) for more information.

* [Reverse Replication](#reverse-replication-publish-to-author)
  Used for replicating from publish to author. Reverse replication is not used for Communities features, such as forums, blogs, and comments. It is effectively disabled as the outbox is not enabled. Use of reverse replication would require custom configuration.

* Static Agent
  This is an "Agent that stores a static representation of a node into the filesystem."
  For example with the default settings, content pages and dam assets are stored under `/tmp`, either as HTML or the appropriate asset format. See the `Settings` and `Rules` tabs for the configuration.
  This was requested so that when the page is requested directly from the application server the content can be seen. This is a specialized agent and (probably) will not be required for most instances.

## Replication Agents - Configuration Parameters {#replication-agents-configuration-parameters}

When configuring a replication agent from the Tools console, four tabs are available within the dialog:

### Settings {#settings}

* **Name**

  A unique name for the replication agent.

* **Description**

  A description of the purpose this replication agent will serve.

* **Enabled**

  Indicates whether the replication agent is currently enabled.

  When the agent is **enabled** the queue will be shown as:

    * **Active** when items are being processed.
    * **Idle** when the queue is empty.
    * **Blocked** when items are in the queue, but cannot be processed; for example, when the receiving queue is disabled.

* **Serialization Type**

  The type of serialization:

    * **Default**: Set if the agent is to be automatically selected.
    * **Dispatcher Flush**: Select this if the agent is to be used for flushing the dispatcher cache.

* **Retry Delay**

  The delay (waiting time in milliseconds) between two retries, should a problem be encountered.

  Default: `60000`

* **Agent User Id**

  Depending on the environment, the agent will use this user account to:

    * collect and package the content from the author environment
    * create and write the content on the publish environment

  Leave this field empty to use the system user account (the account defined in sling as the administrator user; by default this is `admin`).

  >[!CAUTION]
  >
  >For an agent on the author environment this account *must* have read access to all paths that you want to have replicated.

  >[!CAUTION]
  >
  >For an agent on the publish environment this account *must* have the create/write access required to replicate the content.

  >[!NOTE]
  >
  >This can be used as a mechanism for selecting specific content for replication.

* **Log Level**

  Specifies the level of detail to be used for log messages.

    * `Error`: only errors will be logged
    * `Info`: errors, warnings and other informational messages will be logged
    * `Debug`: a high level of detail will be used in the messages, primarily for debug purposes

  Default: `Info`

* **Use for reverse replication**

  Indicates whether this agent will be used for reverse replication; returns user input from the publish to author environment.

* **Alias update**

  Selecting this option enables alias or vanity path invalidation requests to Dispatcher. Also, see [Configuring a Dispatcher Flush Agent](/help/sites-deploying/replication.md#configuring-a-dispatcher-flush-agent).

#### Transport {#transport}

* **URI**

  This specifies the receiving servlet at the target location. In particular, you can specify the hostname (or alias) and context path to the target instance here.

  For example:

    * A Default Agent may replicate to `https://localhost:4503/bin/receive`
    * A Dispatcher Flush agent may replicate to `https://localhost:8000/dispatcher/invalidate.cache`

  The protocol specified here (HTTP or HTTPS) will determine the transport method.

  For Dispatcher Flush agents, the URI property is used only if you use path-based virtualhost entries to differentiate between farms, you use this field to target the farm to invalidate. For example, farm #1 has a virtual host of `www.mysite.com/path1/*` and farm #2 has a virtual host of `www.mysite.com/path2/*`. You can use a URL of `/path1/invalidate.cache` to target the first farm and `/path2/invalidate.cache` to target the second farm.

* **User**

  User name of the account to be used for accessing the target.

* **Password**

  Password for the account to be used for accessing the target.

* **NTLM Domain**

  Domain for NTML authentication.

* **NTLM Host**

  Host for NTML authentication.

* **Enable relaxed SSL**

  Enable if you want self-certified SSL certificates to be accepted.

* **Allow expired certs**

  Enable if you want expired SSL certificates to be accepted.

#### Proxy {#proxy}

The following settings are only needed if a proxy is needed:

* **Proxy Host**

  Hostname of the proxy used for transport.

* **Proxy Port**

  Port of the proxy.

* **Proxy User**

  User name of the account to be used.

* **Proxy Password**

  Password of the account to be used.

* **Proxy NTLM Domain**

  The proxy NTLM domain.

* **Proxy NTLM Host**

  The proxy NTLM domain.

#### Extended {#extended}

* **Interface**

  Here you can define the socket interface to bind to.

  This sets the local address to be used when creating connections. If this is not set, the default address will be used. This is useful for specifying the interface to use on multi-homed or clustered systems.

* **HTTP Method**

  The HTTP method to be used.

  For a Dispatcher Flush agent this is nearly always GET and should not be changed (POST would be another possible value).

* **HTTP Headers**

  These are used for Dispatcher Flush agents and specify elements that must be flushed.

  For a Dispatcher Flush agent the three standard entries should not need changing:

    * `CQ-Action:{action}`
    * `CQ-Handle:{path}`
    * `CQ-Path:{path}`

  These are used, as appropriate, to indicate the action to be used when flushing the handle or path. The sub-parameters are dynamic:

    * `{action}` indicates a replication action

    * `{path}` indicates a path

  They are substituted by the path/action relevant to the request and therefore do not need to be "hardcoded":

  >[!NOTE]
  >
  >If you have installed AEM in a context other than the recommended default context, then you will need to register the context in the HTTP Headers. For example:
  >`CQ-Handle:/<*yourContext*>{path}`

* **Close Connection**

  Enable to close the connection after each request.

* **Connect Timeout**

  Timeout (in milliseconds) to be applied when trying to establish a connection.

* **Socket Timeout**

  Timeout (in milliseconds) to be applied when waiting for traffic after a connection has been established.

* **Protocol Version**

  Version of the protocol; for example `1.0` for HTTP/1.0.

#### Triggers {#triggers}

These settings are used to define triggers for automated replication:

* **Ignore default**

  If checked, the agent is excluded from default replication; this means it will not be used if a content author issues a replication action.

* **On Modification**

  Here a replication by this agent will be automatically triggered when a page is modified. This is mainly used for Dispatcher Flush agents, but also for reverse replication.

* **On Distribute**

  If checked, the agent will automatically replicate any content that is marked for distribution when it is modified.

* **On-/Offtime reached**

  This will trigger automatic replication (to activate or deactivate a page as appropriate) when the ontimes or offtimes defined for a page occur. This is primarily used for Dispatcher Flush agents.

* **On Receive**

  If checked, the agent will chain replicate whenever receiving replication events.

* **No Status Update**

  When checked the agent will not force a replication status update.

* **No Versioning**

  When checked the agent will not force versioning of activated pages.

## Configuring your Replication Agents {#configuring-your-replication-agents}

For information about connecting replication agents to the publish instance using MSSL, see [Replicating Using Mutual SSL](/help/sites-deploying/mssl-replication.md).

### Configuring your Replication Agents from the Author Environment {#configuring-your-replication-agents-from-the-author-environment}

From the Tools tab in the author environment you can configure replication agents that reside in either the author environment (**Agents on author**) or the publish environment (**Agents on publish**). The following procedures illustrate the configuration of an agent for the author environment, but can be used for both.

>[!NOTE]
>
>When a dispatcher handles HTTP requests for author or publish instances, the HTTP request from the replication agent must include the PATH header. In addition to the following procedure, you must add the PATH header to the dispatcher list of client headers. (See [/clientheaders (Client Headers)](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html#specifying-the-http-headers-to-pass-through-clientheaders).
>

1. Access the **Tools** tab in AEM.
1. Click **Replication** (left pane to open the folder).
1. Double-click **Agents on author** (either the left or the right pane).
1. Click the appropriate agent name (which is a link) to show detailed information on that agent.
1. Click **Edit** to open the configuration dialog:

   ![chlimage_1-22](assets/chlimage_1-22.png)

1. The values provided should be sufficient for a default installation. If you make changes then click **OK** to save them (see [Replication Agents - Configuration Parameters](#replication-agents-configuration-parameters) for more details of the individual parameters).

>[!NOTE]
>
>A standard installation of AEM specifies `admin` as the user for transport credentials within the default replication agents.
>
>This should be changed to a site-specific replication user account with the privileges to replicate the required path(s).

### Configuring Reverse Replication {#configuring-reverse-replication}

Reverse replication is used to get user content generated on a publish instance back to an author instance. This is commonly used for features such as surveys and registration forms.

For security reasons, most network topologies do not allow connections *from* the "Demilitarized Zone" (a subnetwork that exposes the external services to an untrusted network such as the Internet).

As the publish environment is usually in the DMZ, to get content back to the author environment the connection must be initiated from the author instance. This is done with:

* an *outbox* in the publish environment where the content is placed.
* an agent (publish) in the author environment which periodically polls the outbox for new content.

>[!NOTE]
>
>For AEM [Communities](/help/communities/overview.md), replication is not used for user generated content on a publish instance. See [Community Content Storage](/help/communities/working-with-srp.md).

To do this you need:

**A reverse replication agent in the author environment** This acts as the active component to collect information from the outbox in the publish environment:

If you want to use reverse replication then ensure that this agent is activated.

![chlimage_1-23](assets/chlimage_1-23.png)

**A reverse replication agent in the publish environment (an outbox)** This is the passive element as it acts as an "outbox". User input is placed here, from where it is collected by the agent in the author environment.

![chlimage_1-1](assets/chlimage_1-1.jpeg)

### Configuring Replication for Multiple Publish Instances {#configuring-replication-for-multiple-publish-instances}

>[!NOTE]
>
>Only content is replicated - user data is not (users, user groups, and user profiles).
>
>To synchronize user data across multiple publish instances, enable [User Synchronization](/help/sites-administering/sync.md).

Upon installation a default agent is already configured for replication of content to a publish instance running on port 4503 of the localhost.

To configure replication of content for an additional publish instance you need to create, and configure, a new replication agent:

1. Open the **Tools** tab in AEM.
1. Select **Replication**, then **Agents on author** in the left panel.
1. Select **New...**.
1. Set the **Title** and **Name**, then select **Replication Agent**.
1. Click **Create** to create the new agent.
1. Double-click the new agent item to open the configuration panel.
1. Click **Edit** - the **Agent Settings** dialog will open - the **Serialization Type** is already defined as Default, this must remain so.

    * In the **Settings** tab:

        * Activate **Enabled**.
        * Enter a **Description**.
        * Set the **Retry Delay** to `60000`.

        * Leave the **Serialization Type** as `Default`.

    * In the **Transport** tab:

        * Enter the required URI for the new publish instance; for example,
          `https://localhost:4504/bin/receive`.

        * Enter the site-specific user account used for replication.
        * You can configure other parameters as required.

1. Click **OK** to save the settings.

You can then test operation by updating, then publishing, a page in the author environment.

The updates will appear on all publish instances that have been configured as above.

If you encounter any problems, you can check the logs on the author instance. Depending on the level of detail required you can also set the **Log Level** to `Debug` using the **Agent Settings** dialog as above.

>[!NOTE]
>
>This can be combined with use of the [Agent User Id](#agentuserid) to select different content for replicating to the individual publish environments. For each publish environment:
>
>1. Configure a replication agent for replicating to that publish environment.
>1. Configure a user account; with the access rights required to read the content that will be replicated to that specific publish environment.
>1. Assign the user account as the **Agent User Id** for the replication agent.
>

### Configuring a Dispatcher Flush agent {#configuring-a-dispatcher-flush-agent}

Default agents are included with the installation. However, certain configuration is still needed and the same applies if you are defining a new agent:

1. Open the **Tools** tab in AEM.
1. Click **Deployment**.
1. Select **Replication** and then **Agents on publish**.
1. Double-click on the **Dispatcher Flush** item to open the overview.
1. Click **Edit** - the **Agent Settings** dialog will open:

    * In the **Settings** tab:

        * Activate **Enabled**.
        * Enter a **Description**.
        * Leave the **Serialization Type** as `Dispatcher Flush`, or set it as such if creating a new agent.

        * (optional) Select **Alias update** to enable alias or vanity path invalidation requests to Dispatcher.

    * In the **Transport** tab:

        * Enter the required URI for the new publish instance; for example,
          `https://localhost:80/dispatcher/invalidate.cache`.

        * Enter the site-specific user account used for replication.
        * You can configure other parameters as required.

   For Dispatcher Flush agents, the URI property is used only if you use path-based virtualhost entries to differentiate between farms, you use this field to target the farm to invalidate. For example, farm #1 has a virtual host of `www.mysite.com/path1/*` and farm #2 has a virtual host of `www.mysite.com/path2/*`. You can use a URL of `/path1/invalidate.cache` to target the first farm and `/path2/invalidate.cache` to target the second farm.

   >[!NOTE]
   >
   >If you have installed AEM in a context other than the recommended default context, then you need to configure the [HTTP Headers](#extended) in the **Extended** tab.

1. Click **OK** to save the changes.
1. Return to the **Tools** tab, from here you can **Activate** the **Dispatcher Flush** agent (**Agents on publish**).

The **Dispatcher Flush** replication agent is not active on author. You can access the same page in the publish environment by using the equivalent URI; for example, `https://localhost:4503/etc/replication/agents.publish/flush.html`.

### Controlling Access to Replication Agents {#controlling-access-to-replication-agents}

Access to the pages used to configure the replication agents can be controlled by using user and/or group page permissions on the `etc/replication` node.

>[!NOTE]
>
>Setting such permissions will not affect users replicating content (e.g. from the Websites console or sidekick option). The replication framework does not use the "user session" of the current user to access replication agents when replicating pages.

### Configuring your Replication Agents from CRXDE Lite {#configuring-your-replication-agents-from-crxde-lite}

>[!NOTE]
>
>The creation of replication agents is only supported in the `/etc/replication` repository location. This is needed in order for the associated ACLs to be properly handled. Creating a replication agent in another location of the tree might lead to unauthorized access.

Various parameters of your replication agents can be configured using CRXDE Lite.

If you navigate to `/etc/replication` you can see the following three nodes:

* `agents.author`
* `agents.publish`
* `treeactivation`

The two `agents` hold configuration information about the appropriate environment, and are only active when that environment is running. For example, `agents.publish` will only be used in the publish environment. The following screenshot shows the publish agent in the author environment, as included with AEM WCM:

![chlimage_1-24](assets/chlimage_1-24.png)

## Monitoring your Replication Agents {#monitoring-your-replication-agents}

To monitor a replication agent:

1. Access the **Tools** tab in AEM.
1. Click **Replication**.
1. Double-click the link to agents for the appropriate environment (either the left or the right pane); for example **Agents on author**.

   The resulting window shows an overview of all your replication agents for the author environment, including their target and status.

1. Click the appropriate agent name (which is a link) to show detailed information on that agent:

   ![chlimage_1-2](assets/chlimage_1-2.jpeg)

   Here you can:

    * See whether the agent is enabled.
    * See the target of any replications.
    * See whether the replication queue is currently active (enabled).
    * See whether there are any items in the queue.
    * **Refresh** or **Clear** to update the display of queue entries; this helps you see items enter and leave the queue.

    * **View Log** to access the log of any actions by the replication agent.
    * **Test Connection** to the target instance.
    * **Force Retry** on any queue items if required.

   >[!CAUTION]
   >
   >Do not use the "Test Connection" link for the Reverse Replication Outbox on a publish instance.
   >
   >
   >If a replication test is performed for an Outbox queue, any items that are older than the test replication will be re-processed with every reverse replication.
   >
   >
   >If such items already exist in a queue, they can be found with the following XPath JCR query and should be removed.
   >
   >
   >`/jcr:root/var/replication/outbox//*[@cq:repActionType='TEST']`

## Batch Replication {#batch-replication}

The batch replication does not replicate individual pages or assets, but waits for the fist threshold of the two, based on time or size, to be triggered.

It then packs all replication items into a package, which is then replicated as one single file to the publisher.

The publisher will unpack all the items, save them and report back to the author.

### Configuring Batch Replication {#configuring-batch-replication}

1. Go to `http://serveraddress:serverport/siteadmin`
1. Press the **[!UICONTROL Tools]** icon in the uppper side of the screen
1. From the left hand side navigation rail, go to **[!UICONTROL Replication - Agents on Author]** and double click **[!UICONTROL Default Agent]**.
   * You can also reach the default publish replication agent by going directly to `http://serveraddress:serverport/etc/replication/agents.author/publish.html`
1. Press the **[!UICONTROL Edit]** button above the replication queue.
1. In the following window, go to the **[!UICONTROL Batch]** tab:
   ![batchreplication](assets/batchreplication.png)
1. Configure the agent.

### Parameters {#parameters}

* `[!UICONTROL Enable Batch Mode]` - enables or disables batch replication mode
* `[!UICONTROL Max Wait Time]` - Maximum wait time until a batch request is started, in seconds. The default is 2 seconds.
* `[!UICONTROL Trigger Size]` - Starts batch replication when this size limit 

## Additional Resources {#additional-resources}

For details about troubleshooting, you can read the [Troubleshooting Replication](/help/sites-deploying/troubleshoot-rep.md) page.
