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
            // Toggle between Details and Halls
            Picker(selection: $selectedTab, label: Text("")) {
                Text("Details").tag(0)
                Text("Halls").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Content based on selection
            if selectedTab == 0 {
                BuildingDetailsView(building: building)
            } else {
                LectureHallsView(building: building)
            }
            
            Spacer()
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
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .cornerRadius(12)
                    .overlay(
                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                    )
                
                // Building information
                Text("About \(building.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                // Additional details
                VStack(alignment: .leading, spacing: 8) {
                    DetailRow(icon: "clock", text: "Open 8:00 AM - 10:00 PM")
                    DetailRow(icon: "phone", text: "+1 (123) 456-7890")
                    DetailRow(icon: "person.2", text: "Capacity: 500 people")
                }
                .padding(.top, 8)
            }
            .padding()
        }
    }
}

struct LectureHallsView: View {
    let building: Building
    
    // Sample lecture halls data
    let halls = [
        ("Hall 101", "Capacity: 120", "Floor 1"),
        ("Hall 201", "Capacity: 80", "Floor 2"),
        ("Hall 202", "Capacity: 60", "Floor 2"),
        ("Hall 301", "Capacity: 150", "Floor 3")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(halls, id: \.0) { hall in
                    LectureHallCard(name: hall.0, detail: hall.1, floor: hall.2)
                }
            }
            .padding()
        }
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
