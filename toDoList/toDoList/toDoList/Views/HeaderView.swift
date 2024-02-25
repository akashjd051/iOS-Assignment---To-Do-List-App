//
//  HeaderView.swift
//  toDoList
//
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle: String
    let angle: Double
    let background: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: angle))
                //.offset(y:-100)
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)

                
            }
            .padding(.top, 100)
                
        }
        .frame(width: UIScreen.main.bounds.width*3,
               height:300)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "Title", 
               subtitle:"Subtitle",
               angle: 15,
               background: .blue)
}
