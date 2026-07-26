import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            Button("Test")
            {
                print ("Button Pressed Successfully")
                testMyPizzaCode()
            }
            .font(.title)
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}
#Preview
{
    ContentView()
}
