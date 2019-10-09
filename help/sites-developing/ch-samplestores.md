---
title: Sample ContextHub Store Candidates
seo-title: Sample ContextHub Store Candidates
description: ContextHub provides several sample store candidates that you can use in your solutions
seo-description: ContextHub provides several sample store candidates that you can use in your solutions
uuid: feccd813-6077-4e87-a96e-d451114e5527
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: personalization
content-type: reference
discoiquuid: 7f813b59-d904-49b6-994c-be3badf74464
---

# Sample ContextHub Store Candidates{#sample-contexthub-store-candidates}

ContextHub provides several sample store candidates that you can use in your solutions. The following information is provided for each sample:

* Where to find the source code so that you can open it for learning purposes.
* How to configure the stores that you create from the store candidates.
* How the store data is structured so that you can access it.

## aem.segmentation Sample Store Candidate {#aem-segmentation-sample-store-candidate}

Store for resolved and unresolved ContextHub segments. Automatically retrieves segments from the ContextHub SegmentManager.

**Source Location**

/libs/cq/contexthub/components/stores/segmentation

**Base Implementation**

The aem.segmentation store candidate extends [`ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

**Configuration**

When you create an aem.segmentation store, you do not need to provide a detailed configuration. The default configuration specifies the location of the ContextHub segment definitions.

```xml
{
   "service":{
      "jsonp":false,
      "timeout":1000,
      "path":"/etc/segmentation/contexthub.segment.js"
   }
}
```

## aem.resolvedsegments Sample Store Candidate {#aem-resolvedsegments-sample-store-candidate}

Stores the currently resolved segments. Listens to the ContextHub SegmentManager service to automatically update the store.

**Source Location**

/libs/cq/contexthub/components/stores/resolvedsegments

**Base Implementation**

The aem.resolvedsegments store candidate extends [`ContextHub.Store.SessionStore`](/help/sites-developing/contexthub-api.md#contexthub-store-sessionstore).

**Configuration**

The default configuration is inherited from `ContextHub.Store.SessionStore`.

**Data Tree**

Stores that use this store candidate have a data tree that is similar to the following example:

```xml
{
   "segments":[],
   "summary":"No segment"
}
```

## contexthub.datetime Sample Store Candidate {#contexthub-datetime-sample-store-candidate}

Stores current date and time information of the client.

**Source Location**

/libs/granite/contexthub/components/stores/datetime

**Base Implementation**

The contexthub.datetime store candidate extends [`ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

**Configuration**

The default configuration is inherited from `ContextHub.Store.PersistedStore`.

**Data Tree**

Stores that use this store candidate have a data tree that is similar to the following example:

```xml
{
   "date":{
      "year":2015,
      "month":7,
      "day":22
   },
   "time":{
      "hours":11,
      "minutes":52,
      "seconds":28,
      "milliseconds":27,
      "timezoneOffset":240
   },
   "formatted":{
      "utc":{
         "date":{
            "year":2015,
            "month":6,
            "day":3
         },
         "time":{
            "hours":15,
            "minutes":52,
            "seconds":28,
            "milliseconds":29
         }
      },
      "iso":"2015-07-22T15:52:28Z",
      "locale":{
         "date":"7/22/2015",
         "time":"11:52:28 AM"
      }
   },
   "season":"Spring"
}
```

## contexthub.generic-jsonp Sample Store Candidate {#contexthub-generic-jsonp-sample-store-candidate}

Stores data from a JSONP service. For an example of a store configuration for this store candidate, see [Creating a contexthub.generic-jsonp Store](/help/sites-administering/contexthub-config.md#creating-a-contexthub-generic-jsonp-store).

**Source Location**

/libs/granite/contexthub/components/stores/generic-jsonp

**Base Implementation**

The contexthub.datetime store candidate extends [ `ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

**Configuration**

When you create a store based on this store candidate, you need to provide a service object that contains details about the JSONP service to call. The following JSON code illustrates the required format to use for the service object:

```xml
{ 
   "service": { 
      "jsonp": false, 
      "timeout": 1000, 
      "ttl": 1800000, 
      "secure": false, 
      "host": "md5.jsontest.com", 
      "port": 80, 
      "params":{ 
         "text":"text to md5" 
      } 
   } 
}
```

**Data Tree**

The data that the JSONP service returns determines the data tree of the store.

## contexthub.geolocation Sample Store Candidate {#contexthub-geolocation-sample-store-candidate}

The contexthub.geolocation sample store candidate uses Google Maps to obtain and store information about the client location.

**Source Location**

/libs/granite/contexthub/components/stores/geolocation

**Base Implementation**

The contexthub.geolocation store candidate extends [ `ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

**Configuration**

The default configuration specifies information about the Google service and the initial latitude and longitude coordinates.

```
{
        "service": {
            "jsonp": false,
            "timeout": 1000,
            "ttl": 1800000,
            "secure": false,
            "host": "maps.googleapis.com",
            "port": 80,
            "path": "/maps/api/geocode/json"
        },

        "eventDeferring": 16,

        "html5coordinatesDiscoveryAPI": {
            "timeout": 30000,
            "ttl": 900000,
            "highAccuracy": false
        },

        "initialValues": {
            "latitude": 37.331375,
            "longitude": -121.893992
        }
    }
```

**Data Items**

The store uses a data tree that is similar to the following example:

```xml
{
   "latitude":"37.331375",
   "longitude":"-121.893992"
}
```

>[!NOTE]
>
>A security policy introduced in Chrome 50.x requires that that all geolocation related calls are made over a secured connection. Therefore AEM forces https usage for geolocation API calls if AEM is running over https as well. Otherwise http is used in order to comply with the policy of same origin. See [this Google blog post](https://developers.google.com/web/updates/2016/04/geolocation-on-secure-contexts-only) for more details on the change in Chrome.

## contexthub.surferinfo Sample Store Candidate {#contexthub-surferinfo-sample-store-candidate}

Stores information about the current client environment such as the device, window, browser, date and time.

**Source Location**

/libs/granite/contexthub/components/stores/profile

**Base Implementation**

The contexthub.datetime store candidate extends [ `ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

**Configuration**

The default configuration is inherited from `ContextHub.Store.PersistedStore`.

**Data Tree**

Stores that use this store candidate have a data tree that is similar to the following example:

```xml
{
   "display":{
      "resolution":{
         "width":1440,
         "height":900
      },
      "devicePixelRatio":1,
      "colorDepth":24,
      "nrOfColors":16777216,
      "pixelsPerInch":96,
      "orientation":{
         "mode":"landscape",
         "direction":"normal"
      }
   },
   "window":{
      "dimension":{
         "width":1395,
         "height":652
      },
      "percentageUsage":0.7
   },
   "browser":{
      "version":"39.0",
      "family":"Firefox",
      "userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:39.0) Gecko/20100101 Firefox/39.0"
   },
   "device":{
      "category":"Desktop",
      "type":"Desktop",
      "model":"PC",
      "version":""
   },
   "isMobile":true,
   "os":{
      "name":"Mac OS X",
      "version":"10"
   },
   "year":2015,
   "month":7,
   "day":22,
   "hour":14,
   "minutes":1
}
```

## contexthub.tagcloud Sample Data Store {#contexthub-tagcloud-sample-data-store}

The granite.tagcloud sample store candidate stores information about tag usage. Optionally, the store can automatically add tags from named HTML elements.

**Source Location**

/libs/granite/contexthub/components/stores/tagcloud

**Base Implementation**

The contexthub.geolocation store candidate extends [ `ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

**Configuration**

Configure stores based on this store candidate using an object that contains the following items:

* **parseMeta:** (Boolean) Whether tags should be added from HTML `meta` elements that exist on the page.

* **metaName:** (String) If `parseMeta` is `true`, the value of the `name` attribute of the `meta` element that contains the tags.

* **`tags[]`:** (String) An array of tags to add to the store.

Provide different device profiles in the Detail Configuration as required. The following configuration is the default:

```xml
{
   "parseMeta":true,
   "metaName":"ch.tagcloud",
   "tags":[]
}
```

**Data Tree**

Stores that use this store candidate have a data tree that is similar to the following example. The store contains tags `tag1` and `tag2`.

```xml
{
   "default":{
      "tag1":{
         ".count":1
      },
      ".recentAdded":{
         "name":"default:tag2",
         "count":1
      },
      "tag2":{
         ".count":1
      }
   },
   ".recentAdded":{
      "name":"default:tag2",
      "count":1
   }
}
```

## granite.emulators Sample Store Candidate {#granite-emulators-sample-store-candidate}

The granite.emulators sample store candidate stores information about client devices.

**Source Location**

/libs/granite/contexthub/components/stores/emulators

**Base Implementation**

The contexthub.geolocation store candidate extends [ `ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

**Configuration**

The default configuration includes an array named `defaultEmulators` that contains information about different devices. When you create a store, provide different device profiles in the Detail Configuration property as required, using the format illustrated in the following example:

```xml
{ 
   "defaultEmulators":[ 
        {
            "id": "iphone-6",
            "title": "iPhone 6",
            "type": "mobile",
            "platform": "iOS",
            "platformVersion": "8.1.3",
            "width": 750,
            "height": 1334,
            "canRotate": true,
            "orientation": "Portrait",
            "device-pixel-ratio": 2
        },
        {
            "id": "iphone-6-plus",
            "title": "iPhone 6 Plus",
            "type": "mobile",
            "platform": "iOS",
            "platformVersion": "8.1.3",
            "width": 1080,
            "height": 1920,
            "canRotate": true,
            "orientation": "Portrait",
            "device-pixel-ratio": 3
        },
        {
            "id": "galaxy-s4",
            "title": "Samsung Galaxy S4",
            "type": "mobile",
            "platform": "Android",
            "platformVersion": "4.4.2 KitKat",
            "width": 1080,
            "height": 1920,
            "canRotate": true,
            "orientation": "Portrait",
            "device-pixel-ratio": 3
        }
    ]
}
```

**Data Items**

The store data tree is similar to the following example:

```xml
{
   "devices":[
      {"id":"native",
      "title":"Native",
      "type":"screen",
      "width":1395,
      "height":374,
      "orientation":"Landscape",
      "platform":"Mac OS X",
      "platformVersion":"10",
      "canRotate":false
      },
      {"id":"ipad-3",
      "title":"iPad 3 / 4 / Air",
      "type":"tablet",
      "platform":"iOS",
      "platformVersion":"8.1.3",
      "width":1536,
      "height":2048,
      "canRotate":true,
      "orientation":"Portrait",
      "device-pixel-ratio":2
      },
      {"id":"iphone-6",
      "title":"iPhone 6",
      "type":"mobile",
      "platform":"iOS",
      "platformVersion":"8.1.3",
      "width":750,
      "height":1334,
      "canRotate":true,
      "orientation":"Portrait",
      "device-pixel-ratio":2
      },
      {"id":"galaxy-s4",
      "title":"Samsung Galaxy S4",
      "type":"mobile",
      "platform":"Android",
      "platformVersion":"4.4.2 KitKat",
      "width":1080,
      "height":1920,
      "canRotate":true,
      "orientation":"Portrait",
      "device-pixel-ratio":3
      }
   ],
   "currentDeviceId":"native",
   "orientations":[
      {"id":"landscape",
      "title":"Landscape"
      },
      {"id":"portrait",
       "title":"Portrait"
      }
   ],
   "currentDevice":{
      "id":"native",
      "title":"Native",
      "type":"screen",
      "width":1395,
      "height":374,
      "orientation":"Landscape",
      "platform":"Mac OS X",
      "platformVersion":"10",
      "canRotate":false
   }
}

```

## granite.profile Sample Store Candidate {#granite-profile-sample-store-candidate}

Stores information about the current user.

**Source Location**

/libs/granite/contexthub/components/stores/profile

**Base Implementation**

The contexthub.datetime store candidate extends [ `ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

**Configuration**

The following default configuration is used. You should not change this configuration.

```xml
{
   "service":{
      "jsonp":false,
      "timeout":1000,
      "path":"${contexthub:/store/profile/path}.infinity.json"
   },
   "initialValues":{"path":"/home/users/a/anonymous"}
}
```

**Data Tree**

Stores that use this store candidate have a data tree that is similar to the following example:

```xml
{
   "displayName":"anonymous",
   "path":"/home/users/6/6zavE_DGre6Ad9Y5E0Ba",
   "avatar":"/etc/designs/default/images/social/avatar.png",
   "authorizableId":"anonymous"
}
```

