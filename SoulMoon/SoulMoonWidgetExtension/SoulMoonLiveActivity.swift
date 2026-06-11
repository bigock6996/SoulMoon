import ActivityKit
import SwiftUI
import WidgetKit

struct SoulMoonLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SoulMoonActivityAttributes.self) { _ in
            EmptyView()
                .activityBackgroundTint(.clear)
                .activitySystemActionForegroundColor(.clear)
        } dynamicIsland: { _ in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    EmptyView()
                }
                DynamicIslandExpandedRegion(.trailing) {
                    EmptyView()
                }
                DynamicIslandExpandedRegion(.center) {
                    EmptyView()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    EmptyView()
                }
            } compactLeading: {
                MoonImage(size: 26)
            } compactTrailing: {
                EmptyView()
            } minimal: {
                MoonImage(size: 20)
            }
            .widgetURL(URL(string: "soulmoon://live-activity"))
            .keylineTint(.clear)
        }
    }
}

private struct MoonImage: View {
    let size: CGFloat

    var body: some View {
        Image("moon")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .accessibilityHidden(true)
    }
}
