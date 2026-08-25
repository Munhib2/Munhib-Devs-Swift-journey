import SwiftUI

struct ContentView: View
{
    @State var movies: [Movie] = []
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            
            ScrollView
            {
                Text ("Movie List")
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                VStack
                {
                    ForEach (movies, id: \.title)
                    {
                        movie in
                        GroupBox
                        {
                            Text (movie.title)
                                .bold()
                                .font(.title)
                            Text ("\(movie.year)")
                            Text (movie.genre)
                            Text ("⭐ \(movie.rating, specifier: "%.1f")")
                        }
                        .glassEffect(in: .rect(cornerRadius: 35))
                    }
                }
                Spacer()
                Button (action: {
                    if let movie = loadData()
                    {
                        movies = movie
                    }
                })
                {
                    Text ("Load Movies")
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
