import SwiftUI

struct User: Decodable
{
    let login: String
    let name: String?
    let avatar_url: String?
    let blog: String?
    let location: String?
    let bio: String?
    let public_repos: Int
    let followers: Int
    let following: Int
    let created_at: String
    let updated_at: String
}

struct ContentView: View
{
    @State private var name: String = "Name"
    @State private var userName: String = "username"
    @State private var bio: String = "Bio"
    @State private var repo: Int = 0
    @State private var followers: Int = 0
    @State private var following: Int = 0
    @State private var location: String = "location"
    @State private var portfolio: String? = "Not Available"
    @State private var avatarUrl: String = ""
    @State private var createdAt: String = "Not Available"
    @State private var updatedAt: String = "Not Available"
    @State private var search: String = ""
    @State private var isLoading: Bool = false

    var body: some View {
        ZStack {
            Color(red: 0.04, green: 0.04, blue: 0.045)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Search Bar Top Floating Area
                HStack(spacing: 12) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.3))
                        
                        TextField("Search username...", text: $search)
                            .foregroundColor(.white)
                            .autocorrectionDisabled()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .glassEffect(.regular.interactive())

                    Button(action: {
                        Task { await loadData() }
                    }) {
                        if isLoading {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text("Search")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                // Scrollable Content Area
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Avatar Image
                        AsyncImage(url: URL(string: avatarUrl)) { phase in
                            switch phase {
                            case .empty:
                                Image(systemName: "person.fill")
                                    .font(.system(size: 45, weight: .light))
                                    .foregroundColor(.white.opacity(0.25))
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .failure:
                                Image(systemName: "person.fill")
                                    .font(.system(size: 45, weight: .light))
                                    .foregroundColor(.white.opacity(0.25))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 120, height: 120)
                        .background(Color(red: 0.1, green: 0.1, blue: 0.11))
                        .clipShape(Circle())
                        .overlay(Circle().strokeBorder(.white.opacity(0.1), lineWidth: 1))
                        .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 6)
                        .padding(.top, 24)

                        // Name & Handle
                        Text(name)
                            .font(.system(size: 24, weight: .semibold))
                            .tracking(-0.5)
                            .foregroundColor(.white)
                            .padding(.top, 16)

                        Text("@\(userName)")
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                            .foregroundColor(.white.opacity(0.3))
                            .padding(.top, 4)

                        // Bio
                        Text(bio)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.white.opacity(0.5))
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                            .padding(.horizontal, 32)
                            .padding(.top, 12)

                        // Repos & Followers Box
                        HStack(spacing: 0) {
                            statColumn(title: "REPOSITORIES", value: repo)
                            Divider().background(.white.opacity(0.1)).frame(height: 30)
                            statColumn(title: "FOLLOWERS", value: followers)
                            Divider().background(.white.opacity(0.1)).frame(height: 30)
                            statColumn(title: "FOLLOWING", value: following)
                        }
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.07, green: 0.07, blue: 0.078))
                                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(.white.opacity(0.07), lineWidth: 1))
                        )
                        .padding(.horizontal, 24)
                        .padding(.top, 24)

                        // Details List (Location, Portfolio, Created, Updated)
                        VStack(spacing: 0) {
                            detailRow(icon: "mappin", title: "Location", value: location)
                            Divider().background(.white.opacity(0.05))
                            
                            detailRow(icon: "link", title: "Portfolio", value: (portfolio == nil || portfolio?.isEmpty == true) ? "Not Available" : portfolio!, isMonospaced: true)
                            Divider().background(.white.opacity(0.05))
                            
                            detailRow(icon: "calendar.badge.plus", title: "Created", value: createdAt)
                            Divider().background(.white.opacity(0.05))
                            
                            detailRow(icon: "arrow.clockwise", title: "Updated", value: updatedAt)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.07, green: 0.07, blue: 0.078))
                                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(.white.opacity(0.07), lineWidth: 1))
                        )
                        .padding(.horizontal, 24)
                        .padding(.top, 16)
                        .padding(.bottom, 40)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    // Helper: Stats Column
    @ViewBuilder
    private func statColumn(title: String, value: Int) -> some View {
        VStack(spacing: 4) {
            Text("\(value)")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
            Text(title)
                .font(.system(size: 8.5, weight: .medium))
                .tracking(1.2)
                .foregroundColor(.white.opacity(0.3))
        }
        .frame(maxWidth: .infinity)
    }

    // Helper: Detail Row
    @ViewBuilder
    private func detailRow(icon: String, title: String, value: String, isMonospaced: Bool = false) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.3))
                .frame(width: 18)
            Text(title)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.3))
            Spacer()
            Text(value)
                .font(isMonospaced ? .system(size: 13, design: .monospaced) : .system(size: 13))
                .foregroundColor(.white.opacity(0.65))
                .lineLimit(1)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }

    private func loadData() async
    {
            let trimmedSearch = search.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmedSearch.isEmpty,
                  let encodedSearch = trimmedSearch.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
                  let url = URL(string: "https://api.github.com/users/\(encodedSearch)") else { return }

            isLoading = true
            defer { isLoading = false }

            var request = URLRequest(url: url)
            request.setValue("SwiftApp", forHTTPHeaderField: "User-Agent")

            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }

                let decodedData = try JSONDecoder().decode(User.self, from: data)

                await MainActor.run {
                    self.name = decodedData.name ?? "No Name"
                    self.userName = decodedData.login
                    self.bio = decodedData.bio ?? "No Bio"
                    self.repo = decodedData.public_repos
                    self.followers = decodedData.followers
                    self.following = decodedData.following
                    self.location = decodedData.location ?? "Not Available"
                    self.portfolio = decodedData.blog
                    self.avatarUrl = decodedData.avatar_url ?? ""
                    self.createdAt = formatDate(decodedData.created_at)
                    self.updatedAt = formatDate(decodedData.updated_at)
                }
            } catch {
                print("Error decoding or fetching user data: \(error)")
            }
        }

    // Helper Date Formatter
    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            return displayFormatter.string(from: date)
        }
        return dateString
    }
}

#Preview {
    ContentView()
}
