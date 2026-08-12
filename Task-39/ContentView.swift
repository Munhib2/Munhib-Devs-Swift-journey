import SwiftUI

struct ContentView: View
{
    @State var name: String = "Munhib"
    @State var age: Int = 20
    var body: some View
    {
        ProfileView(name: $name, age: $age)
    }
}
struct ProfileView: View
{
    @Binding var name: String
    @Binding var age: Int
    var body: some View
    {
        Text ("Name: \(name)")
            .foregroundColor(.black)
        Text ("Age: \(age)")
            .foregroundColor(.black)
        Button (action: {
            name = "Ali"
            age = 35
        })
        {
            Text ("Update Profile")
        }
        .padding()
        .glassEffect(.regular.interactive())
    }
}
#Preview
{
    ContentView()
}
