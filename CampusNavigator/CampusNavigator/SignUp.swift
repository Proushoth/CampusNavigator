import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false
    @State private var agreedToTerms = false

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
                Text("Create an account to access your account and get around campus using the app")
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
                    TextField("Create password", text: $password)
                } else {
                    SecureField("Create password", text: $password)
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

            // Confirm Password Field
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                if isConfirmPasswordVisible {
                    TextField("Re-type your password", text: $confirmPassword)
                } else {
                    SecureField("Re-type your password", text: $confirmPassword)
                }
                Button(action: { isConfirmPasswordVisible.toggle() }) {
                    Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Terms of Service
            HStack(alignment: .top) {
                Toggle("", isOn: $agreedToTerms)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.top, 2)
                Text("By signing up, you agree to our ")
                    .foregroundColor(.gray)
                    + Text("Terms of Service").foregroundColor(.red)
                    + Text(" and ").foregroundColor(.gray)
                    + Text("Privacy Policy").foregroundColor(.red)
            }
            .font(.footnote)
            .padding(.horizontal)

            // Sign Up Button
            Button(action: {
                // Handle sign-up
            }) {
                Text("Sign up")
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

            // Google Sign-Up
            Button(action: {
                // Google sign-up logic
            }) {
                HStack {
                    Image(systemName: "globe") // Replace with real Google icon if needed
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Sign up using Google")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding(.horizontal)

            // Sign In Link
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                Button("Sign in") {
                    // Navigate to Sign In
                }
                .foregroundColor(.red)
            }
            .font(.footnote)

            Spacer()
        }
    }
}

// Toggle style for checkbox appearance
struct checkboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .red : .gray)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
