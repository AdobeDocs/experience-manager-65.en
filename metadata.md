---
cloud: experience-cloud
solution-title: Learn & Support
solution-hub-url: https://helpx.adobe.com/support/experience-manager/6-5.html
solution-icon: assets/experience-cloud-logo-24.png
getting-started-title: Getting Started
getting-started-url: https://helpx.adobe.com/experience-manager/tutorials.html
tutorials-title: Tutorials
tutorials-url: https://helpx.adobe.com/experience-manager/kt/index/aem-6-5-videos.html
mini-toc-levels: 2
git-repo: https://github.com/AdobeDocs/experience-manager-65.en
index: n
---

# Metadata for internal use

The metadata.md file includes repo-level metadata that passes through to user guide TOC.md files in the repo. If you want to change metadata.md content for any user guide, do so in any TOC.md file.

| metadata | what it does |
|--- |--- |
| solution-title | Used in article header as link |
| solution-hub-url | Opens helpx hub page |
| solution-icon | Displays solution icon next to solution title. Not yet implemented |
| getting-started-url | Link to helpx getting started page |
| tutorials-url | Link to video tutorials--either helpx tutorials or KT tutorials |
| mini-toc-levels | Determines the number of heading levels that appear in right rail. default is 2 |
| git-repo | Specifies the location of the master repo for internal use |

In TOC.md file

| metadata | what it does |
|--- |--- |
| user-guide-title | Used in article header as link |
| user-guide-url | Opens helpx hub page |
