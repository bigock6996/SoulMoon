import ActivityKit
import Foundation

@MainActor
final class SoulMoonActivityManager: ObservableObject {
    func summonMoon() async {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            return
        }

        if Activity<SoulMoonActivityAttributes>.activities.isEmpty == false {
            return
        }

        let attributes = SoulMoonActivityAttributes()
        let content = ActivityContent(
            state: SoulMoonActivityAttributes.ContentState(),
            staleDate: nil
        )

        do {
            _ = try Activity.request(
                attributes: attributes,
                content: content,
                pushType: nil
            )
        } catch {
            print("Unable to summon Soul Moon Live Activity: \(error.localizedDescription)")
        }
    }

    func banishMoon() async {
        let finalContent = ActivityContent(
            state: SoulMoonActivityAttributes.ContentState(),
            staleDate: nil
        )

        for activity in Activity<SoulMoonActivityAttributes>.activities {
            await activity.end(finalContent, dismissalPolicy: .immediate)
        }
    }
}
