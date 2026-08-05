import SwiftUI

struct ContentView: View {
   @State var temperature: String = ""
   @State var windspeed: String = ""

    @State private var orbScale: CGFloat = 1.0
    @State private var orbOpacity: Double = 0.55
    @State private var dotOpacity: Double = 0.4

    var body: some View {
        ZStack {
            // Background
            RadialGradient(
                colors: [
                    Color(red: 0.055, green: 0.122, blue: 0.290),
                    Color(red: 0.024, green: 0.051, blue: 0.122),
                    Color.black
                ],
                center: UnitPoint(x: 0.6, y: 0.4),
                startRadius: 0,
                endRadius: 600
            )
            .ignoresSafeArea()

            // Stars
            StarFieldView()
                .ignoresSafeArea()

            // Aurora layer
            VStack {
                Spacer()
                LinearGradient(
                    colors: [
                        Color.clear,
                        Color(red: 0.12, green: 0.24, blue: 0.55).opacity(0.25),
                        Color(red: 0.24, green: 0.08, blue: 0.47).opacity(0.35)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 450)
            }
            .ignoresSafeArea()

            // Central orb glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 0.31, green: 0.51, blue: 1.0).opacity(0.14),
                            Color(red: 0.39, green: 0.24, blue: 0.86).opacity(0.08),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 170
                    )
                )
                .frame(width: 340, height: 340)
                .scaleEffect(orbScale)
                .opacity(orbOpacity)
                .onAppear {
                    withAnimation(
                        .easeInOut(duration: 8).repeatForever(autoreverses: true)
                    ) {
                        orbScale = 1.08
                        orbOpacity = 0.85
                    }
                }

            // Content
            VStack(spacing: 0) {

                Spacer()

                // City name
                Text("LAHORE")
                    .font(.system(size: 14, weight: .medium))
                    .kerning(4.0)
                    .foregroundColor(.white.opacity(0.55))

                // Dot separator
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 3, height: 3)
                    .padding(.top, 10)
                    .padding(.bottom, 48)

                // Temperature
                HStack(alignment: .top, spacing: 4) {
                    Text("\(temperature)")
                        .font(.system(size: 150, weight: .ultraLight))
                        .kerning(-8)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0.47, green: 0.67, blue: 1.0).opacity(0.35), radius: 40)

                    Text("°C")
                        .font(.system(size: 40, weight: .ultraLight))
                        .foregroundColor(.white.opacity(0.35))
                        .padding(.top, 22)
                        .padding(.leading, 4)
                }
                .padding(.bottom, 56)

                // Divider with glowing dot
                HStack(spacing: 12) {
                    LinearGradient(
                        colors: [.clear, .white.opacity(0.18)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 48, height: 1)

                    Circle()
                        .fill(Color(red: 0.47, green: 0.63, blue: 1.0))
                        .frame(width: 4, height: 4)
                        .shadow(color: Color(red: 0.47, green: 0.63, blue: 1.0), radius: 6)
                        .opacity(dotOpacity)
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 4).repeatForever(autoreverses: true)
                            ) {
                                dotOpacity = 1.0
                            }
                        }

                    LinearGradient(
                        colors: [.white.opacity(0.18), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 48, height: 1)
                }
                .padding(.bottom, 52)

                // Wind speed
                VStack(spacing: 10) {
                    Image(systemName: "wind")
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(.white.opacity(0.4))

                    Text("WIND SPEED")
                        .font(.system(size: 10, weight: .semibold))
                        .kerning(3.0)
                        .foregroundColor(.white.opacity(0.3))

                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text("\(windspeed)")
                            .bold()
                            .font(.system(size: 56, weight: .ultraLight))
                            .kerning(-2)
                            .foregroundColor(.white.opacity(0.88))
                            .shadow(
                                color: Color(red: 0.55, green: 0.71, blue: 1.0).opacity(0.3),
                                radius: 20
                            )

                        Text("km/h")
                            .font(.system(size: 14, weight: .regular))
                            .kerning(0.8)
                            .foregroundColor(.white.opacity(0.3))
                            .padding(.bottom, 10)
                    }
                }

                Spacer()
                Button (action: {
                    Task
                    {
                        let result = await loadWether()
                        temperature = result.temperature
                        windspeed = result.windspeed
                    }
                })
                {
                    Text ("Load Data")
                }
                .padding()
                .glassEffect()
            }
        }
    }
}

// MARK: - Star Field

struct StarFieldView: View {
    struct Star: Identifiable {
        let id = UUID()
        let x: CGFloat
        let y: CGFloat
        let radius: CGFloat
        let opacity: Double
    }

    let stars: [Star] = (0..<60).map { _ in
        Star(
            x: CGFloat.random(in: 0...393),
            y: CGFloat.random(in: 0...600),
            radius: CGFloat.random(in: 0.2...1.4),
            opacity: Double.random(in: 0.1...0.7)
        )
    }

    var body: some View {
        Canvas { context, _ in
            for star in stars {
                let rect = CGRect(
                    x: star.x - star.radius,
                    y: star.y - star.radius,
                    width: star.radius * 2,
                    height: star.radius * 2
                )
                context.fill(
                    Path(ellipseIn: rect),
                    with: .color(.white.opacity(star.opacity))
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
