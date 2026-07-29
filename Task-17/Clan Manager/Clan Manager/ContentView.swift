import SwiftUI

struct ContentView: View {
    // --- Sirf State Variable (Jo tumhaari backend file se update hoga) ---
    @State var players: [Player] = []
    
    var body: some View {
        ZStack {
            // Dark Carbon/Metallic Background
            Color(red: 0.06, green: 0.06, blue: 0.09)
                .ignoresSafeArea()
            
            // Neon Orange/Red Accent Glow from Top (Weapon Theme)
            Circle()
                .fill(Color.orange.opacity(0.1))
                .frame(width: 400, height: 400)
                .blur(radius: 120)
                .offset(y: -250)
            
            VStack(spacing: 20) {
                
                // HEADER PORTION
                VStack(spacing: 4) {
                    Text("TACTICAL OPERATIONS")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(.orange)
                        .tracking(3)
                    
                    Text("M4 Assault Clan")
                        .font(.system(size: 26, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                
                // MAIN SCROLLABLE LIST (Array Dynamic Display)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        
                        // Dynamic Loop: Array Items Display
                        ForEach(players, id: \.playerName) { dynamicPlayer in
                            
                            // PREMIUM PLAYER CARD
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(dynamicPlayer.playerName)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        Text(dynamicPlayer.rank)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 2)
                                            .background(Color.white.opacity(0.08))
                                            .cornerRadius(4)
                                    }
                                    
                                    Spacer()
                                    
                                    // Weapon Tag (Special highlight for M4 Carbine)
                                    HStack(spacing: 5) {
                                        Image(systemName: "shield.fill")
                                            .font(.caption)
                                        Text(dynamicPlayer.favWeapon)
                                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    }
                                    .foregroundColor(dynamicPlayer.favWeapon == "M4 Carbine" ? .orange : .cyan)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(dynamicPlayer.favWeapon == "M4 Carbine" ? Color.orange.opacity(0.15) : Color.cyan.opacity(0.15))
                                    .cornerRadius(8)
                                }
                                
                                Divider().background(Color.white.opacity(0.08))
                                
                                // Kills Metric
                                HStack {
                                    Text("CONFIRMED KILLS:")
                                        .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                        .foregroundColor(.white.opacity(0.4))
                                    
                                    Spacer()
                                    
                                    Text("\(dynamicPlayer.kills)")
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(18)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white.opacity(0.03))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(LinearGradient(colors: [.white.opacity(0.08), .clear], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                }
                
                // SYNC BUTTON
                Button(action: {
                    loadData(players: &players)
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "bolt.fill")
                        Text("SYNC CLAN DATA")
                    }
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.orange)
                    .cornerRadius(12)
                    .shadow(color: Color.orange.opacity(0.3), radius: 15, x: 0, y: 6)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
