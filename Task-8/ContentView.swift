import SwiftUI

struct car: Identifiable
{
    let id = UUID()
    let name: String
    let price: Int
    let description: String
    let availableColor: [String]
    let registrationTax: Int
}
struct ContentView: View
{
    @State private var selectedCarForDetail: car? = nil
    @State var name = "Munhib"
    @State var wallet = 700000
    let cars = [
        car (name: "Rolls Royce Phantom 8", price: 520000, description: "The pinnacle of automotive luxury and bespoke craftsmanship. Engineered for those who command the world, the Phantom VIII offers an unparalleled 'magic carpet ride' experience, powered by a whisper quiet V12 engine and wrapped in the finest hand stitched leather.", availableColor: ["Sapphire Black", "Arctic White", "English White", "Belladonna Purple"], registrationTax: 45000),
        car (name: "Mercedes S Class", price: 125000, description: "The undisputed benchmark of executive luxury and cutting edge technology. The S Class combines timeless elegance with industry defining safety features, a serene cabin atmosphere, and an intelligent ambient lighting system tailored for ultimate comfort.", availableColor: ["Obsidian Black", "Diamond White", "Selenite Grey", "Nautical Blue"], registrationTax: 12000),
        car (name: "Defender 130", price: 90000, description: "The ultimate expression of rugged luxury and limitless exploration. With extended space for up to eight passengers, advanced all-terrain capability, and a premium durable interior, the Defender 130 is built to conquer the toughest landscapes in absolute style.", availableColor: ["Sedona Red", "Carpathian Grey", "Fuji White", "Tasman Blue"], registrationTax: 8500),
        car (name: "BMW M8 Competition", price: 140000, description: "An elite grand tourer that seamlessly blends raw racetrack performance with elite sophistication. Driven by a fierce twin turbo V8, the M8 offers breathtaking speed, precise handling, and a driver focused cockpit dripping in carbon fiber and premium luxury.", availableColor: ["Motegi Red", "Marina Bay Blue", "Brands Hatch Grey", "Black Sapphire"], registrationTax: 14000),
        car (name: "BMW M5 Competition", price: 115000, description: "The wolf in a tailored suit. The M5 Competition is a legendary high performance executive sedan, delivering supercar crushing V8 power alongside everyday practicality, elite business class comfort, and an aggressive track-ready stance.", availableColor: ["Snapper Rocks Blue", "Donington Grey", "Alpine White", "Alvit Grey"], registrationTax: 11000),
        car (name: "Audi A5", price: 48000, description: "A masterclass in modern, minimalist aesthetics and German engineering. This sportback offers a sleek sloping silhouette, a highly responsive yet efficient TFSI engine, and Audi’s iconic Virtual Cockpit for a seamless, tech forward daily drive.", availableColor: ["Tango Red", "Mythos Black", "Ibis White", "Navarra Blue"], registrationTax: 4500),
        car (name: "Honda Civic", price: 25000, description: "A contemporary icon of urban style, dynamic performance, and exceptional reliability. Featuring an aggressive fastback design, a punchy turbocharged engine, and a spacious, driver centric cabin that redefines the premium compact sedan experience.", availableColor: ["Rallye Red", "Crystal Black", "Taffeta White", "Lunar Silver"], registrationTax: 2000)
    ]
    var body: some View
    {
        NavigationStack
        {
            ZStack (alignment: .top)
            {
                Color.black
                    .ignoresSafeArea()
                
                    VStack(spacing: 0)
                    {
                        ZStack(alignment: .bottomLeading)
                        {
                            Image("rollsroyce")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 380)
                                .clipped()
                            
                            VStack(alignment: .leading, spacing: 12)
                            {
                                Text("D I N O")
                                    .foregroundColor(.white)
                                    .font(.system(size: 44, weight: .semibold, design: .serif))
                                    .tracking(6)
                                Text("Where automotive heritage\nmeets modern luxury.")
                                    .font(.custom("Snell Roundhand", size: 22))
                                    .italic()
                                    .foregroundColor(.white.opacity(0.8))
                                    .lineSpacing(4)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 28)
                            .padding(.bottom, 35)
                        }
                    ScrollView(.vertical, showsIndicators: false)
                        {
                            VStack(alignment: .leading, spacing: 0)
                            {
                                Text("OUR COLLECTION")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white.opacity(0.4))
                                    .tracking(1.5)
                                    .padding(.horizontal, 24)
                                    .padding(.top, 30)
                                    .padding(.bottom, 16)
                                
                                ForEach(Array(cars.enumerated()), id: \.element.id)
                                { index, car in
                                    NavigationLink(destination: CarDetails(selectedCar: car, userName: name, budget: $wallet))
                                    {
                                        VStack(spacing: 0)
                                        {
                                            HStack(spacing: 16)
                                            {
                                                Image(car.name)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 75, height: 50)
                                                    .background(Color.white.opacity(0.05))
                                                    .cornerRadius(12)
                                                    .clipped()
                                                VStack(alignment: .leading, spacing: 4)
                                                {
                                                    Text(car.name)
                                                        .font(.system(size: 15, weight: .medium))
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.leading)
                                                    Text("2026 · Premium Luxury")
                                                        .font(.system(size: 12))
                                                        .foregroundColor(.gray.opacity(0.8))
                                                }
                                                Spacer()
                                                Text("$\(car.price)")
                                                    .font(.system(size: 15, weight: .semibold))
                                                    .foregroundColor(Color(red: 0.22, green: 0.75, blue: 0.40))
                                                Image(systemName: "chevron.right")
                                                    .font(.system(size: 11, weight: .semibold))
                                                    .foregroundColor(.white.opacity(0.4))
                                            }
                                            .padding(.vertical, 14)
                                            .padding(.horizontal, 24)
                                            
                                            if index < cars.count - 1
                                            {
                                                Divider()
                                                    .background(Color.white.opacity(0.08))
                                                    .padding(.leading, 115)
                                                    .padding(.trailing, 24)
                                            }
                                        }
                                    }
                                }
                                Color.clear.frame(height: 100)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .background(Color(white: 0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                        .offset(y: -20)
                    }
                .ignoresSafeArea(edges: .top)
                
                HStack(spacing: 7)
                {
                    HStack(spacing: 12)
                    {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                            .padding(8)
                            .glassEffect(
                                .clear
                                    .tint(.white.opacity(0.01))
                                    .interactive(),
                                in: .circle
                            )
                        
                        Text(name)
                            .bold()
                            .foregroundStyle(.white)
                    }


                    Spacer()

                    Label {
                        Text("$\(wallet)")
                            .bold()
                    } icon: {
                        Image(systemName: "wallet.pass.fill")
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .glassEffect(
                        .clear
                            .tint(.white.opacity(0.01))
                            .interactive(),
                        in: .rect(cornerRadius: 18)
                    )

                }
                .padding()
                .offset(y: -20)
            }
        }
    }
            
    struct CarDetails: View
    {
        @State var bookAlert = false
        @State private var showConfirmAlert = false
        @State private var showSuccessAlert = false
        let selectedCar: car
        let userName: String
        @Binding var budget: Int
        var body: some View
        {
            ZStack
            {
                GeometryReader
                { geometry in
                    Image (selectedCar.name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }.ignoresSafeArea()
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                
                VStack
                {
                    Text ("Car Specifications")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .bold()
                        .padding()
                    Divider()
                        .background(Color.white.opacity(0.3))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                    
                    VStack(spacing: 10)
                    {
                        Text(selectedCar.name)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("$\(selectedCar.price)")
                            .foregroundColor(.white.opacity(0.8))
                            .foregroundColor(.mint)
                            .bold()
                        
                        Text(selectedCar.description)
                            .font(.body)
                            .foregroundColor(.gray.opacity(0.9))
                            .bold()
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.white.opacity(0.3), .black.opacity(0.02)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .blendMode(.plusLighter)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(
                                        LinearGradient(
                                            colors: [.white.opacity(0.03), .white.opacity(0.05), .clear],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 0.3
                                    )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    HStack (spacing: 50)
                    {
                        Button
                        {
                            if budget >= selectedCar.price
                            {
                                showConfirmAlert = true
                            }
                        } label:
                        {
                            Text("Purchase")
                                .foregroundColor(.green)
                                .bold()
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                        }
                        .glassEffect(
                            .regular
                                .tint(.green.opacity(0.4))
                                .interactive(),
                            in: .capsule
                        )
                        .shadow(color: .green.opacity(0.3), radius: 15, x: 0, y: 0)
                        .alert("Confirm Purchase", isPresented: $showConfirmAlert)
                        {
                            Button("Cancel", role: .cancel) {}
                            Button("Yes")
                            {
                                budget -= selectedCar.price
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)
                                {
                                    showSuccessAlert = true
                                }
                            }
                        } message:
                        {
                            Text("Are you sure you want to buy \(selectedCar.name) for $\(selectedCar.price)?")
                        }
                        .alert("Congratulations!", isPresented: $showSuccessAlert)
                        {
                            Button("OK") { }
                        } message: {
                            Text("\(userName), you have successfully purchased the \(selectedCar.name)")
                        }
                        
                        Button
                        {
                            bookAlert = true
                        } label:
                        {
                            Text("Book")
                                .foregroundColor(.red)
                                .bold()
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                        }
                        .glassEffect(
                            .regular
                                .tint(.red.opacity(0.4))
                                .interactive(),
                            in: .capsule
                        )
                        .shadow(color: .red.opacity(0.3), radius: 15, x: 0, y: 0)
                    }
                    .padding(.horizontal, 50)
                    .alert("Booking Successful!", isPresented: $bookAlert)
                    {
                        Button("OK") { }
                    } message:
                    {
                        Text("Dear \(userName), Your test drive for \(selectedCar.name) has been requested.")
                    }
                }
            }
        }
    }
}
#Preview
{
    ContentView()
}
