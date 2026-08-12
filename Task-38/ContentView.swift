import SwiftUI

struct ContentView: View
{
    @State var isAvailable: Bool = false
    var body: some View
    {
        HStack
        {
            Text("Status:")
            Text (isAvailable ? "Available" : "Not Available")
        }
        ProfileView(isAvailable: $isAvailable)
    }
}

struct ProfileView: View
{
    @Binding var isAvailable: Bool
    var body: some View
    {
        Button(action: {
            isAvailable.toggle()
        })
        {
            Text ("Change Status")
        }
        .padding()
        .glassEffect(.regular.interactive())
    }
}
#Preview
{
    ContentView()
}
