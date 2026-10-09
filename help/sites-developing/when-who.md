---
title: Testing - when and with whom?
description: Various roles can be involved in testing and at various stages of project development.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference
exl-id: 5a16be40-eede-4a47-b03b-3993e285232e
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Testing - when and with whom?{#testing-when-and-with-whom}

Various roles can be involved in testing and at various stages of project development.

<table>
 <tbody>
  <tr>
   <td>Test Team</td>
   <td>Responsible for... </td>
   <td>When...</td>
  </tr>
  <tr>
   <td>Development Team</td>
   <td>The development team is responsible for your unit tests and some integration tests.</td>
   <td>These tests are first in the chain, though they are repeated / extended during development.</td>
  </tr>
  <tr>
   <td>Quality Assurance Team</td>
   <td><p>You need a Quality Assurance Team (of whatever size appropriate) for functional and performance tests.</p> <p>These are neutral, dedicated testers - a golden rule of software always states that a developer should never test their own work.</p> <p>The members of this team may be drawn from the Day project team, the partner and/or your customer team.</p> </td>
   <td><p>The first function release should be made available to the testers (when it is possible). Although an early interim release may generate many bugs, it can provide early feedback on critical issues.</p> </td>
  </tr>
  <tr>
   <td>Customer Test Team</td>
   <td><p>Depending on the selected Project Model, it may be planned for members of the customer team to be involved in testing, in particular authors from the customer site.</p> <p>This is advantageous because it:</p>
    <ul>
     <li><p>The customer is provided with experience of the project being developed.</p> </li>
     <li><p>Provides early feedback from the customer.</p> </li>
     <li><p>Users often express their requirements in terms of previous experience; involving the customers in testing as early as possible increases their experience of the new project in terms of <i>hands-on</i> experience.</p> </li>
    </ul> </td>
   <td><p>Again early involvement is good, though any release the customers use should be stable, with reasonable functionality.</p> <p>First impressions are always important.</p> </td>
  </tr>
 </tbody>
</table>
