import SwiftUI

struct ContentView: View
{
    @State var name = "Text here"
    @State var age = "Text here"
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Spacer()
                GroupBox
                {
                    Text ("Name: \(name)")
                        .foregroundColor(.red)
                        .bold()
                    Text ("Age: \(age)")
                        .foregroundColor(.red)
                        .bold()
                }
                .padding()
                Spacer()
                Button(action: {
                    loadData(name: &name, age: &age)
                })
                {
                    Text ("Load Data")
                        .foregroundColor(.green)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.5))
                .cornerRadius(20)
                .shadow(color: .green.opacity(0.9), radius: 15, x: 0, y: 0)
                .padding(10)
                .buttonStyle(.plain)
            }
        }
    }
}
#Preview {
    ContentView()
}
