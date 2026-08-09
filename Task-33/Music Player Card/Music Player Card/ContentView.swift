import SwiftUI

struct ContentView: View
{
    @State var songName: String = "Song Name"
    @State var artistName: String = "Artist Name"
    @State var currentTime: String = "00:00"
    @State var totalTime: String = "00:00"
    @State var isPlaying: Bool = false
    @State var status: String = "Paused"
    var body: some View
    {
        ZStack
        {
            Color.black.opacity(0.9)
                .ignoresSafeArea()
            VStack
            {
                GroupBox
                {
                    Text ("♫")
                        .foregroundColor(.white)
                        .font(.system(size: 200, weight: .bold))
                        .bold()
                        .frame(width: 300, height: 300)
                }
                .backgroundStyle(Color.indigo.opacity(0.5))
                .cornerRadius(25)
                .padding(.top, 50)
                VStack
                {
                    Text ("\(songName)")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    Text ("\(artistName)")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.title3)
                        .bold()
                }
                Spacer()
                VStack(spacing: 8)
                {
                    GeometryReader
                    { geometry in
                        ZStack(alignment: .leading)
                        {
                            Capsule()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 4)
                            Capsule()
                                .fill(Color.purple)
                                .frame(width: geometry.size.width * 0.5, height: 4)
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 12, height: 12)
                                .offset(x: (geometry.size.width * 0.5) - 6)
                        }
                    }
                    .frame(height: 12)
                    HStack {
                        Text("\(currentTime)")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("\(totalTime)")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding()
                Spacer()
                Text ("\(status)")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 100)
                HStack (spacing: 40)
                {
                    Button(action: {
                        
                    })
                    {
                        Image (systemName: "backward.fill")
                            .font(.title2)
                    }
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .glassEffect(.regular.interactive())
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
                    Button(action: {
                        isPlaying.toggle()
                        status = isPlaying ? "Playing" : "Paused"
                    })
                    {
                        Image (systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                    }
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .padding()
                    .glassEffect(.regular.interactive())
                    .background(Color.indigo.opacity(0.9))
                    .clipShape(Circle())
                    Button(action: {
                        
                    })
                    {
                        Image (systemName: "forward.fill")
                            .font(.title2)
                    }
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .glassEffect(.regular.interactive())
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
                }
                Button(action: {
                    loadData(songName: &songName, artistName: &artistName, currentTime: &currentTime, totalTime: &totalTime)
                })
                {
                    Text ("Load Data")
                }
                .padding()
                .glassEffect()
            }
            .padding(.bottom, 20)
        }
    }
}
#Preview
{
    ContentView()
}
