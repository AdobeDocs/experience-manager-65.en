---
title: Removing the Geometrixx Sites
description: Learn how to remove the sample Geometrixx content.

contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference

---

# Removing the Geometrixx Sites{#removing-the-geometrixx-sites}

AEM comes with a set of sample Geometrixx websites. You can remove this sample content through the **Package Manager**.

The individual geometrixx-related packages are:

* `cq-geometrixx-outdoors-ugc-pkg-<version>.zip`
* `cq-geometrixx-pkg-<version>.zip`
* `cq-content-mac-<version>.zip`
* `cq-geometrixx-login-pkg-<version>.zip`
* `cq-geometrixx-users-pkg-<version>.zip`
* `cq-geometrixx-workflow-pkg-<version>.zip`
* `cq-geometrixx-outdoors-pkg-<version>.zip`
* `cq-geometrixx-commons-pkg-<version>.zip`
* `cq-geometrixx-media-pkg-<version>.zip`

To remove an individual package, simple click **Uninstall** on that package.

There is also a super-package:

* `cq-geometrixx-all-pkg-5.6.12.zip`

This package includes all the above individual packages. To remove all the geometrixx-related content at once, click **Uninstall** on this package. The super-package goes into the uninstalled state, and all the individual packages disappear from the Package Manager view.

You have now an "empty" AEM instance without any demonstration sites.

>[!NOTE]
>
>When upgrading, Geometrixx sites are automatically reinstalled. Remove Geometrixx web sites after upgrading if you do not want these samples.

