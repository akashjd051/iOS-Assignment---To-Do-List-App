//
//  ToDoListView.swift
//  toDoList
//
//  Created by abhishek singh on 24/02/24.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    init(userId: String) {
       // self.userId = userId
        //USERS/<ID>/TODOS/<ENTERIES>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue:
            ToDoListViewViewModel(userId: userId))
        
    }
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationView {
            VStack {
                
                // Your profile content here
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)

                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            
        
            .navigationTitle("TO do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                }
            label: {
                Image(systemName: "plus")
            }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            }
                
                
                
                
            }
        }
}
    
    
    
    struct ToDoListItemsView_Previews: PreviewProvider{
        static var previews: some View{
            ToDoListView(userId: "uGv3Dl4gooaQquVf3q1NJHOZN123")
        }
    }

