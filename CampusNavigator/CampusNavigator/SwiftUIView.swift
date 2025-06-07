//
//  SwiftUIView.swift
//  CampusNavigator
//
//  Created by proushoth koushal on 6/7/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var username  = ""
    @State private var password  = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showLoginScreen){
                        EmptyView()
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "johncena"{
            wrongUsername = 0
        if password.lowercased() == "title17"{
                wrongPassword = 0
                showLoginScreen
            }
            else{
                wrongPassword=2
            }
            }
        else {
            wrongUsername = 2
        }
    }
}

#Preview {
    SwiftUIView()
}
