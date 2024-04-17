---
title: Sample ContextHub Store Candidates

description: ContextHub provides several sample store candidates that you can use in your solutions

contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
exl-id: d8d9a799-3e30-442a-843b-d4d7ba70c557
solution: Experience Manager, Experience Manager Sites
feature: Developing,Personalization
role: Developer
---
# Sample ContextHub Store Candidates{#sample-contexthub-store-candidates}

ContextHub provides several sample store candidates that you can use in your solutions. The following information is provided for each sample:

* Where to find the source code so that you can open it for learning purposes.
* How to configure the stores that you create from the store candidates.
* How the store data is structured so that you can access it.

>[!WARNING]
>
>The sample store candidates are provided as reference configurations to help you build your own dedicated configuration for your project. Do not use them directly.

## aem.segmentation Sample Store Candidate {#aem-segmentation-sample-store-candidate}

Store for resolved and unresolved ContextHub segments. Automatically retrieves segments from the ContextHub SegmentManager.

### Source Location {#source-location-segmentation}

`/libs/settings/cloudsettings/legacy/contexthub/segmentation`

### Base Implementation {#base-implementation-segmentation}

The aem.segmentation store candidate extends [`ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

### Configuration {#configuration-segmentation}

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

## contexthub.geolocation Sample Store Candidate {#contexthub-geolocation-sample-store-candidate}

The contexthub.geolocation sample store candidate uses Google Maps to obtain and store information about the client location.

### Source Location {#source-location-geolocation}

`/libs/settings/cloudsettings/legacy/contexthub/geolocation`

### Base Implementation {#base-implementation-geolocation}

The contexthub.geolocation store candidate extends [`ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

### Configuration {#configuration-geolocation}

The default configuration specifies information about the Google service and the initial latitude and longitude coordinates.

```xml
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

### Data Items {#data-items-geolocation}

The store uses a data tree that is similar to the following example:

```xml
{
   "latitude":"37.331375",
   "longitude":"-121.893992"
}
```

>[!NOTE]
>
>A security policy introduced in Chrome 50.x requires that that all geolocation related calls are made over a secured connection. Therefore AEM forces https usage for geolocation API calls if AEM is running over https as well. Otherwise http is used to comply with the policy of same origin. See [this Google blog post](https://developers.google.com/web/updates/2016/04/geolocation-on-secure-contexts-only) for more details on the change in Chrome.

## contexthub.surferinfo Sample Store Candidate {#contexthub-surferinfo-sample-store-candidate}

Stores information about the current client environment such as the device, window, browser, date and time.

### Source Location {#source-location-surferinfo}

`/libs/settings/cloudsettings/legacy/contexthub/surferinfo`

### Base Implementation {#base-implementation-surferinfo}

The contexthub.datetime store candidate extends [`ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

### Configuration {#configuration-surferinfo}

The default configuration is inherited from `ContextHub.Store.PersistedStore`.

### Data Items {#data-items-surferinfo}

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

## granite.emulators Sample Store Candidate {#granite-emulators-sample-store-candidate}

The granite.emulators sample store candidate stores information about client devices.

### Source Location {#source-location-emulators}

`/libs/settings/cloudsettings/legacy/contexthub/emulators`

### Base Implementation {#base-implementation-emulators}

The contexthub.geolocation store candidate extends [`ContextHub.Store.PersistedStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedstore).

### Configuration {#configuration-emulators}

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

### Data Items {#data-items-emulators}

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

### Source Location {#source-location-profile}

`/libs/settings/cloudsettings/legacy/contexthub/profile`

### Base Implementation {#base-implementation-profile}

The contexthub.datetime store candidate extends [`ContextHub.Store.PersistedJSONPStore`](/help/sites-developing/contexthub-api.md#contexthub-store-persistedjsonpstore).

### Configuration {#configuration-profile}

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

### Data Items {#data-items-profile}

Stores that use this store candidate have a data tree that is similar to the following example:

```xml
{
   "displayName":"anonymous",
   "path":"/home/users/6/6zavE_DGre6Ad9Y5E0Ba",
   "avatar":"/etc/designs/default/images/social/avatar.png",
   "authorizableId":"anonymous"
}
```
