import SwiftUI

// MARK: - Dummy Model for UI Preview (Tum isko real backend model se replace karoge)
struct CoinDummy: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let price: Double
    let changePercentage: Double
    let iconName: String
}

struct ContentView: View {
    // Dummy Data for UI Layout
    let trendingCoins = [
        CoinDummy(name: "Bitcoin", symbol: "BTC", price: 64250.0, changePercentage: 2.45, iconName: "bitcoinsign.circle.fill"),
        CoinDummy(name: "Ethereum", symbol: "ETH", price: 3450.25, changePercentage: -1.20, iconName: "dollarsign.circle.fill")
    ]
    
    let allCoins = [
        CoinDummy(name: "Bitcoin", symbol: "BTC", price: 64250.0, changePercentage: 2.45, iconName: "bitcoinsign.circle.fill"),
        CoinDummy(name: "Ethereum", symbol: "ETH", price: 3450.25, changePercentage: -1.20, iconName: "dollarsign.circle.fill"),
        CoinDummy(name: "Solana", symbol: "SOL", price: 145.80, changePercentage: 5.67, iconName: "s.circle.fill"),
        CoinDummy(name: "Cardano", symbol: "ADA", price: 0.48, changePercentage: -0.50, iconName: "c.circle.fill")
    ]
    
    let manager = PortfolioManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Premium Dark Background
                Color(red: 0.05, green: 0.05, blue: 0.08)
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // 1. Header Portfolio Card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Total Balance")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Text("$\(String(format: "%.2f", Double(manager.calTotalBalance()) ?? 0.0))") // <--- Yeh tumhare backend se dynamically calculate hoga
                                .font(.system(size: 38, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                            
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.up.right.circle.fill")
                                Text("+3.15% Today")
                            }
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.green)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.green.opacity(0.15))
                            .cornerRadius(20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(24)
                        .background(
                            LinearGradient(
                                colors: [Color(red: 0.12, green: 0.14, blue: 0.22), Color(red: 0.08, green: 0.09, blue: 0.15)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.white.opacity(0.05), lineWidth: 1)
                        )
                        
                        // 2. Trending Horizontal Section
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Trending Now")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.white)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(trendingCoins) { coin in
                                        HStack(spacing: 12) {
                                            Image(systemName: coin.iconName)
                                                .font(.title2)
                                                .foregroundStyle(.orange)
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(coin.symbol)
                                                    .font(.callout)
                                                    .bold()
                                                    .foregroundStyle(.white)
                                                Text(String(format: "$%.2f", coin.price))
                                                    .font(.caption)
                                                    .foregroundStyle(.gray)
                                            }
                                            
                                            Text(String(format: "%+.2f%%", coin.changePercentage))
                                                .font(.caption)
                                                .bold()
                                                .foregroundStyle(coin.changePercentage >= 0 ? .green : .red)
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                        .background(Color.white.opacity(0.03))
                                        .cornerRadius(16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.white.opacity(0.05), lineWidth: 1)
                                        )
                                    }
                                }
                            }
                        }
                        
                        // 3. All Assets Vertical List
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Markets")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.white)
                            
                            VStack(spacing: 14) {
                                // 1. DYNAMIC LOOP: Ab loop 'allCoins' par nahi, backend ki 'manager.coinList' par chalega
                                // Aur pehle 'sybmol' ki spelling galat thi, usko '\.symbol' theek kar diya
                                ForEach(manager.coinList, id: \.symbol) { coin in
                                    HStack {
                                        // 2. DYNAMIC ICON: Kyunki backend coin mein 'iconName' nahi hai, humne symbol ke mutabiq SF Symbols set kar diye
                                        Image(systemName: coin.symbol == "BTC" ? "bitcoinsign.circle.fill" :
                                                         coin.symbol == "ETH" ? "dollarsign.circle.fill" :
                                                         coin.symbol == "SOL" ? "s.circle.fill" : "c.circle.fill")
                                            .font(.title)
                                            .foregroundStyle(.blue)
                                            .frame(width: 40, height: 40)
                                            .background(Color.white.opacity(0.03))
                                            .cornerRadius(12)
                                        
                                        // 3. DYNAMIC DATA: Yeh Name aur Symbol seedha backend se aayega
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(coin.name)
                                                .font(.body)
                                                .bold()
                                                .foregroundStyle(.white)
                                            Text(coin.symbol)
                                                .font(.caption)
                                                .foregroundStyle(.gray)
                                        }
                                        
                                        Spacer()
                                        
                                        // 4. DYNAMIC PRICES: Price aur change percentage bhi backend se automatic update hogi
                                        VStack(alignment: .trailing, spacing: 4) {
                                            Text(String(format: "$%.2f", coin.price))
                                                .font(.body)
                                                .bold()
                                                .foregroundStyle(.white)
                                            
                                            Text(String(format: "%+.2f%%", coin.changePercentage))
                                                .font(.caption)
                                                .bold()
                                                .foregroundStyle(coin.changePercentage >= 0 ? .green : .red)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                    
                                    // 5. DYNAMIC DIVIDER: Purana code 'coin.id' dhoond raha tha jo backend mein nahi hai.
                                    // Humne isay change kiya taake check kare ke list ka aakhri coin kon sa hai us par line na lagaye.
                                    if coin.symbol != manager.coinList.last?.symbol {
                                        Divider()
                                            .background(Color.white.opacity(0.05))
                                    }
                                }
                            }
                            .padding(16)
                            .background(Color.white.opacity(0.02))
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("CryptoTracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.cyan)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
