import SwiftUI

struct ContentView: View
{
    @State var temperature: String = "Loading..."
    @State var windspeed: String = "Loading..."
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("Weather App")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 45))
                Spacer()
                Text("Lahore")
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                GroupBox
                {
                    HStack
                    {
                        Text ("Temperature:")
                            .padding()
                            .bold()
                        Text ("\(temperature)°C")
                            .padding()
                    }
                    HStack
                    {
                        Text ("Windspeed:")
                            .padding()
                            .bold()
                        Text ("\(windspeed) km/h")
                            .padding()
                    }
                }
                .glassEffect(in: .rect(cornerRadius: 16.0))
                .cornerRadius(30)
                .frame(maxWidth: .infinity)
                .padding()
                Spacer()
                
                Button (action: {
                    Task
                    {
                        let result = await loadWether()
                        temperature = result.temperature
                        windspeed = result.windspeed
                    }
                })
                {
                    Text ("Load Weather")
                }
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16.0))
            }
        }
    }
}
#Preview
{
    ContentView()
}
