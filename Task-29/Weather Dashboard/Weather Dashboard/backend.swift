import Foundation

struct Weather: Decodable
{
    let location: Location
    let current: Current
}

struct Location: Decodable
{
    let city: String
    let country: String
}
struct Current: Decodable
{
    let temperature: Int
    let condition: String
    let humidity: Int
}


func loadData(temperature: inout String, condition: inout String, humidity: inout String, city: inout String, country: inout String)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(Weather.self, from: jsonData)
        city = decodedData.location.city
        country = decodedData.location.country
        temperature = ("\(decodedData.current.temperature)")
        condition = decodedData.current.condition
        humidity = ("\(decodedData.current.humidity)")
    }
    catch
    {
        print ("\(error)")
    }
}
