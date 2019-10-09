---
title: Assets Proxy Development
seo-title: Assets Proxy Development
description: A proxy is an AEM instance that uses proxy workers to process jobs. Learn how to configure an AEM proxy, supported operations, proxy components, and how to develop a custom proxy worker. 
seo-description: A proxy is an AEM instance that uses proxy workers to process jobs. Learn how to configure an AEM proxy, supported operations, proxy components, and how to develop a custom proxy worker. 
uuid: 72ceb9a5-f88a-48fe-99da-8ec10192320a
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: extending-assets
content-type: reference
discoiquuid: 5332f700-0871-4ce3-945d-fc2e7b65d46e
---

# Assets Proxy Development {#assets-proxy-development}

Adobe Experience Manager (AEM) Assets uses a proxy to distribute processing for certain tasks.

A proxy is a specific (and sometimes separate) AEM instance that uses proxy workers as processors responsible for handling a job and creating a result. A proxy worker can be used for a wide variety of tasks. In the case of an AEM Assets proxy this can be used for loading assets for rendering within AEM Assets. For example, the [IDS proxy worker](indesign.md) uses an InDesign Server to process files for use in AEM Assets.

When the proxy is a separate AEM instance this helps reduce the load on the AEM authoring instance(s). By default, AEM Assets executes the asset processing tasks in the same JVM (externalized via Proxy) to reduce the load on the AEM authoring instance.

## Proxy (HTTP Access) {#proxy-http-access}

A proxy is available via the HTTP Servlet when it is configured to accept processing jobs at: `/libs/dam/cloud/proxy`. This servlet creates a sling job from the posted parameters. This is then added to the proxy job queue and connected to the appropriate proxy worker.

### Supported Operations {#supported-operations}

* `job`  

  **Requirements**: the parameter `jobevent` must be set as a serialized value map. This is used to create an `Event` for a job processor. 

  **Result**: Adds a new job. If successful, a unique job id is returned.

```shell
curl -u admin:admin -F":operation=job" -F"someproperty=xxxxxxxxxxxx"
    -F"jobevent=serialized value map" http://localhost:4502/libs/dam/cloud/proxy
```

* `result` 

  **Requirements**: the parameter `jobid` must be set.  

  **Result**: Returns a JSON representation of the result Node as created by the job processor.

```shell
curl -u admin:admin -F":operation=result" -F"jobid=xxxxxxxxxxxx"
    http://localhost:4502   /libs/dam/cloud/proxy
```

* `resource`  

  **Requirements**: the parameter jobid must be set.  

  **Result**: Returns a resource associated with the given job.

```shell
curl -u admin:admin -F":operation=resource" -F"jobid=xxxxxxxxxxxx"
    -F"resourcePath=something.pdf" http://localhost:4502/libs/dam/cloud/proxy
```

* `remove`  

  **Requirements**: the parameter jobid must be set.  

  **Results**: Removes a job if found.

```shell
curl -u admin:admin -F":operation=remove" -F"jobid=xxxxxxxxxxxx"
    http://localhost:4502/libs/dam/cloud/proxy
```

### Proxy Worker {#proxy-worker}

A proxy worker is a processor responsible for handling a job and creating a result. Workers reside on the proxy instance and must implement [sling JobProcessor](https://sling.apache.org/site/eventing-and-jobs.html) to be recognized as a proxy worker.

>[!NOTE]
>
>The worker must implement [sling JobProcessor](https://sling.apache.org/site/eventing-and-jobs.html) to be recognized as a proxy worker.

### Client API {#client-api}

[`JobService`](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/index.html) is available as an OSGi service that provides methods to create jobs, remove jobs and to get results from those jobs. The default implementation of this service (`JobServiceImpl`) uses the HTTP client to communicate with the remote proxy servlet.

The following is an example of API usage:

```xml
@Reference
 JobService proxyJobService;

 // to create a new job
 final Hashtable props = new Hashtable();
 props.put("someproperty", "some value");
 props.put(JobUtil.PROPERTY_JOB_TOPIC, "myworker/job"); // this is an identifier of the worker
 final String jobId = proxyJobService.addJob(props, new Asset[]{asset});

 // to check status (returns JobService.STATUS_FINISHED or JobService.STATUS_INPROGRESS)
 int status = proxyJobService.getStatus(jobId)

 // to get the result
 final String jsonString = proxyJobService.getResult(jobId);

 // to remove job and cleanup
 proxyJobService.removeJob(jobId);

```

### Cloud Service Configurations {#cloud-service-configurations}

>[!NOTE]
>
>Reference documentation for the proxy API is available under [`com.day.cq.dam.api.proxy`](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/com/day/cq/dam/api/proxy/package-summary.html).

Both proxy and proxy worker configurations are available via cloud services configurations as accessible from the AEM Assets **Tools** console or under `/etc/cloudservices/proxy`. Each proxy worker is expected to add a node under `/etc/cloudservices/proxy` for worker specific configuration details (for example, `/etc/cloudservices/proxy/workername`).

>[!NOTE]
>
>See [Indesign Server Proxy Worker configuration](indesign.md#configuring-the-proxy-worker-for-indesign-server) and [Cloud Services configuration](../sites-developing/extending-cloud-config.md) for more information.

The following is an example of API usage:

```xml
@Reference(policy = ReferencePolicy.STATIC)
 ProxyConfig proxyConfig;
 
 // to get proxy config
 Configuration cloudConfig = proxyConfig.getConfiguration();
 final String value = cloudConfig.get("someProperty", "defaultValue");

 // to get worker config
 Configuration cloudConfig = proxyConfig.getConfiguration("workername");
 final String value = cloudConfig.get("someProperty", "defaultValue");
```

### Developing a Customized Proxy Worker {#developing-a-customized-proxy-worker}

The [IDS proxy worker](indesign.md) is an example of a AEM Assets proxy worker that is already provided out-of-the-box to outsource the processing of Indesign assets.

You can also develop and configure your own AEM Assets proxy worker to create a specialized worker to dispatch and outsource your AEM Assets processing tasks.

Setting up your own custom proxy worker requires you to:

* Set up and implement (using Sling eventing):

    * a custom job topic
    * a custom job event handler

* Then use the JobService API to:

    * dispatch your custom job to the proxy 
    * manage your job

* If you want to use the proxy from a workflow, you must implement a custom external step using the WorkflowExternalProcess API and the JobService API.

The following diagram and steps detail how to proceed:

![chlimage_1-249](assets/chlimage_1-249.png)

>[!NOTE]
>
>In the following steps, Indesign equivalents are indicated as reference examples.

1. A [Sling job](https://sling.apache.org/site/eventing-and-jobs.html) is used, so you need to define a job topic for your use case.

   As an example, see `IDSJob.IDS_EXTENDSCRIPT_JOB` for the IDS proxy worker.

1. The external step is used to trigger the event and then wait until that is finished; this is done by polling on the id. You must develop your own step to implement new functionality.

   Implement a `WorkflowExternalProcess`, then use the JobService API and your job topic to prepare a job event and dispatch it to the JobService (an OSGi service).

   As an example, see `INDDMediaExtractProcess`.java for the IDS proxy worker.

1. Implement a job handler for your topic. This handler requires development so that it performs your specific action and is considered to be the worker implementation.

   As an example, see `IDSJobProcessor.java` for the IDS proxy worker.

1. Make use of `ProxyUtil.java` in dam-commons. This allows you to dispatch jobs to workers using the dam proxy.

>[!NOTE]
>
>What the AEM Assets proxy framework does not provide out-of-the-box is the pool mechanism.
>
>The InDesign integration allows the access of a pool of indesign servers (IDSPool). This pooling is specific to Indesign integration and not part of the AEM Assets proxy framework.

>[!NOTE]
>
>Synchronization of Results:
>
>With n instances using the same proxy, the processing result stays with the proxy. It is the job of the client (AEM Author) to request the result using the same unique job id as given to the client on job creation. The proxy simply gets the job done and keeps the result ready to be requested.
