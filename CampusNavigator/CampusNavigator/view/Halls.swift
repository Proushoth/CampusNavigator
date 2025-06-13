//
//  Halls.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/12/25.
//

import SwiftUI

struct Halls: View {
    
    @State private var selectedSegment = "All"
    let segments = ["Lecture", "Offices", "Events"]
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                // Top Navbar
                HomeNavBar()
                
                // Search Bar
                SearchBar()
                
                
                VStack {
                    
                    Picker("View", selection: $selectedSegment) {
                        ForEach(segments, id: \.self) { view in
                            Text(view)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    if selectedSegment == "Lecture"{
                        
                        ScrollView{
                            InfoCardView1(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                        }
                    }
                    
                    else if selectedSegment == "Offices"{
                        
                        ScrollView
                            
                            {
                                InfoCardView1(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                
                                InfoCardView(
                                    icon: "house.fill",
                                    iconBackground: .green,
                                    title: "Library Quiet Zones",
                                    subtitle: "Moderate occupancy · Level 2 available"
                                )
                                
                            
                            
                        }
                    }
                    
                    else if selectedSegment == "Events"{
                        
                        ScrollView{
                            InfoCardView1(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                            InfoCardView(
                                icon: "house.fill",
                                iconBackground: .green,
                                title: "Library Quiet Zones",
                                subtitle: "Moderate occupancy · Level 2 available"
                            )
                            
                        }
                    }
                    
                }
            }
        }
            
        
        .padding(.top)
    }
}

struct InfoCardView1: View {
    var icon: String
    var iconBackground: Color
    var title: String
    var subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(iconBackground)
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.brown)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    Halls()
}

struct SearchBar: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search halls...", text: $search)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct AllView: View {
    var body: some View {

      
            VStack(spacing: 16) {
                InfoCardView(
                    icon: "house.fill",
                    iconBackground: .green,
                    title: "Library Quiet Zones",
                    subtitle: "Moderate occupancy · Level 2 available"
                )
                
                InfoCardView(
                    icon: "person.2.fill",
                    iconBackground: .orange,
                    title: "Student Cafeteria",
                    subtitle: "Busy · Wait time ~15 min"
                )
                
                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
                
                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
                
                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
                
                InfoCardView(
                    icon: "calendar",
                    iconBackground: .purple,
                    title: "Freshers Mixer",
                    subtitle: "Tonight at 5 PM · Student Center"
                )
                
                
            }
            .padding(.horizontal)
        
        }
    }


