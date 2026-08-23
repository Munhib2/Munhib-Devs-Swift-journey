import Foundation

struct QuoteResponse: Decodable
{
    let quotes: [Quote]
}
struct Quote: Decodable
{
    let text: String
    let author: String
}

func loadData () -> Quote?
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return nil}
    do
    {
        let decodedData = try JSONDecoder().decode(QuoteResponse.self, from: jsonData)
        return decodedData.quotes.randomElement()
    }
    catch
    {
        print ("Munhib Error Aya Hy: \(error)")
        return nil
    }
}
