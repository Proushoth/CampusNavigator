//
//  Hall.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-13.
//

import SwiftUI

struct Hall: View {
    let hallName: String
    let building: Building
    let directions: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            HomeNavBar()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Header with image
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(height: 220)
                            .overlay(
                                Image(systemName: "door.left.hand.open")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.blue.opacity(0.5)))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                            .overlay(
                                Image(systemName: "number.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.blue)
                            )
                            .offset(y: 65)
                    }
                    .padding(.bottom, 65)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(hallName)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            HStack(spacing: 16) {
                                Label(building.name, systemImage: "building.columns")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                                
                                Label("Lecture Hall", systemImage: "speaker.wave.2.fill")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("CURRENT STATUS")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Available")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.green)
                            }
                            
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(Color(.systemGray5))
                                
                                Capsule()
                                    .frame(width: UIScreen.main.bounds.width * 0.3, height: 8)
                                    .foregroundColor(.green)
                                    .shadow(color: .green.opacity(0.3), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Divider()
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Directions from \(building.name) Entrance")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(directions, id: \.self) { direction in
                                    HStack(alignment: .top, spacing: 12) {
                                        Image(systemName: "arrow.turn.up.right")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.blue)
                                            .frame(width: 24, height: 24)
                                            .background(Circle().fill(Color.blue.opacity(0.2)))
                                        
                                        Text(direction)
                                            .font(.system(size: 16, weight: .regular))
                                            .foregroundColor(.secondary)
                                            .lineSpacing(4)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }
            }
            .background(Color(.systemGroupedBackground))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Hall_Previews: PreviewProvider {
    static var previews: some View {
        Hall(
            hallName: "Hall 101",
            building: Building(name: "Library", x: 220, y: 200, width: 60, height: 60),
            directions: [
                "Enter through the main doors of the Library",
                "Take the central staircase to the first floor",
                "Turn left at the top of the stairs",
                "Walk past the study area",
                "Hall 101 will be on your right, just before the restrooms"
            ]
        )
    }
}
