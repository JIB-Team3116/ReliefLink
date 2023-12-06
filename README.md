
# ReliefLink


![3dgifmaker29606](https://user-images.githubusercontent.com/26496730/205802650-9bf511fb-48ab-4602-831c-7d6f5ce8fd9b.gif)


![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) ![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)


![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white) ![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0) ![Windows 11](https://img.shields.io/badge/Windows%2011-%230079d5.svg?style=for-the-badge&logo=Windows%2011&logoColor=white)


      



## About the Project

A companion for individuals struggling with thoughts of harming themselves.
An app to assist suicide prevention, from coping techniques to relaxation exercises. Part of the Junior Design class at Georgia Tech, group 2136, with our client Dr. Nadine Kaslow.

## Team Members

- Joshua Tzeng
- Eric Chang
- Bronson Wong
- George Chen
- Matthew Wright

## Former Team Members

- Eduardo Trunci
- Daniel Young
- Alexandr Shor
- Yuting Shen
- Suvan Adhikari
- Rithvik Rajavelu

## The Design
We had some awesome people thinking on how to make this app look good. The process is still ongoing! Here a snippet of it:

[Link to Figma](https://www.figma.com/file/mNFVtgz74QbCJ8LsecEXef/2136-Prototype---ReliefLink?node-id=0%3A1)


# Installation Guide

## For programmers


### Installating and Running

This app was entirely built on Flutter. Since there is not back-end to it, its deployment is the creation of the APK for Android and iOS devices and its addition to the app stores.

To run it locally, one needs to:

1. [Install Flutter](https://docs.flutter.dev/get-started/install)
2. Fork this repository and clone it into your computer
3. [Create an account on the Google Cloud](https://cloud.google.com/resource-manager/docs/creating-managing-projects), as well as a project.
4. [Create a new API Key for the Google Maps API](https://developers.google.com/maps/documentation/javascript/get-api-key).
5. Add the API Key in [this file](https://github.com/AlexShor0103/Team-2136-ReliefLink/blob/main/web/index.html#L34) and in [this file](https://github.com/AlexShor0103/Team-2136-ReliefLink/blob/main/android/app/src/main/AndroidManifest.xml#L36).
6. On the main directory, run `flutter run` and choose a device to run it on

### Pre-requisites and Libraries
There are some dependencies for this project. They are automatically installed on the `flutter run` command, but here they are:


```
  chewie: ^1.3.5
  video_player: ^2.4.7
  dio: ^4.0.0
  flutter_polyline_points: ^0.2.6
  google_maps_flutter: ^2.0.2
  google_maps_flutter_web: ^0.3.2+2
  url_launcher:
  store_redirect: ^2.0.1
  overlay_support: ^1.0.0
  cupertino_icons: ^1.0.2
  shared_preferences: ^2.0.15
  fl_chart: ^0.55.2
  pie_chart: ^5.3.2
  syncfusion_flutter_charts: ^20.3.59
  image_network: 
```

### Building and Deploying

This is enough to run the project locally and in any connected Android device, as long as it is on developer mode. To build it for the Google App Store, [this tutorial](https://docs.flutter.dev/deployment/android) should do it. This is the [tutorial for iOS](https://docs.flutter.dev/deployment/ios).

For demo purposes, we suggest you to deploy the Flutter app to Firebase - so that people can open in on their phone's browsers. If you do so, update the link in the next section. Here is a guide for doing it: [Guide](https://medium.com/flutter/must-try-use-firebase-to-host-your-flutter-app-on-the-web-852ee533a469).

### Troubleshooting

* With time, the Flutter version used in the application will become outdated. In that case, one should change the version of Flutter to be the latest and fix any major errors that arise - not much can be known now about future bugs.
* If the Maps API is not working, make sure to check whether your set up of the Google Cloud console is complete. More reseources on it can be found [here](https://developers.google.com/maps).


## For non-programmers

We suggest that you speak to the programmers on your team. You can try this link, too: [Link](https://relieflink-d8470.web.app/#/). It might contain a working version of the deployed app for your phone!


# Major Release Notes

## v1.5.0

Tutorial Update, included a tutorial within the application for users to learn about the app's main features and how to use them.

### New Features
- Frontend
  - New Users will automatically be placed into the tutorial which walks them through the application
  - Users can access the tutorial from the me page and selecting "onboarding"
  - Users can choose healthcare locations near them and mark them on the map
  - Users can upload custom relief techniques tailored to them
### Bug Fixes
- Users who register and login and logout should no longer need to restart the application to log back in.

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Pixel overflow can occur if too many contacts are added
- If the image chosen isn't high quality, it can look really blurry when displayed
- Map currently says for development purposes only
- Pictures can have a weird watermark if using desktop
- formatting between mobile and desktop aren't consistent
- Sometimes error messages for incorrect login or existing registration don't show up

# Previous Release Notes
## v1.4.0

User Features update, we implemented some major features of the application within this update that focused on customizability for users regarding how they want to approach their individual mental healthcare.

### New Features
- Backend
  - Nearly every part of the application should allow users to save their data to their account and access from multiple devices
- Frontend
  - Users can now customize their crisis plans with specific contacts, relief techniques, and steps
  - User can customize which relief techniques they want to include in their plan and create their own relief techniques
  - Users can specify specific contacts for emergency situations along with what each contact is used for
### Bug Fixes
- n/a

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Duplicated Header after completing the onboarding
- Pixel overflow can occur if too many contacts are added
- If the image chosen isn't high quality, it can look really blurry when displayed
- Sometimes error messages for incorrect login or existing registration don't show up
  
## v1.3.0

Backend intergration update part 2, we have integrated more of the backend using users' accounts so that the information they save is consistent across all updates/versions of the app when using the same account.

### New Features
- Backend
  - Users can now record and save thoughts in an online diary within the application
  - Users can create and save a crisis plan specific to them in the application
  - Users can save and use emergency contacts for urgent situations within the app

### Bug Fixes
- Issues with trying to register with existing account have been fixed

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Duplicated Header after completing the onboarding
- Pixel overflow can occur if too many contacts are added
- If the image chosen isn't high quality, it can look really blurry when displayed
- Sometimes error messages for incorrect login or existing registration don't show up


## v1.2.0

Backend intergration update. We have implemented the ability for users to register, authenticate, and login to their respective accounts.

###  Features
- Backend
  - Users can now register for an using their email
  - Users can authenticate and login to their account using their email and password 

### Bug Fixes
- Issues with inconsistent starting page is fixed

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Duplicated Header after completing the onboarding
- Pixel overflow can occur if too many contacts are added
- If the image chosen isn't high quality, it can look really blurry when displayed

## v1.1

First update to the public deployment of the app! We are very excited to continue this project. We have implemented the ability to display and add images along with fixing the map feature.

###  Features
- Relief Techniques
  - Users can now add/show images for their techniques
  - All preexisting techniques have been updated to also feature pictures
- Mental health clinics near me
  - Users can now actually access the Google Maps integration to see health clinics, police departments, etc. near their location

### Bug Fixes
- Map api is now working mostly as intended
- Issues with image and video display have been fixed

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Duplicated Header after completing the onboarding
- Pixel overflow can occur if too many contacts are added
- If the image chosen isn't high quality, it can look really blurry when displayed

## v1.0

The first public deployment of the app! We are very excited to show this working app. All of the psychology-related tasks in the app have been developed and discussed with our clients.

### Features

- Journaling
  - Users have a space to write down how their are feeling and keep track of their mood trends
- Relief Techniques
  - Users have an available list of Relief Techniques to their various moods
  - Users can add, delete, favorite and edit their techniques
  - Techniques can be sorted by mood, duration, rating and favorites
  - Users can rate the activities after completed
- Emergency Button
  - Always available in most screens in the app, will now call 988, the Suicide Hotline
- Emergency Contacts
  - Users can add, edit and remove Emergency Contacts
  - Emergency contacts can be saved to the app, with the ability to call or text them
- Mental health clinics near me
  - Users can search the map to find health resources near them
-  External suggestions of resources
   -  A curated list of apps and services that can assist the users, on top of our own features, can be found in the app now. That includes breathing exercises, relaxation and meditation apps
- Crisis Plan
  - Users can now add their own crisis plan and access when needed
  - The plan's structured was carefully indicated to us by our clients over from Emory University
- Onboarding is available for new users
  - New users can now go through a tutorial of the screens on the first time they open the app, or skip it
  - They can revisit it in the future if needed

### Bug Fixes

- Relief Technique cards overflows in some devices have been fixed
- Relief Technique's video will pause after exiting the page or going to the rating page
- Top bar will now update according to the screen the user is in, which was not previously updating the title
- Crisis screen now shows as a page, not a pop up
- Sorting in the Relief Techniques will update on any changes
- Saved data is now consistent across sessions, since the local storage has been implemented

### Known Issues
- Autocomplete in Crisis Plan can miss suggestions
- Duplicated Header after completing the onboarding
- Maps API is not using the user's current location
- Pixel overflow can occur if too many contacts are added

## v0.4.0


### Features

- Crisis Plan
  - Users can now add their own crisis plan and access when needed
  - The plan's structured was carefully indicated to us by our clients over from Emory University
- Onboarding is available for new users
  - New users can now go through a tutorial of the screens on the first time they open the app, or skip it
  - They can revisit it in the future if needed
-  New sorting and organizing features
   - On the relief techniques page, cards can be sorted by ratings now
   - Card's categories by which they were sorted also available on the sorted screen


### Bug Fixes

- Fixed inconsistent tabbing of elements in the "Relation" field in Emergency Contact cards
- Favoriting an acitivity when looking at the favorites tab in the home screen now updates instantly
- Correct formatting of settings tab
- Recommendations screen now fully revamped
- Several color and style fixes across the app

### Known Issues

- Map API is not using the user's current location
- Relief Technique cards overflow in some devices
- Onboarding flow not popping up upon first start of app

## v0.3.0


### Features

- Find mental health clinics near me
  - Users can now search the map to find health resources near them
- Add and reach out to Emergency Contacts
  - Emergency contacts can be saved to the app, with the ability to call or text them
-  Access to external suggestions of resources
   -  A curated list of apps and services that can assist the users, on top of our own features, can be found in the app now. That includes breathing exercises, relaxation and meditation apps


### Bug Fixes

- Profile tab is no longer breaking when accessed through the menu bar
- Map API now works on all devices
- Favoriting an acitivity is now consistent across sessions

### Known Issues

- Inconsistent tabbing of elements in the "Relation" field in Emergency Contact cards
- Map API is not using the user's current location
- Favoriting an acitivity when looking at the favorites tab in the home screen does not update instantly
- Buggy formatting of settings tab, with the Profile, Maps and External Coping Activities tab


## v0.2.0

### Features

- Activities search on the home screen is enabled
- Ability to access the favorite activities from the navigation bar
- Settings tab created, where you can access the profile page and recommended external coping techniques (such as other apps)
- Personal information is now stored in the device (and not lost when closing the app)
- The ability to search for health resources in the area is now available!


### Bug Fixes

- Overflow of the cards is fixed, as well as all overflows in icons
- Information in the personal profile is now persistent accress sessions

### Known Issues

- Favoriting an acitivity when looking at the favorites tab in the home screen does not update instantly
- Favoriting an activity resets when the app is closed
- Buggy formatting of settings tab and external coping activities
- Map API is not using the user's current location

## v0.1.0

### Features

- Activities sorting on the home screen is enabled by favorites, mood or duration
- Favoriting is enabled on the home screen (as well as in the evaluation screen)
- Profile screen available, to add personal information and Health Insurance information

### Bug Fixes

- Sorting in Home Page now works and only one sorting option can be selected at a time

### Known Issues

- Some titles of activities get broken down and overflow in the cards due to the cards being too small
- Favoriting an activity resets when the app is closed
- Favorite Icon overflows on some Relief Technique cards
