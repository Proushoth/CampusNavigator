import SwiftUI

struct Hall: View {
    let hallName: String
    let building: Building
    let directions: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(height: 240)
                            .overlay(
                                Image("square")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            )
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                            .overlay(
                                Image("rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            )
                            .offset(y: 65)
                    }
                    .padding(.bottom, 65)
                    .padding(.top, 90)

                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(hallName)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Label(building.name, systemImage: "building.columns")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                                
                                Label("Lecture Hall", systemImage: "speaker.wave.2.fill")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("CURRENT LECTURE")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("In Session")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.orange)
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Advanced Computer Science")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.primary)
                                
                                Text("Prof. Sarah Johnson")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.secondary)
                                
                                HStack {
                                    Image(systemName: "clock")
                                    Text("10:00 AM - 11:30 AM")
                                        .font(.system(size: 15, weight: .medium))
                                }
                                .foregroundColor(.secondary)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                    )
                            )
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
                .navigationTitle(hallName)
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
