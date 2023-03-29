---
title: Updating your Content Fragments for Optimized GraphQL Filtering 
description: Learn how to update your Content Fragments for Optimized GraphQL Filtering in Adobe Experience Manager for headless content delivery.
---

# Updating your Content Fragments for optimized GraphQL Filtering {#updating-content-fragments-for-optimized-graphql-filtering}

To optimize the performance of your GraphQL filters you need to run a procedure to update your Content Fragments.

>[!NOTE]
>
>After updating your Content Fragments you can follow the recommendations for [Optimizing GraphQL Queries](/help/sites-developing/headless/graphql-api/graphql-optimization.md).


## Prerequisites {#prerequisites}

Ensure that you have a minimum of the 2023.1.0 release  of AEM as a Cloud Service.

## Updating your Content Fragments {#updating-content-fragments}

To run the procedure use the following steps:

1. Enable the update by setting the following variables for your instance using the Cloud Manager UI:

   ![Cloud Manager Environment Configuration](assets/cfm-graphql-update-01.png "Cloud Manager Environment Configuration")

   The available variables are:

   <table style="table-layout:auto">
    <tbody>
     <tr>
      <th>&nbsp;</th>
      <th>Name</th>
      <th>Value</th>
      <th>Default Value</th>
      <th>Service</th>
      <th>Applied</th>
      <th>Type</th>
      <th>Notes</th>
     </tr>
     <tr>
      <td>1</td>
      <td>`AEM_RELEASE_CHANNEL` </td>
      <td>`prerelease` </td>
      <td> </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Required to enable the feature. </td>
     </tr>
     <tr>
      <td>2</td>
      <td>`CF_MIGRATION_ENABLED` </td>
      <td>`1` </td>
      <td>`0` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Enables(!=0) or disables(0) triggering of Content Fragment migration job. </td>
     </tr>
     <tr>
      <td>3</td>
      <td>`CF_MIGRATION_ENFORCE` </td>
      <td>`1` </td>
      <td>`0` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Enforce (!=0) re-migration of Content Fragments.<br>Setting this flag to 0 will do an incremental migration of CFs. This means, if the job is terminated due to any reason, then next run of the job will start migration from the pont where it got terminated. Note that, the very first migration is recommended to be enforced (value=1). </td>
     </tr>
     <tr>
      <td>4</td>
      <td>`CF_MIGRATION_BATCH` </td>
      <td>`50` </td>
      <td>`50` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Size of the batch for saving number of Content Fragments after migration.<br>This is relevant to how many CFs will be saved to repository in one batch, and can be used to optimize number of writes to repository. </td>
     </tr>
     <tr>
      <td>5</td>
      <td>`CF_MIGRATION_LIMIT` </td>
      <td>`1000` </td>
      <td>`1000` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Max number of Content Fragments to process at a time.<br>See also notes for `CF_MIGRATION_INTERVAL`. </td>
     </tr>
     <tr>
      <td>6</td>
      <td>`CF_MIGRATION_INTERVAL` </td>
      <td>`60` </td>
      <td>`600` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Interval (seconds) to process remaining Content Fragments up till next Limit<br>This interval is also considered as a wait-time before starting the job, as well as a delay between processing of each subsequent CF_MIGRATION_LIMIT number of CFs.<br>(*)</td>
     </tr>
    </tbody>
   </table>

   >[!NOTE]  
   >
   >(*)
   >
   >The value of `CF_MIGRATION_INTERVAL` can also help to approximate the total execution time of the migration job. 
   >
   >For example:
   >
   >* Total number of Content Fragments = 20,000
   >* CF_MIGRATION_LIMIT = 1000
   >* CF_MIGRATION_INTERNAL = 60 (Sec)
   >* Approximate time required to complete the migration = 60 + (20,000/1000 * 60) = 1260 Sec = 21 Minutes
   >  The additional "60" seconds added at the start is due to the initial delay when starting the job.
   >
   >You should also be aware that this is only the *minimum* time required to complete the job, and does not include the I/O time. The actual time taken could be significantly more than this estimation.  

1. Monitor the progress, and completion of the update.

   To do this, monitor the logs on author and golden-publish from:
   
   * `com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob`

     * Author logs; for example:

       ```shell
       23.01.2023 13:13:45.926 *INFO* [sling-threadpool-09cbdb47-4d99-4c4c-b6d5-781b635ee21b-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob This instance<dd9ffdc1-0c28-4d04-9a96-5d4d223e457e> is the leader, will schedule the upgrade schedule job.
       ...
       23.01.2023 13:13:45.941 *INFO* [sling-threadpool-09cbdb47-4d99-4c4c-b6d5-781b635ee21b-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob Scheduling content fragments upgrade from version 0 to 1, slingJobId: 2023/1/23/13/13/50e1a575-4cd7-497b-adf0-62cb5768eedb_0, enforce: true, limit: 1000, batch: 50, interval: 60s
       
       23.01.2023 13:20:40.960 *INFO* [sling-threadpool-09cbdb47-4d99-4c4c-b6d5-781b635ee21b-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob Finished content fragments upgrade in 6m, slingJobId: 2023/1/23/13/13/50e1a575-4cd7-497b-adf0-62cb5768eedb_0, status: MaintenanceJobStatus{jobState=SUCCEEDED, statusMessage='Upgrade to version '1' succeeded.', errors=[], successCount=3781, failedCount=0, skippedCount=0}
       ```

    * Golden-publish logs; for example:

      ```shell
      23.01.2023 12:35:05.150 *INFO* [sling-threadpool-8abcc1bb-cdcb-46d4-8565-942ad8a73209-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob This instance<ad1b399e-77be-408e-bc3f-57097498fddb> is the leader, will schedule the upgrade schedule job.
      
      23.01.2023 12:35:05.161 *INFO* [sling-threadpool-8abcc1bb-cdcb-46d4-8565-942ad8a73209-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob Scheduling content fragments upgrade from version 0 to 1, slingJobId: 2023/1/23/12/34/ad1b399e-77be-408e-bc3f-57097498fddb_0, enforce: true, limit: 1000, batch: 50, interval: 60s
      ...
      23.01.2023 12:40:45.180 *INFO* [sling-threadpool-8abcc1bb-cdcb-46d4-8565-942ad8a73209-(apache-sling-job-thread-pool)-1-Content Fragment Upgrade Job Queue Config(cfm/upgrader)] com.adobe.cq.dam.cfm.impl.upgrade.UpgradeJob Finished content fragments upgrade in 5m, slingJobId: 2023/1/23/12/34/ad1b399e-77be-408e-bc3f-57097498fddb_0, status: MaintenanceJobStatus{jobState=SUCCEEDED, statusMessage='Upgrade to version '1' succeeded.', errors=[], successCount=3781, failedCount=0, skippedCount=0}
      ```

1. Disable the update procedure.

   >[!IMPORTANT]
   >
   >This step is required to complete the upgrade.

   After the update procedure has run, reset the cloud environment variable `CF_MIGRATION_ENABLED` to '0', to trigger the recycling of all pods.

   <table style="table-layout:auto">
    <tbody>
     <tr>
      <th>&nbsp;</th>
      <th>Name</th>
      <th>Value</th>
      <th>Default Value</th>
      <th>Service</th>
      <th>Applied</th>
      <th>Type</th>
      <th>Notes</th>
     </tr>
     <tr>
      <td></td>
      <td>`CF_MIGRATION_ENABLED` </td>
      <td>`0` </td>
      <td>`0` </td>
      <td>All </td>
      <td> </td>
      <td>Variable </td>
      <td>Disables(0) (or Enables(!=0)) triggering of Content Fragment migration job. </td>
     </tr>
    </tbody>
   </table>

   >[!NOTE]
   >
   >This is particularly important for the publish tier, as the content update is only done on golden-publish, and when recycling of pods, all normal publish pods are based on the golden-publish.

1. Verify completion of the update procedure.

   You can verify the successful completion of the update using the repository browser in the Cloud Manager developer console to check the content fragment data.

   * Before the first complete migration, the `cfGlobalVersion` property will not exist. 
     Therefore, the presence of this property, on the JCR node `/content/dam` with a value of `1`, confirms the completion of the migration.

   * You can also check the following properties on the individual Content Fragments:

     * `_strucVersion` should have the value of `1`
     * `indexedData` structure must exist

     >[!NOTE]
     >
     >The procedure will update Content Fragments on author and publish instances. 
     >
     >Therefore, it is recommended to perform the verification via repository browser for *at least* one author *and* one publish instance.

## Limitations {#limitations}

Please be aware of the following limitations:

* Optimization of the performance of GraphQL filters will only be possible after a complete update of all your Content Fragments (indicated by the presence of the `cfGlobalVersion` property for the JCR node `/content/dam`)

* If Content Fragments are imported from a content package (using `crx/de`) after the update procedure is run, then those Content Fragments will not be considered in the GraphQL query results, until the update procedure is executed again. 