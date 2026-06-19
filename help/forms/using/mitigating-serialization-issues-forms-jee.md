---
title: Mitigating serialization issues in AEM Forms JEE | Adobe Experience Manager
description: Learn how to mitigate Java deserialization issues in AEM Forms JEE running on JDK 8.
solution: Experience Manager, Experience Manager Forms
feature: Security
version: Experience Manager 6.5
type: Documentation
role: Admin
---

# Mitigating serialization issues in AEM Forms JEE {#mitigating-serialization-issues-in-aem-forms-jee}

AEM Forms JEE includes a deserialization firewall that adds a preflight check before any attempt to deserialize an object. This check tests a class name against a firewall-style allowlist, blocklist, or both, and rejects classes that are known to be exploitable through Java&trade; deserialization attacks. The underlying agent is Adobe's modified distribution of the open-source [NotSoSerial](https://github.com/kantega/notsoserial) project, licensed under the [Apache 2 license](https://www.apache.org/licenses/LICENSE-2.0).

On installations running **JDK 11 or later**, this protection is activated by the platform's native serialization filtering and requires no manual steps. On installations running **JDK 8**, native serialization filtering is not effective, so the agent must be attached explicitly to the JVM at startup. This article describes how to do that.

>[!NOTE]
>
>If the deserialization filter health check already reports as active on your server (see [Verifying the agent's activation](#verifying-the-agents-activation)), your application server is already protected and you can skip the remaining steps in this document.

## Before you begin {#before-you-begin}

Confirm the Java&trade; version that your application server runs with:

```shell
java -version
```

If the reported version is `1.8.x` (JDK 8), the steps in this article apply. If it is 11 or later, no manual action is required; verify protection using the health check described in [Verifying the agent's activation](#verifying-the-agents-activation).

In the steps that follow, `<jee-installation-directory>` refers to the root of your AEM Forms JEE installation.

## Applying the agent {#applying-the-agent}

>[!IMPORTANT]
>
>These steps require a restart of the application server. Apply them on each affected instance.

1. **Validate the current state.** Browse to the deserialization filter health check:

   ```text
   https://<server>:<port>/system/console/healthcheck?tags=deserialization
   ```

   If the check reports as active, the instance is already protected and no further action is needed. If it is failing, continue with the following steps.

1. **Verify whether the agent JAR is already present.** Check for `notsoserial.jar` under the following location:

   ```text
   <jee-installation-directory>/crx-quickstart/opt/notsoserial/
   ```

1. **Add the JAR if it is missing.** Download [`notsoserial.jar`](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/hotfix/notsoserial.jar) and copy it to the folder above on each instance:

   ```text
   <jee-installation-directory>/crx-quickstart/opt/notsoserial/notsoserial.jar
   ```

   >[!NOTE]
   >
   >Replace this step with the official Adobe download location for the Forms JEE distribution of the agent before publishing.

1. **Update the JVM startup parameters** of your application server to attach the agent. Add the following option to the Java&trade; run line:

   ```shell
   -javaagent:<jee-installation-directory>/crx-quickstart/opt/notsoserial/notsoserial.jar
   ```

   The exact location of the Java&trade; run line depends on your application server (for example, JBoss, WebLogic, or WebSphere&reg;). Add the option to the JVM options used to start the AEM Forms JEE application server.

1. **Restart the JEE server** so that the agent is loaded at JVM startup.

1. **Revalidate.** Browse again to the health check:

   ```text
   https://<server>:<port>/system/console/healthcheck?tags=deserialization
   ```

   The health check should now report as healthy.

## Verifying the agent's activation {#verifying-the-agents-activation}

You can verify the deserialization agent's configuration at any time by browsing to the following URL:

```text
https://<server>:<port>/system/console/healthcheck?tags=deserialization
```

A list of health checks related to the agent is displayed. If the checks are passing, the agent is properly activated. If they are failing on a JDK 8 instance, the agent has not loaded and you must attach it manually using the steps in [Applying the agent](#applying-the-agent).

## Configuring the agent {#configuring-the-agent}

The below steps apply if the Java&trade; version of your application server is running with JDK 8. You can configure the agent after you attach and load it using the steps in [Applying the agent](#applying-the-agent).

The default configuration is adequate for most installations. It includes a blocklist of known remotely exploitable classes and an allowlist of packages where deserialization of trusted data is safe. The blocklist is applied before any allowlisted entries.

The firewall configuration is dynamic and can be changed at any time:

1. Go to the Web Console at `https://<server>:<port>/system/console/configMgr`.

1. Search for and click **Deserialization Firewall Configuration**.

This configuration contains the allowlist, blocklist, and diagnostic logging options:

* **Allow listing** - classes or package prefixes permitted for deserialization. If you deserialize classes of your own, add the relevant classes or packages here.
* **Block listing** - classes that are never permitted for deserialization. The initial set is limited to classes found vulnerable to remote execution attacks.
* **Diagnostic logging** - options to log when deserialization takes place. The default **class-name-only** reports the classes being deserialized. The **full-stack** option logs a Java&trade; stack for the first deserialization attempt, which is useful for locating and removing untrusted deserialization in your usage. These options are logged only on first use.

## Other considerations {#other-considerations}

* The agent is intended to mitigate currently known vulnerable classes. If your project deserializes untrusted data, it may still be exposed to denial-of-service, out-of-memory, or unknown future deserialization attacks.
* If you run on a JRE (Java&trade; Runtime Environment) rather than a JDK (Java&trade; Development Kit), the tools required for dynamic agent loading are not available, and the agent must be attached manually at startup as described in [Applying the agent](#applying-the-agent).
* If you are running on an IBM&reg; JVM, review the documentation on support for the Java&trade; Attach API.
