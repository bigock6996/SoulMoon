import SwiftUI

struct ContentView: View {
    @StateObject private var activityManager = SoulMoonActivityManager()

    var body: some View {
        VStack(spacing: 16) {
            Button {
                Task {
                    await activityManager.summonMoon()
                }
            } label: {
                Text("Summon Moon")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Button(role: .destructive) {
                Task {
                    await activityManager.banishMoon()
                }
            } label: {
                Text("Banish Moon")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding(24)
    }
}

#Preview {
    ContentView()
}
