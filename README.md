# Flutter Products Full App Tutorial

## Video Tutorial

Video Tutorial: [YouTube Video](https://youtu.be/wXy-8L1G3xA)  
Blog: [Article](https://jedipixels.dev/flutter-products-full-app-tutorial)  
Source Code: [GitHub](https://github.com/JediPixels/products)

# ![](https://github.com/JediPixels/products/blob/master/readmeassets/Products_Light_Dark_Mode_Full_480.gif)

**Timeline**  
00:00:00 - Part 1 Intro
00:04:43 - Part 2
00:39:42 - Part 3
01:48:32 - Part 4
02:34:49 - Part 5
03:30:15 - Part 6
04:00:22 - Part 7
04:48:53 - Part 8
05:39:56 - Part 9
06:11:37 - Part 10
06:34:01 - Outro

---
In this project, this is a small partial list of what you are going to take a look at:

-   API
-   Auth
-   Auth to load Products Feed
-   Check the Internet Connection
-   json.decode
-   Isolate
-   compute - Spawn a Isolate
-   Isolate.spawn
-   StreamBuilder
-   StreamController
-   Sink
-   Streams
-   ValueListenableBuilder
-   ValueNotifier
-   ScrollController
-   ListView
-   ListTile  
    ThemeData()
-   SliverToBoxAdapter
-   SliverList
-   SliverChildBuilderDelegate
-   RoundedRectangleBorder
-   AspectRatio
-   Image.network
-   FadeInImage
-   loadingBuilder
-   ImageChunkEvent
-   NumberFormat.simpleCurrency()
-   NumberFormat.percentPattern()
-   Services
-   Models
-   Widgets
-   Helpers
-   Business Logic
-   UI/ UX
-   packages
---

## Part 1 – Introduction

**What we’ll cover:**

-   Take a look at the [dummyjson.com](https://dummyjson.com) free JSON service
-   Ability to test Authentication
-   Retrieve records with Authentication Token

**Create Project called products**

-   Separate Business Logic
-   UI/UX

**Create Models needed for API calls**

-   Auth Model
-   Auth Error Model
-   Product Model
-   Products List Model

**Create Services to make API Calls**

-   API Values Service
-   Authentication Service
-   Connection Service – Check Internet Connection
-   Product List Service
-   Product Service

**Create Reusable Widgets**

-   Products `ListView`
-   Products `ListView Item 1`
-   Products `ListView Item 2`
-   Products `ListView Card`
-   Star Rating
-   Status Message

**Create Helpers**

-   App Helpers

**Performance – Rebuild only what is needed by using…**

-   `StreamBuilder`
-   `Streams`
-   `ValueListenableBuilder`
-   `ValueNotifier`
-   Parse JSON server response via `json.decode`
-   Parse JSON Via `compute` – Spawn a Isolate
-   Parse JSON Via `Isolate.spawn` – Manually spawn Isolate plus message

**Retrieve Records via pagination**

-   `ScrollController`
-   `ScrollController Listener`
-   `ScrollController` check scrolling `offset` and `maxScroll Extent` to retrieve the next 10 records

**Themes**

-   Light Mode
-   Dark Mode
-   Switch Between Modes

**Version Control**

-   GitHub

## Part 2

**What we’ll cover:**

-   Create Products Flutter Project
-   Platforms, Android, iOS, Web
-   Enable GitHub for project

-   Modify `main.dart` to handle Light & Dark Mode by creating Themes via `ThemeData()`
-   Add Home Page base layout
-   Overview of Free [DummyJson.com](https://DummyJson.com) API JSON Service
-   Create partial project folder structure

-   Overview of [App.QuickType.io](https://App.QuickType.io) to convert JSON to Dart Class for Data Models
-   Create Auth Model, Auth Error Model, Product Model, Product List Classes

-   Add `http`, `connectivity_plus`, `intl` packages to `pubspec.yaml` file by running the `flutter pub add <packagename>` command. This automatically adds the packages to the `pubspec.yaml` file with the latest version.

-   `http` package – To consume HTTP resources
-   `connectivity_plus` package – Discover network (internet) connectivity
-   `intl` package – Number formatting, currency, internationalization and localization

## Part 3

**What we’ll cover:**

-   Create Connection Service
-   Create Product List Service
-   `StreamController`
-   `Sink`
-   `Stream`
-   Implement `StreamBuilder` for Home page for Product List Service
-   Create Status Message Widget
-   Push changes to GitHub

## **Part 4**

**What we’ll cover:**

-   Create API Values Service
-   Create Auth Service
-   Use `http.post` to call API Service
-   Process JSON `response`
-   `StreamBuilder` watch for Product List Service Snapshot Connection
-   Push changes to GitHub

## Part 5

**What we’ll cover:**

-   Product Service

-   Use `http.get` to call API Service
-   Use Auth Token to Retrieve Products
-   Use Paging to Retrieve the next 10 Products

-   Parse JSON Server Response via `json.decode`
-   Parse JSON Via `compute` – Spawn a Isolate
-   Parse JSON Via `Isolate.spawn` – Manually Spawn Isolate plus Message

-   Create Products Service Background Message
-   Create Products Service Background Parser
-   Push changes to GitHub

## Part 6

**What we’ll cover:**

-   `AppBar` – Add Dynamic Content
-   Show Products Count
-   Get Next 10 Records IconButton
-   `DropdownButton` to Choose Different Templates
-   `DropdownMenuItem`

-   `StreamBuilder` for Performance
-   `ValueListenableBuilder` for `DropdownButton` Performance
-   `ValueNotifier`
-   Create App Helpers

## Part 7

**What we’ll cover:**

-   Create Products `ListView` Widget
-   `CustomScrollView`
-   `SliverToBoxAdapter`
-   `SliverList`
-   `SliverChildBuilderDelegate`

-   Create Products `ListView Item Card` Template
-   `Card Widget`
-   `RoundedRectangleBorder`
-   `AspectRatio`

-   `Image.network`
-   `FadeInImage`
-   `ListView.builder`
-   `ListTile`
-   Push changes to GitHub

## Part 8

**What we’ll cover:**

-   Create Star Rating Widget
-   Create `getProducts` method
-   Create Products List Model
-   Create Products ListView Item 1 Template

-   `AspectRatio`
-   `Image.network`
-   `ListView.builder`
-   `ListTile`

-   `NumberFormat.simpleCurrency()` for Price
-   `NumberFormat.percentPattern()` for Discount Percentage

-   `CustomScrollView`
-   `SliverToBoxAdapter`
-   `SliverList`
-   `SliverChildBuilderDelegate`
-   Push changes to GitHub

## Part 9

**What we’ll cover:**

-   Create Assets Images Folders
-   Add Placeholder Image
-   Enable assets in `pubspec.yaml`
-   Create Products ListView Item 2 Template

-   `NumberFormat.simpleCurrency()` for Price
-   `NumberFormat.percentPattern()` for Discount Percentage

-   `ListView.builder`
-   `ListTile`
-   `Image.network`
-   `BoxFit`  
    `loadingBuilder` – Track `ImageChunkEvent`
-   `CircularProgressIndicator`

**TEST**

-   Parse JSON Server Response via `json.decode`
-   Parse JSON Via `compute` – Spawn a Isolate
-   Parse JSON Via `Isolate.spawn` – Manually Spawn Isolate plus Message

-   General Overview
-   Push changes to GitHub

## Part 10

**What we’ll cover:**

**Supplemental**

Alternate ways to build the `ListView` to view different performance issues between `CustomScrollView`, `SilverChildBuilderDelegate` -vs- `ListView.builder`, `ListView.separated` when you combine multiple widgets. When you mix different scrolling widgets, like vertical or horizontal, the ListView.builder instead of building the visible records, can rebuild all of the fetched records. In theory, things should work this way, but when you combine them you might have side effects, especially performance.

- `ListView.builder`
- `ListView.separated`
- Test for Performance
- Use `debugPrint` to View number of Builds
- Push changes to GitHub

