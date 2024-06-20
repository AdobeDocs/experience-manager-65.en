---
title: Dynamically populating drop-down lists
description: Procedure to dynamically populate drop-down lists based on some logic
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 64b88423-aaae-4258-bf48-73df5c9353ea
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Dynamically populating drop-down lists {#dynamically-populating-drop-down-lists}

## Prerequisites {#prerequisites}

* [Creating OSGI bundles](https://helpx.adobe.com/experience-manager/using/creating-osgi-bundles-digital-marketing.html)
* [Developing AEM components](/help/sites-developing/components.md)
* [Creating adaptive form](../../forms/using/creating-adaptive-form.md)
* [Authoring adaptive form](../../forms/using/introduction-forms-authoring.md)

## Procedure to dynamically populate drop-down lists {#procedure-to-dynamically-populate-drop-down-lists}

Consider a scenario where you want to populate the **State** drop-down list based on a value that you select in the **Country** drop-down list. If you select Australia in the **Country** drop-down list, the **State** drop-down list displays the states within Australia. The following procedure describes how to accomplish this task.

1. Create a project with the following modules:

    * The bundle that contains the logic to populate the drop-down, which in this case is a servlet.
    * The content, which embeds the .jar file and has a drop-down resource. The servlet points to this resource.

1. Write a servlet based on the request parameter Country, which returns an array that contains the names of states within the country.

   ```java
   @Component(metatype = false)
   @Service(value = Servlet.class)
   @Properties({
           @Property(name = "sling.servlet.resourceTypes", value = "/apps/populatedropdown"),
           @Property(name = "sling.servlet.methods", value = {"GET", "POST"}),
           @Property(name = "service.description", value = "Populate states dropdown based on country value")
   })
   public class DropDownPopulator extends SlingAllMethodsServlet {
       private Logger logger = LoggerFactory.getLogger(DropDownPopulator.class);

       protected void doPost(SlingHttpServletRequest request,
                             final SlingHttpServletResponse response)
               throws ServletException, IOException {
           response.setHeader("Access-Control-Allow-Origin", "*");
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");
           try {
               String US_STATES[] = {"0=Alabama",
                       "1=Alaska",
                       "2=Arizona",
                       "3=Arkansas",
                       "4=California",
                       "5=Colorado",
                       "6=Connecticut",
                       "7=Delaware",
                       "8=Florida",
                       "9=Georgia",
                       "10=Hawaii",
                       "11=Idaho",
                       "12=Illinois",
                       "13=Indiana",
                       "14=Iowa",
                       "15=Kansas",
                       "16=Kentucky",
                       "17=Louisiana",
                       "18=Maine",
                       "19=Maryland",
                       "20=Massachusetts",
                       "21=Michigan",
                       "22=Minnesota",
                       "23=Mississippi",
                       "24=Missouri",
                       "25=Montana",
                       "26=Nebraska",
                       "27=Nevada",
                       "28=New Hampshire",
                       "29=New Jersey",
                       "30=New Mexico",
                       "31=New York",
                       "32=North Carolina",
                       "33=North Dakota",
                       "34=Ohio",
                       "35=Oklahoma",
                       "36=Oregon",
                       "37=Pennsylvania",
                       "38=Rhode Island",
                       "39=South Carolina",
                       "40=South Dakota",
                       "41=Tennessee",
                       "42=Texas",
                       "43=Utah",
                       "44=Vermont",
                       "45=Virginia",
                       "46=Washington",
                       "47=West Virginia",
                       "48=Wisconsin",
                       "49=Wyoming"};
               String AUSTRALIAN_STATES[] = {"0=Ashmore and Cartier Islands",
                       "1=Australian Antarctic Territory",
                       "2=Australian Capital Territory",
                       "3=Christmas Island",
                       "4=Cocos (Keeling) Islands",
                       "5=Coral Sea Islands",
                       "6=Heard Island and McDonald Islands",
                       "7=Jervis Bay Territory",
                       "8=New South Wales",
                       "9=Norfolk Island",
                       "10=Northern Territory",
                       "11=Queensland",
                       "12=South Australia",
                       "13=Tasmania",
                       "14=Victoria",
                       "15=Western Australia"};
               String country = request.getParameter("country");
               JSONArray stateJsonArray = new JSONArray();
               if (country.length() > 0) {
                   if ("australia".equalsIgnoreCase(country)) {
                       stateJsonArray = new JSONArray();
                       for (String state : AUSTRALIAN_STATES) {
                           stateJsonArray.put(state);
                       }
                   } else if ("unitedstates".equalsIgnoreCase(country)) {
                       stateJsonArray = new JSONArray();
                       for (String state : US_STATES) {
                           stateJsonArray.put(state);
                       }
                   }
                   response.setContentType("application/json");
                   response.getWriter().write(stateJsonArray.toString());
               }

           } catch ( Exception e) {
               logger.error(e.getMessage(), e);
           }
       }
   }
   ```

1. Create a drop-down node under a particular folder hierarchy in apps (for example, create a node under /apps/myfolder/demo). Ensure that the `sling:resourceType` parameter for the node is the same as that to which the servlet points (/apps/populatedropdown).

   ![Create a drop-down node](assets/dropdown-node.png)

1. Package the content node and embed the .jar file at a particular location (for example, /apps/myfolder/demo/install/). Deploy the same file on the server.
1. Create an adaptive form and add two drop-down lists, Country and State to it. The Country list can include the names of countries. The State list can dynamically populate the names of states for the country you select in the first list.

   Add the names of countries to display in Country list. In the State list, add a script to populate it based on the name of the country in the Country list.

   ![Adding country names](assets/country-dropdown.png) ![Adding script to populate state names](assets/state-dropdown.png) ![Country and State drop-down lists togather](assets/2dropdowns.png)

   ```javascript
   JSON.parse(
       $.ajax({
           url: "/apps/myfolder/demo/dropdown",
           type: "POST",
           async: false,
           data: {"country": country.value},
            success: function(res){},
            error : function (message) {
                 guideBridge._guide.logger().log(message);
                 successFlag = false;
                 }
              })
   .responseText);
   ```

The Content package that contains a sample adaptive form (demo/AFdemo) with the above code implemented.

[Get File](assets/dropdown-demo-content-1.0.1-snapshot.zip)
