import SwiftUI

struct ContentView: View
{
    @State var userName: String = "name"
    @State var age: Int = 0
    @State var isAvailable: Bool = false
    @State var bio: String = "bio"
    @State var city: String = "city"
    @State var website: String?
    @State var skills: [String] = []
    @State var projects: [Project] = []
    var body: some View
    {
        ZStack
        {
            Color.black
                .ignoresSafeArea()
            VStack
            {
                Text ("Developer Profile")
                    .foregroundColor(.white)
                    .font(.system(size: 35))
                    .bold()
                VStack
                {
                    Text ("\(userName)")
                        .foregroundColor(.white.opacity(0.7))
                        .bold()
                        .font(.title)
                    Text ("Age: \(age)")
                        .foregroundColor(.white.opacity(0.7))
                        .bold()
                        .font(.title3)
                }
                Text (isAvailable ? "🟢 Available" : "🔴 Not Available")
                    .foregroundColor(.white)
                VStack
                {
                    VStack
                    {
                        Text ("iOS Developer")
                            .foregroundColor(.white)
                        Text ("\(city)")
                            .foregroundColor(.white)
                    }
                    VStack
                    {
                        Text ("Skills")
                            .foregroundColor(.white)
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    VStack
                    {
                        ForEach (skills, id: \.self)
                        {
                            skill in
                            Text (skill)
                                .foregroundColor(.white)
                        }
                    }
                    VStack
                    {
                        Text ("Projects")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    VStack
                    {
                        ForEach (projects, id: \.name)
                        {
                            project in
                            Text (project.name)
                                .foregroundColor(.white)
                            Text ("\(project.year)")
                                .foregroundColor(.white)
                            ForEach (project.technologies, id: \.self)
                            {
                                technology in
                                Text (technology)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    VStack
                    {
                        Text ("Website: \(website)")
                            .foregroundColor(.white)
                    }
                    VStack
                    {
                        Text (bio)
                            .foregroundColor(.white)
                    }
                }
                Button (action: {
                    loadData (userName: &userName, age: &age, isAvailable: &isAvailable, bio: &bio, city: &city, website: &website, skills: &skills, projects: &projects)
                })
                {
                    Text ("Load Profile")
                }
                .padding()
                .glassEffect(.regular.interactive())
            }
        }
    }
}
#Preview
{
    ContentView()
}
