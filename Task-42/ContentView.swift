import SwiftUI
import Foundation

struct User: Decodable {
    let username: String
    let age: Int
    let isAvailable: Bool
    let website: String?
    let profile: Profile
    let skills: [String]
    let projects: [Project]
}

struct Profile: Decodable {
    let bio: String
    let city: String
}

struct Project: Decodable {
    let name: String
    let year: Int
    let technologies: [String]
    let isCompleted: Bool
}

// MARK: - JSON

let fakeJsonData = """
{
  "username": "Munhib",
  "age": 20,
  "isAvailable": true,
  "website": null,

  "profile": {
    "bio": "iOS Developer",
    "city": "Lahore"
  },

  "skills": [
    "Swift",
    "SwiftUI",
    "JSON",
    "Git"
  ],

  "projects": [
    {
      "name": "Menu App",
      "year": 2026,
      "technologies": [
        "Swift",
        "SwiftUI",
        "JSON"
      ],
      "isCompleted": true
    },
    {
      "name": "Developer Profile",
      "year": 2026,
      "technologies": [
        "Swift",
        "SwiftUI"
      ],
      "isCompleted": false
    }
  ]
}
"""

// MARK: - Decoder

func loadData(
    username: inout String,
    age: inout Int,
    availability: inout Bool,
    bio: inout String,
    city: inout String,
    website: inout String?,
    skills: inout [String],
    projects: inout [Project]
) {
    guard let jsonData = fakeJsonData.data(using: .utf8) else {
        return
    }

    do {
        let decodedData = try JSONDecoder().decode(User.self, from: jsonData)

        username = decodedData.username
        age = decodedData.age
        availability = decodedData.isAvailable
        bio = decodedData.profile.bio
        city = decodedData.profile.city
        website = decodedData.website
        skills = decodedData.skills
        projects = decodedData.projects

    } catch {
        print("Error agaya: \(error)")
    }
}


struct ContentView: View {
    
    @State var username: String = "name"
    @State var age: Int = 0
    @State var availability: Bool = false
    @State var bio: String = "bio"
    @State var city: String = "city"
    @State var website: String?
    @State var skills: [String] = []
    @State var projects: [Project] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Developer Dashboard")
                    .font(.system(size: 30))
                    .bold()
                
                // MARK: Basic Info
                
                HStack(spacing: 80) {
                    VStack {
                        Text("Name")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text(username)
                            .font(.title3)
                            .bold()
                    }
                    
                    VStack {
                        Text("Age")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.gray)
                        
                        Text("\(age)")
                            .font(.title3)
                            .bold()
                    }
                }
                
                // MARK: Availability
                
                VStack {
                    Text("Status")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    
                    Text(
                        availability
                        ? "🟢 Available"
                        : "🔴 Not Available"
                    )
                    .font(.title3)
                    .bold()
                }
                
                // MARK: Profile
                
                VStack(spacing: 5) {
                    Text(bio)
                        .font(.headline)
                    
                    Text(city)
                        .foregroundColor(.gray)
                }
                
                // MARK: Skills
                
                VStack(spacing: 10) {
                    Text("Skills")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    
                    ForEach(skills, id: \.self) { skill in
                        Text(skill)
                    }
                }
                
                // MARK: Projects
                
                VStack(spacing: 15) {
                    Text("Projects")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    
                    ForEach(projects, id: \.name) { project in
                        
                        VStack(spacing: 6) {
                            Text(project.name)
                                .font(.headline)
                            
                            Text("\(project.year)")
                                .foregroundColor(.gray)
                            
                            ForEach(project.technologies, id: \.self) { technology in
                                Text(technology)
                                    .font(.subheadline)
                            }
                            
                            Text(
                                project.isCompleted
                                ? "✅ Completed"
                                : "🟡 In Progress"
                            )
                        }
                        .padding()
                    }
                }
                
                // MARK: Website
                
                VStack(spacing: 5) {
                    Text("Website")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.gray)
                    
                    if let website = website {
                        Text(website)
                    } else {
                        Text("Not Available")
                            .foregroundColor(.gray)
                    }
                }
                
                // MARK: Editor
                
                ProfileEditorView(
                    username: $username,
                    age: $age,
                    availability: $availability
                )
                
                // MARK: Load Button
                
                Button {
                    loadData(
                        username: &username,
                        age: &age,
                        availability: &availability,
                        bio: &bio,
                        city: &city,
                        website: &website,
                        skills: &skills,
                        projects: &projects
                    )
                } label: {
                    Text("Load Profile")
                        .bold()
                        .padding()
                }
                .glassEffect(.regular.interactive())
            }
            .padding()
        }
    }
}

// MARK: - Profile Editor

struct ProfileEditorView: View {
    
    @Binding var username: String
    @Binding var age: Int
    @Binding var availability: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            
            Button {
                username = "Ali"
            } label: {
                Text("Change Name")
                    .bold()
            }
            
            Button {
                age += 1
            } label: {
                Text("Increase Age")
                    .bold()
            }
            
            Button {
                availability.toggle()
            } label: {
                Text("Toggle Status")
                    .bold()
            }
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
