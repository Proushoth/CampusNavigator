//
//  Dashboard.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/11/25.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Top Navbar
            HomeNavBar()
            
            // Greeting
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, Proushoth")
                    .font(.caption)
                    .fontWeight(.medium)
                    
            
            }
            .padding(.horizontal)

            // Next Class Card
            NextClassCard()
            
            Spacer()
        }
        .padding(.top)
    }
}

struct HomeNavBar: View {
    var body: some View {
        HStack {
            HStack {
                Text("Campus")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.red)
                Text("Navigator")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.black)
            }

            Spacer()

            Image(uiImage: #imageLiteral(resourceName: "notifications"))
                .onTapGesture {
                    // Notification tap action
                }
        }
        .padding(.horizontal)
    }
}

struct NextClassCard: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            // Calendar Icon
            Image(systemName: "calendar")
                .font(.system(size: 24))
                .foregroundColor(.white)

            // Text Content
            VStack(alignment: .leading, spacing: 4) {
                Text("Next Class")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)

                Text("Computer Science 101")
                    .font(.headline)
                    .foregroundColor(.white)

                Text("10:00 AM • Hall A2 • 5 min walk")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
            }

            Spacer()

            // Chevron
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.9)]),
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    Dashboard()
}
