//
//  Canteen.swift
//  CampusNavigator
//
//  Created by Abdul Rahuman on 2025-06-13.
//
import SwiftUI

struct CanteenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HomeNavBar()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(Color.red.opacity(0.2))
                                .frame(height: 220)
                                .overlay(
                                    Image(systemName: "fork.knife")
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
                                    Image(systemName: "takeoutbag.and.cup.and.straw")
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
                                Text("Canteen")
                                    .font(.system(size: 32, weight: .bold, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                HStack(spacing: 16) {
                                    Label("Building 2", systemImage: "building.columns")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .foregroundColor(.secondary)
                                    
                                    Label("Ground Floor", systemImage: "stairs")
                                        .font(.system(size: 18, weight: .medium, design: .default))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("CURRENT CROWD")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Text("Moderate")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.red)
                                }
                                
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .frame(height: 8)
                                        .foregroundColor(Color(.systemGray5))
                                    
                                    Capsule()
                                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 8)
                                        .foregroundColor(.red)
                                        .shadow(color: .red.opacity(0.3), radius: 4, x: 0, y: 2)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            Divider()
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                            
                            // About section
                            VStack(alignment: .leading, spacing: 12) {
                                Text("About the Canteen")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(.primary)
                                
                                Text("The campus canteen offers a variety of meals, snacks, and beverages at affordable prices. Open from 7:30AM to 8PM daily. Features vegetarian options, a salad bar, and daily specials. Payment accepted via campus card or cash.")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.secondary)
                                    .lineSpacing(4)
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 12) {
                                NavigationLink(destination: MenuView()) {
                                    HStack {
                                        Text("Show Menu")
                                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        Image(systemName: "menucard")
                                    }
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 3)
                                }
                                .buttonStyle(ScaleButtonStyle())
                                
                                Button(action: {
                                }) {
                                    HStack {
                                        Text("Take me there")
                                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        Image(systemName: "arrow.right")
                                    }
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 3)
                                }
                                .buttonStyle(ScaleButtonStyle())
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                        }
                        .padding(.top, 20)
                    }
                }
                .background(Color(.systemGroupedBackground))
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct MenuView: View {
    let menuItems = [
        MenuItem(name: "Rice & Curry", price: "LKR 250", icon: "takeoutbag.and.cup.and.straw", color: .red),
        MenuItem(name: "Kottu", price: "LKR 300", icon: "flame", color: .orange),
        MenuItem(name: "String Hoppers", price: "LKR 200", icon: "circle.grid.2x2", color: .green),
        MenuItem(name: "Fried Rice", price: "LKR 280", icon: "fork.knife", color: .purple),
        MenuItem(name: "Hoppers", price: "LKR 150", icon: "circle.dashed", color: .blue),
        MenuItem(name: "Fruit Juice", price: "LKR 180", icon: "drop", color: .pink)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                Text("Today's Menu")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                    .padding(.top, 20)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(menuItems, id: \.name) { item in
                        MenuItemView(item: item)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(item.color.opacity(0.2))
                    .frame(width: 60, height: 60)
                
                Image(systemName: item.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(item.color)
            }
            
            Text(item.name)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(item.price)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(item.color)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct MenuItem {
    let name: String
    let price: String
    let icon: String
    let color: Color
}

#Preview {
    CanteenView()
}
