//
//  ProfileView.swift
//  toDoList
//
//  
//

/*import SwiftUI

struct ProfileView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    
                }
            label:
                {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
*/
import SwiftUI
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                //Avatar
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                        .padding()

                    
                    
                    //Info: Name, Email
                    VStack(alignment: .leading)
                    {
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()

                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()

                        HStack{
                            Text("Part Of Family Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
                    }
                    .padding()

                    
                    //sign Out
                    Button("Sign Out"){
                        viewModel.logOut()
                    }
                    .tint(.blue)
                    Spacer()
                    .padding()
                }
                else{
                    Text("Loading...")
                }
                
            }
            .navigationTitle("Your Profile")
        }
        .onAppear()
        {
            viewModel.fetchUser()
        }
    }
}

// ... Preview code remains the same

struct ProfileView_Previews: PreviewProvider  {
    static var previews: some View {
        ProfileView()
    }
}
