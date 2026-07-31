import Foundation

var gamesList: [String] = []

func loadGamesData() {
    guard let jsonData = fakeJsonData.data(using: .utf8) else { return }
    
    do {
        let decodedGames = try JSONDecoder().decode([String].self, from: jsonData)
        gamesList = decodedGames
        print("Games Loaded Successfully!")
    } catch {
        print("Error: \(error)")
    }
}
