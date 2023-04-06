---
title: Mitigating serialization issues in AEM
seo-title: Mitigating serialization issues in AEM
description: Learn how to mitigate serialization issues in AEM.
seo-description: Learn how to mitigate serialization issues in AEM.
uuid: c3989dc6-c728-40fd-bc47-f8427ed71a49
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
discoiquuid: f3781d9a-421a-446e-8b49-40744b9ef58e
exl-id: 01e9ab67-15e2-4bc4-9b8f-0c84bcd56862
---
# Mitigating serialization issues in AEM{#mitigating-serialization-issues-in-aem}

## Overview {#overview}

The AEM team at Adobe worked closely with the open-source project [NotSoSerial](https://github.com/kantega/notsoserial) to help in mitigating the vulnerabilities described in **CVE-2015-7501**. NotSoSerial is licensed under the [Apache 2 license](https://www.apache.org/licenses/LICENSE-2.0) and includes ASM code licensed under its own [BSD-like license](https://asm.ow2.io/).

The agent jar included with this package is Adobe's modified distribution of NotSoSerial.

NotSoSerial is a Java&trade; level solution to a Java&trade; level problem and is not AEM-specific. It adds a preflight check to an attempt to deserialize an object. This check tests a class name against a firewall-style allowlist, or blocklist, or both. Due to the limited number of classes in the default blocklist, this test is unlikely to have an impact on your systems or code.

By default, the agent performs a blocklist check against current known vulnerable classes. This blocklist is intended to protect you from the current list of exploits that use this type of vulnerability.

The blocklist and allowlist can be configured by following the instructions in the [Configuring the Agent](/help/sites-administering/mitigating-serialization-issues.md#configuring-the-agent) section of this article.

The agent is intended to help mitigate the latest known vulnerable classes. If your project is deserializing untrusted data, it may still be vulnerable to denial of service attacks, out of memory attacks, and unknown future deserialization exploits.

Adobe officially supports Java&trade; 6, 7, and 8. However, Adobe's understanding is that NotSoSerial supports Java&trade; 5 as well.

## Installing the Agent {#installing-the-agent}

>[!NOTE]
>
>If you have previously installed the serialization hotfix for AEM 6.1, remove the agent start commands from your Java&trade; run line.

1. Install the **com.adobe.cq.cq-serialization-tester** bundle.

1. Go to the Bundle Web Console at `https://server:port/system/console/bundles`
1. Look for the serialization bundle and start it. Doing so dynamically autoloads the NotSoSerial agent.

## Installing the Agent on Application Servers {#installing-the-agent-on-application-servers}

The NotSoSerial agent is not included in the standard distribution of AEM for application servers. However, you can extract it from the AEM jar distribution and use it with your application server setup:

1. First, download the AEM quickstart file and extract it:

   ```shell
   java -jar aem-quickstart-6.2.0.jar -unpack
   ```

1. Go to the location of the newly unzipped AEM quickstart, and copy the `crx-quickstart/opt/notsoserial/` folder to the `crx-quickstart` folder of the AEM application server installation.

1. Change the ownership of `/opt` to the user running the server:

   ```shell
   chown -R opt <user running the server>
   ```

1. Configure and check that the agent has been properly activated as shown in the following sections of this article.

## Configuring the agent {#configuring-the-agent}

The default configuration is adequate for most installs. This configuration includes a blocklist of known remote run vulnerable classes and an allowlist of packages where deserialization of trusted data is safe.

The firewall configuration is dynamic, and can be changed at any time by:

1. Going to the Web Console at `https://server:port/system/console/configMgr`
1. Searching for and clicking **Deserialization Firewall Configuration.**

   >[!NOTE]
   >
   >You can also reach the configuration page directly by accessing the URL at:
   >
   >* `https://server:port/system/console/configMgr/com.adobe.cq.deserfw.impl.DeserializationFirewallImpl`

This configuration contains the allowlist, blocklist, and deserialization logging.

**Allow Listing**

In the allow listing section, these listings are classes, or package prefixes that are allowed for deserialization. If you are deserializing classes of your own, add either the classes or packages to this allowlist.

**Block Listing**

In the block listing section are classes that are never allowed for deserialization. The initial set of these classes is limited to classes that have been found vulnerable to remote execution attacks. The blocklist is applied before any allow listed entries.

**Diagnostic Logging**

In the section for diagnostic logging, you can choose several options to log when deserialization is taking place. These options are only logged on first use, and are not logged again on subsequent uses.

The default of **class-name-only** informs you of the classes that are being deserialized.

You can also set the **full-stack** option which logs a Java&trade; stack of the first deserialization attempt to inform you where your deserialization is taking place. This option is useful for finding and removing deserialization from your usage.

## Verifying the Agent's Activation {#verifying-the-agent-s-activation}

You can verify the deserialization agent's configuration by browsing to the URL at:

* `https://server:port/system/console/healthcheck?tags=deserialization`

After you access the URL, a list of health checks related to the agent is displayed. You can determine if the agent is properly activated by verifying that the health checks are passing. If they are failing, you must load the agent manually.

For more information on troubleshooting issues with the agent, see [Handling Errors With Dynamic Agent Loading](#handling-errors-with-dynamic-agent-loading) below.

>[!NOTE]
>
>If you add `org.apache.commons.collections.functors` to the allowlist, the health check always fails.

## Handling errors with dynamic agent loading {#handling-errors-with-dynamic-agent-loading}

If errors are exposed in the log, or the verification steps detect a problem loading the agent, load the agent manually. This workflow is also recommended if you use a JRE (Java&trade; Runtime Environment) instead of a JDK (Java&trade; Development Toolkit), because the tools for dynamic loading are not available.

To load the agent manually, do the following:

1. Edit the JVM startup parameters of the CQ jar, adding the following option:

   ```shell
   -javaagent:<aem-installation-folder>/crx-quickstart/opt/notsoserial/notsoserial.jar
   ```

   >[!NOTE]
   >
   >Requires that you use the -nofork CQ/AEM option as well, along with the appropriate JVM memory settings, as the agent is not enabled on a forked JVM.

   >[!NOTE]
   >
   >The Adobe distribution of the NotSoSerial agent jar can be found in the `crx-quickstart/opt/notsoserial/` folder of your AEM installation.

1. Stop and restart the JVM;

1. Verify the agent's activation again by following the steps described above in [Verifying The Agent's Activation](/help/sites-administering/mitigating-serialization-issues.md#verifying-the-agent-s-activation).

## Other Considerations {#other-considerations}

If you are running on an IBM&reg; JVM, review the documentation on support for the Java&trade; Attach API at [this location](https://www.ibm.com/docs/en/sdk-java-technology/8?topic=documentation-java-attach-api).
