import Foundation

struct Player: Codable
{
    let playerName: String
    let rank: String
    let favWeapon: String
    let kills: Int
}

func loadData (players: inout [Player])
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode([Player].self, from: jsonData)
        players = decodedData
    }
    catch
    {
        print ("\(error)")
    }
}
