import SwiftUI

struct ContentView: View {
    @State var displayFruit: String = "No Fruit Loaded"
    
    var body: some View {
        VStack(spacing: 25) {
            Text(displayFruit)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(12)
            
            // 2. Load Button
            Button(action: {
                loadFruitsData()
                displayFruit = myFruits[0]
            }) {
                Text("LOAD FIRST FRUIT")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.08, green: 0.08, blue: 0.10).ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
