//
//  Office.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-14.
//


import SwiftUI

struct Office: View {
    let officeName: String
    let building: Building
    let department: String
    let directions: [String]
    let status: String
    
    var statusColor: Color {
        switch status {
        case "Open": return .green
        case "Closed": return .red
        case "Available": return .blue
        default: return .gray
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.green.opacity(0.2))
                            .frame(height: 240)
                            .overlay(
                                Image(systemName: "door.garage.open")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.green.opacity(0.5)))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.green, lineWidth: 3)
                            )
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.green)
                            )
                            .offset(y: 65)
                    }
                    .padding(.bottom, 65)
                    .padding(.top, 90)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(officeName)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            HStack(spacing: 16) {
                                Label(building.name, systemImage: "building.columns")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                                
                                Label(department, systemImage: "person.2.fill")
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
                                Text(status)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(statusColor)
                            }
                            
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(Color(.systemGray5))
                                
                                Capsule()
                                    .frame(width: UIScreen.main.bounds.width * (status == "Open" ? 0.8 : 0.3), height: 8)
                                    .foregroundColor(statusColor)
                                    .shadow(color: statusColor.opacity(0.3), radius: 4, x: 0, y: 2)
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
                                            .foregroundColor(.green)
                                            .frame(width: 24, height: 24)
                                            .background(Circle().fill(Color.green.opacity(0.2)))
                                        
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
                .navigationTitle(officeName)
            }
            .background(Color(.systemGroupedBackground))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Office_Previews: PreviewProvider {
    static var previews: some View {
        Office(
            officeName: "Dean's Office",
            building: Building(name: "Administration Building", x: 220, y: 200, width: 60, height: 60),
            department: "Administration",
            directions: [
                "Enter through the main doors of the Administration Building",
                "Take the elevator to the third floor",
                "Turn right after exiting the elevator",
                "The Dean's Office will be the first door on your left"
            ],
            status: "Open"
        )
    }
}
