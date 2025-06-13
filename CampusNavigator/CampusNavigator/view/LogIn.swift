import SwiftUI

struct ModernLoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var rememberMe = false

    var body: some View {
        VStack(spacing: 24) {
            // Welcome Text
            VStack(alignment: .leading, spacing: 4) {
                Text("Campus")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.red)
                Text("Navigator")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                Text("Sign in to access your account and get around campus using the app")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 50)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 30)

            // Email Field
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Enter your mail/phone number", text: $email)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Password Field
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                if isPasswordVisible {
                    TextField("Enter your password", text: $password)
                } else {
                    SecureField("Enter your password", text: $password)
                }
                Button(action: { isPasswordVisible.toggle() }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Remember Me + Forgot Password
            HStack {
                Toggle(isOn: $rememberMe) {
                    Text("Remember me")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .toggleStyle(CheckboxToggleStyle())
                
                Spacer()
                Button("Forgot password") {
                    // Handle forgot password
                }
                .foregroundColor(.blue)
                .font(.subheadline)
            }
            .padding(.horizontal)

            // Sign In Button
            Button(action: {
                // Handle sign in
            }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [Color.red, Color.red.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(24)
            }
            .padding(.horizontal)

            // Or Divider
            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
                Text("Or").foregroundColor(.gray)
                Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
            }
            .padding(.horizontal)

            // Continue with Google
            Button(action: {
                // Google Sign-In Logic
            }) {
                HStack {
                    Image(systemName: "globe") // Replace with Google logo if available
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Google")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding(.horizontal)

            // Sign Up Prompt
            HStack {
                Text("Don’t have an account?")
                    .foregroundColor(.gray)
                Button("Create an account") {
                    // Handle navigation
                }
                .foregroundColor(.red)
            }
            .font(.footnote)
            .navigationBarBackButtonHidden(true) 
            Spacer()
        }
    }
}

// Toggle style for checkbox appearance
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .red : .gray)
                configuration.label
            }
        }
    }
}

struct ModernLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ModernLoginView()
    }
}
