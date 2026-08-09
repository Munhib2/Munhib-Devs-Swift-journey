import Foundation

struct User: Decodable
{
   let name: String
   let username: String
   let age: Int
   let profile: Profile
   let website: String?
}
struct Profile: Decodable
{
   let bio: String
   let location: String
}

func loadData (name: inout String, username: inout String, age: inout String, bio: inout String, location: inout String, website: inout String?)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let decodedData = try JSONDecoder().decode(User.self, from: jsonData)
        name = decodedData.name
        username = decodedData.username
        website = decodedData.website
        age = ("\(decodedData.age)")
        bio = decodedData.profile.bio
        location = decodedData.profile.location
    }
    catch
    {
        print ("\(error)")
    }
}
