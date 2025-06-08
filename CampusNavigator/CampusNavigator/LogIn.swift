import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 32) {
            // App logo or name
            Text("Campus Nav")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 20) {
                // Email Field
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                
                // Password Field
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                
                // Forgot Password
                HStack {
                    Spacer()
                    Button("Forgot Password?") {
                        // Handle forgot password action
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
            }
            
            // Login Button
            Button(action: {
                if email.isEmpty || password.isEmpty {
                    showAlert = true
                } else {
                    // Handle login logic here
                }
            }) {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Missing Fields"), message: Text("Please enter both email and password."), dismissButton: .default(Text("OK")))
            }
            
            // Sign Up Prompt
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                Button("Sign Up") {
                    // Navigate to sign up screen
                }
                .foregroundColor(.blue)
            }
            .font(.footnote)
        }
        .padding(.horizontal, 32)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
