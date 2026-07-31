import SwiftUI

struct ContentView: View {
    @State var isGamesLoaded: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("GAME LIBRARY")
                .font(.headline)
                .foregroundColor(.cyan)
                .tracking(3)
            
            if isGamesLoaded {
                ForEach(gamesList, id: \.self) { gameName in
                    Text(gameName)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.blue.opacity(0.15))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                        )
                }
            } else {
                Text("No Games in Library")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()
            }
            
            Spacer().frame(height: 10)
            
            // Load Button
            Button(action: {
                loadGamesData()
                isGamesLoaded = true
            }) {
                Text("LOAD ALL GAMES")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.cyan)
                    .cornerRadius(10)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.05, green: 0.05, blue: 0.08).ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
