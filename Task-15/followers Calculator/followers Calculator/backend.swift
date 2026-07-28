import Foundation

struct Followers: Codable
{
    let person1: Int
    let person2: Int
    let person3: Int
    let person4: Int
}

func loadData (person1Followers: inout Int, person2Followers: inout Int, person3Followers: inout Int, person4Followers: inout Int, totalFollowers: inout Int)
{
    guard let jsonData = fakeJsonData.data(using: .utf8) else {return}
    do
    {
        let follower = try JSONDecoder().decode(Followers.self, from: jsonData)
        person1Followers = follower.person1
        person2Followers = follower.person2
        person3Followers = follower.person3
        person4Followers = follower.person4
        totalFollowers = follower.person1 + follower.person2 + follower.person3 + follower.person4
    }
    catch
    {
        print ("\(error)")
    }
}
