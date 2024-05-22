---
title: Managing the categories displayed in Workspace

description: In Workspace, the processes that a user can start are displayed in categories in the left navigation pane. Learn how you can manage these categories displayed in Workspace.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_workspace
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 62621fe9-f69f-4bc0-aecc-d7bcc3064516
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Managing the categories displayed in Workspace {#managing-the-categories-displayed-in-workspace}

In Workspace, the processes that a user can start are displayed in categories in the left navigation pane. You can set up the categories in administration console, or process designers can set them up in Workbench. When process designers creates processes, they assign them to categories.

When you specify category names, create them so that they appear properly in the Workspace navigation pane. By default, the left navigation pane has a fixed width of 210 pixels, which is approximately 24 characters. If the category name that you specify is too long to fit within the fixed width of the left navigation pane, it is truncated. The full name appears only when the mouse pointer is paused over it. Try to avoid category names that will be truncated. The following examples illustrate category names that fit and those that are truncated:

**Category name that fits:** Attendance & Leave

**Category name that is truncated:** Attendance & Leave (United States)

In Workspace, processes within a category are typically displayed as cards on the Start Process page. In general, six cards can be displayed on the screen for a category before the user is required to scroll to view remaining cards. Because scrolling makes it more difficult to find a process, consider limiting each category to six processes or, depending on your resolution, limiting the number of processes that can be displayed on the screen without requiring any scrolling.

If you are using MySQL as your AEM forms database, Administration Console cannot differentiate between two category names that differ only in the use of extended characters. For example, if you create a category named abcde and a category named âbcdè, they are considered the same.

## Add a category {#add-a-category}

1. In administration console, click Services &gt; Applications and Services &gt; Category Management.
1. Click Add. If you wish to add a sub-cateogry, select a category and then click Add.
1. In the Name box, type a name for the category and in the Description box, type a description of the category.
1. Click Add. The category is displayed on the Category Management page.

   ***note**: You can add only up to five levels of hierarchy when creating categories.*

## Edit a category {#edit-a-category}

1. In administration console, click Services &gt; Applications and Services &gt; Category Management.
1. Select the category you wish to edit and click Edit. Alternatively, you can double-click a category to edit.
1. Edit the name of the category in the Name box.

## Remove a category {#remove-a-category}

You can remove only the categories that are not in use.

1. In administration console, click Services &gt; Applications and Services &gt; Category Management.
1. On the Category Management page, select the check box for the category to remove and click Remove. The category is no longer displayed.
