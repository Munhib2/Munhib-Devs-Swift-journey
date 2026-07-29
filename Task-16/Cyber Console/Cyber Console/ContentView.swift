import SwiftUI

struct ContentView: View {
    // --- Tumhaare Backend Variables (Warmup Task) ---
    @State var serverName: String = "Connecting..."
    @State var pingRate: Int = 0
    @State var activePlayers: Int = 0
    @State var isServerOnline: Bool = false
    
    var body: some View {
        ZStack {
            // Dark Cyberpunk Metallic Background
            Color(red: 0.05, green: 0.05, blue: 0.08)
                .ignoresSafeArea()
            
            // Premium Cyan/Blue Radial Glow from the bottom
            Circle()
                .fill(Color.cyan.opacity(0.12))
                .frame(width: 400, height: 400)
                .blur(radius: 100)
                .offset(y: 300)
            
            VStack(spacing: 25) {
                // HEADER PORTION
                VStack(spacing: 6) {
                    Text("CYBER CONSOLE")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.cyan)
                        .tracking(4)
                    
                    Text("System Authentication")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                
                // MAIN DISPLAY: STATUS CARD
                VStack(spacing: 15) {
                    HStack {
                        Text("Server Core:")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Text(serverName)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                    Divider().background(Color.white.opacity(0.1))
                    
                    HStack {
                        Text("Network Status:")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        
                        // Live Status Tag (Dynamic logic based on Bool)
                        Text(isServerOnline ? "ONLINE" : "OFFLINE")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(isServerOnline ? .green : .red)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(isServerOnline ? Color.green.opacity(0.15) : Color.red.opacity(0.15))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isServerOnline ? Color.green.opacity(0.3) : Color.red.opacity(0.3), lineWidth: 1)
                            )
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.02))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(colors: [.white.opacity(0.1), .clear], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                        )
                )
                .padding(.horizontal, 20)
                
                // GRID/METRICS PORTION (Ping & Active Players)
                HStack(spacing: 15) {
                    // Ping Box
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundColor(.cyan)
                            .font(.title3)
                        
                        Text("Ping Rate")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("\(pingRate) ms")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.05), lineWidth: 1))
                    
                    // Players Box
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "person.3.sequence.fill")
                            .foregroundColor(.cyan)
                            .font(.title3)
                        
                        Text("Active Pilots")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("\(activePlayers)")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.05), lineWidth: 1))
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // PREMIUM INITIALIZE BUTTON
                Button(action: {
                    loadData(serverName: &serverName, pingRate: &pingRate, activePlayers: &activePlayers, isServerOnline: &isServerOnline)
                }) {
                    HStack {
                        Image(systemName: "terminal.fill")
                        Text("BOOT SYSTEM")
                    }
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.cyan)
                    .cornerRadius(14)
                    .shadow(color: Color.cyan.opacity(0.4), radius: 20, x: 0, y: 8)
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
