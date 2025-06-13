---
title: Logging

description: Learn how to configure global parameters for the central logging service, specific settings for the individual services or how to request data logging.


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference

feature: Configuring
exl-id: b32001a1-0078-43f6-89d6-781d6d2e9c94
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Logging{#logging}

AEM offers you the possibility to configure:

* global parameters for the central logging service
* request data logging; a specialized logging configuration for request information
* specific settings for the individual services; for example, an individual log file and format for the log messages

These are all [OSGi configurations](/help/sites-deploying/configuring-osgi.md).

>[!NOTE]
>
>Logging in AEM is based on Sling principles. See [Sling Logging](https://sling.apache.org/site/logging.html) for further information.

## Global Logging {#global-logging}

[Apache Sling Logging Configuration](/help/sites-deploying/osgi-configuration-settings.md) is used to configure the root logger. This defines the global settings for logging in AEM:

* the logging level
* the location of the central log file
* the number of versions to be kept
* version rotation; either maximum size or a time interval
* the format to be used when writing the log messages

## Loggers and Writers for Individual Services {#loggers-and-writers-for-individual-services}

In addition to the global logging settings, AEM lets you configure specific settings for an individual service:

* the specific logging level
* the location of the individual log file
* the number of versions to be kept
* version rotation; either maximum size or the time interval
* the format to be used when writing the log messages
* the logger (the OSGi service supplying the log messages)

This lets you channel log messages for a single service into a separate file. This can be particularly useful during development or testing; for example, when you need an increased log level for a specific service.

AEM uses the following to write log messages to file:

1. An **OSGi service** (logger) writes a log message.
1. A **Logging Logger** takes this message and formats it according to your specification.
1. A **Logging Writer** writes all these messages to the physical file that you have defined.

These elements are linked by the following parameters for the appropriate elements:

* **Logger (Logging Logger)**

  Define the service(s) generating the messages.

* **Log File (Logging Logger)**

  Define the physical file for storing the log messages.

  This is used to link a Logging Logger with a Logging Writer. The value must be identical to the same parameter in the Logging Writer configuration for the connection to be made.

* **Log File (Logging Writer)**

  Define the physical file that the log messages will be written to.

  This must be identical to the same parameter in the Logging Writer configuration, or the match will not be made. If there is no match then an implicit Writer will be created with default configuration (daily log rotation).

### Standard Loggers and Writers {#standard-loggers-and-writers}

Certain Loggers and Writers are included in a standard AEM installation.

The first is a special case as it controls both the `request.log` and `access.log` files:

* The Logger:

    * Apache Sling Customizable Request Data Logger

      (org.apache.sling.engine.impl.log.RequestLoggerService)

    * Write messages about request content to `request.log`.

* Links to:

    * Apache Sling Request Logger

      (org.apache.sling.engine.impl.log.RequestLogger)

    * Writes the messages to either `request.log` or `access.log`.

These can be customized if necessary, though the standard configuration is suitable for most installations.

The other pairs follow the standard configuration:

* The Logger:

    * Apache Sling Logging Logger Configuration

      (org.apache.sling.commons.log.LogManager.factory.config)

    * Writes `Information` messages to `logs/error.log`.

* Links to the Writer:

    * Apache Sling Logging Writer Configuration

      (org.apache.sling.commons.log.LogManager.factory.writer)

* The Logger:

    * Apache Sling Logging Logger Configuration
      (org.apache.sling.commons.log.LogManager.factory.config.649d51b7-6425-45c9-81e6-2697a03d6be7)

    * Writes `Warning` messages to `../logs/error.log` for the service `org.apache.pdfbox`.

* Does not link to a specific Writer so will create and use an implicit Writer with default configuration (daily log rotation).

### Creating Your Own Loggers and Writers {#creating-your-own-loggers-and-writers}

You can define your own Logger / Writer pair:

1. Create an instance of the Factory Configuration [Apache Sling Logging Logger Configuration](/help/sites-deploying/osgi-configuration-settings.md).

    1. Specify the Log File.
    1. Specify the Logger.
    1. Configure the other parameters as required.

1. Create an instance of the Factory Configuration [Apache Sling Logging Writer Configuration](/help/sites-deploying/osgi-configuration-settings.md).

    1. Specify the Log File - this must match that specified for the Logger.
    1. Configure the other parameters as required.

>[!NOTE]
>
>In certain circumstances you may want to create a [custom log file](/help/sites-deploying/monitoring-and-maintaining.md#create-a-custom-log-file).
