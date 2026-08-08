import SwiftUI

struct ContentView: View
{
    @State var city: String = "city..."
    @State var country: String = "country..."
    @State var temperature: String = "loading..."
    @State var condition: String = "loading..."
    @State var humidity: String = "loading..."
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("🌤️ Weather")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 40))
                Spacer()
                HStack
                {
                    Text ("\(city),")
                        .foregroundColor(.gray)
                        .bold()
                    Text ("\(country)")
                        .foregroundColor(.gray)
                        .bold()
                }
                Spacer()
                GroupBox
                {
                    Text ("🌡️ \(temperature)")
                        .padding()
                    Text ("\(condition)")
                        .padding()
                    Text ("💧 Humidity: \(humidity)%")
                        .padding()
                }
                .glassEffect(in: .rect(cornerRadius: 30))
                .padding()
                Spacer()
                Button (action: {
                    loadData(city: &city, country: &country, temperature: &temperature, condition: &condition, humidity: &humidity)
                })
                {
                    Text ("Load Weather")
                }
                .padding()
                .glassEffect(.regular.interactive())
            }
        }
    }
}
#Preview
{
    ContentView()
}
