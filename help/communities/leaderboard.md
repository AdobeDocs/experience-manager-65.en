---
title: Leaderboard Essentials
description: Learn how to configure Communities Scoring and Badges so that you can work with the Leaderboard component in Adobe Experience Manager Communities.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: fd1b1749-13f9-4079-ae39-348676105852
---
# Leaderboard Essentials {#leaderboard-essentials}

This page provides the essential information for working with the leaderboard feature.

Before including the leaderboard component on a page, it is necessary to configure [Communities Scoring and Badges](implementing-scoring.md). 

See [Scoring and Badges Essentials](configure-scoring.md).

## Essentials for Client-Side {#essentials-for-client-side}

<table>
 <tbody>
  <tr>
   <td> <strong>resourceType</strong></td>
   <td>social/gamification/components/hbs/leaderboard</td>
  </tr>
  <tr>
   <td> <a href="scf.md#add-or-include-a-communities-component"><strong>includable</strong></a></td>
   <td>No</td>
  </tr>
  <tr>
   <td> <a href="clientlibs.md"><strong>clientllibs</strong></a></td>
   <td>cq.social.gamification.hbs.leaderboard</td>
  </tr>
  <tr>
   <td> <strong>templates</strong></td>
   <td> /libs/social/gamification/components/hbs/leaderboard/leaderboard.hbs<br /> </td>
  </tr>
  <tr>
   <td> <strong>css</strong></td>
   <td> /libs/social/gamification/components/hbs/leaderboard/clientlibs/leaderboard.css</td>
  </tr>
  <tr>
   <td><strong> properties</strong></td>
   <td>See <a href="enabling-leaderboard.md">Leaderboard Feature</a></td>
  </tr>
 </tbody>
</table>

* [Client-side Customizations](client-customize.md)

### File Library Function {#file-library-function}

A community site structure that includes the [Leaderboard function](functions.md#leaderboard-function), includes a configured `leaderboard` component.
