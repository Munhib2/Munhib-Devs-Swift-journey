import SwiftUI

struct ContentView: View
{
    @State var name = "Munhib"
    @State var age = 20
    @State var isAvailable = false
    var body: some View
    {
        ProfileView(name: $name, age: $age, isAvailable: $isAvailable)
    }
}
struct ProfileView: View
{
    @Binding var name: String
    @Binding var age: Int
    @Binding var isAvailable: Bool
    var body: some View
    {
        Spacer()
        Text ("Name: \(name)")
            .font(.title)
            .bold()
        Text ("Age: \(age)")
            .font(.title)
            .bold()
        Text ("Status: \(isAvailable ? "🟢 Available" : "🔴 Not Available")")
        Spacer()
        HStack (spacing: 50)
        {
            Button (action: {
                isAvailable.toggle()
            })
            {
                Text ("Toggle Status")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .glassEffect(.regular.interactive())
            .background(Color.blue)
            .cornerRadius(30)
            .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 0)
            Button (action: {
                age += 1
            })
            {
                Text ("Increase Age")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .glassEffect(.regular.interactive())
            .background(Color.green)
            .cornerRadius(30)
            .shadow(color: .green.opacity(0.3), radius: 8, x: 0, y: 0)
        }
        .padding()
        Button (action: {
            name = "Ali"
        })
        {
            Text ("Change Name")
                .foregroundColor(.white)
                .bold()
        }
        .padding()
        .glassEffect(.regular.interactive())
        .background(Color.orange)
        .cornerRadius(30)
        .shadow(color: .orange.opacity(0.3), radius: 8, x: 0, y: 0)
    }
}
#Preview
{
    ContentView()
}
