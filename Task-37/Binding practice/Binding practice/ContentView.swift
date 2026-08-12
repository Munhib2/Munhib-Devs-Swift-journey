import SwiftUI

struct ContentView: View
{
    @State var age: Int = 20
    var body: some View
    {
        ProfileView (age: $age)
    }
}

struct ProfileView: View
{
    @Binding var age: Int
    var body: some View
    {
        VStack
        {
            Text ("\(age)")
            Button ("Change Age")
            {
                age = 21
            }
            .padding()
            .glassEffect(.regular.interactive())
        }
    }
}
#Preview {
    ContentView()
}
