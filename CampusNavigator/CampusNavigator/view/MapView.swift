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
    @State private var showNavigationView: Bool = false
    @State private var showBuildingPopup: Bool = false
    @State private var selectedBuildingForPopup: Building? = nil
    @State private var navigateToBuildingDetails: Bool = false
    
    private let buildings: [Building] = [
        Building(name: "Library", x: 220, y: 200, width: 60, height: 60),
        Building(name: "Lecture Hall", x: 500, y: 230, width: 60, height: 60),
        Building(name: "Study Hall", x: 150, y: 400, width: 60, height: 60),
        Building(name: "Auditorium", x: 230, y: 700, width: 60, height: 60),
        Building(name: "Admin Office", x: 440, y: 550, width: 60, height: 60),
        Building(name: "Student Center", x: 700, y: 400, width: 60, height: 60)
    ]

    private let distances: [String: Double] = [
        "Library-Lecture Hall": 120,
        "Library-Study Hall": 90,
        "Library-Auditorium": 170,
        "Library-Admin Office": 150,
        "Library-Student Center": 180,
        
        "Lecture Hall-Study Hall": 140,
        "Lecture Hall-Auditorium": 80,
        "Lecture Hall-Admin Office": 90,
        "Lecture Hall-Student Center": 200,
        
        "Study Hall-Auditorium": 110,
        "Study Hall-Admin Office": 130,
        "Study Hall-Student Center": 160,
        
        "Auditorium-Admin Office": 60,
        "Auditorium-Student Center": 190,
        
        "Admin Office-Student Center": 150
    ]
    
    private let directions: [String: [String]] = [
        "Library-Lecture Hall": [
            "Head northeast from Library main entrance",
            "Walk straight for 50 meters along the main path",
            "Turn right at the fountain",
            "Continue for 70 meters to reach Lecture Hall"
        ],
        "Library-Study Hall": [
            "Exit Library through west entrance",
            "Walk straight for 90 meters",
            "Study Hall will be on your left"
        ],
        "Library-Auditorium": [
            "Head south from Library",
            "Take the pedestrian bridge",
            "After bridge, turn left",
            "Walk 100 meters to reach Auditorium"
        ],
        "Library-Admin Office": [
            "Exit Library through east entrance",
            "Walk diagonally across the quad",
            "Turn right after the statue",
            "Admin Office is the second building on your left"
        ],
        "Library-Student Center": [
            "Head northeast from Library",
            "Follow the main path for 100 meters",
            "Turn left at the intersection",
            "Student Center is at the end of the path"
        ],
        "Lecture Hall-Study Hall": [
            "Exit Lecture Hall through west entrance",
            "Cross the courtyard",
            "Follow the path around the garden",
            "Study Hall is straight ahead"
        ],
        "Lecture Hall-Auditorium": [
            "Head south from Lecture Hall",
            "Take the stairs down to lower campus",
            "Auditorium is directly ahead"
        ],
        "Lecture Hall-Admin Office": [
            "Exit Lecture Hall through east entrance",
            "Walk straight for 50 meters",
            "Turn right at the crossroads",
            "Admin Office is on your left"
        ],
        "Lecture Hall-Student Center": [
            "Head west from Lecture Hall",
            "Follow the path around the lake",
            "Student Center is the large building at the end"
        ],
        "Study Hall-Auditorium": [
            "Exit Study Hall through south entrance",
            "Walk down the hill",
            "Cross the small bridge",
            "Auditorium is straight ahead"
        ],
        "Study Hall-Admin Office": [
            "Head east from Study Hall",
            "Walk through the academic quad",
            "Admin Office is the third building on your right"
        ],
        "Study Hall-Student Center": [
            "Exit Study Hall through north entrance",
            "Walk uphill for 50 meters",
            "Turn right at the top",
            "Student Center is visible ahead"
        ],
        "Auditorium-Admin Office": [
            "Exit Auditorium through north entrance",
            "Walk straight for 60 meters",
            "Admin Office is on your right"
        ],
        "Auditorium-Student Center": [
            "Head northwest from Auditorium",
            "Take the path through the gardens",
            "Student Center is at the top of the hill"
        ],
        "Admin Office-Student Center": [
            "Exit Admin Office through west entrance",
            "Walk straight along the main path",
            "Student Center is at the end of the path"
        ]
    ]

    var body: some View {
        NavigationView {
            Group {
                if showNavigationView {
                    NavigationContentView
                } else {
                    MainView
                }
            }
            .overlay(
                Group {
                    if showBuildingPopup, let building = selectedBuildingForPopup {
                        BuildingPopupView(building: building) {
                            showBuildingPopup = false
                            navigateToBuildingDetails = true
                        }
                        .position(x: UIScreen.main.bounds.width/2,
                                 y: UIScreen.main.bounds.height/2)
                    }
                }
            )
            .background(
                NavigationLink(
                    destination: BuildingDetails(building: selectedBuildingForPopup ?? buildings[0]),
                    isActive: $navigateToBuildingDetails,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
    }
    
    private var MainView: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                HStack {
                    HomeNavBar()
                        .offset(y:-90)
                        .padding(.top, 50)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                VStack(spacing: 12) {
                    LocationInputField(icon: "location.fill", text: $startText, placeholder: "Start Location")
                    
                    LocationInputField(icon: "flag.fill", text: $destinationText, placeholder: "Destination")
                }
                .padding(.horizontal, 20)
                .offset(y:-90)
            }
            .padding(.bottom, 16)
            .background(Color(.systemBackground))
            
            ZStack {
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
                                .onLongPressGesture(minimumDuration: 0.5) {
                                    selectedBuildingForPopup = building
                                    showBuildingPopup = true
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
                .frame(height: 400)
                .offset(y:-50)
            }
            
            VStack(spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.black)
                    Text("Distance: \(distanceText) meters")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                .padding(.top, 10)
                .opacity(startBuilding != nil && endBuilding != nil ? 1 : 0)
                .animation(.easeInOut, value: startBuilding)
                .animation(.easeInOut, value: endBuilding)
                
                Button(action: {
                    withAnimation {
                        showNavigationView = true
                    }
                }) {
                    HStack {
                        Text("Navigate")
                        Image(systemName: "arrow.right")
                    }
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(Color.black)
                    .cornerRadius(24)
                    .shadow(radius: 3)
                }
                .padding(.bottom, 20)
                .opacity(startBuilding != nil && endBuilding != nil ? 1 : 0)
                .animation(.easeInOut, value: startBuilding)
                .animation(.easeInOut, value: endBuilding)
            }
            .frame(maxWidth: .infinity)
            .offset(y:-35)
            .background(Color(.systemBackground))}}
    
    private var NavigationContentView: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        withAnimation {
                            showNavigationView = false
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.systemBackground))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(startBuilding?.name ?? "") to \(endBuilding?.name ?? "")")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("\(distanceText) meters • Walking")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer().frame(width: 40)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                
                Divider()
            }
            .background(Color(.systemBackground))
            
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
            .frame(maxHeight: .infinity)
            
            DirectionsPanel(
                start: startBuilding?.name ?? "",
                destination: endBuilding?.name ?? "",
                distance: distanceText,
                directions: getDirections()
            )
            .frame(height: UIScreen.main.bounds.height * 0.35)
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.bottom)
        .transition(.move(edge: .trailing))
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
    
    private func getDirections() -> [String] {
        guard let start = startBuilding, let end = endBuilding else { return [] }
        let key1 = "\(start.name)-\(end.name)"
        let key2 = "\(end.name)-\(start.name)"
        return directions[key1] ?? directions[key2] ?? ["No directions available for this route"]
    }
}

struct BuildingPopupView: View {
    let building: Building
    let onFindPressed: () -> Void
    
    let halls = [
        ("Hall 101", "Capacity: 120"),
        ("Hall 201", "Capacity: 80"),
        ("Hall 202", "Capacity: 60")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(building.name)
                .font(.headline)
                .fontWeight(.bold)
            
            Divider()
            
            Text("Available Halls:")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(halls, id: \.0) { hall in
                HStack {
                    Image(systemName: "door.left.hand.open")
                    VStack(alignment: .leading) {
                        Text(hall.0)
                        Text(hall.1)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Spacer()
            
            Button(action: onFindPressed) {
                Text("Find")
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(16)
        .frame(width: 280, height: 280)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
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

struct DirectionsPanel: View {
    let start: String
    let destination: String
    let distance: String
    let directions: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Route")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(start) → \(destination)")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Distance")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(distance) meters")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(directions, id: \.self) { direction in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "arrow.turn.up.right")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.blue)
                                .frame(width: 24, height: 24)
                                .background(Circle().fill(Color.blue.opacity(0.2)))
                            
                            Text(direction)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        if direction != directions.last {
                            Divider()
                                .padding(.leading, 44)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    CampusMapView()
}
