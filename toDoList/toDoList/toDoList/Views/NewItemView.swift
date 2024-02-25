//
//  NewItemView.swift
//  toDoList
//

//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var  newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            
            Form {
                //Title
                TextField("Title",  text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TLButton(
                    title: "Save",
                    background: .blue
                ) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                    
                    
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                
                Alert(title:Text( "Error"),
                      message: Text( "Please fill in all fields and select due date"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
    }))
}
 
