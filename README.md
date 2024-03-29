# Canal
Lightspark wallet geared towards retail remittance flows.

# System Prerequisites
```
Node.js
Java
Dart
Flutter SDK
Flutter CLI
XCode 
Android Studio (?)
Firebase CLI
FlutterFire CLI
IOS Simulator
Android Simulator
```
# Firebase 
Requires an invitation to nicholas.sandomeno@gmail.com's Firebase Console.

Configure Firebase project 
`flutterfire configure --project=< FIREBASE PROJECT ID >`

Add a feature after initial configuration
`firebase init [ feature ]`

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

- Information on how to setup CORS and displaying images (requires Google Cloud Platform):
(1) https://docs.flutter.dev/platform-integration/web/web-images
(2) https://stackoverflow.com/questions/65849071/flutter-firebase-storage-cors-issue
(3) https://courses.codewithandrea.com/courses/flutter-firebase-masterclass-complete/lectures/46377975

- NOTE: Add additional origins in production.

This is the command that must be use the in the GCP cloud shell terminal:

`echo '[{"origin": ["*"],"responseHeader": ["Content-Type"],"method": ["GET", "HEAD"],"maxAgeSeconds": 3600}]' > cors-config.json`

This is how it should be done in production eventually (with the application domain specified)

```
echo '[{"origin": ["http://your-domain.com"],"responseHeader": ["Content-Type"],"method": ["GET", "HEAD"],"maxAgeSeconds": 3600}]' > cors-config.json
gsutil cors set cors-config.json gs://YOUR_BUCKET_NAME

```

Then get the name of the storage bucket from Firebase Storage and copy it in to the parameter
of this command
`gsutil cors set cors-config.json < BUCKET URI >`

Explicit routing configuration for web
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

# Resources
- Architecture inspiration: https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/
