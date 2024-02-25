//
//  LoginView.swift
//  toDoList
//


import SwiftUI

struct LoginView: View {
   // @State var email = ""
    //@State var password = ""
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{ VStack{
            //Header
            HeaderView(title: "To DO List", subtitle:"Make Things Happen",
                       angle: 18, background: .blue)
            
            //Login Form
          
            Form{
                TextField("Email Address", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Log In", 
                         background: .blue) {
                    viewModel.login()
                }
                
            }   
            .padding()
            .offset(y:-80)
                //.padding(.top,10)

            
            //Create Account
            VStack{
                Text("Hey Mate! New around here?")
                NavigationLink("Create a Account",
                               destination: RegisterView())
            }
            .padding(.bottom, 40)
            Spacer()
        }
        }
    }
}
#Preview {
    LoginView()
}
