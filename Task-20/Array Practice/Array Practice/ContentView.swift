import SwiftUI

struct ContentView: View {
    // Single variable jo screen par display hoga
    @State var displayFirstFruit: String = "No Fruit Loaded"
    @State var displaySecondFruit: String = "No Fruit Loaded"
    @State var displayThirdFruit: String = "No Fruit Loaded"
    
    var body: some View {
        VStack(spacing: 25) {
            
            // 1. Simple Display Box
            Text(displayFirstFruit)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(12)
            Text(displaySecondFruit)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(12)
            Text(displayThirdFruit)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .cornerRadius(12)
            
            // 2. Load Button
            Button(action: {
               loadData()
                displayFirstFruit = fruits[0]
                displaySecondFruit = fruits[1]
                displayThirdFruit = fruits[2]
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
