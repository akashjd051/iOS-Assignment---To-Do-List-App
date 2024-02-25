//
//  ToDoListViewViewModels.swift
//  toDoList

//
import FirebaseFirestore
import Foundation
//ViewModel For listy of itemd
//primary tab
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list Items
    /// - Parameter id: item id to delete
    func delete(id: String)
    {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

