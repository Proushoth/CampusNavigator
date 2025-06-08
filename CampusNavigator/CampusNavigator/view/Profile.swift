//
//  Profile.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/8/25.
//

import SwiftUI

struct ProfileSetupView: View {
    @State private var fullName = "Proushoth Koushal"
    @State private var phoneNumber = ""
    @State private var selectedCountry = "🇬🇧"
    @State private var profileImage: Image? = nil

    var body: some View {
        VStack(spacing: 24) {

            // Header Text
            VStack(alignment: .leading, spacing: 4) {
                Text("Almost")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.red)
                Text("there!")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Profile Image Picker
            VStack {
                if let image = profileImage {
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .strokeBorder(Color.gray.opacity(0.4), lineWidth: 2)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Image(systemName: "person.crop.circle.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                        )
                }
                Button("Choose") {
                    // Trigger image picker (needs UIKit integration)
                }
                .foregroundColor(.red)
                .font(.subheadline)
            }

            // Full Name Field
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Full Name", text: $fullName)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Phone Number Field
            HStack {
                Text(selectedCountry)
                    .font(.largeTitle)
                TextField("Your number", text: $phoneNumber)
                    .keyboardType(.phonePad)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Setup Address
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Home").bold()
                        Text("Setup address for home")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                HStack {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.gray)
                    Text("Add more address")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal)

            // Continue Button
            Button(action: {
                // Handle continue
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(24)
            }
            .padding(.horizontal)

            Button("Setup address later") {
                // Skip setup
            }
            .font(.footnote)
            .foregroundColor(.gray)

            Spacer()
        }
        
    }
}

struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView()
    }
}
