# Agora Vote iOS

## Student Name: Siddharth Sen [@siddharth952](https://gitlab.com/siddharth952)  [Linkedin](https://www.linkedin.com/in/siddharth952/)

## Organization: [AOSSIE](https://aossie.gitlab.io/)

## [Agora iOS](https://gitlab.com/aossie/agora-ios/)

[Source Code](https://gitlab.com/aossie/agora-ios/-/tree/gsoc-2020) [Product Videos](https://drive.google.com/drive/folders/1ZkNTaq9s4lmBmVGHHXYLXNrKBt0pWH4D?usp=sharing)

## Mentors: [Thuvarakan](https://github.com/Thuva4), [Bruno Woltzenlogel Paleo](https://github.com/ceilican), [Mukul Kumar](https://github.com/mukulCode),[Abanda Ludovic](https://github.com/icemc)


### Overview of the Application

iOS Application for Agora Web that uses Agora: An Electronic Voting Library implemented in Scala. This application uses Agora Web API as backend application.
It allows for elections to be held by using multiple algorithms such as, Oklahoma, RangeVoting. The application has been built from scratch.

### Goals

I have identified the following tasks in the project at the starting of the project.

1. Facebook/AppleID/Server Authentication and Sign up - **Done**
2. MVVM Architecture - **Done**
3. Build a Custom Calendar Library - **Done**
4. Implement the elections-algorithms - **Done**
5. Integrate Database with API - **Done**
6. Settings View - **Done**
7. Election Details View - **Done**
8. Notifications - **Done**
9. Animations - **Done**
10. CI/CD - **Done**
11. Unit and UI tests - **Done**
12. iPad support - **Done**
13. UI/UX with animations - **Done**
14. Discuss TestFlight - **Done**


### Deep view into the technology.

This project is created using [SwiftUI + UIKit](https://developer.apple.com/xcode/swiftui/) on [Xcode 11](https://developer.apple.com/xcode/).

Minimal libraries have been used in this project ones which are used are below:

* [Facebook SDK for iOS](https://github.com/facebook/facebook-ios-sdk)- To implement User login using social media account Facebook.
* [Realm](https://realm.io/docs/swift/latest/)- No-SQL database, object-oriented, cross-platform database that persists data locally on device it is lightweight and highly performant, capable of handling very large data loads and running queries in fractions of a second.
* [KVKCalendar](https://github.com/kvyatkovskys/KVKCalendar)- Modified this calendar library for the calendar view.
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)- Deal with JSON data in Swift.
* [Alamofire](https://github.com/Alamofire/Alamofire)- An HTTP networking library written in Swift.


### Summary of whole GSoC journey

The developer community at AOSSIE is awesome! I worked with my mentor who patiently reviewed my pull requests (PRs) and helped improve my pull requests and code quality.
The first phase of GSoC involved a community bonding period. I built a plan with my mentor for subsequent weeks/months and finalized the mockups. My mentor and I used a shared 'Gitlab Boards' (work-flow management tool) board to keep track of open, merged PRs. I maintained a detailed list of all the PRs created and reviewed, issues created here later helped me during my evaluations. Further, I established the MVVM architecture for a smooth flow of work, added default Xcode tests and the Realm No-SQL database.

In the coding phase one, I added continuous integration via Github Actions. I cached Carthage build files to improve the CI build time, also built the Login/Authentication view. The challenging tasks were Facebook Authentication, Apple Sign In (requires an endpoint in the backend to fully function), implementing Agora-Web API (used Semaphore for API Calls), worked with RealmSwift database to save user information, built the dashboard view elements, custom shapes & Textfields and implemented animations. Used @ObservedObject for 'userResults' for each view which needs to access the user data (Functional Programming)

After this, in the 2nd phase, I worked with the most challenging and main highlight of the project the 'Calendar View' for election events. I modified the 'KVKCalendar' according to my needs, there were many challenges here as it was difficult to alter anything in this framework as many of the elements were dependent on each other. But eventually, with time I was able to overcome them. After the calendar view, I built the 'Create Election View', here I added various utility functions; eg for handling dates, animations, badge popups, element transitions, election model, date picker, handled JSON data, improved navigation; and made the navigation minimal and easy to use. Furthermore, I added UI Tests.

In the last phase, I implemented more UI and Unit Tests, improved the UI of the modified calendar framework (used both 'SwiftUI' and 'UIKit' elements in Calendar View for the Segmented Control, Day, Week, Year), adapted all the views for iPads and made some views exclusive for iPads. Here I also discussed the Apple Developer Platform and 'TestFlight' and we concluded that we would get an open-source development account and would publish the app at a later date.

Over the next 3 months, I saw myself to be able to understand and debug code at a much quicker rate. My ability to manage complex PRs improved many-folds and so did my team-communication skills. 

It was a great experience to be able to develop this project under 3 months and I believe it would not have been possible without the constant guidance of my mentors **Thuvarakan Tharmarajasingam, Abanda Ludovic, Mukul Kumar and Bruno Woltzenlogel Paleo**. I would also like to thank each and every AOSSIE member.

### Merge Requests 

1. [Merge Request !1](https://gitlab.com/aossie/agora-ios/-/merge_requests/26)- Initial skeleton application   (**Merged**)
* Added initial project and default tests.
* Added structure for theviews and other components.
* Added `RealmSwift` dependency.
* Added skeleton for dashboard, election, card view.

2. [Merge Request !2](https://gitlab.com/aossie/agora-ios/-/merge_requests/28)- Add CI with Github Actions   (**Merged**)
* Changed simulator version to use the latest available.
* Cache `Carthage` build to improve build time.
* Xcpretty for better formatting.

3. [Merge Request !3](https://gitlab.com/aossie/agora-ios/-/merge_requests/31)- Add Settings View   (**Merged**)
* Added dual previews (iPhone 11&8).
* Added logout button with confirmation alert.
* Added logout button with `User Defaults` will take the user back to Login View.
* Added user name abbreviation as profile image.
* Added Name and Email in settings view.

4. [Merge Request !4](https://gitlab.com/aossie/agora-ios/-/merge_requests/30)-Add Login View, Signup View   (**Merged**)

* Updated readme and removed the .xcuserstate from git.
* Added dual previews (iPhone 11&8).
* Added custom gradient shape.
* Used inbuilt `AppleID` in `UIKit` in `SwiftUI` view.
* Created custom corner shape that can be applied to any Shape.
* Added Textfield (Username) and SecureField (Password).
* Added `Keyboard Observers`.
* Animations with Username, Password field.
* Added Sign Up View

5. [Merge Request !5](https://gitlab.com/aossie/agora-ios/-/merge_requests/32)-Implement the Agora-Web API   (**Merged**)
* Added `AppUserDefaults` & `UserDefaultsWrappe`r And Rename NetworkingService to `APIService`.
* Added EndPoints and Path for API.
* Added primary key in db identify elections.
* Added getElection method to APIService.
* Updated `Realm` schemaVersion.
* Added `Credentials` and `xAuth user defaults` and login.
* Deleted all elections from the database when logged out.
* Added `ActivityIndicator` and fixed bug with setting API key

6. [Merge Request !6](https://gitlab.com/aossie/agora-ios/-/merge_requests/33)-Add Dashboard User Data & Settings View   (**Merged**)

* Update background color in `Settings View`, change `Database Schema` and `User information` is now saved in the database
* Added `Ballot`, `VoterList` models.
* Added `Total Election`, `Total Pending Elections`, `Total Active Elections`, `Finished Elections` Count.
* Added `ElectionManager` ViewModel.
* Fixed jsonDateFormatter and build @ObservedObject for userResults for each view which needs access to user data.
* Added DatabaseUser for `Realm Database` and UI is updated according to the userData stored in the database.
* Updated Settings view according to the User database.
* Prototyped with `KVKCalender` Framework

7. [Merge Request !7](https://gitlab.com/aossie/agora-ios/-/merge_requests/34)-Add Facebook Login   (**Merged**)
* Added `Facebook` SDK & update `readme.md` with `Facebook` SDK details
* Added Facebook-Button in Login View.
* Modified Facebook SDK `GraphQL` parameters
* Changed/Modified `APIService` to include Facebook Login
* Added API calls using `Semaphore`

8.  [Merge Request !8](https://gitlab.com/aossie/agora-ios/-/merge_requests/35)-Add Apple Sign in, Settings, Signup, fix bugs   (**Merged**)
* Modified `Settings`, `Logout` Buttons
* Added Alert for `Account Details`.
* Fixed Navigation bugs.
* Modified UserTextField to have defaultText
* Added sign in with apple
* Refactored & renamed `ElectionManager` to `DatabaseElectionManager`
* Added `SignInWithAppleCoordinator` & `userSignup` in `APIService`
* Added activity indicator for Sign up &  multiple sheets
* Added Animations in Sign up view

9. [Merge Request !9](https://gitlab.com/aossie/agora-ios/-/merge_requests/37)-Create Election View   (**Merged**)

* Modified states of `Mid_Elections View` to reflect which are present in the API
* Added states which were not present
* Added `ballotOptions`
* Fixed Navigation Bugs
* Added `DateFormat` in utilities
* Added `Election Model` for 'createNewElection' method
* Added 'createNewElection' method in APIService
* Added toJSON method to convert dictionary to JSON for 'createNewElection' method
* Modified CreateElection View layout
* Added Buttons and checkboxes
* Added Animations for List
* Added all algorithms for voting
* Added blurred `background card` view for selecting the Algorithms with Picker
* Fixed `Date Picker` and improve its layout

10. [Merge Request !10](https://gitlab.com/aossie/agora-ios/-/merge_requests/38)- Update dependencies   (**Merged**)

* Updated `Realm`
* Updated `KVKCalendar`


11. [Merge Request !11](https://gitlab.com/aossie/agora-ios/-/merge_requests/39)- Calendar and Navigation   (**Merged**)

* Fixed `Navigation`
* Removed `Create Election` from `Tab bar`
* Wraped `KVK Calendar` to work with `SwiftUI`
* Studied the `KVK Calendar` framework
* Fixed various navigation bugs
* Fixed bugs and add animations
* Cleaned code of Calendar View


12. [Merge Request !12](https://gitlab.com/aossie/agora-ios/-/merge_requests/41)- Send 'Create Election' data to Server & update UX & UI Tests   (**Merged**)

* Removed extra realtimeResult from Election struct.
* Addeded create new election in API service call.
* Added `Badge shape`.
* Added `EventUpdateOverlay` in Create Election View with Animations.
* Added essential UI tests
* Workaround XCode bug related to iOS Simulators 'Connect with Hardware Keyboard'


13. [Merge Request !13](https://gitlab.com/aossie/agora-ios/-/merge_requests/42)- Improve Tests and Calendar   (**Merged**)

* Forked the `KVKCalendar` and made changes to the repository to reflect the design.
* Used both SwiftUI and UIKit elements for the Calendar view.
* Modified the framework to work alongside SwiftUI for :

    - `Picker View`
    - `Month View`
    - `Day View`
    - `Custom Date View`

* Improve `UI Tests`.

14. [Merge Request !14](https://gitlab.com/aossie/agora-ios/-/merge_requests/43)- Add Notification and Details View   (**Merged**)

* Added `candidatesArra`y & modify objc object with List for candidates.
* Added `getParticularElectionFromDb` func to get election from database for the Details View.
* Fixed month calendar frame.
* Updated year in month calendar.
* Added candidates to Detail View.
* Modified `startingDate` & `endingDate` of `Election model`.
* Added mutating func for changeDays and Minutes for implementing `Notifications`.
* Updated Create Elections.
* Added date formatter for `JSON encoding` for creating election.


15. [Merge Request !15](https://gitlab.com/aossie/agora-ios/-/merge_requests/45)- Fix UI Tests & add Unit tests   (**Merged**)

* Added `Unit Tests`
* Fixed test problem with login test (UI Test)
* Discuss with mentors for `TestFlight`.

16. [Merge Request !16](https://gitlab.com/aossie/agora-ios/-/merge_requests/44)- Add iPad support & adapt calendar    (**Merged**)
* Added application icons.
* Fixed LaunchScreen constraints for `iPad` & `iPhone 7`.
* Added `year view` for `iPad`.
* Modified `Segmented control` of calendar type for iPad.
* Modified `navigationViewStyle` for iPad.
* Modified calendar view top gradient background to change according to calendar type.
* Fixed `iPad Calendar view` spacing.
* Set `navigationViewStyle` based on device.
* Modified `Settings View` for iPad.


### Screenshots

**Overall:**

<img src="https://i.imgur.com/tQSdcdj.png" width=960/>


# 1. Login View

<img src="https://i.imgur.com/t7Sqia6.png" width=300/>       <img src="https://i.imgur.com/pn2mKge.png" width=300/>      <img src="https://i.imgur.com/9SPUGLD.png" width=300/>



<img src="https://i.imgur.com/5Zov8ja.png" width=300/>       <img src="https://i.imgur.com/oWF1KqT.png" width=300/>      <img src="https://i.imgur.com/bydelRE.png" width=300/>      <img src="https://i.imgur.com/wPmWvxO.png" width=300/>



# 2. Dashboard:

<img src="https://i.imgur.com/Dx2KnHa.png" width=300/>       <img src="https://i.imgur.com/SmzYghn.png" width=300/>   

# 3. Add Calendar View Events:

<img src="https://i.imgur.com/qUCcfLu.png" width=300/>       <img src="https://i.imgur.com/Q9H0yw5.png" width=300/>      <img src="https://i.imgur.com/ncS8FmR.png" width=300/>      <img src="https://i.imgur.com/tqX4vTd.png" width=300/>      <img src="https://i.imgur.com/x81fRi8.png" width=300/>      <img src="https://i.imgur.com/VNFSj22.png" width=300/>      <img src="https://i.imgur.com/MIjfUWd.png" width=300/>




# 4. Calendar View:

 <img src="https://i.imgur.com/FjOMIDf.png" width=300/>       <img src="https://i.imgur.com/uxe1b3M.png" width=300/>      <img src="https://i.imgur.com/GoFh1D3.png" width=300/>      <img src="https://i.imgur.com/jw6prPV.png" width=300/>      <img src="https://i.imgur.com/KBclkCi.png" width=300/>      <img src="https://i.imgur.com/1lXQpkm.png" width=300/>      <img src="https://i.imgur.com/ywTEdud.png" width=300/>      <img src="https://i.imgur.com/A9W8N94.png" width=300/>      <img src="https://i.imgur.com/yLAqNlZ.png" width=300/>



## 5. iPad Screens:


<img alt="screenshot" src="https://gitlab.com/aossie/agora-ios/uploads/9b9b777c00ff2eac87b80a8e5d1000ef/Simulator_Screen_Shot_-_iPad__7th_generation__-_2020-08-23_at_12.40.25.png" width="400">

<img alt="screenshot" src="https://gitlab.com/aossie/agora-ios/uploads/de4b4051491d0fed1b6995dac28dfb7a/Simulator_Screen_Shot_-_iPad__7th_generation__-_2020-08-23_at_12.39.19.png" width="400">


<img alt="screenshot" src="https://gitlab.com/aossie/agora-ios/uploads/fa273f5f21f46e80b4d2cc62f2b22bcf/Simulator_Screen_Shot_-_iPad__7th_generation__-_2020-08-23_at_12.40.20.png" width="400">

<img alt="screenshot" src="https://gitlab.com/aossie/agora-ios/uploads/906493e0c1647a8f31ead555c07eccf4/Simulator_Screen_Shot_-_iPad__7th_generation__-_2020-08-23_at_12.40.06.png" width="400">



# 6. Settings View & Profile Screens

<img src="https://i.imgur.com/dJbK1Qa.png" width=300/>       <img src="https://i.imgur.com/SulsdLR.png" width=300/>      <img src="https://i.imgur.com/OaGQ6q8.png" width=300/>      <img src="https://i.imgur.com/uDoVdZU.png" width=300/>



