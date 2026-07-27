import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack (spacing: 10)
            {
                HStack
                {
                    Text ("Welcome back")
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack
                {
                    Text ("Munhib Devs")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                Spacer().frame(height: 20)
                HStack
                {
                    Image (systemName: "bitcoinsign.circle.fill")
                        .foregroundColor(.orange)
                    Text ("Bitcoin")
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text ("$64,000")
                        .foregroundColor(.green)
                }
                HStack
                {
                    Image (systemName: "diamond.circle.fill")
                        .foregroundColor(.blue)
                    Text ("Ethereum")
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text ("$3,500")
                        .foregroundColor(.green)
                }
                HStack
                {
                    Image (systemName: "s.circle.fill")
                        .foregroundColor(.purple)
                    Text ("Solana")
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text ("$140")
                        .foregroundColor(.green)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
