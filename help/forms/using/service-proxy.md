---
title: HTML5 forms service proxy
description: HTML5 forms Service Proxy is a configuration to register a proxy for the submission service. To configure Service Proxy, specify the URL of submission service through request parameter submissionServiceProxy.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
docset: aem65
feature: HTML5 Forms,Mobile Forms
exl-id: 8f9b10ae-1600-49c2-a061-153a2a89c67e
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# HTML5 forms service proxy{#html-forms-service-proxy}

HTML5 forms Service Proxy is a configuration to register a proxy for the submission service. To configure Service Proxy, specify the URL of submission service through request parameter *submissionServiceProxy*.

## Benefits of Service Proxy {#benefits-of-service-proxy-br}

The service proxy eliminates following:

* HTML5 forms workflow requires opening up of the submission service "/content/xfaforms/submission/default" for the HTML5 forms users. It exposes AEM servers to a wider unintended audience.
* The service URL is embedded in the runtime model of the form. It is not possible to change service URL path.
* The submission is two-step process. To submit the form data, submission requires at least two journeys to server. Thus, increases load on the server.
* HTML5 forms send data in the POST request instead of PDF request. For workflow involving both PDF and HTML5 forms, two different methods of processing the submissions are required.

### Topologies {#topologies-br}

HTML5 forms can use following topologies to connect to the AEM servers.

* A topology where AEM Server or HTML5 forms send data via POST to the server.
* A topology where proxy server sends POST data to the server.

![HTML5 forms service proxy topologies](assets/topology.png)

HTML5 forms service proxy topologies

HTML5 forms connect to the AEM servers to run server-sided scripts, web-services, and submissions. The XFA runtime of the HTML5 forms uses Ajax calls on "/bin/xfaforms/submitaction" end point with various parameters to connect to the AEM servers. HTML5 forms connect AEM servers to perform following operations:

#### Execute Server-sided scripts and Web Services {#execute-server-sided-scripts-and-web-services}

The scripts marked to run on the server are known as server-sided scripts. The following table lists all the parameters used in Server-sided scripts and Web Services.

<table>
 <tbody>
  <tr>
   <td><p><strong>Parameter</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p>activity</p> </td>
   <td><p>Activity contains the events that trigger the request. Such as click, exit or change</p> </td>
  </tr>
  <tr>
   <td><p>contextSom</p> </td>
   <td><p>contextSom contains SOM expression of the object where events are executed.</p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>Template contains the template used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>contentRoot</p> </td>
   <td><p>contentRoot contains the template root directory used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>Data</p> </td>
   <td><p>Data contains bata bytes used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>formDom</p> </td>
   <td><p>formDom contains DOM of the HTML5 form in JSON format.</p> </td>
  </tr>
  <tr>
   <td><p>packet</p> </td>
   <td><p>packet is specified as form.</p> </td>
  </tr>
  <tr>
   <td><p>debugDir</p> </td>
   <td><p>debugDir contains the debug directory used to render the form.</p> </td>
  </tr>
 </tbody>
</table>

#### Submit data {#submit-data}

On clicking the submit button, HTML5 forms send data to the server. The following table lists all the parameters that HTML5 forms send to server.

<table>
 <tbody>
  <tr>
   <td><p><strong>Parameter</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p>Template</p> </td>
   <td><p>Template used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>contentRoot</p> </td>
   <td><p>template root directory used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>Data</p> </td>
   <td><p>bata bytes used to render the form.</p> </td>
  </tr>
  <tr>
   <td><p>formDom</p> </td>
   <td><p>DOM of the HTML5 form in JSON format.</p> </td>
  </tr>
  <tr>
   <td><p>submiturl</p> </td>
   <td><p>The URL where data XML is posted.</p> </td>
  </tr>
  <tr>
   <td><p>debugDir</p> </td>
   <td><p>The debug directory used to render the form.</p> </td>
  </tr>
 </tbody>
</table>

#### How&nbsp;the&nbsp;submit proxy works? {#how-nbsp-the-nbsp-submit-proxy-works}

The submit service proxy acts as a pass through if the submiturl is not present in the request parameter. It acts as a pass-through. It sends the request to the /bin/xfaforms/submitaction end point and sends the response to the XFA runtime.

The submit service proxy selects a topology if the submiturl is present in the request parameter.

* If AEM servers post the data, proxy service acts as a pass-through. It sends the request to the /bin/xfaforms/submitaction end point and sends the response to the XFA runtime.
* If proxy posts the data, the proxy service passes all the parameters except submitUrl to the */bin/xfaforms/submitaction* end point and receives xml bytes in response stream. Then, the proxy service posts the data xml bytes to the submitUrl for processing.

* Before sending data (POST request) to a server, HTML5 forms verify connectivity and availability of the server. To verify connectivity and availability, HTML forms send an empty head request to the server. If the server is available, HTML5 form sends data (POST request) to the server. If the server is not available, an error message, *Could’t connect to the server,* is displayed. The advance detection prevents users from the hassle of refilling the form. The proxy servlet handles head request and does not throw exception.
