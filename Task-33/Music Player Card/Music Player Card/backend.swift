import Foundation

struct Music: Decodable
{
    let title: String
    let artist: String
    let currentTime: String
    let duration: String
}

func loadData(songName: inout String, artistName: inout String, currentTime: inout String, totalTime: inout String)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Music.self, from: jsonData)
        songName = decodedData.title
        artistName = decodedData.artist
        currentTime = decodedData.currentTime
        totalTime = decodedData.duration
    }
    catch
    {
        print ("Munhib bro error aya hy: \(error)")
    }
}
