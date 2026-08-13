import Foundation

struct User: Decodable
{
    let username: String
    let age: Int
    let isAvailable: Bool
    let website: String?
    let profile: Profile
    let skills: [String]
    let projects: [Project]
}
struct Profile: Decodable
{
    let bio: String
    let city: String
}
struct Project: Decodable
{
    let name: String
    let year: Int
    let technologies: [String]
    let isCompleted: Bool
}

func loadData(username: inout String, age: inout Int, availability: inout Bool, bio: inout String, city: inout String, website: inout String?, skills: inout [String], projects: inout [Project])
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(User.self, from: jsonData)
        username = decodedData.username
        age = decodedData.age
        availability = decodedData.isAvailable
        bio = decodedData.profile.bio
        city = decodedData.profile.city
        website = decodedData.website
        skills = decodedData.skills
        projects = decodedData.projects
    }
    catch
    {
        print ("Munhib error agaya hy: \(error)")
    }
}
