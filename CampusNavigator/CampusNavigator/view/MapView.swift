import SwiftUI

struct Building: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let x: CGFloat
    let y: CGFloat
    let width: CGFloat
    let height: CGFloat
}

struct CampusMapView: View {
    @State private var startBuilding: Building?
    @State private var endBuilding: Building?
    @State private var startText: String = ""
    @State private var destinationText: String = ""
    @State private var distanceText: String = ""

    // Static list of buildings and distances
    private let buildings: [Building] = [
        Building(name: "Library", x: 110, y: 76, width: 60, height: 60),
        Building(name: "Lecture Hall", x: 260, y: 56, width: 60, height: 60),
        Building(name: "Study Hall", x: 115, y: 64, width: 60, height: 60),
        Building(name: "Auditorium", x: 320, y: 54, width: 60, height: 60),
        Building(name: "Admin Office", x: 40, y: 34, width: 60, height: 60),
        Building(name: "Student Center", x: 50, y: 43, width: 60, height: 60)
    ]

    // Static distances between buildings
    private let distances: [String: Double] = [
        "Library-Lecture Hall": 120,
        "Lecture Hall-Study Hall": 140,
        "Study Hall-Auditorium": 110,
        "Library-Auditorium": 170,
        "Lecture Hall-Auditorium": 80,
        "Auditorium-Admin Office": 60,
        "Lecture Hall-Admin Office": 90,
        "Admin Office-Student Center": 150,
        "Student Center-Library": 180
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                HStack {
                    Text("Campus")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.red)
                    Text("Navigator")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "notifications"))
                    .onTapGesture {
                        // Notification tap
                    }
            }
            .padding(.horizontal)
            .padding(.top, 12)

            // Input fields
            VStack(spacing: 12) {
                TextField("Start Location", text: $startText)
                    .textFieldStyle(EnhancedTextFieldStyle())
                    .disabled(true)

                TextField("Destination", text: $destinationText)
                    .textFieldStyle(EnhancedTextFieldStyle())
                    .disabled(true)

                if !distanceText.isEmpty {
                    Text("Distance: \(distanceText) meters")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            // Map View
            ScrollView([.horizontal, .vertical]) {
                ZStack {
                    Image("CampusMap")
                        .resizable()
                        .frame(width: 800, height: 800)

                    ForEach(buildings) { building in
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: building.width, height: building.height)
                            .position(x: building.x, y: building.y)
                            .onTapGesture {
                                handleTap(on: building)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke((building == startBuilding || building == endBuilding) ? Color.yellow : Color.clear, lineWidth: 2)
                            )
                    }
                }
                .frame(width: 800, height: 800)
            }
            .frame(height: 450)
            .padding(.top, 30)

            // Bottom dock
            ContentView()
        }
    }

    private func handleTap(on building: Building) {
        if startBuilding == nil {
            startBuilding = building
            startText = building.name
            endBuilding = nil
            destinationText = ""
            distanceText = ""
        } else if endBuilding == nil && building != startBuilding {
            endBuilding = building
            destinationText = building.name
            distanceText = computeDistance(from: startBuilding!, to: endBuilding!)
        } else {
            // Reset if tapped again
            startBuilding = nil
            endBuilding = nil
            startText = ""
            destinationText = ""
            distanceText = ""
        }
    }

    private func computeDistance(from: Building, to: Building) -> String {
        let key1 = "\(from.name)-\(to.name)"
        let key2 = "\(to.name)-\(from.name)"
        if let distance = distances[key1] ?? distances[key2] {
            return String(format: "%.2f", distance)
        } else {
            return "N/A"
        }
    }
}

struct EnhancedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .font(.system(size: 16, weight: .medium))
    }
}

#Preview {
    CampusMapView()
}
