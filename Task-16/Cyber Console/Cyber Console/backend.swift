import Foundation

struct User: Codable
{
    let serverName: String
    let pingRate: Int
    let activePlayers: Int
    let isServerOnline: Bool
}

func loadData (serverName: inout String, pingRate: inout Int, activePlayers: inout Int, isServerOnline: inout Bool)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let screen = try JSONDecoder().decode(User.self, from: jsonData)
        serverName = screen.serverName
        pingRate = screen.pingRate
        activePlayers = screen.activePlayers
        isServerOnline = screen.isServerOnline
    }
    catch
    {
        print ("\(error)")
    }
}
