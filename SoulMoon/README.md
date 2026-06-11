# Soul Moon

Soul Moon is a personal SwiftUI iPhone app with a local ActivityKit Live Activity. The app has two buttons: **Summon Moon** starts the Live Activity, and **Banish Moon** ends it.

## File Layout

- `SoulMoon.xcodeproj`: open this in Xcode.
- `SoulMoon/SoulMoonApp.swift`: app entry point.
- `SoulMoon/ContentView.swift`: the two-button main screen.
- `SoulMoon/SoulMoonActivityManager.swift`: local ActivityKit start/end logic.
- `Shared/SoulMoonActivityAttributes.swift`: shared ActivityKit attributes compiled into the app and widget extension.
- `SoulMoonWidgetExtension/SoulMoonWidgetBundle.swift`: widget extension entry point.
- `SoulMoonWidgetExtension/SoulMoonLiveActivity.swift`: Dynamic Island Live Activity configuration.
- `SoulMoon/Assets.xcassets/moon.imageset/moon.png`: supplied moon image asset.
- `SoulMoon/Info.plist`: app Info.plist with Live Activities enabled.
- `SoulMoonWidgetExtension/Info.plist`: WidgetKit extension Info.plist.

## Dynamic Island Behavior

- Compact Leading: shows `moon` at 26 pt.
- Compact Trailing: empty.
- Minimal: shows `moon` at 20 pt.
- Expanded: required ActivityKit regions exist, but each uses `EmptyView()`.
- No text, timers, progress bars, status information, push token, server, networking, analytics, or tracking.
- Tapping the Live Activity opens the app through `soulmoon://live-activity`.

## Add or Replace moon.png in Xcode

The provided `moon.png` has already been copied into:

`SoulMoon/Assets.xcassets/moon.imageset/moon.png`

To replace it in Xcode:

1. Open `SoulMoon.xcodeproj`.
2. Select `SoulMoon/Assets.xcassets`.
3. Select the `moon` image set.
4. Drag your `moon.png` into the `1x` slot, replacing the existing file.
5. Keep the image set name exactly `moon`.
6. In the File inspector, make sure `Assets.xcassets` is included in both targets: `SoulMoon` and `SoulMoonWidgetExtension`.

The app preserves PNG alpha transparency. If the source PNG has a solid white background, iOS will show that white background because the app does not alter or generate artwork.

## Build in Xcode

1. Open `SoulMoon.xcodeproj`.
2. Select the `SoulMoon` project, then the `SoulMoon` target.
3. Change `Bundle Identifier` from `com.example.SoulMoon` to your own identifier.
4. Select the `SoulMoonWidgetExtension` target and change its Bundle Identifier to match, for example `your.bundle.SoulMoon.SoulMoonWidgetExtension`.
5. In **Signing & Capabilities**, choose your team for both targets.
6. Confirm **Live Activities** is enabled for the app target. The `NSSupportsLiveActivities` key is already present in `SoulMoon/Info.plist`.
7. Select an iPhone 16 device running iOS 26.5 or newer.
8. Build and run.

## Archive and Export IPA

1. In Xcode, select **Any iOS Device** as the run destination.
2. Choose **Product > Archive**.
3. In Organizer, select the archive.
4. Choose **Distribute App**.
5. For personal sideloading, export a development-signed app if you are using your own Apple ID team.
6. Save the exported `.ipa`.

## Install with AltStore or SideStore

1. Make sure the app and widget extension bundle identifiers are unique.
2. Export an `.ipa` from Xcode.
3. Open AltStore or SideStore on your iPhone.
4. Use **My Apps > +** and choose the exported `.ipa`.
5. If prompted, sign with the same Apple ID used by AltStore or SideStore.
6. Launch Soul Moon, tap **Summon Moon**, then use **Banish Moon** to end it.

Live Activities require device support and must be enabled in iOS Settings. The Dynamic Island compact leading layout is system-controlled, so the moon is requested in the left compact region beside the camera cutout, but exact placement is ultimately decided by iOS.
