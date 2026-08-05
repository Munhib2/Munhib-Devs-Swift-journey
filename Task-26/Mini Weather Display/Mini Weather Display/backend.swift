import Foundation

struct CurrentWeather: Decodable
{
    let windspeed: Double
    let temperature: Double
}

struct WeatherResponse: Decodable
{
    let current_weather: CurrentWeather
}

func loadWether() async -> (temperature: String, windspeed: String)
{
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=31.52&longitude=74.35&current_weather=true"
    guard let url = URL(string: urlString)
    else
    {
        print ("Invalid URL")
        return ("N/A", "N/A")
    }
    do
    {
        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        let temperature = ("\(weatherData.current_weather.temperature)")
        let windspeed = ("\(weatherData.current_weather.windspeed)")
        return (temperature, windspeed)
    }
    catch
    {
        print ("\(error)")
        return ("Error", "Error")
    }
}
