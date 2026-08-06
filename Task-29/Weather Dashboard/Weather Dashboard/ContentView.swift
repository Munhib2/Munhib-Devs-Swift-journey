import SwiftUI

struct ContentView: View
{
    @State var temperature: String = "loading..."
    @State var condition: String = "loading..."
    @State var humidity: String = "loading..."
    @State var city: String = "City"
    @State var country: String = "Country"
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("Weather Dashboard")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 30))
                Spacer()
                HStack
                {
                    Text ("📍")
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
                    VStack
                    {
                        HStack
                        {
                            Text ("🌡️ Temperature:")
                                .bold()
                                .font(.title3)
                                .padding()
                            Text ("\(temperature)")
                                .font(.title3)
                                .padding()
                        }
                        .padding()
                        HStack
                        {
                            Text ("☀️ Condition:")
                                .bold()
                                .font(.title3)
                                .padding()
                            Text ("\(condition)")
                                .font(.title3)
                                .padding()
                        }
                        .padding()
                        HStack
                        {
                            Text ("💧 Humidity:")
                                .bold()
                                .font(.title3)
                                .padding()
                            Text ("\(humidity)")
                                .font(.title3)
                                .padding()
                        }
                        .padding()
                    }
                }
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 30))
                .frame(maxWidth: .infinity)
                .padding()
                Spacer()
                Button (action: {
                    loadData(temperature: &temperature, condition: &condition, humidity: &humidity, city: &city, country: &country)
                })
                {
                    Text ("Load Weather")
                }
                .padding()
                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 20))
            }
        }
    }
}
#Preview
{
    ContentView()
}
