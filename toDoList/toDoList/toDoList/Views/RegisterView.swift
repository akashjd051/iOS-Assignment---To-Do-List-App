//
//  RegisterView.swift
//  toDoList
//

//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //Header MAKING IT GENERIC AND PASSING PARAMETERS INSIDE IT
            HeaderView(title: "Register", subtitle:"Start Organizing your work",
                       angle: -15, background: .blue)
            
            //form for registration
            Form{
                TextField(" Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    
                
                TextField(" Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField(" password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Crete Account",
                         background: .blue) {
                    //Attempt Login
                    viewModel.register()
                }
                         .padding()
                
                
            }
            .offset(y:-50)
            
            Spacer()
        }
    }
}
#Preview {
    RegisterView()
}
