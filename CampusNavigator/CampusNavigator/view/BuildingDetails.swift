//
//  BuildingDetails.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-13.
//

import SwiftUI

struct BuildingDetails: View {
    let building: Building
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Picker("", selection: $selectedTab) {
                Text("Details").tag(0)
                Text("Halls").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.top)
            
            TabView(selection: $selectedTab) {
                BuildingDetailsView(building: building)
                    .tag(0)
                
                LectureHallsView(building: building)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .navigationBarHidden(true)
    }
}
struct BuildingDetailsView: View {
    let building: Building
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue.opacity(0.1))
                        .frame(height: 150)
                        .cornerRadius(10)
                    
                    Image(systemName: "building.columns.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue.opacity(0.3))
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Building Information")
                        .font(.headline)
                    
                    DetailRow(icon: "clock", text: "Open Hours: 8:00 AM - 10:00 PM")
                    DetailRow(icon: "phone", text: "Contact: +1 (123) 456-7890")
                    DetailRow(icon: "person.2.fill", text: "Total Capacity: 500 people")
                    DetailRow(icon: "location.fill", text: "Coordinates: X: \(Int(building.x)), Y: \(Int(building.y))")
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical)
                
                Text("Description")
                    .font(.headline)
                    .padding(.horizontal)
                
                Text("The \(building.name) is one of the main buildings on campus. It features modern facilities and hosts various academic departments. The building has multiple lecture halls, study spaces, and faculty offices.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}
struct LectureHallsView: View {
    let building: Building
    
    let halls: [(name: String, detail: String, floor: String, equipment: String, status: String, directions: [String])] = [
        ("Hall 101", "Capacity: 120", "Floor 1", "Projector, Whiteboard", "Available", [
            "Enter through the main doors of the building",
            "Take the central staircase to the first floor",
            "Turn left at the top of the stairs",
            "Walk past the study area",
            "Hall 101 will be on your right"
        ]),
        ("Hall 201", "Capacity: 80", "Floor 2", "Projector, Sound System", "In Use", [
            "Enter through the east entrance",
            "Take the elevator to the second floor",
            "Exit elevator and turn right",
            "Walk down the corridor",
            "Hall 201 is the second door on your left"
        ]),
        ("Hall 202", "Capacity: 60", "Floor 2", "Whiteboard", "Available", [
            "Enter through the main lobby",
            "Take the stairs to the second floor",
            "Turn right at the landing",
            "Hall 202 is at the end of the hallway"
        ]),
        ("Hall 301", "Capacity: 150", "Floor 3", "Projector, Sound System, Video Conferencing", "Maintenance", [
            "Use the north entrance",
            "Take the elevator to the third floor",
            "Exit and turn left",
            "Walk past the faculty offices",
            "Hall 301 is the large room at the end"
        ])
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(halls, id: \.name) { hall in
                    NavigationLink(destination: Hall(
                        hallName: hall.name,
                        building: building,
                        directions: hall.directions
                    )) {
                        HallRow(
                            title: hall.name,
                            subtitle: "\(hall.detail) • \(hall.floor)",
                            detail: hall.equipment,
                            status: hall.status
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                }
            }
            .padding(.top, 8)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitle("Lecture Halls", displayMode: .inline)
    }
}

struct LectureHallCard: View {
    let name: String
    let detail: String
    let floor: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(detail)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(floor)
                .font(.caption)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.blue)
                .cornerRadius(4)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct DetailRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(.blue)
            Text(text)
            Spacer()
        }
    }
}

