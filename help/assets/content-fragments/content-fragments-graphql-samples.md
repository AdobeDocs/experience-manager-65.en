---
title: Learning to use GraphQL with AEM - Sample Content and Queries
description: Learn to use GraphQL with AEM to serve content headlessly by exploring sample content and queries.
feature: Content Fragments,GraphQL API
exl-id: b60fcf97-4736-4606-8b41-4051b8b0c8a7
---
# Learning to use GraphQL with AEM - Sample Content and Queries {#learn-graphql-with-aem-sample-content-queries}

Learn to use GraphQL with AEM to serve content headlessly by exploring sample content and queries.

>[!NOTE]
>
>This page should be read together with:
>
>* [Content Fragments](/help/assets/content-fragments/content-fragments.md)
>* [Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md)
>* [AEM GraphQL API for use with Content Fragments](/help/assets/content-fragments/graphql-api-content-fragments.md)

To get started with GraphQL queries and how they work with AEM Content Fragments it helps to see some practical examples. 

To help with this see:

* A [sample Content Fragment structure](#content-fragment-structure-graphql) 

* And some [sample GraphQL queries](#graphql-sample-queries), based on the sample content fragment structure (Content Fragment Models and related Content Fragments).


## GraphQL - Sample Queries using the Sample Content Fragment Structure {#graphql-sample-queries-sample-content-fragment-structure}

See these sample queries for illustrations of create queries, together with sample results.

>[!NOTE]
>
>Depending on your instance you can directly access the [Graph*i*QL interface included with AEM GraphQL API](/help/assets/content-fragments/graphql-api-content-fragments.md#graphiql-interface) for submitting and testing queries.
>
>For example: `http://localhost:4502/content/graphiql.html`

>[!NOTE]
>
>The sample queries are based on the [Sample Content Fragment Structure for use with GraphQL](#content-fragment-structure-graphql)

### Sample Query - All Available Schemas and Datatypes {#sample-all-schemes-datatypes}

This will return all `types` for all available schemas.

**Sample Query**

```xml
{
  __schema {
    types {
      name
      description
    }
  }
}
```

**Sample Result**

```xml
{
  "data": {
    "__schema": {
      "types": [
        {
          "name": "AdventureModel",
          "description": null
        },
        {
          "name": "AdventureModelArrayFilter",
          "description": null
        },
        {
          "name": "AdventureModelFilter",
          "description": null
        },
        {
          "name": "AdventureModelResult",
          "description": null
        },
        {
          "name": "AdventureModelResults",
          "description": null
        },
        {
          "name": "AllFragmentModels",
          "description": null
        },
        {
          "name": "ArchiveRef",
          "description": null
        },
        {
          "name": "ArrayMode",
          "description": null
        },
        {
          "name": "ArticleModel",
          "description": null
        },

...more results...

        {
          "name": "__EnumValue",
          "description": null
        },
        {
          "name": "__Field",
          "description": null
        },
        {
          "name": "__InputValue",
          "description": null
        },
        {
          "name": "__Schema",
          "description": "A GraphQL Introspection defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, the entry points for query, mutation, and subscription operations."
        },
        {
          "name": "__Type",
          "description": null
        },
        {
          "name": "__TypeKind",
          "description": "An enum describing what kind of type a given __Type is"
        }
      ]
    }
  }
}
```

### Sample Query - All Information about All Cities {#sample-all-information-all-cities}

To retrieve all information about all cities, you can use the very basic query:
**Sample Query**

```xml
{
  cityList {
    items
  }
}
```

When executed, the system will automatically expand the query to include all fields:

```xml
{
  cityList {
    items {
      _path
      name
      country
      population
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "_path": "/content/dam/sample-content-fragments/cities/basel",
          "name": "Basel",
          "country": "Switzerland",
          "population": 172258
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/berlin",
          "name": "Berlin",
          "country": "Germany",
          "population": 3669491
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/bucharest",
          "name": "Bucharest",
          "country": "Romania",
          "population": 1821000
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/san-francisco",
          "name": "San Francisco",
          "country": "USA",
          "population": 883306
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/san-jose",
          "name": "San Jose",
          "country": "USA",
          "population": 1026350
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/stuttgart",
          "name": "Stuttgart",
          "country": "Germany",
          "population": 634830
        },
        {
          "_path": "/content/dam/sample-content-fragments/cities/zurich",
          "name": "Zurich",
          "country": "Switzerland",
          "population": 415367
        }
      ]
    }
  }
}
```

### Sample Query - Names of All Cities {#sample-names-all-cities}

This is a straightforward query to return the `name`of all entries in the `city`schema.

**Sample Query**

```xml
query {
  cityList {
    items {
      name
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "name": "Basel"
        },
        {
          "name": "Berlin"
        },
        {
          "name": "Bucharest"
        },
        {
          "name": "San Francisco"
        },
        {
          "name": "San Jose"
        },
        {
          "name": "Stuttgart"
        },
        {
          "name": "Zurich"
        }
      ]
    }
  }
}
```

### Sample Query - A Single Specific City Fragment {#sample-single-specific-city-fragment}

This is a query to return the details of a single fragment entry at a specific location in the repository.

**Sample Query**

```xml
{
  cityByPath (_path: "/content/dam/sample-content-fragments/cities/berlin") {
    item {
      _path
      name
      country
      population
     categories
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityByPath": {
      "item": {
        "_path": "/content/dam/sample-content-fragments/cities/berlin",
        "name": "Berlin",
        "country": "Germany",
        "population": 3669491,
        "categories": [
          "city:capital",
          "city:emea"
        ]
      }
    }
  }
}
```

### Sample Query - All Cities with a Named Variation {#sample-cities-named-variation}

If you create a new variation, named "Berlin Centre" (`berlin_centre`), for the `city` Berlin, then you can use a query to return details of the variation.

**Sample Query**

```xml
{
  cityList (variation: "berlin_center") {
    items {
      _path
      name
      country
      population
      categories
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "_path": "/content/dam/sample-content-fragments/cities/berlin",
          "name": "Berlin",
          "country": "Germany",
          "population": 3669491,
          "categories": [
            "city:capital",
            "city:emea"
          ]
        }
      ]
    }
  }
}
```

### Sample Query - Full Details of a Company's CEO and Employees {#sample-full-details-company-ceos-employees}

Using the structure of the nested fragments, this query returns the full details of a company's CEO and all its employees.

**Sample Query**

```xml
query {
  companyList {
    items {
      name
      ceo {
        _path
        name
        firstName
        awards {
        id
          title
        }
      }
      employees {
       name
        firstName
       awards {
         id
          title
        }
      }
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "companyList": {
      "items": [
        {
          "name": "Apple Inc.",
          "ceo": {
            "_path": "/content/dam/sample-content-fragments/persons/steve-jobs",
            "name": "Jobs",
            "firstName": "Steve",
            "awards": []
          },
          "employees": [
            {
              "name": "Marsh",
              "firstName": "Duke",
              "awards": []
            },
            {
              "name": "Caulfield",
              "firstName": "Max",
              "awards": [
                {
                  "id": "GB",
                  "title": "Gameblitz"
                }
              ]
            }
          ]
        },
        {
          "name": "Little Pony, Inc.",
          "ceo": {
            "_path": "/content/dam/sample-content-fragments/persons/adam-smith",
            "name": "Smith",
            "firstName": "Adam",
            "awards": []
          },
          "employees": [
            {
              "name": "Croft",
              "firstName": "Lara",
              "awards": [
                {
                  "id": "GS",
                  "title": "Gamestar"
                }
              ]
            },
            {
              "name": "Slade",
              "firstName": "Cutter",
              "awards": [
                {
                  "id": "GB",
                  "title": "Gameblitz"
                },
                {
                  "id": "GS",
                  "title": "Gamestar"
                }
              ]
            }
          ]
        },
        {
          "name": "NextStep Inc.",
          "ceo": {
            "_path": "/content/dam/sample-content-fragments/persons/steve-jobs",
            "name": "Jobs",
            "firstName": "Steve",
            "awards": []
          },
          "employees": [
            {
              "name": "Smith",
              "firstName": "Joe",
              "awards": []
            },
            {
              "name": "Lincoln",
              "firstName": "Abraham",
              "awards": []
            }
          ]
        }
      ]
    }
  }
}
```

### Sample Query - All Persons that have a name of "Jobs" or "Smith" {#sample-all-persons-jobs-smith}

This will filter all `persons` for any that have the name `Jobs`or `Smith`.

**Sample Query**

```xml
query {
  personList(filter: {
    name: {
      _logOp: OR
      _expressions: [
        {
          value: "Jobs"
        },
        {
          value: "Smith"
        }
      ]
    }
  }) {
    items {
      name
      firstName
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "personList": {
      "items": [
        {
          "name": "Smith",
          "firstName": "Adam"
        },
        {
          "name": "Smith",
          "firstName": "Joe"
        },
        {
          "name": "Jobs",
          "firstName": "Steve"
        }
      ]
    }
  }
}
```

### Sample Query - All Persons that do not have a name of "Jobs" {#sample-all-persons-not-jobs}

This will filter all `persons` for any that have the name `Jobs`or `Smith`.

**Sample Query**

```xml
query {
  personList(filter: {
    name: {
      _expressions: [
        {
          value: "Jobs"
          _operator: EQUALS_NOT
        }
      ]
    }
  }) {
    items {
      name
      firstName
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "personList": {
      "items": [
        {
          "name": "Lincoln",
          "firstName": "Abraham"
        },
        {
          "name": "Smith",
          "firstName": "Adam"
        },
        {
          "name": "Slade",
          "firstName": "Cutter"
        },
        {
          "name": "Marsh",
          "firstName": "Duke"
        },
        {
          "name": "Smith",
          "firstName": "Joe"
        },
        {
          "name": "Croft",
          "firstName": "Lara"
        },
        {
          "name": "Caulfield",
          "firstName": "Max"
        }
      ]
    }
  }
}
```

### Sample Query - All Adventures whose `_path` is starting with a specific prefix {#sample-wknd-all-adventures-cycling-path-filter}

All `adventures` where `_path` starts with a specific prefix (`/content/dam/wknd/en/adventures/cycling`).

**Sample Query**

```xml
query {
  adventureList(
    filter: {
      _path: {
        _expressions: [
        {
          value: "/content/dam/wknd/en/adventures/cycling"
         _operator: STARTS_WITH
        }]
       }
    })
    {
    items {
      _path
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "adventureList": {
      "items": [
        {
          "_path": "/content/dam/wknd/en/adventures/cycling-southern-utah/cycling-southern-utah"
        },
        {
          "_path": "/content/dam/wknd/en/adventures/cycling-tuscany/cycling-tuscany"
        }
      ]
    }
  }
}
```

### Sample Query - All cities located in Germany or Switzerland with a population between 400000 and 999999 {#sample-all-cities-d-ch-population}

Here a combination of fields are filtered on. An `AND` (implicit) is used to select the `population`range, while an `OR` (explicit) is used to select the required cities.

**Sample Query**

```xml
query {
  cityList(filter: {
    population: {
      _expressions: [
        {
          value: 400000
          _operator: GREATER_EQUAL
        }, {
          value: 1000000
          _operator: LOWER
        }
      ]
    },
    country: {
      _logOp: OR
      _expressions: [
        {
          value: "Germany"
        }, {
          value: "Switzerland"
        }
      ]
    }
  }) {
    items {
      name
      population
      country
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "name": "Stuttgart",
          "population": 634830,
          "country": "Germany"
        },
        {
          "name": "Zurich",
          "population": 415367,
          "country": "Switzerland"
        }
      ]
    }
  }
}
```

### Sample Query - All cities with SAN in the name, irrespective of case {#sample-all-cities-san-ignore-case}

This query interrogates for all cities that have `SAN` in the name, irrespective of case.

**Sample Query**

```xml
query {
  cityList(filter: {
    name: {
      _expressions: [
        {
          value: "SAN"
          _operator: CONTAINS
          _ignoreCase: true
        }
      ]
    }
  }) {
    items {
      name
      population
      country
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "name": "San Francisco",
          "population": 883306,
          "country": "USA"
        },
        {
          "name": "San Jose",
          "population": 1026350,
          "country": "USA"
        }
      ]
    }
  }
}
```

### Sample Query - Filter on an array with an item that must occur at least once {#sample-array-item-occur-at-least-once}

This query filters on an array with an item (`city:na`) that must occur at least once.

**Sample Query**

```xml
query {
  cityList(filter: {
    categories: {
      _expressions: [
        {
          value: "city:na"
          _apply: AT_LEAST_ONCE
        }
      ]
    }
  }) {
    items {
      name
      population
      country
      categories
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "name": "San Francisco",
          "population": 883306,
          "country": "USA",
          "categories": [
            "city:beach",
            "city:na"
          ]
        },
        {
          "name": "San Jose",
          "population": 1026350,
          "country": "USA",
          "categories": [
            "city:na"
          ]
        }
      ]
    }
  }
}
```

### Sample Query - Filter on an exact array value {#sample-array-exact-value}

This query filters on an exact array value.

**Sample Query**

```xml
query {
  cityList(filter: {
    categories: {
      _expressions: [
        {
          values: [
            "city:beach",
            "city:na"
          ]
        }
      ]
    }
  }) {
    items {
      name
      population
      country
      categories
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "cityList": {
      "items": [
        {
          "name": "San Francisco",
          "population": 883306,
          "country": "USA",
          "categories": [
            "city:beach",
            "city:na"
          ]
        }
      ]
    }
  }
}
```

### Sample Query for Nested Content Fragments - All companies that have at least one employee that has a name of "Smith" {#sample-companies-employee-smith}

This query illustrates filtering for any `person` of `name` "Smith", returning information from across two nested fragments - `company` and `employee`.

**Sample Query**

```xml
query {
  companyList(filter: {
    employees: {
      _match: {
        name: {
          _expressions: [
            {
              value: "Smith"
            }
          ]
        }
      }
    }
  }) {
    items {
      name
      ceo {
        name
        firstName
      }
      employees {
        name
        firstName
      }
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "companyList": {
      "items": [
        {
          "name": "NextStep Inc.",
          "ceo": {
            "name": "Jobs",
            "firstName": "Steve"
          },
          "employees": [
            {
              "name": "Smith",
              "firstName": "Joe"
            },
            {
              "name": "Lincoln",
              "firstName": "Abraham"
            }
          ]
        }
      ]
    }
  }
}
```

### Sample Query for Nested Content Fragments - All companies where all employees have won the "Gamestar" award {#sample-all-companies-employee-gamestar-award}

This query illustrates filtering across three nested fragments - `company`, `employee`, and `award`.

**Sample Query**

```xml
query {
  companyList(filter: {
    employees: {
      _apply: ALL
      _match: {
        awards: {
          _match: {
            id: {
              _expressions: [
                {
                  value: "GS"
                  _operator:EQUALS
                }
              ]
            }
          }
        }
      }
    }
  }) {
    items {
      name
      ceo {
        name
        firstName
      }
      employees {
        name
        firstName
        awards {
          id
          title
        }
      }
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "companyList": {
      "items": [
        {
          "name": "Little Pony, Inc.",
          "ceo": {
            "name": "Smith",
            "firstName": "Adam"
          },
          "employees": [
            {
              "name": "Croft",
              "firstName": "Lara",
              "awards": [
                {
                  "id": "GS",
                  "title": "Gamestar"
                }
              ]
            },
            {
              "name": "Slade",
              "firstName": "Cutter",
              "awards": [
                {
                  "id": "GB",
                  "title": "Gameblitz"
                },
                {
                  "id": "GS",
                  "title": "Gamestar"
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```

### Sample Query for Metadata - List the Metadata for Awards titled GB {#sample-metadata-awards-gb}

This query illustrates filtering across three nested fragments - `company`, `employee`, and `award`.

**Sample Query**

```xml
query {
  awardList(filter: {
      id: {
        _expressions: [
          {
            value:"GB"
          }
        ]
    }
  }) {
    items {
      _metadata {
        stringMetadata {
          name,
          value
        }
      }
      id
      title
    }
  }
}
```

**Sample Results**

```xml
{
  "data": {
    "awardList": {
      "items": [
        {
          "_metadata": {
            "stringMetadata": [
              {
                "name": "title",
                "value": "Gameblitz Award"
              },
              {
                "name": "description",
                "value": ""
              }
            ]
          },
          "id": "GB",
          "title": "Gameblitz"
        }
      ]
    }
  }
}
```

## Sample Queries using the WKND Project {#sample-queries-using-wknd-project}

These sample queries are based on the WKND project. This has:

* Content Fragment Models available under:
  `http://<hostname>:<port>/libs/dam/cfm/models/console/content/models.html/conf/wknd`

* Content Fragments (and other content) available under:
  `http://<hostname>:<port>/assets.html/content/dam/wknd/en`

>[!NOTE]
>
>As the results can be extensive they are not reproduced here.

### Sample Query for all Content Fragments of a certain model with the specified properties {#sample-wknd-all-model-properties}

This sample query interrogates:

* for all Content Fragments of type `article`
* with the `path`and `author` properties.

**Sample Query**

```xml
{
  articleList {
    items {
      _path
      author
    }
  }
}
```

### Sample Query for Metadata {#sample-wknd-metadata}

This query interrogates:

* for all Content Fragments of type `adventure`
* metadata

**Sample Query**

```xml
{
  adventureList {
    items {
      _path,
      _metadata {
        stringMetadata {
          name,
          value
        }
        stringArrayMetadata {
          name,
          value
        }
        intMetadata {
          name,
          value
        }
        intArrayMetadata {
          name,
          value
        }
        floatMetadata {
          name,
          value
        }
        floatArrayMetadata {
          name,
          value
        }
        booleanMetadata {
          name,
          value
        }
        booleanArrayMetadata {
          name,
          value
        }
        calendarMetadata {
          name,
          value
        }
        calendarArrayMetadata {
          name,
          value
        }
      }
    }
  }
}
```

### Sample Query for a single Content Fragment of a given Model {#sample-wknd-single-content-fragment-of-given-model}

This sample query interrogates:

* for a single Content Fragment of type `article` at a specific path
  * within that, all formats of content:
    * HTML
    * Markdown
    * Plain Text
    * JSON

**Sample Query**

```xml
{
  articleByPath (_path: "/content/dam/wknd/en/magazine/alaska-adventure/alaskan-adventures") {
    item {
        _path
        author
        main {
          html
          markdown
          plaintext
          json
        }
    }
  }
}
```

### Sample Query for a Content Fragment Model from a Model {#sample-wknd-content-fragment-model-from-model}

This sample query interrogates:

* for a single Content Fragment 
  * details of the underlying Content Fragment Model 
  
**Sample Query**

```xml
{
  adventureByPath(_path: "/content/dam/wknd/en/adventures/riverside-camping-australia/riverside-camping-australia") {
    item {
      _path
      adventureTitle
      _model {
        _path
        title
      }
    }
  }
}
```

### Sample Query for a Nested Content Fragment - Single Model Type{#sample-wknd-nested-fragment-single-model}

This query interrogates:

* for a single Content Fragment of type `article` at a specific path
  * within that, the path and author of the referenced (nested) fragment

>[!NOTE]
>
>The field `referencearticle` has the Data type `fragment-reference`.

**Sample Query**

```xml
{
  articleByPath (_path: "/content/dam/wknd/en/magazine/skitouring/skitouring") {
    item {
        _path
        author
        referencearticle {
          _path
          author
      }
    }
  }
}
```

### Sample Query for a Nested Content Fragment - Multiple Model Type{#sample-wknd-nested-fragment-multiple-model}

This query interrogates:

* for multiple Content Fragments of type `bookmark`
  * with Fragment References to other fragments of the specific model types `article` and `adventure`

>[!NOTE]
>
>The field `fragments` has the Data type `fragment-reference`, with the models `Article`, `Adventure` selected.

```xml
{
  bookmarkList {
    items {
        fragments {
          ... on ArticleModel {
            _path
            author
          }
          ... on AdventureModel {
            _path
            adventureTitle
          }
        }
     }
  }
}
```

### Sample Query for a Content Fragment of a specific Model with Content References{#sample-wknd-fragment-specific-model-content-reference}

There are two flavors of this query:

1. To return all content references.
1. To return the specific content references of type `attachments`.

These queries interrogate:

* for multiple Content Fragments of type `bookmark`
  * with Content References to other fragments 

#### Sample Query for multiple Content Fragments with Prefetched References {#sample-wknd-multiple-fragments-prefetched-references}

The following query returns all content references by using `_references`:

```xml
{
  bookmarkList {
     _references {
         ... on ImageRef {
          _path
          type
          height
        }
        ... on MultimediaRef {
          _path
          type
          size
        }
        ... on DocumentRef {
          _path
          type
          author
        }
        ... on ArchiveRef {
          _path
          type
          format
        }
    }
    items {
        _path
    }
  }
}
```

#### Sample Query for multiple Content Fragments with Attachments {#sample-wknd-multiple-fragments-attachments}

The following query returns all `attachments` - a specific field (sub-group) of type `content-reference`:

>[!NOTE]
>
>The field `attachments` has the Data type `content-reference`, with various forms selected.

```xml
{
  bookmarkList {
    items {
      attachments {
        ... on PageRef {
          _path
          type
        }
        ... on ImageRef {
          _path
          width
        }
        ... on MultimediaRef {
          _path
          size
        }
        ... on DocumentRef {
          _path
          author
        }
        ... on ArchiveRef {
          _path
          format
        }
      }
    }
  }
}
```

### Sample Query for a single Content Fragment with RTE Inline Reference {#sample-wknd-single-fragment-rte-inline-reference}

This query interrogates:

* for a single Content Fragment of type `bookmark` at a specific path
  * within that, RTE inline references

>[!NOTE]
>
>The RTE inline references are hydrated in `_references`.

**Sample Query**

```xml
{
  bookmarkByPath(_path: "/content/dam/wknd/en/bookmarks/skitouring") {
    item {
      _path
      description {
        json
      }
    }
    _references {
      ... on ArticleModel {
        _path
      }
      ... on AdventureModel {
        _path
      }
      ... on ImageRef {
        _path
      }
      ... on MultimediaRef {
        _path
      }
      ... on DocumentRef {
        _path
      }
      ... on ArchiveRef {
        _path
      }
    }
  }
}
```

### Sample Query for a single Content Fragment variation of a given Model {#sample-wknd-single-fragment-given-model}

This query interrogates:

* for a single Content Fragment of type `article` at a specific path
  * within that, the data related to the variation: `variation1`

**Sample Query**

```xml
{
  articleByPath (_path: "/content/dam/wknd/en/magazine/alaska-adventure/alaskan-adventures", variation: "variation1") {
    item {
      _path
      author
      main {
        html
        markdown
        plaintext
        json
      }
    }
  }
}
```

### Sample Query for a named Variation of multiple Content Fragments of a given Model {#sample-wknd-variation-multiple-fragment-given-model}

This query interrogates:

* for Content Fragments of type `article` with a specific variation: `variation1`

**Sample Query**

```xml
{
  articleList (variation: "variation1") {
    items {
      _path
      author
      main {
        html
        markdown
        plaintext
        json
      }
    }
  }
}
```

### Sample Query for multiple Content Fragments of a given locale {#sample-wknd-multiple-fragments-given-locale}

This query interrogates:

* for Content Fragments of type `article` within the `fr` locale

**Sample Query**

```xml
{ 
  articleList (_locale: "fr") {
    items {
      _path
      author
      main {
        html
        markdown
        plaintext
        json
      }
    }
  }
}
```

## The Sample Content Fragment Structure (used with GraphQL) {#content-fragment-structure-graphql}

The sample queries are based on the following structure, which uses:

* One, or more, [Sample Content Fragment Models](#sample-content-fragment-models-schemas) - form the basis for the GraphQL schemas

* [Sample Content Fragments](#sample-content-fragments) based on the above models

### Sample Content Fragment Models (Schemas) {#sample-content-fragment-models-schemas}

For the sample queries, we will use the following Content Models, and their interrelationships (references ->):

* [Company](#model-company)
  -> [Person](#model-person)
  &nbsp;&nbsp;&nbsp;&nbsp;-> [Award](#model-award)

* [City](#model-city)

#### Company {#model-company}

The basic fields defining the company are:

| Field Name | Data Type | Reference |
|--- |--- |--- |
| Company Name | Single line text | |
| CEO | Fragment Reference (single) | [Person](#model-person) |
| Employees | Fragment Reference (multifield) | [Person](#model-person) |

#### Person {#model-person}

The fields defining a person, who can also be an employee:

| Field Name | Data Type | Reference |
|--- |--- |--- |
| Name | Single line text | |
| First name | Single line text | |
| Awards | Fragment Reference (multifield) | [Award](#model-award) |

#### Award {#model-award}

The fields defining an award are:

| Field Name | Data Type | Reference |
|--- |--- |--- |
| Shortcut/ID | Single line text | |
| Title | Single line text | |

#### City {#model-city}

The fields for defining a city are:

| Field Name | Data Type | Reference |
|--- |--- |--- |
| Name | Single line text | |
| Country | Single line text | |
| Population | Number | |
| Categories | Tags | |

### Sample Content Fragments {#sample-content-fragments}

The following fragments are used for the appropriate model. 

#### Company {#fragment-company}

| Company Name | CEO | Employees |
|--- |--- |--- |
| Apple | Steve Jobs | Duke Marsh<br>Max Caulfield |
| Little Pony Inc. | Adam Smith | Lara Croft<br>Cutter Slade |
| NextStep Inc. | Steve Jobs | Joe Smith<br>Abe Lincoln |

#### Person {#fragment-person}

| Name | First Name | Awards |
|--- |--- |--- |
| Lincoln | Abe | |
| Smith | Adam | |
| Slade | Cutter | Gameblitz<br>Gamestar |
| Marsh | Duke | | 
| Smith | Joe | |
| Croft | Lara | Gamestar |
| Caulfield | Max | Gameblitz |
| Jobs | Steve | |

#### Award {#fragment-award}

| Shortcut/ID | Title |
|--- |--- |
| GB | Gameblitz |
| GS | Gamestar |
| OSC | Oscar |

#### City {#fragment-city}

| Name | Country | Population | Categories |
|--- |--- |--- |--- |
| Basel | Switzerland | 172258 | city:emea |
| Berlin | Germany | 3669491 | city:capital<br>city:emea |
| Bucharest | Romania | 1821000 | city:capital<br>city:emea |
| San Francisco | USA | 883306 | city:beach<br>city:na |
| San Jose | USA | 102635 | city:na |
| Stuttgart | Germany | 634830 | city:emea |
| Zurich | Switzerland | 415367 | city:capital<br>city:emea |
