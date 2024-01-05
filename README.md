# Canal
Lightspark wallet geared towards retail remittance flows.

# System Prerequisites

# Firebase 

# Local Emulators

first run
`firebase emulators:start --export-on-exit=./seed`

subsequent runs
`firebase emulators:start --import=./seed`

# Cleanup
(1) get process ID `sudo lsof -i tcp:8080`
(2) use PID to kill process `kill -9 < PID >`
(3) clean XCode `xcrun simctl erase all`
(4) clean Flutter `flutter clean`
(5) remove Pods (iOS) `cd ios && rm -rf Pods/ && rm -rf Podfile.lock && cd ..`
(6) reinstall Flutter dependencies `flutter pub get`
(7) reinstall Pods (iOS) `cd ios && pod install && cd ..`

# Riverpod code generation
in its own terminal run

`dart run build_runner watch`

then use the `@Riverpod` decorator on a top-level function and `part < repository >.g.dart;` to generate the provider code.

# Platform-Specific Modifications
Primary reference is the supporting notes here: https://courses.codewithandrea.com/courses/flutter-firebase-masterclass-complete/lectures/45889560

# IOS

Podfile

- Uncomment line 2 in /ios/Podfile and set it to: platform :ios, '12.0'

- Faster builds with Firestore SDK (read more: https://joshuamdeguzman.com/blog/improve-flutter-firestore-build/#:~:text=The%20issue%20is%20caused%20by,iOS%20SDK%20solves%20this%20problem.)

- target runner / target runner tests issue: https://docs.page/bizz84/flutter-firebase-masterclass/faq/unable-to-find-runner-tests

Builds
- speed up build times : https://codewithandrea.com/tips/speed-up-cloud-firestore-xcode-builds/

# Android

app/build.gradle

- build.gradle : Set minSdkVersion to "21"

# MacOS

key dependency compatability

- Firebase x MacOS : https://codewithandrea.com/articles/flutter-firebase-auth-macos/

Builds

- Speed up build times : https://codewithandrea.com/tips/speed-up-cloud-firestore-xcode-builds/

# Web

- the `usePathUrlStrategy()` is conditionally called in the application entrypoints (main/mock_main for testing) if the `ClientDevice` class determines the user is accessing via the Web.

```
/// turn off the # in the URLs on the web
if (device.isWeb) {
    usePathUrlStrategy();
}
```

# Windows
`currently unsupported.`

# Linux 
`currently unsupported.`