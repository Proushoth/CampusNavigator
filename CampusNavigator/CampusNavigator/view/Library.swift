import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack(spacing: 0) {
            HomeNavBar()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.red.opacity(0.2))
                            .frame(height: 220)
                            .overlay(
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.red.opacity(0.5)))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.red, lineWidth: 3)
                            )
                            .overlay(
                                Image(systemName: "book.closed.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.red)
                            )
                            .offset(y: 65)
                    }
                    .padding(.bottom, 65)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Library")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            HStack(spacing: 16) {
                                Label("Building 1", systemImage: "building.columns")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                                
                                Label("Room 101", systemImage: "door.left.hand.open")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("OCCUPANCY")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("80%")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.red)
                            }
                            
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(Color(.systemGray5))
                                
                                Capsule()
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 8)
                                    .foregroundColor(.red)
                                    .shadow(color: .red.opacity(0.3), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Divider()
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("About the Library")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(.primary)
                            
                            Text("The main library offers a quiet study environment with over 10,000 books, computer workstations, and group study rooms. Open Monday to Friday from 8AM to 10PM.")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.secondary)
                                .lineSpacing(4)
                        }
                        .padding(.horizontal, 20)
                        
                        Button(action: {
                        }) {
                            HStack {
                                Text("Take me there")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(12)
                            .shadow(color: .red.opacity(0.3), radius: 10, x: 0, y: 5)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        .buttonStyle(ScaleButtonStyle())
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

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    LibraryView()
}
