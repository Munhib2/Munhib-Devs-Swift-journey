import Foundation

struct CurrentWeather: Decodable
{
    let temperature: Double
    let windspeed: Double
}

struct WeatherResponse: Decodable
{
    let current_weather: CurrentWeather
}

func fetchLiveWeather () async
{
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=31.52&longitude=74.35&current_weather=true"
    guard let url = URL(string: urlString)
    else
    {
        print ("Invalid URL")
        return
    }
    do
    {
        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        print ("Live Temperature: \(weatherData.current_weather.temperature)°C")
        print("Live Wind: \(weatherData.current_weather.windspeed) km/h")
    }
    catch
    {
        print ("Error Fetching Data: \(error)")
    }
}
