import SwiftUI

struct ContentView: View {
    // Shuru mein hum ne variable ko khali chor diya
    @State var singleTask: String = "No Task Loaded"
    
    var body: some View {
        VStack(spacing: 20) {
            // 1. Ek simple text box jo variable ko display kar raha hai
            Text(singleTask)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
            
            // 2. Button jo array se data nikaal kar is variable ko dega
            Button("LOAD FIRST ITEM") {
                // Hum backend ki array 'myTasks' ke pehle box (0) se data nikaal rahe hain
                singleTask = myTasks[0]
            }
            .font(.subheadline)
            .bold()
            .foregroundColor(.black)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.08, green: 0.08, blue: 0.10).ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
