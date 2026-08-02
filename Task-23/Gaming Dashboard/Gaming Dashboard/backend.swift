import Foundation

struct GameResponse: Codable
{
    let games: [String]
    let isGamesLoaded: Bool
}

var gameList: [String] = []
var global: Bool = false

func loadGamesData (gameBool: inout Bool)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(GameResponse.self, from: jsonData)
        gameList = decodedData.games
        global = decodedData.isGamesLoaded
        gameBool = decodedData.isGamesLoaded
    }
    catch
    {
        print ("\(error)")
    }
}
