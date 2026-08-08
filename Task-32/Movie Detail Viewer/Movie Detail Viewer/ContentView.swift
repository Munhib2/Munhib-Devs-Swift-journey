import SwiftUI

struct ContentView: View
{
    @State var movieName: String = "loading..."
    @State var ratings: String = "loading..."
    @State var year: String = "loading..."
    @State var genre: String = "loading..."
    @State var director: String = "loading..."
    @State var description: String = "loading..."
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("🎬 Movie")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 35))
                Spacer()
                Text ("\(movieName)")
                    .foregroundColor(.white)
                    .font(.title3)
                Spacer()
                HStack
                {
                    Text ("⭐️ \(ratings)")
                        .padding()
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Text ("\(year)")
                        .padding()
                        .foregroundColor(.white)
                        .padding()
                }
                Text ("Genre: \(genre)")
                    .foregroundColor(.white)
                    .padding()
                Text ("Director: \(director)")
                    .foregroundColor(.white)
                Spacer()
                Text ("\(description)")
                    .foregroundColor(.gray)
                Spacer()
                Button (action: {
                    loadData(movieName: &movieName, ratings: &ratings, year: &year, genre: &genre, director: &director, description: &description)
                })
                {
                    Text ("Load Movie")
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
