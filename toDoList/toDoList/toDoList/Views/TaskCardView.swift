//
//  TaskCardView.swift
//  toDoList
//
//  Created by abhishek singh on 24/02/24.
//

import SwiftUI

struct TaskCardView: View {
    let task: Task
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(task.priorityColor)
                    .frame(width: 30, height: 30)
                Text("\(task.priority + 1)") // Assuming 0 is low, 4 is high
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                if let description = task.description {
                    Text(description)
                        .font(.caption)
                }
                Text(task.formattedDueDate)
                    .font(.caption)
                HStack {
                    Spacer()
                    Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            // Handle completion toggle here
                        }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}


#Preview {
    TaskCardView()
}
