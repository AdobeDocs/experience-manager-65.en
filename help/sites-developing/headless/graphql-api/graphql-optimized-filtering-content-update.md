---
title: Updating your Content Fragments for Optimized GraphQL Filtering
description: Learn how to update your Content Fragments for Optimized GraphQL Filtering in Adobe Experience Manager for headless content delivery.
exl-id: d78ec052-c091-49ca-9f36-a3d24eb9edd5
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,GraphQL,Persisted Queries,Developing
role: Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: bfd4bc52-c397-5127-8f86-8953ba9fc0a3
    internal-label: Headless
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
  - id: d429a63e-ade4-4117-b04e-9b996d1c94ef
    internal-label: Integrations
  - id: c124fa01-25c5-42ec-adf6-21d1c114058b
    internal-label: Developer tools
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
  - id: a02b73a7-bdfc-4225-bdfd-69f7891ab55e
    internal-label: GraphQL
  - id: d781bc8f-52af-43f6-84d0-b73e59a130d5
    internal-label: Persisted queries
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Updating your Content Fragments for optimized GraphQL Filtering {#updating-content-fragments-for-optimized-graphql-filtering}

To optimize the performance of your GraphQL filters, run a procedure to update your Content Fragments.

>[!NOTE]
>
>After updating your Content Fragments, you can follow the recommendations for [Optimizing GraphQL Queries](/help/sites-developing/headless/graphql-api/graphql-optimization.md).

## Prerequisites {#prerequisites}

Ensure that you have a minimum of the 6.5.17.0 release  of AEM.

## Updating your Content Fragments {#updating-content-fragments}

To run the procedure, use the following steps:

1. [Configure the OSGi settings](/help/sites-deploying/configuring-osgi.md) for the **Content Fragment Migration Job Configuration**:

   ![OSGi Content Fragment Migration Job Configuration](assets/cfm-graphql-update-01.png "OSGi Content Fragment Migration Job Configuration")

1. In the dialog, set these two parameters as follows:

   * **ContentFragmentMigration:Enabled** : `1`
   * **ContentFragmentMigration:Enforce** : `1`

1. **Save** the specifications - the update procedure starts.

1. Wait until the procedure is completed. The procedure is complete when the property `cfGlobalVersion` appears on `/content/dam` and is set to `1`.

1. Return to the OSGi configuration to deactivate the procedure.

   In the dialog for the **Content Fragment Migration Job Configuration** set these two parameters as follows:

   * **ContentFragmentMigration:Enabled** : `0`
   * **ContentFragmentMigration:Enforce** : `0`

## Limitations {#limitations}

Be aware of the following limitations:

* Optimization of the performance of GraphQL filters will only be possible after a complete update of all your Content Fragments (indicated by the presence of the `cfGlobalVersion` property for the JCR node `/content/dam`)

* If Content Fragments are imported from a content package (using `crx/de`) after the update procedure is run, then those Content Fragments will not be considered in the GraphQL query results, until the update procedure is executed again.
