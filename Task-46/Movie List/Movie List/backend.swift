import Foundation

struct MovieDetails: Decodable
{
    let movies: [Movie]
}
struct Movie: Decodable
{
    let title: String
    let year: Int
    let genre: String
    let rating: Double
}

func loadData () -> [Movie]?
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return nil}
    do
    {
        let decodedData = try JSONDecoder().decode(MovieDetails.self, from: jsonData)
        return decodedData.movies
    }
    catch
    {
        print ("Munhib Error: \(error)")
        return nil
    }
    
}
