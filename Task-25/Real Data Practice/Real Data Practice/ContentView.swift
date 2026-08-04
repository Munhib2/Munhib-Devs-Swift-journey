import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Console Mein Output Dekho!")
        }
        .padding()
        .task {
            // Yeh app chalne par tumhara backend function auto-run karega
            await fetchLiveWeather()
        }
    }
}
