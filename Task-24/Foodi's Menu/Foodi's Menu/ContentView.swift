import SwiftUI

struct ContentView: View {
    // Check karne ke liye ke menu load hua ya nahi
    @State var isMenuLoaded: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Agar data load ho jaye toh Restaurant ka Naam dikhao
            if isMenuLoaded {
                Text(restaurantName)
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
                    .padding(.bottom, 10)
                
                // ForEach loop array ke har dish ke liye box banaye ga
                ForEach(specialDishes, id: \.self) { dish in
                    Text(dish)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                }
            } else {
                // Shuru mein jab tak button nahi daba
                VStack(spacing: 10) {
                    Text("🏪")
                        .font(.system(size: 150))
                    Text("Restaurant Closed")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 40)
            }
            
            Spacer()
            
            // Open/Load Button
            Button(action: {
                // Tumhara backend function jo tum banaoge
                loadMenuData(menuBool: &isMenuLoaded)
            }) {
                Text("OPEN RESTAURANT 🔓")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.orange)
                    .cornerRadius(12)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.97, green: 0.97, blue: 0.98).ignoresSafeArea()) // Light background UI
    }
}

#Preview {
    ContentView()
}
