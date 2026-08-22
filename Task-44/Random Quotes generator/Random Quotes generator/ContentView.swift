import SwiftUI

struct Quote: Identifiable, Equatable, Codable
{
    var id = UUID()
    let text: String
    let author: String
    let role: String
    let category: String
}

struct ZenQuoteResponse: Codable
{
    let q: String
    let a: String
}

struct ContentView: View
{
    @State private var selectedTab: AppTab = .home
    @State private var copied = false
    @State private var appeared = false
    
    @State private var savedQuotes: [Quote] = []
    @State private var currentQuote: Quote = Quote(
        text: "The future depends entirely on what you do today.",
        author: "Mahatma Gandhi",
        role: "Independence Leader",
        category: "#Motivation"
    )
    @State private var isLoading = false

    private let fallbackQuotes: [Quote] = [
        Quote(text: "The future depends entirely on what you do today.", author: "Mahatma Gandhi", role: "Independence Leader", category: "#Motivation"),
        Quote(text: "It always seems impossible until it's done.", author: "Nelson Mandela", role: "Former President", category: "#Wisdom"),
        Quote(text: "Stay hungry. Stay foolish.", author: "Steve Jobs", role: "Co-founder Apple", category: "#Tech"),
        Quote(text: "What we think, we become.", author: "Buddha", role: "Spiritual Leader", category: "#Wisdom"),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt", role: "26th US President", category: "#Motivation")
    ]

    private var isCurrentQuoteSaved: Bool
    {
        savedQuotes.contains(where: { $0.text == currentQuote.text })
    }

    var body: some View
    {
        ZStack
        {
            AmbientBackground()

            ScrollView(showsIndicators: false)
            {
                VStack(spacing: 0)
                {
                    if selectedTab == .home
                    {
                        homeView
                    }
                    else
                    {
                        savedView
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .padding(.bottom, 110)
            }

            VStack
            {
                Spacer()

                bottomNavigation
                    .padding(.horizontal, 20)
                    .padding(.bottom, 13)
            }
        }
        .preferredColorScheme(.dark)
        .task
        {
            loadSavedQuotes()
            withAnimation(.easeOut(duration: 0.8))
            {
                appeared = true
            }
            await fetchRandomQuote()
        }
    }

    private var homeView: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            topBar
                .padding(.bottom, 22)

            Text("Find your")
                .font(.system(size: 34, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.72))

            Text("daily focus.")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.bottom, 22)

            quoteCard
                .scaleEffect(appeared ? 1 : 0.97)
                .opacity(appeared ? 1 : 0)

            Spacer(minLength: 22)

            Button(action:
                    {
                Task
                {
                    await fetchRandomQuote()
                }
            })
            {
                HStack(spacing: 10)
                {
                    if isLoading
                    {
                        ProgressView()
                            .tint(.black)
                    }
                    else
                    {
                        Text("New Quote")
                            .font(.system(size: 17, weight: .bold, design: .rounded))

                        Text("✨")
                            .font(.system(size: 18))
                    }
                }
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background {
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.84, green: 1.0, blue: 0.72),
                                    .mint
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                .shadow(color: .mint.opacity(0.38), radius: 20, y: 7)
            }
            .disabled(isLoading)
            .buttonStyle(.plain)
            .padding(.top, 4)
        }
    }

    private var topBar: some View
    {
        HStack
        {
            HStack(spacing: 9)
            {
                Circle()
                    .fill(.white.opacity(0.12))
                    .frame(width: 32, height: 32)
                    .overlay {
                        Image(systemName: "sparkles")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(.mint)
                    }

                Text("Daily Focus")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
            }

            Spacer()
        }
    }

    private var quoteCard: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            HStack
            {
                Text("QUOTE OF THE DAY")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.3)
                    .foregroundStyle(.mint)

                Spacer()
            }

            Text("“")
                .font(.system(size: 74, weight: .bold, design: .serif))
                .foregroundStyle(.mint.opacity(0.85))
                .frame(height: 45)
                .padding(.top, 11)

            Text(currentQuote.text)
                .font(.system(size: 27, weight: .bold, design: .rounded))
                .tracking(-0.8)
                .foregroundStyle(.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 10)

            HStack(spacing: 10)
            {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .cyan, .white.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 38, height: 38)
                    .overlay {
                        Text(String(currentQuote.author.prefix(1)))
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                    }

                VStack(alignment: .leading, spacing: 2)
                {
                    Text(currentQuote.author)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text(currentQuote.role)
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.42))
                }

                Spacer()

                Text(currentQuote.category)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                    .foregroundStyle(.mint)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 7)
                    .background(.mint.opacity(0.10), in: Capsule())
            }
            .padding(.top, 29)

            Divider()
                .overlay(.white.opacity(0.10))
                .padding(.vertical, 20)

            HStack(spacing: 10)
            {
                actionButton(
                    systemImage: isCurrentQuoteSaved ? "heart.fill" : "heart",
                    title: "Save",
                    tint: isCurrentQuoteSaved ? .pink : .white.opacity(0.65)
                ) {
                    toggleSaveQuote()
                }

                ShareLink(item: "“\(currentQuote.text)” — \(currentQuote.author)")
                {
                    HStack(spacing: 6)
                    {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 14, weight: .semibold))

                        Text("Share")
                            .font(.system(size: 11, weight: .semibold, design: .rounded))
                    }
                    .foregroundStyle(.white.opacity(0.65))
                    .frame(maxWidth: .infinity)
                    .frame(height: 34)
                    .background(.white.opacity(0.07), in: Capsule())
                }
                .buttonStyle(.plain)

                actionButton(
                    systemImage: copied ? "checkmark" : "doc.on.doc",
                    title: copied ? "Copied" : "Copy"
                )
                {
                    UIPasteboard.general.string = "“\(currentQuote.text)” — \(currentQuote.author)"
                    withAnimation(.easeInOut(duration: 0.2))
                    {
                        copied = true
                    }
                }
            }
        }
        .padding(22)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.white.opacity(0.055))
        )
        .overlay
        {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.28), .white.opacity(0.04)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        }
        .shadow(color: .black.opacity(0.28), radius: 28, y: 15)
    }

    private func fetchRandomQuote() async
    {
        isLoading = true
        copied = false
        
        guard let url = URL(string: "https://zenquotes.io/api/random") else
        {
            useFallbackQuote()
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            {
                let decodedResponse = try JSONDecoder().decode([ZenQuoteResponse].self, from: data)
                if let apiQuote = decodedResponse.first
                {
                    withAnimation(.easeInOut(duration: 0.3))
                    {
                        currentQuote = Quote(
                            text: apiQuote.q,
                            author: apiQuote.a,
                            role: "Author",
                            category: "#Inspiration"
                        )
                        isLoading = false
                    }
                    return
                }
            }
            useFallbackQuote()
        }
        catch
        {
            useFallbackQuote()
        }
    }

    private func useFallbackQuote()
    {
        withAnimation(.easeInOut(duration: 0.3))
        {
            if let randomBackup = fallbackQuotes.randomElement()
            {
                currentQuote = randomBackup
            }
            isLoading = false
        }
    }
    
    private func saveQuotesToStorage()
    {
        if let encoded = try? JSONEncoder().encode(savedQuotes)
        {
            UserDefaults.standard.set(encoded, forKey: "PersistentSavedQuotesKey")
        }
    }

    private func loadSavedQuotes()
    {
        if let data = UserDefaults.standard.data(forKey: "PersistentSavedQuotesKey"),
           let decoded = try? JSONDecoder().decode([Quote].self, from: data)
        {
            savedQuotes = decoded
        }
    }

    private func toggleSaveQuote()
    {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6))
        {
            if let index = savedQuotes.firstIndex(where: { $0.text == currentQuote.text })
            {
                savedQuotes.remove(at: index)
            }
            else
            {
                savedQuotes.append(currentQuote)
            }
            saveQuotesToStorage()
        }
    }

    private func removeSavedQuote(_ quote: Quote)
    {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7))
        {
            savedQuotes.removeAll(where: { $0.id == quote.id })
            saveQuotesToStorage()
        }
    }

    private func actionButton(
        systemImage: String,
        title: String,
        tint: Color = .white.opacity(0.65),
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: systemImage)
                    .font(.system(size: 14, weight: .semibold))

                Text(title)
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
            }
            .foregroundStyle(tint)
            .frame(maxWidth: .infinity)
            .frame(height: 34)
            .background(.white.opacity(0.07), in: Capsule())
        }
        .buttonStyle(.plain)
    }

    private var savedView: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            HStack
            {
                Text("Saved Quotes")
                    .font(.system(size: 31, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)

                Spacer()
            }
            .padding(.top, 18)
            .padding(.bottom, 20)

            if savedQuotes.isEmpty
            {
                VStack(spacing: 12)
                {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 40))
                        .foregroundStyle(.white.opacity(0.3))
                    Text("No saved quotes yet")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.5))
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
            }
            else
            {
                LazyVGrid(
                    columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)],
                    spacing: 12
                )
                {
                    ForEach(Array(savedQuotes.enumerated()), id: \.element.id)
                    {
                        index, item in
                        MiniQuoteCard(
                            quote: item.text,
                            author: item.author,
                            tag: item.category,
                            accent: accentColor(for: index),
                            onUnsave:
                                {
                                removeSavedQuote(item)
                            }
                        )
                    }
                }
            }
        }
    }

    private func accentColor(for index: Int) -> Color
    {
        let colors: [Color] = [.orange, .blue, .purple, .pink, .mint, .yellow]
        return colors[index % colors.count]
    }

    private var bottomNavigation: some View
    {
        HStack(spacing: 0)
        {
            tabButton(.home, title: "Today", icon: "house.fill")
            tabButton(.saved, title: "Saved", icon: "heart.fill")
        }
        .padding(5)
        .background(.ultraThinMaterial, in: Capsule())
        .overlay
        { Capsule().stroke(.white.opacity(0.16), lineWidth: 1) }
        .shadow(color: .black.opacity(0.30), radius: 20, y: 8)
    }

    private func tabButton(_ tab: AppTab, title: String, icon: String) -> some View
    {
        Button
        {
            withAnimation(.easeInOut(duration: 0.25))
            {
                selectedTab = tab
            }
        }
        label:
        {
            HStack(spacing: 7)
            {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))

                Text(title)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
            }
            .foregroundStyle(selectedTab == tab ? .black : .white.opacity(0.52))
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .background
            {
                if selectedTab == tab
                {
                    Capsule().fill(.mint)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

private enum AppTab
{
    case home
    case saved
}

private struct MiniQuoteCard: View
{
    let quote: String
    let author: String
    let tag: String
    let accent: Color
    var onUnsave: (() -> Void)? = nil

    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            HStack
            {
                Circle()
                    .fill(accent.opacity(0.85))
                    .frame(width: 9, height: 9)
                    .shadow(color: accent, radius: 7)

                Spacer()

                if let onUnsave = onUnsave
                {
                    Button(action: onUnsave)
                    {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.pink)
                            .padding(6)
                            .background(.white.opacity(0.1), in: Circle())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.bottom, 12)

            Text("“")
                .font(.system(size: 36, weight: .bold, design: .serif))
                .foregroundStyle(accent.opacity(0.85))
                .frame(height: 24)

            Text(quote)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .lineSpacing(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 17)

            Spacer(minLength: 0)

            Text(author)
                .font(.system(size: 11, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.55))
                .lineLimit(1)

            Text(tag)
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundStyle(accent)
                .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(minHeight: 182, alignment: .top)
        .padding(16)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(.white.opacity(0.13), lineWidth: 1)
        }
    }
}

private struct AmbientBackground: View
{
    var body: some View
    {
        ZStack
        {
            LinearGradient(
                colors: [
                    Color(red: 0.04, green: 0.07, blue: 0.10),
                    Color(red: 0.06, green: 0.04, blue: 0.11),
                    Color(red: 0.02, green: 0.07, blue: 0.09)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(.mint.opacity(0.18))
                .frame(width: 260, height: 260)
                .blur(radius: 75)
                .offset(x: 135, y: -325)

            Circle()
                .fill(.purple.opacity(0.20))
                .frame(width: 280, height: 280)
                .blur(radius: 95)
                .offset(x: -145, y: 120)

            Circle()
                .fill(.blue.opacity(0.12))
                .frame(width: 250, height: 250)
                .blur(radius: 90)
                .offset(x: 155, y: 380)
        }
        .ignoresSafeArea()
    }
}

#Preview
{
    ContentView()
}
