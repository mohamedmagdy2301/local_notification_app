<br clear="both">
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Protest+Guerrilla&weight=900&size=45&pause=1000&color=F78918&width=835&height=100&lines=Local+Notification+App+%F0%9F%98%8A%E2%9C%8C%EF%B8%8F" alt="Typing SVG" /></a>
<br clear="both">


[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0-blue.svg)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Local Notification App is a Flutter application designed to showcase how to use local notifications, including basic, repeating, and scheduled notifications. It allows users to push and cancel notifications through an interactive UI.

## Features

- **Basic Notification**: Displays a simple notification.
- **Repeating Notification**: Repeats a notification at a set interval.
- **Scheduled Notification**: Schedules a notification to be shown after a specific time delay.
- **Cancel Notifications**: Cancel individual or all notifications.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
    -   [Step 1: Clone the repository](#step-1-clone-the-repository)
    -   [Step 2: Install dependencies](#step-2-install-dependencies)
    -   [Step 3: Update Android Permissions](#step-3-update-android-permissions)
    -   [Step 4: Initialize Local Notification Service](#step-4-initialize-local-notification-service)
    -   [Step 5: Build the Project](#step-5-build-the-project)
- [Usage](#usage)
- [Contributing](#contributing)
- [Congratulations](#congratulations)
- [Contact](#contact)

## Getting Started

These instructions will guide you on setting up and running the project on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK
- Android Studio or Visual Studio Code with Flutter plugin
- A physical or virtual device for testing (Android/iOS)

### Installation

Follow the steps below to set up the project and run it locally.

#### Step 1: Clone the repository

```bash
git clone https://github.com/mohamedmagdy2301/local_notification_app.git
cd local_notification_app
```

#### Step 2: Install dependencies

Ensure you have all the necessary Flutter dependencies. Run the following command in your terminal:

```bash
flutter pub get
```

#### Step 3: Update Android Permissions

In the Android `AndroidManifest.xml`, ensure the following permissions are set to allow notifications, alarms, and receive boot completions:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
<uses-permission android:name="android.permission.USE_EXACT_ALARM" />
<uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />
```
Also, Include the following receivers in your `AndroidManifest.xml`:
```xml
<manifest>
  <application>
    <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
    <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
      <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON"/>
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
      </intent-filter>
    </receiver>
  </application>
</manifest>
```

#### Step 4: Initialize Local Notification Service

In the `lib/main.dart` file, we ensure that notifications are initialized before the app starts:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.initialize();
  runApp(const NotificationApp());
}
```

#### Step 5: Build the Project

Once the project is set up, use the following command to build and run the app on a connected device or emulator:

```bash
flutter run
```

### Android-Specific Setup

#### Update `build.gradle`

Make sure your `android/app/build.gradle` includes the required dependencies:

```gradle
dependencies {
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.2.2'
    implementation 'androidx.window:window:1.0.0'
    implementation 'androidx.window:window-java:1.0.0'
}
```

Ensure you have specified the correct Gradle plugin versions:

```gradle
buildscript {
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.1'
    }
}
```

<!-- ### iOS-Specific Setup

For iOS devices, ensure that you add the necessary permissions for notifications in the `Info.plist` file.

```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>We need access to your location to show relevant notifications.</string>
``` -->

## Usage

Once installed, the app allows users to interact with the following types of notifications:

- **Basic Notification**: Push a simple notification.
- **Repeating Notification**: Push a repeating notification that shows every minute.
- **Scheduled Notification**: Push a notification that will appear after a delay (e.g., 10 seconds).
- **Cancel Notifications**: Cancel individual or all notifications from the UI.

### Example

Here’s how to trigger a basic notification:

```dart
LocalNotificationService.showBasicNotification();
```

To cancel all notifications:

```dart
LocalNotificationService.cancelAllNotifications();
```

## Contributing

Contributions are welcome! Feel free to submit a Pull Request with improvements, bug fixes, or new features.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Make your changes and commit (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Create a new Pull Request.

## Congratulations

You’ve successfully integrated local notifications into your Flutter app! For more advanced features and customization options, be sure to check out the official [Flutter Local Notifications guide](https://pub.dev/packages/flutter_local_notifications).

If you found this guide helpful, don’t forget to ⭐ star this repository on GitHub to show your support!

Thank you for reading!

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** [mohammedmego15@gmail.com](mohammedmego15@gmail.com)
