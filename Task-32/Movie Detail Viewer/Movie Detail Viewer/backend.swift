import Foundation

struct Movie: Decodable
{
    let title: String
    let year: Int
    let rating: Double
    let genre: String
    let director: String
    let description: String
    let posterURL: String?
}

func loadData(movieName: inout String, ratings: inout String, year: inout String, genre: inout String, director: inout String, description: inout String)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Movie.self, from: jsonData)
        movieName = decodedData.title
        year = ("\(decodedData.year)")
        ratings = ("\(decodedData.rating)")
        genre = decodedData.genre
        director = decodedData.director
        description = decodedData.description
    }
    catch
    {
        print ("\(error)")
    }
}
