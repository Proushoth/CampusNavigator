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
            // Segmented control for tabs
            Picker("", selection: $selectedTab) {
                Text("Details").tag(0)
                Text("Halls").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.top)
            
            // Tab content
            TabView(selection: $selectedTab) {
                BuildingDetailsView(building: building)
                    .tag(0)
                
                LectureHallsView(building: building)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .navigationTitle(building.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BuildingDetailsView: View {
    let building: Building
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Building image placeholder
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
                
                // Building information
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
    
    let halls = [
        ("Hall 101", "Capacity: 120", "Floor 1", "Projector, Whiteboard", "Available"),
        ("Hall 201", "Capacity: 80", "Floor 2", "Projector, Sound System", "In Use"),
        ("Hall 202", "Capacity: 60", "Floor 2", "Whiteboard", "Available"),
        ("Hall 301", "Capacity: 150", "Floor 3", "Projector, Sound System, Video Conferencing", "Maintenance")
    ]
    
    var body: some View {
        List {
            ForEach(halls, id: \.0) { hall in
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(hall.0)
                            .font(.headline)
                        Spacer()
                        Text(hall.3)
                            .font(.caption)
                            .foregroundColor(hall.4 == "Available" ? .green : (hall.4 == "In Use" ? .orange : .red))
                    }
                    
                    Text("\(hall.1) • \(hall.2)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(hall.3)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
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
