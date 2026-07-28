import SwiftUI

struct ContentView: View {
    // --- Tumhaare Backend Variables (Inhein tum apne fakeJson se connect karoge) ---
    @State var totalFollowers: Int = 0
    @State var person1Followers: Int = 0
    @State var person2Followers: Int = 0
    @State var person3Followers: Int = 0
    @State var person4Followers: Int = 0
    
    var body: some View {
        ZStack {
            // Pure Premium Black Background
            Color.black
                .ignoresSafeArea()
            
            // Neon Purple Ambient Glow (Premium Dev Aesthetic)
            Circle()
                .fill(Color.purple.opacity(0.15))
                .frame(width: 300, height: 300)
                .blur(radius: 90)
                .offset(x: -100, y: -250)
            
            VStack(spacing: 20) {
                // 1. TOP PORTION: Brand Header
                VStack(spacing: 4) {
                    Text("ELEGANT")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.purple)
                        .tracking(5)
                    
                    HStack
                    {
                        Text("Munhib")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                        Text("Devs")
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.top, 25)
                
                // 2. MAIN DISPLAY BOX: Total Followers
                VStack(spacing: 8) {
                    Text("Total Followers")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text("\(totalFollowers)")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white.opacity(0.03))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(LinearGradient(colors: [.purple.opacity(0.4), .clear], startPoint: .top, endPoint: .bottom), lineWidth: 1.5)
                        )
                )
                .padding(.horizontal, 20)
                
                // 3. BREAKDOWN BOXES: Person 1 to 4
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        FollowerRow(personNumber: 1, count: person1Followers)
                        FollowerRow(personNumber: 2, count: person2Followers)
                        FollowerRow(personNumber: 3, count: person3Followers)
                        FollowerRow(personNumber: 4, count: person4Followers)
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
                
                // 4. PREMIUM BUTTON: Load Data
                Button(action: {
                    loadData(person1Followers: &person1Followers, person2Followers: &person2Followers, person3Followers: &person3Followers, person4Followers: &person4Followers, totalFollowers: &totalFollowers)
                }) {
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                        Text("Load Data")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .controlSize(.large)
                .shadow(color: Color.purple.opacity(0.3), radius: 15, x: 0, y: 5)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}

// Custom Premium Sub-Box Component (Code chota aur clean rakhne ke liye)
struct FollowerRow: View {
    let personNumber: Int
    let count: Int
    
    var body: some View {
        HStack {
            Text("Followers from Person \(personNumber):")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
            
            Spacer()
            
            Text("\(count)")
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
        }
        .padding(.all, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.02))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.06), lineWidth: 1)
                )
        )
    }
}

#Preview {
    ContentView()
}
