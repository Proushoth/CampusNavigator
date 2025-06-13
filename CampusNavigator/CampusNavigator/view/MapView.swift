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

    // Static list of buildings
    private let buildings: [Building] = [
        Building(name: "Library", x: 220, y: 200, width: 60, height: 60),
        Building(name: "Lecture Hall", x: 500, y: 230, width: 60, height: 60),
        Building(name: "Study Hall", x: 150, y: 400, width: 60, height: 60),
        Building(name: "Auditorium", x: 230, y: 700, width: 60, height: 60),
        Building(name: "Admin Office", x: 440, y: 550, width: 60, height: 60),
        Building(name: "Student Center", x: 700, y: 400, width: 60, height: 60)
    ]

    // Complete distances between all buildings
    private let distances: [String: Double] = [
        // Library connections
        "Library-Lecture Hall": 120,
        "Library-Study Hall": 90,
        "Library-Auditorium": 170,
        "Library-Admin Office": 150,
        "Library-Student Center": 180,
        
        // Lecture Hall connections
        "Lecture Hall-Study Hall": 140,
        "Lecture Hall-Auditorium": 80,
        "Lecture Hall-Admin Office": 90,
        "Lecture Hall-Student Center": 200,
        
        // Study Hall connections
        "Study Hall-Auditorium": 110,
        "Study Hall-Admin Office": 130,
        "Study Hall-Student Center": 160,
        
        // Auditorium connections
        "Auditorium-Admin Office": 60,
        "Auditorium-Student Center": 190,
        
        // Admin Office connections
        "Admin Office-Student Center": 150
    ]

    var body: some View {
        VStack(spacing: 0) {
            // Header and input fields in a compact group
            VStack(spacing: 16) {
                // Header
                HStack {
                    HStack(spacing: 0) {
                        Text("Campus")
                            .font(.system(size: 28, weight: .heavy))
                            .foregroundColor(.red)
                        Text("Navigator")
                            .font(.system(size: 28, weight: .heavy))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Notification action
                    }) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .padding(8)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .offset(y: -40)
                
                // Input fields
                VStack(spacing: 12) {
                    LocationInputField(icon: "location.fill", text: $startText, placeholder: "Start Location")
                    
                    LocationInputField(icon: "flag.fill", text: $destinationText, placeholder: "Destination")
                    
                    // Always show the distance view, but make it transparent when empty
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(distanceText.isEmpty ? .clear : .blue)
                        Text(distanceText.isEmpty ? " " : "Distance: \(distanceText) meters")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(distanceText.isEmpty ? .clear : .blue)
                    }
                    .padding(8)
                    .background(distanceText.isEmpty ? Color.clear : Color.blue.opacity(0.1))
                    .cornerRadius(8)
                    .frame(height: 20) // Maintain consistent height
                }
                .padding(.horizontal, 20)
                .offset(y: -20)
            }
            .padding(.bottom, 16)
            .background(Color(.systemBackground))
            .zIndex(1)
            
            // Map View
            ScrollView([.horizontal, .vertical]) {
                ZStack {
                    Image("CampusMap")
                        .resizable()
                        .frame(width: 800, height: 800)
                    
                    ForEach(buildings) { building in
                        let buildingColor = determineBuildingColor(building: building)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(buildingColor.fill)
                            .frame(width: building.width, height: building.height)
                            .position(x: building.x, y: building.y)
                            .onTapGesture {
                                handleTap(on: building)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(buildingColor.border, lineWidth: 3)
                            )
                            .overlay(
                                Text(building.name)
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(4)
                                    .offset(y: building.height/2 + 12)
                            )
                    }
                }
                .frame(width: 800, height: 800)
            }
            .frame(height: 450)
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    private func determineBuildingColor(building: Building) -> (fill: Color, border: Color) {
        if building == startBuilding {
            return (Color.green.opacity(0.3), Color.green)
        } else if building == endBuilding {
            return (Color.red.opacity(0.3), Color.red)
        } else {
            return (Color.blue.opacity(0.3), Color.clear)
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

struct LocationInputField: View {
    let icon: String
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 20)
            TextField(placeholder, text: $text)
                .font(.system(size: 16, weight: .medium))
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CampusMapView()
}
