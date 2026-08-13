import SwiftUI

struct ContentView: View
{
    @State var username: String = "name"
    @State var age: Int = 0
    @State var availability: Bool = false
    @State var bio: String = "bio"
    @State var city: String = "city"
    @State var website: String?
    @State var skills: [String] = []
    @State var projects: [Project] = []
    
    var body: some View
    {
        ScrollView
        {
            VStack (spacing: 20)
            {
                Text ("Developer Dashboard")
                    .bold()
                    .font(.system(size: 30))
                
                HStack (spacing: 150)
                    {
                        VStack
                        {
                            Text ("Name")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            Text (username)
                                .font(.title3)
                                .bold()
                        }
                        VStack
                        {
                            Text ("Age")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            Text ("\(age)")
                                .font(.title3)
                                .bold()
                        }
                    }
                VStack
                {
                    Text ("Status")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    Text (availability ? "Available" : "Not Available")
                        .font(.title3)
                        .bold()
                }
                VStack
                {
                    Text (bio)
                    Text (city)
                }
                VStack
                {
                    Text ("Skills")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    ForEach (skills, id: \.self)
                    {
                        skill in
                        Text ("\(skill)")
                    }
                }
                VStack
                {
                    Text ("Projects")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    ForEach (projects, id: \.name)
                    {
                        project in
                        Text (project.name)
                        Text ("\(project.year)")
                        ForEach (project.technologies, id: \.self)
                        {
                            technology in
                            Text (technology)
                        }
                    }
                }
                ProfileEditorView(username: $username, age: $age, availability: $availability)
                
                Button (action: {
                    loadData(username: &username, age: &age, availability: &availability, bio: &bio, city: &city, website: &website, skills: &skills, projects: &projects)
                })
                {
                    Text ("Load Data")
                }
                .padding()
                .glassEffect(.regular.interactive())
            }
        }
    }
}
struct ProfileEditorView: View
{
    @Binding var username: String
    @Binding var age: Int
    @Binding var availability: Bool
    
    var body: some View
    {
        HStack
        {
            Button (action: {
                username = "Ali"
            })
            {
                Text ("Change Name")
            }
            .padding()
            .glassEffect(.regular.interactive())
            Button (action: {
                age += 1
            })
            {
                Text ("Age +")
            }
            .padding()
            .glassEffect(.regular.interactive())
            Button (action: {
                availability.toggle()
            })
            {
                Text ("Toggle Status")
            }
            .padding()
            .glassEffect(.regular.interactive())
        }
    }
}
#Preview
{
    ContentView()
}
