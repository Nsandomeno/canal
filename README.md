## canal
Lightspark wallet geared towards retail remittance flows.


## firebase 

# Local Emulators

# first run:
`firebase emulators:start --export-on-exit=./seed`

# subsequent runs:
`firebase emulators:start --import=./seed`

# cleanup:
(1) get process ID `sudo lsof -i tcp:8080`
(2) use PID to kill process `kill -9 < PID >`
(3) clean XCode `xcrun simctl erase all`
(4) clean Flutter `flutter clean`
(5) remove Pods (iOS) `cd ios && rm -rf Pods/ && rm -rf Podfile.lock && cd ..`
(6) reinstall Flutter dependencies `flutter pub get`
(7) reinstall Pods (iOS) `cd ios && pod install && cd ..`

## riverpod code generation
in its own terminal run:

`dart run build_runner watch`

then use the `@Riverpod` decorator on a top-level function and `part < repository >.g.dart;` to generate the provider code.

## Platform-Specific Modifications
Primary reference is the supporting notes here: https://courses.codewithandrea.com/courses/flutter-firebase-masterclass-complete/lectures/45889560

## iOS
# podfile

- podfile : Uncomment line 2 in /ios/Podfile and set it to: platform :ios, '12.0'

- podfile : Faster builds with Firestore SDK (read more: https://joshuamdeguzman.com/blog/improve-flutter-firestore-build/#:~:text=The%20issue%20is%20caused%20by,iOS%20SDK%20solves%20this%20problem.)

## Android
# app/build.gradle

- build.gradle : Set minSdkVersion to "21"

## MacOS

## Web

## Windows
`currently unsupported.`

## Linux 
`currently unsupported.`