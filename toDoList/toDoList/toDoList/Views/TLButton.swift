//
//  TLButton.swift
//  toDoList
//

//

import SwiftUI

struct TLButton: View {
    let title: String
    let background :Color
    let action: () ->Void
    var body: some View {
        Button{
            //Action
            action()
            
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                
            }
            
        }    }
}

#Preview {
    TLButton(title: "Value", background: .blue) {
    //Action
    }
}
