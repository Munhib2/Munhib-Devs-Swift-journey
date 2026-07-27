import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack (spacing: 20)
            {
                Spacer()
                Text ("🎧")
                    .font(.system(size: 60))
                    .bold()
                Spacer()
                Text ("Unlock Premium Music")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Text ("Listen to millions of songs offline and without ads")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                Spacer()
                Button(action: {})
                {
                    Text ("Subscribe now")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .green.opacity(0.5), radius: 15, x: 0, y: 0)
                }.padding(.horizontal, 40)
            }
        }
    }
}
#Preview
{
    ContentView()
}
