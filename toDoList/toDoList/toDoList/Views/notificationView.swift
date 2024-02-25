//
//  notificationView.swift
//  toDoList
//

//
import SwiftUI

struct notificationView: View {
    @ObservedObject var viewModel = notificationViewViewModel()
    
    var body: some View {
        VStack {
            DatePicker("Due Time", selection: $viewModel.dueTime, displayedComponents: .hourAndMinute)
            
            Button("Set Notification") {
                viewModel.scheduleNotification()
            }
            .padding()
            
            if let notificationTime = viewModel.notificationTime {
                Text("Notification will be sent at \(formattedTime(notificationTime))")
                    .padding()
            }
        }
        .padding()
    }
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        notificationView()
    }
}
